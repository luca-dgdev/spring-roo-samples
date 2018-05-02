package com.springsource.pizzashop.web;
import com.springsource.pizzashop.domain.Topping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Topping.class)
@Controller
@RequestMapping("/toppings")
@RooWebScaffold(path = "toppings", formBackingObject = Topping.class)
public class ToppingController {
}
