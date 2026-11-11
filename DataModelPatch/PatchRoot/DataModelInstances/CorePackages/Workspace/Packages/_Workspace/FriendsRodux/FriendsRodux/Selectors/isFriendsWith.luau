local LlamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)
local GetDeepValueModule = require(script.Parent.Parent.getDeepValue)

return function(p1)
	-- upvalues: GetDeepValueModule (copy), LlamaModule (copy)
	local KeyPath = p1.keyPath
	
	return function(p2, p3, p4)
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy), LlamaModule (upval)
		local DeepValueModule = GetDeepValueModule(p2, KeyPath .. ".byUserId")
		
		return DeepValueModule[p3] ~= nil and LlamaModule.List.find(DeepValueModule[p3], p4)
	end
end