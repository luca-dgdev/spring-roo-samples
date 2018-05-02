package com.disid.restful.repository;
import com.disid.restful.model.CustomerOrder;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;

/**
 * = CustomerOrderRepository
 TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = CustomerOrder.class)
public interface CustomerOrderRepository extends DetachableJpaRepository<CustomerOrder, Long>, CustomerOrderRepositoryCustom {
}
