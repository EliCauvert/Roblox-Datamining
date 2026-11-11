local CryoModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Cryo)

return function(List, p1)
	-- upvalues: CryoModule (copy)
	local JoinResult = CryoModule.Dictionary.join(p1 or {}, {})
	
	for i, value in List do
		local JoinResultEntry = JoinResult[i]
		JoinResult[i] = if JoinResultEntry then CryoModule.Dictionary.join(JoinResultEntry, value) else value
	end
	return JoinResult
end