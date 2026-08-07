local setCountryCodeListModule = require(script:FindFirstAncestor("AuthCommon").Actions.SetCountryCodeList)

return function(p0, p1) --[[ line: 13 ]]
	-- upvalues: setCountryCodeListModule (ref)
	p0 = p0 or {}
	assert(p0, "")
	
	if p1.type == setCountryCodeListModule.name then
		p0 = p1.countryCodeList
	end
	return p0
end