local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p0, p1) --[[ line: 13 | named "getLastMessageWithFilter" ]]
	-- upvalues: cryoModule (ref)
	if p0 and #p0 ~= 0 then
		local var1 = cryoModule.List.findWhere(p0, p1)
		
		return if var1 then p0[var1].messageId else nil
	end
	return nil
end