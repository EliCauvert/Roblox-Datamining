local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local BuildUIVisibilityModule = require(BuildExperience.utils.buildUIVisibility)

return function(p1)
	-- upvalues: ReactModule (copy), BuildUIVisibilityModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), BuildUIVisibilityModule (upval)
		if p1 then
			BuildUIVisibilityModule.acquire()
			
			return function()
				-- upvalues: BuildUIVisibilityModule (upval)
				BuildUIVisibilityModule.release()
			end
		else
			return nil
		end
	end, { p1 })
end