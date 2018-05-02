package com.disid.restful.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import com.disid.restful.model.Category;

/**
 * = CategoryRepositoryImpl
 *
 * Implementation of CategoryRepositoryCustom
 *
 */
@RooJpaRepositoryCustomImpl(repository = CategoryRepositoryCustom.class)
public class CategoryRepositoryImpl extends QueryDslRepositorySupportExt<Category> implements CategoryRepositoryCustom{

    /**
     * Default constructor
     */
    CategoryRepositoryImpl() {
        super(Category.class);
    }
}