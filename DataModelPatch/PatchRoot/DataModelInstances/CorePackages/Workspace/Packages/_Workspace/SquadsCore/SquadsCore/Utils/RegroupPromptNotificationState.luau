local GuiService = game:GetService("GuiService")
local Active = nil
local Active1 = nil
local RegroupPromptNotificationStateModule = {
	setActive = function(Value, Value1)
		-- upvalues: Active (ref), Active1 (ref)
		Active = Value
		Active1 = Value1
	end,
	getActiveNotifId = function()
		-- upvalues: Active (ref)
		return Active
	end,
	getActiveSquadId = function()
		-- upvalues: Active1 (ref)
		return Active1
	end,
	clearActive = function(NotificationId)
		-- upvalues: Active (ref), Active1 (ref)
		if NotificationId == nil or Active == NotificationId then
			Active = nil
			Active1 = nil
		end
	end
}

function RegroupPromptNotificationStateModule.dismissNotification(NotificationId)
	-- upvalues: GuiService (copy), RegroupPromptNotificationStateModule (copy)
	if NotificationId ~= nil then
		pcall(function()
			-- upvalues: GuiService (upval), NotificationId (copy)
			GuiService:DismissNotification(NotificationId)
		end)
		RegroupPromptNotificationStateModule.clearActive(NotificationId)
		
		return
	end
end

return RegroupPromptNotificationStateModule