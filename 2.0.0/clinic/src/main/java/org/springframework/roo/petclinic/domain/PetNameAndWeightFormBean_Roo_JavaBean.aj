// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.domain;

import org.springframework.roo.petclinic.domain.PetNameAndWeightFormBean;

privileged aspect PetNameAndWeightFormBean_Roo_JavaBean {
    
    /**
     * Gets name value
     * 
     * @return String
     */
    public String PetNameAndWeightFormBean.getName() {
        return this.name;
    }
    
    /**
     * Sets name value
     * 
     * @param name
     * @return PetNameAndWeightFormBean
     */
    public PetNameAndWeightFormBean PetNameAndWeightFormBean.setName(String name) {
        this.name = name;
        return this;
    }
    
    /**
     * Gets weight value
     * 
     * @return Float
     */
    public Float PetNameAndWeightFormBean.getWeight() {
        return this.weight;
    }
    
    /**
     * Sets weight value
     * 
     * @param weight
     * @return PetNameAndWeightFormBean
     */
    public PetNameAndWeightFormBean PetNameAndWeightFormBean.setWeight(Float weight) {
        this.weight = weight;
        return this;
    }
    
}
