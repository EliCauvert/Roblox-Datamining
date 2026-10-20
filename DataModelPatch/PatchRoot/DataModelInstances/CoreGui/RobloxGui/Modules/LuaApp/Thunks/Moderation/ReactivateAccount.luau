local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local PromiseModule = require(Modules.LuaApp.Promise)
local PostReactivateModule = require(Modules.LuaApp.Http.Requests.ModerationAPI.PostReactivate)
local SetModerationStatusModule = require(Modules.LuaApp.Actions.Moderation.SetModerationStatus)

return function(p1, p2)
	-- upvalues: PostReactivateModule (copy), SetModerationStatusModule (copy), GuiService (copy), NotificationTypeModule (copy), PromiseModule (copy)
	return function(p3)
		-- upvalues: PostReactivateModule (upval), p1 (copy), p2 (copy), SetModerationStatusModule (upval), GuiService (upval), NotificationTypeModule (upval), PromiseModule (upval)
		return PostReactivateModule(p1, p2):andThen(function(_)
			-- upvalues: p3 (copy), SetModerationStatusModule (upval), GuiService (upval), NotificationTypeModule (upval), PromiseModule (upval)
			p3:dispatch(SetModerationStatusModule(false))
			GuiService:BroadcastNotification("", NotificationTypeModule.RESTART_LUA_APP)
			
			return PromiseModule.resolve()
		end, function(p4)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject({ error = p4 })
		end)
	end
end