local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getBuildPillMenuPortalStoreModule = require(buildExperience.Stores.GetBuildPillMenuPortalStore)
local view = foundationModule.View

return reactModule.memo(function(p1)
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), reactModule (ref), view (ref)
	local var1 = getBuildPillMenuPortalStoreModule()
	local var2 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1.setPortalTarget(p2)
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.setPortalTarget(nil)
		end
	end, { var1 })
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ref = var2,
		testId = p1.testId or "build-pill-menu-portal-host"
	})
end)