local list = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).List

return function(p0) --[[ line: 5 | named "getNumberOfParticipants" ]]
	-- upvalues: list (ref)
	return list.count(p0:GetChildren(), function(p1) --[[ line: 6 ]]
		return p1:IsA("TextSource")
	end)
end