local cryoModule = require(script:FindFirstAncestor("PhoneUpsell").Parent.Cryo)

return function(p0, p1)
	-- upvalues: cryoModule (ref)
	return cryoModule.Dictionary.join(p0, p1)
end