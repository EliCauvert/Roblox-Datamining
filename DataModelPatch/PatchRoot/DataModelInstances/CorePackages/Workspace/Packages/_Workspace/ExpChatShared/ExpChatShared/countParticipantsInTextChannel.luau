local List = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).List

return function(Object)
	-- upvalues: List (copy)
	return List.count(Object:GetChildren(), function(TextSource)
		return TextSource:IsA("TextSource")
	end)
end