// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.restful.model;

import com.disid.restful.model.Address;
import com.disid.restful.model.Customer;
import java.util.Objects;

privileged aspect Address_Roo_JavaBean {
    
    /**
     * Gets id value
     * 
     * @return Long
     */
    public Long Address.getId() {
        return this.id;
    }
    
    /**
     * Sets id value
     * 
     * @param id
     * @return Address
     */
    public Address Address.setId(Long id) {
        this.id = id;
        return this;
    }
    
    /**
     * Gets version value
     * 
     * @return Integer
     */
    public Integer Address.getVersion() {
        return this.version;
    }
    
    /**
     * Sets version value
     * 
     * @param version
     * @return Address
     */
    public Address Address.setVersion(Integer version) {
        this.version = version;
        return this;
    }
    
    /**
     * Gets street value
     * 
     * @return String
     */
    public String Address.getStreet() {
        return this.street;
    }
    
    /**
     * Sets street value
     * 
     * @param street
     * @return Address
     */
    public Address Address.setStreet(String street) {
        this.street = street;
        return this;
    }
    
    /**
     * Gets city value
     * 
     * @return String
     */
    public String Address.getCity() {
        return this.city;
    }
    
    /**
     * Sets city value
     * 
     * @param city
     * @return Address
     */
    public Address Address.setCity(String city) {
        this.city = city;
        return this;
    }
    
    /**
     * Gets streetNumber value
     * 
     * @return Integer
     */
    public Integer Address.getStreetNumber() {
        return this.streetNumber;
    }
    
    /**
     * Sets streetNumber value
     * 
     * @param streetNumber
     * @return Address
     */
    public Address Address.setStreetNumber(Integer streetNumber) {
        this.streetNumber = streetNumber;
        return this;
    }
    
    /**
     * Gets customer value
     * 
     * @return Customer
     */
    public Customer Address.getCustomer() {
        return this.customer;
    }
    
    /**
     * Sets customer value
     * 
     * @param customer
     * @return Address
     */
    public Address Address.setCustomer(Customer customer) {
        this.customer = customer;
        return this;
    }
    
    /**
     * This `equals` implementation is specific for JPA entities and uses 
     * the entity identifier for it, following the article in 
     * https://vladmihalcea.com/2016/06/06/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
     * 
     * @param obj
     * @return Boolean
     */
    public boolean Address.equals(Object obj) {
        if (this == obj) {
            return true;
        }
        // instanceof is false if the instance is null
        if (!(obj instanceof Address)) {
            return false;
        }
        return getId() != null && Objects.equals(getId(), ((Address) obj).getId());
    }
    
    /**
     * This `hashCode` implementation is specific for JPA entities and uses a fixed `int` value to be able 
     * to identify the entity in collections after a new id is assigned to the entity, following the article in 
     * https://vladmihalcea.com/2016/06/06/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
     * 
     * @return Integer
     */
    public int Address.hashCode() {
        return 31;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String Address.toString() {
        return "Address {" + 
                "id='" + id + '\'' + 
                ", version='" + version + '\'' + 
                ", street='" + street + '\'' + 
                ", city='" + city + '\'' + 
                ", streetNumber='" + streetNumber + '\'' + "}" + super.toString();
    }
    
}