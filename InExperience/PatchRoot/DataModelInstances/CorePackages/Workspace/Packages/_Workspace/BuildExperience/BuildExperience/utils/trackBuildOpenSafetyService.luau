local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local buildUIVisibilityModule = require(buildExperience.utils.buildUIVisibility)

return function(p1)
	-- upvalues: reactModule (ref), buildUIVisibilityModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), buildUIVisibilityModule (copy)
		if p1 then
			buildUIVisibilityModule.acquire()
			
			return function()
				-- upvalues: buildUIVisibilityModule (copy)
				buildUIVisibilityModule.release()
			end
		end
		return nil
	end, { p1 })
end