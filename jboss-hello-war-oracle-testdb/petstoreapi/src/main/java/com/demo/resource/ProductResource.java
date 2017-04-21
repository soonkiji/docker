package com.demo.resource;

import com.demo.entity.Product;
import com.demo.repository.ProductRepository;
import com.demo.schema.ProductModel;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Path("/v1/products")
public class ProductResource {
    static Map<Long, ProductModel> products = new HashMap<Long, ProductModel>() {
        {
            put(1L, new ProductModel(1L, "Product One"));
            put(2L, new ProductModel(2L, "Product Two"));
            put(3L, new ProductModel(3L, "Product Three"));
        }
    };

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    DozerBeanMapper dozerBeanMapper;

    // R
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public Response getProducts() throws IOException {
        List<Product> productEntityList = productRepository.findAll();
        List<ProductModel> ProductModelList = new ArrayList<>();
        for (Product entity : productEntityList) {
            ProductModelList.add(dozerBeanMapper.map(entity, ProductModel.class));
        }
        return Response.status(Response.Status.OK).entity(ProductModelList).build();
    }

    // R
    @GET
    @Path("/count")
    @Produces({MediaType.APPLICATION_JSON})
    public Response getCount() throws IOException {
        return Response.status(Response.Status.OK).entity(productRepository.count()).build();
    }

    // C
    @POST
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public Response addProduct(ProductModel productModel) {
        if (productModel == null) {
            return BadRequest();
        }
        if (products.get(productModel.getId()) != null) {
            return Conflict(productModel.getId());
        }
        products.put(productModel.getId(), productModel);
        return Response.status(Response.Status.CREATED).entity(productModel).build();
    }

    // R
    @GET
    @Path("/{id}")
    @Produces({MediaType.APPLICATION_JSON})
    public Response getProduct(@PathParam("id") Long id) throws IOException {
        Product productEntity = productRepository.findOne(id);
        if (productEntity == null) {
            return NotFound(id);
        }
        ProductModel productModel = dozerBeanMapper.map(productEntity, ProductModel.class);
        return Response.status(Response.Status.OK).entity(productModel).build();
    }

    // U
    @PUT
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public Response updateProduct(ProductModel productModel) {
        if (productModel == null) {
            return BadRequest();
        }
        ProductModel user2 = products.get(productModel.getId());
        if (user2 == null) {
            products.put(productModel.getId(), productModel);
            return Response.status(Response.Status.CREATED).entity(productModel).build();
        } else {
            products.put(productModel.getId(), productModel);
            return Response.status(Response.Status.OK).entity(productModel).build();
        }
    }

    // D
    @DELETE
    @Path("/{id}")
    @Produces({MediaType.APPLICATION_JSON})
    public Response deleteProduct(@PathParam("id") Long id) {
        ProductModel productModel = products.get(id);
        if (productModel == null) {
            return NotFound(id);
        }
        products.remove(id);
        return Response.status(Response.Status.OK).entity(productModel).build();
    }


    private Response NotFound(Long id) {
        return Response.status(Response.Status.NOT_FOUND).entity("HTTP " + Response.Status.NOT_FOUND + ", invalid id " + id + ".\n").build();
    }

    private Response BadRequest() {
        return Response.status(Response.Status.BAD_REQUEST).entity("HTTP " + Response.Status.BAD_REQUEST + ", bad request.\n").build();
    }

    private Response Conflict(Long id) {
        return Response.status(Response.Status.CONFLICT).entity("HTTP " + Response.Status.CONFLICT + ", " + id + " exists.\n").build();
    }
}
