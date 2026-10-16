local SceneOverrides = nil
local List = {}
local config = {
	getSceneOverrides = function() --[[ Line: 24 ]]
		-- upvalues: SceneOverrides (ref)
		return SceneOverrides
	end,
	setSceneOverrides = function(Value) --[[ Line: 27 ]]
		-- upvalues: SceneOverrides (ref), List (copy)
		SceneOverrides = Value
		
		for _, value in List do
			value(Value)
		end
	end,
	subscribe = function(Value) --[[ Line: 33 ]]
		-- upvalues: List (copy)
		table.insert(List, Value)
		
		return function() --[[ Line: 35 ]]
			-- upvalues: List (upval), Value (copy)
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end
}

return function() --[[ Line: 44 | Named "getSceneOverridesStore" ]]
	-- upvalues: config (copy)
	return config
end