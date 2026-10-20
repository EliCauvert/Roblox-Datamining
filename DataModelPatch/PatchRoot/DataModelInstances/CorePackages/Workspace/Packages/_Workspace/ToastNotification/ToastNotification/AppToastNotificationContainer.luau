local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ToastNotificationWrapperModule = require(Parent.ToastNotificationWrapper)
local ExperienceService = require(Parent1.ExperienceService).ExperienceService

return function(p1)
	-- upvalues: ReactModule (copy), ExperienceService (copy), ToastNotificationWrapperModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: ExperienceService (upval), UseStateResult2 (copy)
		ExperienceService:RegisterForExperienceJoin(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		ExperienceService:RegisterForExperienceLeave(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
	end, {})
	
	return not UseStateResult and ReactModule.createElement(ToastNotificationWrapperModule, {
		renderLocation = "universalApp",
		displayOrder = p1.displayOrder
	})
end