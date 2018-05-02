// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.domain;

import java.util.Date;
import java.util.Objects;
import org.springframework.roo.petclinic.domain.AbstractPerson;

privileged aspect AbstractPerson_Roo_JavaBean {
    
    /**
     * Gets id value
     * 
     * @return Long
     */
    public Long AbstractPerson.getId() {
        return this.id;
    }
    
    /**
     * Sets id value
     * 
     * @param id
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setId(Long id) {
        this.id = id;
        return this;
    }
    
    /**
     * Gets version value
     * 
     * @return Integer
     */
    public Integer AbstractPerson.getVersion() {
        return this.version;
    }
    
    /**
     * Sets version value
     * 
     * @param version
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setVersion(Integer version) {
        this.version = version;
        return this;
    }
    
    /**
     * Gets firstName value
     * 
     * @return String
     */
    public String AbstractPerson.getFirstName() {
        return this.firstName;
    }
    
    /**
     * Sets firstName value
     * 
     * @param firstName
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }
    
    /**
     * Gets lastName value
     * 
     * @return String
     */
    public String AbstractPerson.getLastName() {
        return this.lastName;
    }
    
    /**
     * Sets lastName value
     * 
     * @param lastName
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setLastName(String lastName) {
        this.lastName = lastName;
        return this;
    }
    
    /**
     * Gets address value
     * 
     * @return String
     */
    public String AbstractPerson.getAddress() {
        return this.address;
    }
    
    /**
     * Sets address value
     * 
     * @param address
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setAddress(String address) {
        this.address = address;
        return this;
    }
    
    /**
     * Gets city value
     * 
     * @return String
     */
    public String AbstractPerson.getCity() {
        return this.city;
    }
    
    /**
     * Sets city value
     * 
     * @param city
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setCity(String city) {
        this.city = city;
        return this;
    }
    
    /**
     * Gets telephone value
     * 
     * @return String
     */
    public String AbstractPerson.getTelephone() {
        return this.telephone;
    }
    
    /**
     * Sets telephone value
     * 
     * @param telephone
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setTelephone(String telephone) {
        this.telephone = telephone;
        return this;
    }
    
    /**
     * Gets homePage value
     * 
     * @return String
     */
    public String AbstractPerson.getHomePage() {
        return this.homePage;
    }
    
    /**
     * Sets homePage value
     * 
     * @param homePage
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setHomePage(String homePage) {
        this.homePage = homePage;
        return this;
    }
    
    /**
     * Gets email value
     * 
     * @return String
     */
    public String AbstractPerson.getEmail() {
        return this.email;
    }
    
    /**
     * Sets email value
     * 
     * @param email
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setEmail(String email) {
        this.email = email;
        return this;
    }
    
    /**
     * Gets birthDay value
     * 
     * @return Date
     */
    public Date AbstractPerson.getBirthDay() {
        return this.birthDay;
    }
    
    /**
     * Sets birthDay value
     * 
     * @param birthDay
     * @return AbstractPerson
     */
    public AbstractPerson AbstractPerson.setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
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
    public boolean AbstractPerson.equals(Object obj) {
        if (this == obj) {
            return true;
        }
        // instanceof is false if the instance is null
        if (!(obj instanceof AbstractPerson)) {
            return false;
        }
        return getId() != null && Objects.equals(getId(), ((AbstractPerson) obj).getId());
    }
    
    /**
     * This `hashCode` implementation is specific for JPA entities and uses a fixed `int` value to be able 
     * to identify the entity in collections after a new id is assigned to the entity, following the article in 
     * https://vladmihalcea.com/2016/06/06/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
     * 
     * @return Integer
     */
    public int AbstractPerson.hashCode() {
        return 31;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String AbstractPerson.toString() {
        return "AbstractPerson {" + 
                "id='" + id + '\'' + 
                ", version='" + version + '\'' + 
                ", firstName='" + firstName + '\'' + 
                ", lastName='" + lastName + '\'' + 
                ", address='" + address + '\'' + 
                ", city='" + city + '\'' + 
                ", telephone='" + telephone + '\'' + 
                ", homePage='" + homePage + '\'' + 
                ", email='" + email + '\'' + 
                ", birthDay='" + birthDay == null ? null : java.text.DateFormat.getDateTimeInstance().format(birthDay) + '\'' + "}" + super.toString();
    }
    
}