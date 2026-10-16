local LlamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p1, List) --[[ Line: 5 ]]
	-- upvalues: LlamaModule (copy)
	local Nones = {}
	
	for _, value in pairs(List) do
		Nones[value] = LlamaModule.None
	end
	return LlamaModule.Dictionary.join(p1, Nones)
end