local list = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).List

return function(p1)
	-- upvalues: list (ref)
	return list.count(p1:GetChildren(), function(p2)
		return p2:IsA("TextSource")
	end)
end