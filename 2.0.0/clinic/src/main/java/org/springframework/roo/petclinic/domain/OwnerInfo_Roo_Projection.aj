// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.domain;

import io.springlets.format.EntityFormat;
import org.springframework.roo.petclinic.domain.OwnerInfo;

privileged aspect OwnerInfo_Roo_Projection {
    
    declare @type: OwnerInfo: @EntityFormat;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param id
     * @param firstName
     * @param lastName
     * @param city
     */
    public OwnerInfo.new(Long id, String firstName, String lastName, String city) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
    }

}
