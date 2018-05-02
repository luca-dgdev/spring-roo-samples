// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.restful.service.impl;

import com.disid.restful.model.Category;
import com.disid.restful.model.OrderDetail;
import com.disid.restful.model.Product;
import com.disid.restful.repository.ProductRepository;
import com.disid.restful.service.api.OrderDetailService;
import com.disid.restful.service.impl.ProductServiceImpl;
import io.springlets.data.domain.GlobalSearch;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProductServiceImpl_Roo_Service_Impl {
    
    declare @type: ProductServiceImpl: @Service;
    
    declare @type: ProductServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private ProductRepository ProductServiceImpl.productRepository;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private OrderDetailService ProductServiceImpl.orderDetailService;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param productRepository
     * @param orderDetailService
     */
    @Autowired
    public ProductServiceImpl.new(ProductRepository productRepository, @Lazy OrderDetailService orderDetailService) {
        setProductRepository(productRepository);
        setOrderDetailService(orderDetailService);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return ProductRepository
     */
    public ProductRepository ProductServiceImpl.getProductRepository() {
        return productRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param productRepository
     */
    public void ProductServiceImpl.setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return OrderDetailService
     */
    public OrderDetailService ProductServiceImpl.getOrderDetailService() {
        return orderDetailService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param orderDetailService
     */
    public void ProductServiceImpl.setOrderDetailService(OrderDetailService orderDetailService) {
        this.orderDetailService = orderDetailService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param product
     * @param orderDetailsToAdd
     * @return Product
     */
    @Transactional
    public Product ProductServiceImpl.addToOrderDetails(Product product, Iterable<Long> orderDetailsToAdd) {
        List<OrderDetail> orderDetails = getOrderDetailService().findAll(orderDetailsToAdd);
        product.addToOrderDetails(orderDetails);
        return getProductRepository().save(product);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param product
     * @param orderDetailsToRemove
     * @return Product
     */
    @Transactional
    public Product ProductServiceImpl.removeFromOrderDetails(Product product, Iterable<Long> orderDetailsToRemove) {
        List<OrderDetail> orderDetails = getOrderDetailService().findAll(orderDetailsToRemove);
        product.removeFromOrderDetails(orderDetails);
        return getProductRepository().save(product);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param product
     * @param orderDetails
     * @return Product
     */
    @Transactional
    public Product ProductServiceImpl.setOrderDetails(Product product, Iterable<Long> orderDetails) {
        List<OrderDetail> items = getOrderDetailService().findAll(orderDetails);
        Set<OrderDetail> currents = product.getOrderDetails();
        Set<OrderDetail> toRemove = new HashSet<OrderDetail>();
        for (Iterator<OrderDetail> iterator = currents.iterator(); iterator.hasNext();) {
            OrderDetail nextOrderDetail = iterator.next();
            if (items.contains(nextOrderDetail)) {
                items.remove(nextOrderDetail);
            } else {
                toRemove.add(nextOrderDetail);
            }
        }
        product.removeFromOrderDetails(toRemove);
        product.addToOrderDetails(items);
        // Force the version update of the parent side to know that the parent has changed
        // because it has new books assigned
        product.setVersion(product.getVersion() + 1);
        return getProductRepository().save(product);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param product
     */
    @Transactional
    public void ProductServiceImpl.delete(Product product) {
        // Clear bidirectional many-to-many child relationship with Category
        for (Category item : product.getCategories()) {
            item.getProducts().remove(product);
        }
        
        // Clear bidirectional one-to-many parent relationship with OrderDetail
        for (OrderDetail item : product.getOrderDetails()) {
            item.setProduct(null);
        }
        
        getProductRepository().delete(product);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Product> ProductServiceImpl.save(Iterable<Product> entities) {
        return getProductRepository().save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void ProductServiceImpl.delete(Iterable<Long> ids) {
        List<Product> toDelete = getProductRepository().findAll(ids);
        getProductRepository().deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Product
     */
    @Transactional
    public Product ProductServiceImpl.save(Product entity) {
        return getProductRepository().save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Product
     */
    public Product ProductServiceImpl.findOne(Long id) {
        return getProductRepository().findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Product
     */
    public Product ProductServiceImpl.findOneForUpdate(Long id) {
        return getProductRepository().findOneDetached(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Product> ProductServiceImpl.findAll(Iterable<Long> ids) {
        return getProductRepository().findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Product> ProductServiceImpl.findAll() {
        return getProductRepository().findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long ProductServiceImpl.count() {
        return getProductRepository().count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Product> ProductServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return getProductRepository().findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Product> ProductServiceImpl.findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable) {
        return getProductRepository().findAllByIdsIn(ids, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param categories
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Product> ProductServiceImpl.findByCategoriesContains(Category categories, GlobalSearch globalSearch, Pageable pageable) {
        return getProductRepository().findByCategoriesContains(categories, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param categories
     * @return Long
     */
    public long ProductServiceImpl.countByCategoriesContains(Category categories) {
        return getProductRepository().countByCategoriesContains(categories);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Product> ProductServiceImpl.getEntityType() {
        return Product.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Long> ProductServiceImpl.getIdType() {
        return Long.class;
    }
    
}
