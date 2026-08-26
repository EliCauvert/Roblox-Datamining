local cryoModule = require(script:FindFirstAncestor("PhoneUpsell").Parent.Cryo)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	return cryoModule.Dictionary.join(p1, p2)
end