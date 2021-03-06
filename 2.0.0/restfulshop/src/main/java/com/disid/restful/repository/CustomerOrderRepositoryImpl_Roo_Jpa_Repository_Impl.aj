// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.restful.repository;

import com.disid.restful.model.Customer;
import com.disid.restful.model.CustomerOrder;
import com.disid.restful.model.QCustomerOrder;
import com.disid.restful.repository.CustomerOrderRepositoryImpl;
import com.querydsl.core.types.Path;
import com.querydsl.jpa.JPQLQuery;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt.AttributeMappingBuilder;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

privileged aspect CustomerOrderRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare @type: CustomerOrderRepositoryImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String CustomerOrderRepositoryImpl.ORDER_DATE = "orderDate";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String CustomerOrderRepositoryImpl.SHIPPED_DATE = "shippedDate";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String CustomerOrderRepositoryImpl.SHIP_ADDRESS = "shipAddress";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String CustomerOrderRepositoryImpl.CUSTOMER = "customer";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<CustomerOrder> CustomerOrderRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        
        QCustomerOrder customerOrder = QCustomerOrder.customerOrder;
        
        JPQLQuery<CustomerOrder> query = from(customerOrder);
        
        Path<?>[] paths = new Path<?>[] {customerOrder.orderDate,customerOrder.shippedDate,customerOrder.shipAddress,customerOrder.customer};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(ORDER_DATE, customerOrder.orderDate)
			.map(SHIPPED_DATE, customerOrder.shippedDate)
			.map(SHIP_ADDRESS, customerOrder.shipAddress)
			.map(CUSTOMER, customerOrder.customer);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, customerOrder);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<CustomerOrder> CustomerOrderRepositoryImpl.findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable) {
        
        QCustomerOrder customerOrder = QCustomerOrder.customerOrder;
        
        JPQLQuery<CustomerOrder> query = from(customerOrder);
        
        Path<?>[] paths = new Path<?>[] {customerOrder.orderDate,customerOrder.shippedDate,customerOrder.shipAddress,customerOrder.customer};        
        applyGlobalSearch(globalSearch, query, paths);
        
        // Also, filter by the provided ids
        query.where(customerOrder.id.in(ids));
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(ORDER_DATE, customerOrder.orderDate)
			.map(SHIPPED_DATE, customerOrder.shippedDate)
			.map(SHIP_ADDRESS, customerOrder.shipAddress)
			.map(CUSTOMER, customerOrder.customer);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, customerOrder);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customer
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<CustomerOrder> CustomerOrderRepositoryImpl.findByCustomer(Customer customer, GlobalSearch globalSearch, Pageable pageable) {
        
        QCustomerOrder customerOrder = QCustomerOrder.customerOrder;
        
        JPQLQuery<CustomerOrder> query = from(customerOrder);
        
        Assert.notNull(customer, "customer is required");
        
        query.where(customerOrder.customer.eq(customer));
        Path<?>[] paths = new Path<?>[] {customerOrder.orderDate,customerOrder.shippedDate,customerOrder.shipAddress,customerOrder.customer};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(ORDER_DATE, customerOrder.orderDate)
			.map(SHIPPED_DATE, customerOrder.shippedDate)
			.map(SHIP_ADDRESS, customerOrder.shipAddress)
			.map(CUSTOMER, customerOrder.customer);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, customerOrder);
    }
    
}
