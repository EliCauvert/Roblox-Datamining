local Parent = script:FindFirstAncestor("SocialTab").Parent
local AndroidTVExitButtonManager = require(Parent.RobloxAppNavigationCore).AndroidTVExitButtonManager
local FFlagAndroidTVExitWithB = require(Parent.SharedFlags).FFlagAndroidTVExitWithB

return function(GuiService, p1)
	-- upvalues: FFlagAndroidTVExitWithB (copy), AndroidTVExitButtonManager (copy)
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
			-- upvalues: ShowLeaveConfirmationConnection (ref), FFlagAndroidTVExitWithB (upval), RegisterResult (ref), GuiService (copy), AndroidTVExitButtonManager (upval)
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
			-- upvalues: GuiService (copy), p1 (copy)
			if GuiService and p1 then
				GuiService:BroadcastNotification("", p1.BACK_BUTTON_NOT_CONSUMED)
			end
		end
	}
end