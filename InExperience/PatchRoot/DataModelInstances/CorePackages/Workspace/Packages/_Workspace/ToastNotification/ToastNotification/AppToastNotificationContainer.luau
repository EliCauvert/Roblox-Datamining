local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local toastNotificationWrapperModule = require(parent.ToastNotificationWrapper)
local experienceService = require(parent_1.ExperienceService).ExperienceService

return function(p0) --[[ line: 14 ]]
	-- upvalues: reactModule (ref), experienceService (ref), toastNotificationWrapperModule (ref)
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: experienceService (copy), var3 (ref)
		experienceService:RegisterForExperienceJoin(function() --[[ line: 17 ]]
			-- upvalues: var3 (copy)
			var3(true)
		end)
		experienceService:RegisterForExperienceLeave(function() --[[ line: 20 ]]
			-- upvalues: var3 (copy)
			var3(false)
		end)
	end, {})
	
	return not var2 and reactModule.createElement(toastNotificationWrapperModule, {
		renderLocation = "universalApp",
		displayOrder = p0.displayOrder
	})
end