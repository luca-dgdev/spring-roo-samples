// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.pizzashop.web;

import com.springsource.pizzashop.domain.Topping;
import com.springsource.pizzashop.service.ToppingService;
import com.springsource.pizzashop.web.ToppingController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ToppingController_Roo_Controller {
    
    @Autowired
    ToppingService ToppingController.toppingService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ToppingController.create(@Valid Topping topping, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, topping);
            return "toppings/create";
        }
        uiModel.asMap().clear();
        toppingService.saveTopping(topping);
        return "redirect:/toppings/" + encodeUrlPathSegment(topping.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ToppingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Topping());
        return "toppings/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ToppingController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("topping", toppingService.findTopping(id));
        uiModel.addAttribute("itemId", id);
        return "toppings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ToppingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("toppings", toppingService.findToppingEntries(firstResult, sizeNo));
            float nrOfPages = (float) toppingService.countAllToppings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("toppings", toppingService.findAllToppings());
        }
        return "toppings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ToppingController.update(@Valid Topping topping, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, topping);
            return "toppings/update";
        }
        uiModel.asMap().clear();
        toppingService.updateTopping(topping);
        return "redirect:/toppings/" + encodeUrlPathSegment(topping.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ToppingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, toppingService.findTopping(id));
        return "toppings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ToppingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Topping topping = toppingService.findTopping(id);
        toppingService.deleteTopping(topping);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/toppings";
    }
    
    void ToppingController.populateEditForm(Model uiModel, Topping topping) {
        uiModel.addAttribute("topping", topping);
    }
    
    String ToppingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
