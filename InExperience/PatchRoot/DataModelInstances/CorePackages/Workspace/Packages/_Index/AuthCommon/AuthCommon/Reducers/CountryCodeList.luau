local SetCountryCodeListModule = require(script:FindFirstAncestor("AuthCommon").Actions.SetCountryCodeList)

return function(p1, p2) --[[ Line: 13 ]]
	-- upvalues: SetCountryCodeListModule (copy)
	local P0 = p1 or {}
	assert(P0, "")
	
	if p2.type == SetCountryCodeListModule.name then
		P0 = p2.countryCodeList
	end
	return P0
end