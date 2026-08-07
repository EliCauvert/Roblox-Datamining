local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local getBuildPillMenuPortalStoreModule = require(buildExperience.Stores.GetBuildPillMenuPortalStore)
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 18 | named "BuildPillMenuPortalHost" ]]
	-- upvalues: getBuildPillMenuPortalStoreModule (ref), reactModule (ref), view (ref)
	local var4 = getBuildPillMenuPortalStoreModule()
	local var5 = reactModule.useCallback(function(p1) --[[ line: 21 ]]
		-- upvalues: var4 (ref)
		var4.setPortalTarget(p1)
	end, { var4 })
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: var4 (ref)
		return function() --[[ line: 26 ]]
			-- upvalues: var4 (copy)
			var4.setPortalTarget(nil)
		end
	end, { var4 })
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		ref = var5,
		testId = p0.testId or "build-pill-menu-portal-host"
	})
end)