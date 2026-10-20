local Parent = script:FindFirstAncestor("AddFriends").Parent
local LlamaModule = require(Parent.llama)
local TModule = require(Parent.t)

return function(p1)
	-- upvalues: TModule (copy), LlamaModule (copy)
	assert(TModule.table(p1))
	
	return LlamaModule.List.sort(p1, function(p2, p3): boolean
		return (p2.order or 9999999) < (p3.order or 9999999)
	end)
end