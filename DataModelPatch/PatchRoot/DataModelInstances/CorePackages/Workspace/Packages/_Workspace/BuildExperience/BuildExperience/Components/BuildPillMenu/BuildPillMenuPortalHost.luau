local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local GetBuildPillMenuPortalStoreModule = require(BuildExperience.Stores.GetBuildPillMenuPortalStore)
local View = require(Parent.Foundation).View

return ReactModule.memo(function(p1)
	-- upvalues: GetBuildPillMenuPortalStoreModule (copy), ReactModule (copy), View (copy)
	local BuildPillMenuPortalStoreModule = GetBuildPillMenuPortalStoreModule()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: BuildPillMenuPortalStoreModule (copy)
		BuildPillMenuPortalStoreModule.setPortalTarget(p2)
	end, { BuildPillMenuPortalStoreModule })
	ReactModule.useEffect(function()
		-- upvalues: BuildPillMenuPortalStoreModule (copy)
		return function()
			-- upvalues: BuildPillMenuPortalStoreModule (upval)
			BuildPillMenuPortalStoreModule.setPortalTarget(nil)
		end
	end, { BuildPillMenuPortalStoreModule })
	
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ref = UseResult,
		testId = p1.testId or "build-pill-menu-portal-host"
	})
end)