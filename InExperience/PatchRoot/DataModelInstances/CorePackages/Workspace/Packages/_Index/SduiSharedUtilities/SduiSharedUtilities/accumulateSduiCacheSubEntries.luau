local cryoModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Cryo)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	local var1 = cryoModule.Dictionary.join(p2 or {}, {})
	
	for i, v in p1 do
		local var2 = var1[i]
		var1[i] = if var2 then cryoModule.Dictionary.join(var2, v) else v
	end
	return var1
end