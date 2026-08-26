local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local reactModule = require(parent.React)
local expChatSharedModule = require(parent.ExpChatShared)
local buttonType = require(parent.UIBlox).App.Button.Enum.ButtonType
local reportCompleteDialogModule = require(parent.GenericAbuseReporting.ReportCompleteDialog)
local localPlayer = game:GetService("Players").LocalPlayer
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(chatLineReporting.Common.Constants)
local getDisplayNameFromUserIdModule = require(chatLineReporting.Common.getDisplayNameFromUserId)
local getPlayerModule = require(chatLineReporting.Common.getPlayer)
local mutePlayerModule = require(chatLineReporting.Common.mutePlayer)
local sendSystemMessageModule = require(chatLineReporting.Common.sendSystemMessage)

return function(p1)
	-- upvalues: expChatSharedModule (ref), useLocalization (ref), getPlayerModule (ref), getDisplayNameFromUserIdModule (ref), buttonType (ref), reactModule (ref), reportCompleteDialogModule (ref), localPlayer (ref), mutePlayerModule (ref), constantsModule (ref), sendSystemMessageModule (ref)
	local context = expChatSharedModule.context
	local var1 = useLocalization(p1.localizationKeys)
	local t = nil
	
	if context.store then
		t = getPlayerModule(context.store:getState().Players.byUserId, p1.selectedMessage.userId)
		
		if t == nil then
			t = {
				username = "",
				displayName = getDisplayNameFromUserIdModule(p1.selectedMessage.userId),
				userId = p1.selectedMessage.userId
			}
		end
	end
	local var2 = useLocalization({
		completeMute = {
			"Feature.ReportAbuse.Action.TextMute",
			name = if t then t.displayName else ""
		},
		systemMuteMessage = {
			"Feature.ReportAbuse.Message.UserTextMutedSystem",
			name = if t then t.displayName else ""
		}
	})
	local t_1 = {
		buttonType = buttonType.PrimarySystem,
		props = {
			onActivated = function()
				-- upvalues: p1 (ref)
				p1.onDismiss(nil, "")
			end,
			text = var1.completeClose
		}
	}
	
	return reactModule.createElement(reportCompleteDialogModule, {
		buttonStackInfo = {
			forceFillDirection = Enum.FillDirection.Vertical,
			buttons = if localPlayer then {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = function()
							-- upvalues: mutePlayerModule (copy), t (write), localPlayer (copy), p1 (ref), constantsModule (copy), sendSystemMessageModule (copy), var2 (ref)
							local var3 = mutePlayerModule(t, localPlayer, p1.selectedMessage.isUniverseChat)
							
							if var3 and var3.key == constantsModule.SuccessfulMuteKey then
								sendSystemMessageModule(var2.systemMuteMessage)
							end
							p1.onDismiss(var3)
						end,
						text = var2.completeMute
					}
				},
				t_1
			} else { t_1 }
		},
		localizationKeys = p1.localizationKeys,
		onDismiss = function()
			-- upvalues: p1 (ref)
			p1.onDismiss(nil, "")
		end
	})
end