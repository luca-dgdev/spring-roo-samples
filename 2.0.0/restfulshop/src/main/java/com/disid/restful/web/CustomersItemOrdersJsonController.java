package com.disid.restful.web;
import com.disid.restful.model.Customer;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooDetail;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = CustomersItemOrdersJsonController
 TODO Auto-generated class documentation
 *
 */
@RooController(entity = Customer.class, type = ControllerType.DETAIL)
@RooDetail(relationField = "orders")
@RooJSON
public class CustomersItemOrdersJsonController {
}
