package com.disid.restful.repository;
import com.disid.restful.dod.DataOnDemandConfiguration;
import com.disid.restful.model.dod.CategoryDataOnDemand;
import org.springframework.roo.addon.layers.repository.jpa.annotations.test.RooRepositoryJpaIntegrationTest;

/**
 * = CategoryRepositoryIT
 TODO Auto-generated class documentation
 *
 */
@RooRepositoryJpaIntegrationTest(targetClass = CategoryRepository.class, dodConfigurationClass = DataOnDemandConfiguration.class, dodClass = CategoryDataOnDemand.class)
public class CategoryRepositoryIT {
}
