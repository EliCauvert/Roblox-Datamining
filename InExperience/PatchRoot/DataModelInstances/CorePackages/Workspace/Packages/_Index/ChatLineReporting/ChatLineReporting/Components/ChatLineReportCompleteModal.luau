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

return function(p0)
	-- upvalues: expChatSharedModule (ref), useLocalization (ref), getPlayerModule (ref), getDisplayNameFromUserIdModule (ref), buttonType (ref), reactModule (ref), reportCompleteDialogModule (ref), localPlayer (ref), mutePlayerModule (ref), constantsModule (ref), sendSystemMessageModule (ref)
	local context = expChatSharedModule.context
	local var9 = useLocalization(p0.localizationKeys)
	local t = nil
	
	if context.store then
		t = getPlayerModule(context.store:getState().Players.byUserId, p0.selectedMessage.userId)
		
		if t == nil then
			t = {
				username = "",
				displayName = getDisplayNameFromUserIdModule(p0.selectedMessage.userId),
				userId = p0.selectedMessage.userId
			}
		end
	end
	local var11 = useLocalization({
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
				-- upvalues: p0 (ref)
				p0.onDismiss(nil, "")
			end,
			text = var9.completeClose
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
							-- upvalues: mutePlayerModule (copy), t (write), localPlayer (copy), p0 (ref), constantsModule (copy), sendSystemMessageModule (copy), var11 (ref)
							local var13 = mutePlayerModule(t, localPlayer, p0.selectedMessage.isUniverseChat)
							
							if var13 and var13.key == constantsModule.SuccessfulMuteKey then
								sendSystemMessageModule(var11.systemMuteMessage)
							end
							p0.onDismiss(var13)
						end,
						text = var11.completeMute
					}
				},
				t_1
			} else { t_1 }
		},
		localizationKeys = p0.localizationKeys,
		onDismiss = function()
			-- upvalues: p0 (ref)
			p0.onDismiss(nil, "")
		end
	})
end