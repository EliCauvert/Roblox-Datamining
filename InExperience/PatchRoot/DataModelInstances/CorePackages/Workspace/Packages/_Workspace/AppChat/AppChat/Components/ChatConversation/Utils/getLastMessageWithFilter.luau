local CryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)

return function(p1, p2) --[[ Line: 13 | Named "getLastMessageWithFilter" ]]
	-- upvalues: CryoModule (copy)
	if p1 and #p1 ~= 0 then
		local Where = CryoModule.List.findWhere(p1, p2)
		
		return Where and p1[Where].messageId or nil
	else
		return nil
	end
end