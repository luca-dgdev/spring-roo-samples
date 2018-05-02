package com.disid.restful.repository;
import com.disid.restful.dod.DataOnDemandConfiguration;
import com.disid.restful.model.dod.CustomerDataOnDemand;
import org.springframework.roo.addon.layers.repository.jpa.annotations.test.RooRepositoryJpaIntegrationTest;

/**
 * = CustomerRepositoryIT
 TODO Auto-generated class documentation
 *
 */
@RooRepositoryJpaIntegrationTest(targetClass = CustomerRepository.class, dodConfigurationClass = DataOnDemandConfiguration.class, dodClass = CustomerDataOnDemand.class)
public class CustomerRepositoryIT {
}
