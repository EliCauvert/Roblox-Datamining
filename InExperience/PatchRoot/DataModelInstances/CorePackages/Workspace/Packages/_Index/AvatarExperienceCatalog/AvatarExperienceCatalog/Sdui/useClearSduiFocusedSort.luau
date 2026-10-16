local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function(p1) --[[ Line: 27 | Named "useClearSduiFocusedSort" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.useCallback(function(p2) --[[ Line: 29 ]]
		-- upvalues: UseDispatchResult (copy), p1 (copy)
		if p2 then
			UseDispatchResult(p1.ClearWidgetInfo(nil, p2))
			
			return
		end
	end, { UseDispatchResult, p1.ClearWidgetInfo })
end