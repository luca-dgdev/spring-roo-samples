// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.restful.service.impl;

import com.disid.restful.model.Category;
import com.disid.restful.model.Product;
import com.disid.restful.repository.CategoryRepository;
import com.disid.restful.service.api.ProductService;
import com.disid.restful.service.impl.CategoryServiceImpl;
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

privileged aspect CategoryServiceImpl_Roo_Service_Impl {
    
    declare @type: CategoryServiceImpl: @Service;
    
    declare @type: CategoryServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private CategoryRepository CategoryServiceImpl.categoryRepository;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private ProductService CategoryServiceImpl.productService;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param categoryRepository
     * @param productService
     */
    @Autowired
    public CategoryServiceImpl.new(CategoryRepository categoryRepository, @Lazy ProductService productService) {
        setCategoryRepository(categoryRepository);
        setProductService(productService);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return CategoryRepository
     */
    public CategoryRepository CategoryServiceImpl.getCategoryRepository() {
        return categoryRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param categoryRepository
     */
    public void CategoryServiceImpl.setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ProductService
     */
    public ProductService CategoryServiceImpl.getProductService() {
        return productService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param productService
     */
    public void CategoryServiceImpl.setProductService(ProductService productService) {
        this.productService = productService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @param productsToAdd
     * @return Category
     */
    @Transactional
    public Category CategoryServiceImpl.addToProducts(Category category, Iterable<Long> productsToAdd) {
        List<Product> products = getProductService().findAll(productsToAdd);
        category.addToProducts(products);
        return getCategoryRepository().save(category);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @param productsToRemove
     * @return Category
     */
    @Transactional
    public Category CategoryServiceImpl.removeFromProducts(Category category, Iterable<Long> productsToRemove) {
        List<Product> products = getProductService().findAll(productsToRemove);
        category.removeFromProducts(products);
        return getCategoryRepository().save(category);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @param products
     * @return Category
     */
    @Transactional
    public Category CategoryServiceImpl.setProducts(Category category, Iterable<Long> products) {
        List<Product> items = getProductService().findAll(products);
        Set<Product> currents = category.getProducts();
        Set<Product> toRemove = new HashSet<Product>();
        for (Iterator<Product> iterator = currents.iterator(); iterator.hasNext();) {
            Product nextProduct = iterator.next();
            if (items.contains(nextProduct)) {
                items.remove(nextProduct);
            } else {
                toRemove.add(nextProduct);
            }
        }
        category.removeFromProducts(toRemove);
        category.addToProducts(items);
        // Force the version update of the parent side to know that the parent has changed
        // because it has new books assigned
        category.setVersion(category.getVersion() + 1);
        return getCategoryRepository().save(category);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     */
    @Transactional
    public void CategoryServiceImpl.delete(Category category) {
        // Clear bidirectional many-to-many parent relationship with Product
        for (Product item : category.getProducts()) {
            item.getCategories().remove(category);
        }
        
        getCategoryRepository().delete(category);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Category> CategoryServiceImpl.save(Iterable<Category> entities) {
        return getCategoryRepository().save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void CategoryServiceImpl.delete(Iterable<Long> ids) {
        List<Category> toDelete = getCategoryRepository().findAll(ids);
        getCategoryRepository().deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Category
     */
    @Transactional
    public Category CategoryServiceImpl.save(Category entity) {
        return getCategoryRepository().save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Category
     */
    public Category CategoryServiceImpl.findOne(Long id) {
        return getCategoryRepository().findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Category
     */
    public Category CategoryServiceImpl.findOneForUpdate(Long id) {
        return getCategoryRepository().findOneDetached(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Category> CategoryServiceImpl.findAll(Iterable<Long> ids) {
        return getCategoryRepository().findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Category> CategoryServiceImpl.findAll() {
        return getCategoryRepository().findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long CategoryServiceImpl.count() {
        return getCategoryRepository().count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Category> CategoryServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return getCategoryRepository().findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Category> CategoryServiceImpl.findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable) {
        return getCategoryRepository().findAllByIdsIn(ids, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Category> CategoryServiceImpl.getEntityType() {
        return Category.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Long> CategoryServiceImpl.getIdType() {
        return Long.class;
    }
    
}
