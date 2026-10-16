local Object = require(script.Parent.Parent.Parent.LuauPolyfill).Object
local RobloxComponentPropsModule = require(script.Parent.roblox.RobloxComponentProps)
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])

return {
	setInitialProperties = RobloxComponentPropsModule.setInitialProperties,
	diffProperties = function(_, _, List1, List2, _) --[[ Line: 32 ]]
		-- upvalues: Object (copy)
		local List = nil
		
		for i, value in List1 do
			if List2[i] == nil then
				List = List or table.create(2)
				table.insert(List, i)
				table.insert(List, Object.None)
			end
		end
		for i1, value in List2 do
			if value ~= (if List1 == nil then nil else List1[i1]) then
				List = List or table.create(2)
				table.insert(List, i1)
				table.insert(List, value)
			end
		end
		return List
	end,
	updateProperties = RobloxComponentPropsModule.updateProperties,
	cleanupHostComponent = RobloxComponentPropsModule.cleanupHostComponent
}