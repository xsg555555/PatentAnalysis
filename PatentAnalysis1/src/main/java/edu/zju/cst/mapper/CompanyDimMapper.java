package edu.zju.cst.mapper;

import java.util.List;

import edu.zju.cst.beans.CompanyDim;

public interface CompanyDimMapper {
	public CompanyDim getCompanyById(int id);
	public List<CompanyDim> getCompanyList();
}
