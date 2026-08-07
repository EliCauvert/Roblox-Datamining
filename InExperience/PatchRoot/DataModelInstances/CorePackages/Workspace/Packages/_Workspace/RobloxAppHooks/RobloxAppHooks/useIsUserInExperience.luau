local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local experienceService = require(parent.ExperienceService).ExperienceService
local reactModule = require(parent.React)

return function(p0) --[[ line: 10 | named "useIsUserInExperience" ]]
	-- upvalues: reactModule (ref), experienceService (ref)
	local var1, var2 = reactModule.useState(p0 or false)
	reactModule.useEffect(function() --[[ line: 12 ]]
		-- upvalues: experienceService (copy), var2 (ref)
		local list = {
			experienceService:RegisterForExperienceJoin(function() --[[ line: 14 ]]
				-- upvalues: var2 (copy)
				var2(true)
			end),
			experienceService:RegisterForExperienceLeave(function() --[[ line: 17 ]]
				-- upvalues: var2 (copy)
				var2(false)
			end)
		}
		
		return function() --[[ line: 22 ]]
			-- upvalues: list (ref)
			for i, v in list do
				if v and v.Disconnect then
					v:Disconnect()
				end
			end
		end
	end, {})
	
	return var1
end