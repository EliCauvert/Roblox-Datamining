local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local BuildUIVisibilityModule = require(BuildExperience.utils.buildUIVisibility)

return function(p1) --[[ Line: 7 | Named "trackBuildOpenSafetyService" ]]
	-- upvalues: ReactModule (copy), BuildUIVisibilityModule (copy)
	ReactModule.useEffect(function() --[[ Line: 8 ]]
		-- upvalues: p1 (copy), BuildUIVisibilityModule (upval)
		if p1 then
			BuildUIVisibilityModule.acquire()
			
			return function() --[[ Line: 14 ]]
				-- upvalues: BuildUIVisibilityModule (upval)
				BuildUIVisibilityModule.release()
			end
		else
			return nil
		end
	end, { p1 })
end