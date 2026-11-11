local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local ReactModule = require(Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy), ExperienceService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or false)
	ReactModule.useEffect(function()
		-- upvalues: ExperienceService (upval), UseStateResult2 (copy)
		local Connections = {
			ExperienceService:RegisterForExperienceJoin(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end),
			ExperienceService:RegisterForExperienceLeave(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
		}
		
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				if connection and connection.Disconnect then
					connection:Disconnect()
				end
			end
		end
	end, {})
	
	return UseStateResult
end