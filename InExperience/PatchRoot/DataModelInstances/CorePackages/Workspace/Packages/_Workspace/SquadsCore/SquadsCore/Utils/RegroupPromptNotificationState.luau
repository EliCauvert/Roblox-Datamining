local GuiService = game:GetService("GuiService")
local Active = nil
local Active1 = nil
local RegroupPromptNotificationStateModule = {
	setActive = function(Value, Value1) --[[ Line: 7 ]]
		-- upvalues: Active (ref), Active1 (ref)
		Active = Value
		Active1 = Value1
	end,
	getActiveNotifId = function() --[[ Line: 12 ]]
		-- upvalues: Active (ref)
		return Active
	end,
	getActiveSquadId = function() --[[ Line: 16 ]]
		-- upvalues: Active1 (ref)
		return Active1
	end,
	clearActive = function(NotificationId) --[[ Line: 20 ]]
		-- upvalues: Active (ref), Active1 (ref)
		if NotificationId == nil or Active == NotificationId then
			Active = nil
			Active1 = nil
		end
	end
}

function RegroupPromptNotificationStateModule.dismissNotification(NotificationId) --[[ Line: 27 ]]
	-- upvalues: GuiService (copy), RegroupPromptNotificationStateModule (copy)
	if NotificationId ~= nil then
		pcall(function() --[[ Line: 31 ]]
			-- upvalues: GuiService (upval), NotificationId (copy)
			GuiService:DismissNotification(NotificationId)
		end)
		RegroupPromptNotificationStateModule.clearActive(NotificationId)
		
		return
	end
end

return RegroupPromptNotificationStateModule