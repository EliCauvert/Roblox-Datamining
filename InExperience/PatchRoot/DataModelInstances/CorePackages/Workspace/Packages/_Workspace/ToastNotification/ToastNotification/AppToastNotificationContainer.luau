local parent = script.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local toastNotificationWrapperModule = require(parent.ToastNotificationWrapper)
local experienceService = require(parent_1.ExperienceService).ExperienceService

return function(p1)
	-- upvalues: reactModule (ref), experienceService (ref), toastNotificationWrapperModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: experienceService (copy), var2 (ref)
		experienceService:RegisterForExperienceJoin(function()
			-- upvalues: var2 (copy)
			var2(true)
		end)
		experienceService:RegisterForExperienceLeave(function()
			-- upvalues: var2 (copy)
			var2(false)
		end)
	end, {})
	
	return not var1 and reactModule.createElement(toastNotificationWrapperModule, {
		renderLocation = "universalApp",
		displayOrder = p1.displayOrder
	})
end