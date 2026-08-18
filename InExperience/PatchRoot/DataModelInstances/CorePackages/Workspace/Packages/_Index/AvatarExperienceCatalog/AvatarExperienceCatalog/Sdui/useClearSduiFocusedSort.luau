local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function(p0) --[[ line: 27 | named "useClearSduiFocusedSort" ]]
	-- upvalues: useDispatch (ref), reactModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useCallback(function(p1) --[[ line: 29 ]]
		-- upvalues: var1 (ref), p0 (ref)
		if p1 then
			var1(p0.ClearWidgetInfo(nil, p1))
			
			return
		end
	end, { var1, p0.ClearWidgetInfo })
end