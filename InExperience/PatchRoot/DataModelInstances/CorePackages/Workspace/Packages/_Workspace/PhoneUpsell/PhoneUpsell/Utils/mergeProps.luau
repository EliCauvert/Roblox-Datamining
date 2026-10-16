local CryoModule = require(script:FindFirstAncestor("PhoneUpsell").Parent.Cryo)

return function(p1, p2) --[[ Line: 9 | Named "mergeProps" ]]
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p1, p2)
end