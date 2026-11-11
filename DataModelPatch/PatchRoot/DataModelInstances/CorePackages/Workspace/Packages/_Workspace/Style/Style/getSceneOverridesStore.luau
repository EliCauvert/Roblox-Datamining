local SceneOverrides = nil
local List = {}
local config = {
	getSceneOverrides = function()
		-- upvalues: SceneOverrides (ref)
		return SceneOverrides
	end,
	setSceneOverrides = function(Value)
		-- upvalues: SceneOverrides (ref), List (copy)
		SceneOverrides = Value
		
		for _, value in List do
			value(Value)
		end
	end,
	subscribe = function(Value)
		-- upvalues: List (copy)
		table.insert(List, Value)
		
		return function()
			-- upvalues: List (upval), Value (copy)
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end
}

return function()
	-- upvalues: config (copy)
	return config
end