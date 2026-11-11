local CorePackages = game:GetService("CorePackages")
local NotificationTypeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.NotificationType)
local GuiService = game:GetService("GuiService")
local AndroidTVExitButtonManager = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).AndroidTVExitButtonManager
local FFlagAndroidTVExitWithB = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAndroidTVExitWithB

return function()
	-- upvalues: FFlagAndroidTVExitWithB (copy), GuiService (copy), AndroidTVExitButtonManager (copy), NotificationTypeModule (copy)
	local ShowLeaveConfirmationConnection = nil
	local RegisterResult = nil
	
	return {
		disconnect = function()
			-- upvalues: ShowLeaveConfirmationConnection (ref), FFlagAndroidTVExitWithB (upval), RegisterResult (ref)
			if ShowLeaveConfirmationConnection then
				ShowLeaveConfirmationConnection:Disconnect()
				ShowLeaveConfirmationConnection = nil
			end
			if FFlagAndroidTVExitWithB and RegisterResult then
				RegisterResult()
				RegisterResult = nil
			end
		end,
		connect = function(Callback)
			-- upvalues: ShowLeaveConfirmationConnection (ref), FFlagAndroidTVExitWithB (upval), RegisterResult (ref), GuiService (upval), AndroidTVExitButtonManager (upval)
			if ShowLeaveConfirmationConnection then
				if ShowLeaveConfirmationConnection then
					ShowLeaveConfirmationConnection:Disconnect()
					ShowLeaveConfirmationConnection = nil
				end
				if FFlagAndroidTVExitWithB and RegisterResult then
					RegisterResult()
					RegisterResult = nil
				end
			end
			if GuiService then
				ShowLeaveConfirmationConnection = GuiService.ShowLeaveConfirmation:Connect(Callback)
			end
			if FFlagAndroidTVExitWithB then
				RegisterResult = AndroidTVExitButtonManager.register(Callback)
			end
		end,
		showExitDialog = function()
			-- upvalues: GuiService (upval), NotificationTypeModule (upval)
			if GuiService and NotificationTypeModule then
				GuiService:BroadcastNotification("", NotificationTypeModule.BACK_BUTTON_NOT_CONSUMED)
			end
		end
	}
end