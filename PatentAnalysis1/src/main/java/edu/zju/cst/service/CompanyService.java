package edu.zju.cst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zju.cst.beans.CompanyDim;
import edu.zju.cst.mapper.CompanyDimMapper;


@Service("companyService")
public class CompanyService {
	@Autowired
	private CompanyDimMapper companyDimMapper;
	
	public CompanyDim getCompanyById(int id){
		return (CompanyDim)this.companyDimMapper.getCompanyById(id);
	}
	public List<CompanyDim> getCompanyList() {       
        return (List<CompanyDim>)this.companyDimMapper.getCompanyList();  
    } 
}
