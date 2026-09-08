local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), p1 (ref)
		if p2 then
			var1(p1.ClearWidgetInfo(nil, p2))
			
			return
		end
	end, { var1, p1.ClearWidgetInfo })
end