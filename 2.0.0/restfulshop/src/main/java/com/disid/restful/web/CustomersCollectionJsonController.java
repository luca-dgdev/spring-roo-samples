package com.disid.restful.web;
import com.disid.restful.model.Customer;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = CustomersCollectionJsonController
 TODO Auto-generated class documentation
 *
 */
@RooController(entity = Customer.class, type = ControllerType.COLLECTION)
@RooJSON
public class CustomersCollectionJsonController {
}
