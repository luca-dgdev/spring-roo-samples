// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.web;

import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.web.datatables.ConvertedDatatablesData;
import io.springlets.data.web.datatables.Datatables;
import io.springlets.data.web.datatables.DatatablesColumns;
import io.springlets.data.web.datatables.DatatablesPageable;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.ConversionService;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.petclinic.domain.Owner;
import org.springframework.roo.petclinic.domain.OwnerCityFormBean;
import org.springframework.roo.petclinic.domain.OwnerFirstNameFormBean;
import org.springframework.roo.petclinic.domain.OwnerInfo;
import org.springframework.roo.petclinic.service.api.OwnerService;
import org.springframework.roo.petclinic.web.OwnersSearchThymeleafController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

privileged aspect OwnersSearchThymeleafController_Roo_Thymeleaf {
    
    declare @type: OwnersSearchThymeleafController: @Controller;
    
    declare @type: OwnersSearchThymeleafController: @RequestMapping(value = "/owners/search", name = "OwnersSearchThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private OwnerService OwnersSearchThymeleafController.ownerService;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource OwnersSearchThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private ConversionService OwnersSearchThymeleafController.conversionService;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param ownerService
     * @param conversionService
     * @param messageSource
     */
    @Autowired
    public OwnersSearchThymeleafController.new(OwnerService ownerService, ConversionService conversionService, MessageSource messageSource) {
        setOwnerService(ownerService);
        setConversionService(conversionService);
        setMessageSource(messageSource);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return OwnerService
     */
    public OwnerService OwnersSearchThymeleafController.getOwnerService() {
        return ownerService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ownerService
     */
    public void OwnersSearchThymeleafController.setOwnerService(OwnerService ownerService) {
        this.ownerService = ownerService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource OwnersSearchThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void OwnersSearchThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConversionService
     */
    public ConversionService OwnersSearchThymeleafController.getConversionService() {
        return conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param conversionService
     */
    public void OwnersSearchThymeleafController.setConversionService(ConversionService conversionService) {
        this.conversionService = conversionService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "byFirstNameLikeForm", value = "/byFirstNameLike/search-form")
    public ModelAndView OwnersSearchThymeleafController.byFirstNameLikeForm(@ModelAttribute("formBean") OwnerFirstNameFormBean formBean, Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        return new ModelAndView("owners/findByFirstNameLikeForm");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "byFirstNameLike", value = "/byFirstNameLike")
    public ModelAndView OwnersSearchThymeleafController.byFirstNameLike(@ModelAttribute("formBean") OwnerFirstNameFormBean formBean, Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        return new ModelAndView("owners/findByFirstNameLike");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param datatablesColumns
     * @param search
     * @param pageable
     * @param draw
     * @return ResponseEntity
     */
    @GetMapping(name = "byFirstNameLikeDt", value = "/byFirstNameLike/dt", produces = Datatables.MEDIA_TYPE)
    @ResponseBody
    public ResponseEntity<ConvertedDatatablesData<Owner>> OwnersSearchThymeleafController.byFirstNameLikeDt(@ModelAttribute("formBean") OwnerFirstNameFormBean formBean, DatatablesColumns datatablesColumns, GlobalSearch search, DatatablesPageable pageable, @RequestParam(Datatables.PARAMETER_DRAW) Integer draw) {
        
        Page<Owner> owners = getOwnerService().findByFirstNameLike(formBean,search,pageable);
        long totalOwnersCount = owners.getTotalElements();
        if (search != null && StringUtils.isNotBlank(search.getText())) {
            totalOwnersCount = getOwnerService().countByFirstNameLike(formBean);
        }
        ConvertedDatatablesData<Owner> datatablesData = new ConvertedDatatablesData<Owner>(owners, totalOwnersCount, draw, getConversionService(), datatablesColumns);
        return ResponseEntity.ok(datatablesData);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "byCityLikeForm", value = "/byCityLike/search-form")
    public ModelAndView OwnersSearchThymeleafController.byCityLikeForm(@ModelAttribute("formBean") OwnerCityFormBean formBean, Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        return new ModelAndView("owners/findByCityLikeForm");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "byCityLike", value = "/byCityLike")
    public ModelAndView OwnersSearchThymeleafController.byCityLike(@ModelAttribute("formBean") OwnerCityFormBean formBean, Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        return new ModelAndView("owners/findByCityLike");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param datatablesColumns
     * @param search
     * @param pageable
     * @param draw
     * @return ResponseEntity
     */
    @GetMapping(name = "byCityLikeDt", value = "/byCityLike/dt", produces = Datatables.MEDIA_TYPE)
    @ResponseBody
    public ResponseEntity<ConvertedDatatablesData<OwnerInfo>> OwnersSearchThymeleafController.byCityLikeDt(@ModelAttribute("formBean") OwnerCityFormBean formBean, DatatablesColumns datatablesColumns, GlobalSearch search, DatatablesPageable pageable, @RequestParam(Datatables.PARAMETER_DRAW) Integer draw) {
        
        Page<OwnerInfo> owners = getOwnerService().findByCityLike(formBean,search,pageable);
        long totalOwnersCount = owners.getTotalElements();
        if (search != null && StringUtils.isNotBlank(search.getText())) {
            totalOwnersCount = getOwnerService().countByCityLike(formBean);
        }
        ConvertedDatatablesData<OwnerInfo> datatablesData = new ConvertedDatatablesData<OwnerInfo>(owners, totalOwnersCount, draw, getConversionService(), datatablesColumns);
        return ResponseEntity.ok(datatablesData);
    }
    
}
