local CountryCodeModule = {
	new = function()
		return {}
	end
}

function CountryCodeModule.fromJSON(p1)
	-- upvalues: CountryCodeModule (copy)
	local NewCountryCode = CountryCodeModule.new()
	NewCountryCode.name = p1.name
	NewCountryCode.code = p1.code
	NewCountryCode.prefix = p1.prefix
	NewCountryCode.localizedName = p1.localizedName
	NewCountryCode.isDefault = p1.isDefault
	
	return NewCountryCode
end

return CountryCodeModule