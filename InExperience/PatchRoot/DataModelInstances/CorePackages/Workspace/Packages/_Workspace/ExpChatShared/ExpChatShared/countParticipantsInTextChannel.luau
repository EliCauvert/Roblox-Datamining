local List = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).List

return function(Object) --[[ Line: 5 | Named "getNumberOfParticipants" ]]
	-- upvalues: List (copy)
	return List.count(Object:GetChildren(), function(TextSource) --[[ Line: 6 ]]
		return TextSource:IsA("TextSource")
	end)
end