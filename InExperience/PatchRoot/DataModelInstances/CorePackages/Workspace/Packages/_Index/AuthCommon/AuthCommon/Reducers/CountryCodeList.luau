local setCountryCodeListModule = require(script:FindFirstAncestor("AuthCommon").Actions.SetCountryCodeList)

return function(p1, p2)
	-- upvalues: setCountryCodeListModule (ref)
	p1 = p1 or {}
	assert(p1, "")
	
	if p2.type == setCountryCodeListModule.name then
		p1 = p2.countryCodeList
	end
	return p1
end