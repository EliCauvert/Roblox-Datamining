local Parent = script.Parent.Parent
local LlamaModule = require(Parent.Parent.llama)
local _ = require(Parent.roduxFriendsTypes)
local GetDeepValueModule = require(Parent.getDeepValue)

local function v4(p1, p2): boolean
	return p1.rank < p2.rank
end

return function(p1)
	-- upvalues: GetDeepValueModule (copy), LlamaModule (copy), v4 (copy)
	local KeyPath = p1.keyPath
	
	return function(p2, p3)
		-- upvalues: GetDeepValueModule (upval), KeyPath (copy), LlamaModule (upval), v4 (upval)
		return LlamaModule.List.sort(LlamaModule.Dictionary.values(GetDeepValueModule(p2, string.format("%s.recommendations.byUserId.%s", KeyPath, p3)) or {}), v4)
	end
end