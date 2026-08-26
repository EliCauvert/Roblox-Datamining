local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	if p1 and #p1 ~= 0 then
		local var1 = cryoModule.List.findWhere(p1, p2)
		
		return if var1 then p1[var1].messageId else nil
	end
	return nil
end