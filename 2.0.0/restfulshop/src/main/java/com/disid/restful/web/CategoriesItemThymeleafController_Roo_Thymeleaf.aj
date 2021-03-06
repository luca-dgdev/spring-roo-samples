// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.restful.web;

import com.disid.restful.model.Category;
import com.disid.restful.service.api.CategoryService;
import com.disid.restful.web.CategoriesCollectionThymeleafController;
import com.disid.restful.web.CategoriesItemThymeleafController;
import com.disid.restful.web.CategoriesItemThymeleafLinkFactory;
import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import io.springlets.web.mvc.util.concurrency.ConcurrencyCallback;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import io.springlets.web.mvc.util.concurrency.ConcurrencyTemplate;
import java.util.Locale;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect CategoriesItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: CategoriesItemThymeleafController: @Controller;
    
    declare @type: CategoriesItemThymeleafController: @RequestMapping(value = "/categories/{category}", name = "CategoriesItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private CategoryService CategoriesItemThymeleafController.categoryService;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource CategoriesItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<CategoriesItemThymeleafController> CategoriesItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<CategoriesCollectionThymeleafController> CategoriesItemThymeleafController.collectionLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private final ConcurrencyTemplate<Category> CategoriesItemThymeleafController.concurrencyTemplate = new ConcurrencyTemplate<Category>(this);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param categoryService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public CategoriesItemThymeleafController.new(CategoryService categoryService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setCategoryService(categoryService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(CategoriesItemThymeleafController.class));
        setCollectionLink(linkBuilder.of(CategoriesCollectionThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return CategoryService
     */
    public CategoryService CategoriesItemThymeleafController.getCategoryService() {
        return categoryService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param categoryService
     */
    public void CategoriesItemThymeleafController.setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource CategoriesItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void CategoriesItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<CategoriesItemThymeleafController> CategoriesItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void CategoriesItemThymeleafController.setItemLink(MethodLinkBuilderFactory<CategoriesItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<CategoriesCollectionThymeleafController> CategoriesItemThymeleafController.getCollectionLink() {
        return collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param collectionLink
     */
    public void CategoriesItemThymeleafController.setCollectionLink(MethodLinkBuilderFactory<CategoriesCollectionThymeleafController> collectionLink) {
        this.collectionLink = collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Category
     */
    @ModelAttribute
    public Category CategoriesItemThymeleafController.getCategory(@PathVariable("category") Long id, Locale locale, HttpMethod method) {
        Category category = null;
        if (HttpMethod.PUT.equals(method)) {
            category = categoryService.findOneForUpdate(id);
        } else {
            category = categoryService.findOne(id);
        }
        
        if (category == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Category", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return category;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView CategoriesItemThymeleafController.show(@ModelAttribute Category category, Model model) {
        model.addAttribute("category", category);
        return new ModelAndView("categories/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView CategoriesItemThymeleafController.showInline(@ModelAttribute Category category, Model model) {
        model.addAttribute("category", category);
        return new ModelAndView("categories/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void CategoriesItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void CategoriesItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConcurrencyTemplate
     */
    public ConcurrencyTemplate<Category> CategoriesItemThymeleafController.getConcurrencyTemplate() {
        return concurrencyTemplate;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String CategoriesItemThymeleafController.getModelName() {
        return "category";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String CategoriesItemThymeleafController.getEditViewPath() {
        return "categories/edit";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param record
     * @return Integer
     */
    public Integer CategoriesItemThymeleafController.getLastVersion(Category record) {
        return getCategoryService().findOne(record.getId()).getVersion();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @param model
     * @return ModelAndView
     */
    public ModelAndView CategoriesItemThymeleafController.populateAndGetFormView(Category entity, Model model) {
        // Populate the form with all the necessary elements
        populateForm(model);
        // Add concurrency attribute to the model to show the concurrency form
        // in the current edit view
        model.addAttribute("concurrency", true);
        // Add the new version value to the model.
        model.addAttribute("newVersion", getLastVersion(entity));
        // Add the current pet values to maintain the values introduced by the user
        model.addAttribute(getModelName(), entity);
        // Return the edit view path
        return new org.springframework.web.servlet.ModelAndView(getEditViewPath(), model.asMap());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("category")
    public void CategoriesItemThymeleafController.initCategoryBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView CategoriesItemThymeleafController.editForm(@ModelAttribute Category category, Model model) {
        populateForm(model);
        
        model.addAttribute("category", category);
        return new ModelAndView("categories/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @param result
     * @param version
     * @param concurrencyControl
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView CategoriesItemThymeleafController.update(@Valid @ModelAttribute Category category, BindingResult result, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            return new ModelAndView(getEditViewPath());
        }
        // Create Concurrency Spring Template to ensure that the following code will manage the
        // possible concurrency exceptions that appears and execute the provided coded inside the Spring template.
        // If some concurrency exception appears the template will manage it.
        Category savedCategory = getConcurrencyTemplate().execute(category, model, new ConcurrencyCallback<Category>() {
            @Override
            public Category doInConcurrency(Category category) throws Exception {
                return getCategoryService().save(category);
            }
        });
        UriComponents showURI = getItemLink().to(CategoriesItemThymeleafLinkFactory.SHOW).with("category", savedCategory.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> CategoriesItemThymeleafController.delete(@ModelAttribute Category category) {
        getCategoryService().delete(category);
        return ResponseEntity.ok().build();
    }
    
}
