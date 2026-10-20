local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local SetModerationStatusModule = require(Modules.LuaApp.Actions.Moderation.SetModerationStatus)

return function()
	-- upvalues: SetModerationStatusModule (copy), GuiService (copy), NotificationTypeModule (copy)
	return function(p1)
		-- upvalues: SetModerationStatusModule (upval), GuiService (upval), NotificationTypeModule (upval)
		p1:dispatch(SetModerationStatusModule(false))
		GuiService:BroadcastNotification("", NotificationTypeModule.RESTART_LUA_APP)
	end
end