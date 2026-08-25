local list = require(script:FindFirstAncestor("ExpChatShared").Parent.llama).List

return function(p0)
	-- upvalues: list (ref)
	return list.count(p0:GetChildren(), function(p1)
		return p1:IsA("TextSource")
	end)
end