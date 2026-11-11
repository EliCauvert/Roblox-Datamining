local LlamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p1, List)
	-- upvalues: LlamaModule (copy)
	local Nones = {}
	
	for _, value in pairs(List) do
		Nones[value] = LlamaModule.None
	end
	return LlamaModule.Dictionary.join(p1, Nones)
end