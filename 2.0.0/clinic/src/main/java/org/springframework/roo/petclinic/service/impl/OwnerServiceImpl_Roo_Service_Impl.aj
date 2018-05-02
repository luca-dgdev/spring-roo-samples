// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.service.impl;

import io.springlets.data.domain.GlobalSearch;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.petclinic.domain.Owner;
import org.springframework.roo.petclinic.domain.OwnerCityFormBean;
import org.springframework.roo.petclinic.domain.OwnerFirstNameFormBean;
import org.springframework.roo.petclinic.domain.OwnerInfo;
import org.springframework.roo.petclinic.domain.Pet;
import org.springframework.roo.petclinic.repository.OwnerRepository;
import org.springframework.roo.petclinic.service.api.PetService;
import org.springframework.roo.petclinic.service.impl.OwnerServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OwnerServiceImpl_Roo_Service_Impl {
    
    declare @type: OwnerServiceImpl: @Service;
    
    declare @type: OwnerServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private OwnerRepository OwnerServiceImpl.ownerRepository;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private PetService OwnerServiceImpl.petService;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param ownerRepository
     * @param petService
     */
    @Autowired
    public OwnerServiceImpl.new(OwnerRepository ownerRepository, @Lazy PetService petService) {
        setOwnerRepository(ownerRepository);
        setPetService(petService);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return OwnerRepository
     */
    public OwnerRepository OwnerServiceImpl.getOwnerRepository() {
        return ownerRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ownerRepository
     */
    public void OwnerServiceImpl.setOwnerRepository(OwnerRepository ownerRepository) {
        this.ownerRepository = ownerRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return PetService
     */
    public PetService OwnerServiceImpl.getPetService() {
        return petService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param petService
     */
    public void OwnerServiceImpl.setPetService(PetService petService) {
        this.petService = petService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param petsToAdd
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.addToPets(Owner owner, Iterable<Long> petsToAdd) {
        List<Pet> pets = getPetService().findAll(petsToAdd);
        owner.addToPets(pets);
        return getOwnerRepository().save(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param petsToRemove
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.removeFromPets(Owner owner, Iterable<Long> petsToRemove) {
        List<Pet> pets = getPetService().findAll(petsToRemove);
        owner.removeFromPets(pets);
        return getOwnerRepository().save(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     * @param pets
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.setPets(Owner owner, Iterable<Long> pets) {
        List<Pet> items = getPetService().findAll(pets);
        Set<Pet> currents = owner.getPets();
        Set<Pet> toRemove = new HashSet<Pet>();
        for (Iterator<Pet> iterator = currents.iterator(); iterator.hasNext();) {
            Pet nextPet = iterator.next();
            if (items.contains(nextPet)) {
                items.remove(nextPet);
            } else {
                toRemove.add(nextPet);
            }
        }
        owner.removeFromPets(toRemove);
        owner.addToPets(items);
        // Force the version update of the parent side to know that the parent has changed
        // because it has new books assigned
        owner.setVersion(owner.getVersion() + 1);
        return getOwnerRepository().save(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param owner
     */
    @Transactional
    public void OwnerServiceImpl.delete(Owner owner) {
        // Clear bidirectional one-to-many parent relationship with Pet
        for (Pet item : owner.getPets()) {
            item.setOwner(null);
        }
        
        getOwnerRepository().delete(owner);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Owner> OwnerServiceImpl.save(Iterable<Owner> entities) {
        return getOwnerRepository().save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void OwnerServiceImpl.delete(Iterable<Long> ids) {
        List<Owner> toDelete = getOwnerRepository().findAll(ids);
        getOwnerRepository().deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Owner
     */
    @Transactional
    public Owner OwnerServiceImpl.save(Owner entity) {
        return getOwnerRepository().save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Owner
     */
    public Owner OwnerServiceImpl.findOne(Long id) {
        return getOwnerRepository().findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Owner
     */
    public Owner OwnerServiceImpl.findOneForUpdate(Long id) {
        return getOwnerRepository().findOneDetached(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Owner> OwnerServiceImpl.findAll(Iterable<Long> ids) {
        return getOwnerRepository().findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Owner> OwnerServiceImpl.findAll() {
        return getOwnerRepository().findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long OwnerServiceImpl.count() {
        return getOwnerRepository().count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Owner> OwnerServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return getOwnerRepository().findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Owner> OwnerServiceImpl.findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable) {
        return getOwnerRepository().findAllByIdsIn(ids, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Owner> OwnerServiceImpl.findByFirstNameLike(OwnerFirstNameFormBean formBean, GlobalSearch globalSearch, Pageable pageable) {
        return getOwnerRepository().findByFirstNameLike(formBean, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<OwnerInfo> OwnerServiceImpl.findByCityLike(OwnerCityFormBean formBean, GlobalSearch globalSearch, Pageable pageable) {
        return getOwnerRepository().findByCityLike(formBean, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public long OwnerServiceImpl.countByFirstNameLike(OwnerFirstNameFormBean formBean) {
        return getOwnerRepository().countByFirstNameLike(formBean);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public long OwnerServiceImpl.countByCityLike(OwnerCityFormBean formBean) {
        return getOwnerRepository().countByCityLike(formBean);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Owner> OwnerServiceImpl.getEntityType() {
        return Owner.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Long> OwnerServiceImpl.getIdType() {
        return Long.class;
    }
    
}
