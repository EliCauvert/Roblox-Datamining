local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Parent = ChatLineReporting.Parent
local ReactModule = require(Parent.React)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ButtonType = require(Parent.UIBlox).App.Button.Enum.ButtonType
local ReportCompleteDialogModule = require(Parent.GenericAbuseReporting.ReportCompleteDialog)
local LocalPlayer = game:GetService("Players").LocalPlayer
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local GetDisplayNameFromUserIdModule = require(ChatLineReporting.Common.getDisplayNameFromUserId)
local GetPlayerModule = require(ChatLineReporting.Common.getPlayer)
local MutePlayerModule = require(ChatLineReporting.Common.mutePlayer)
local SendSystemMessageModule = require(ChatLineReporting.Common.sendSystemMessage)

return function(p1) --[[ Line: 40 | Named "ChatLineReportCompleteModal" ]]
	-- upvalues: ExpChatSharedModule (copy), UseLocalizationFunction (copy), GetPlayerModule (copy), GetDisplayNameFromUserIdModule (copy), ButtonType (copy), ReactModule (copy), ReportCompleteDialogModule (copy), LocalPlayer (copy), MutePlayerModule (copy), ConstantsModule (copy), SendSystemMessageModule (copy)
	local Context = ExpChatSharedModule.context
	local UseLocalizationResult = UseLocalizationFunction(p1.localizationKeys)
	local v1 = nil
	
	if Context.store then
		v1 = GetPlayerModule(Context.store:getState().Players.byUserId, p1.selectedMessage.userId)
		
		if v1 == nil then
			v1 = {
				username = "",
				displayName = GetDisplayNameFromUserIdModule(p1.selectedMessage.userId),
				userId = p1.selectedMessage.userId
			}
		end
	end
	local UseLocalizationResult1 = UseLocalizationFunction({
		completeMute = {
			"Feature.ReportAbuse.Action.TextMute",
			name = v1 and v1.displayName or ""
		},
		systemMuteMessage = {
			"Feature.ReportAbuse.Message.UserTextMutedSystem",
			name = v1 and v1.displayName or ""
		}
	})
	local config = {
		buttonType = ButtonType.PrimarySystem,
		props = {
			onActivated = function() --[[ Line: 67 ]]
				-- upvalues: p1 (copy)
				p1.onDismiss(nil, "")
			end,
			text = UseLocalizationResult.completeClose
		}
	}
	
	return ReactModule.createElement(ReportCompleteDialogModule, {
		buttonStackInfo = {
			forceFillDirection = Enum.FillDirection.Vertical,
			buttons = if LocalPlayer then {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = function() --[[ Line: 82 ]]
							-- upvalues: MutePlayerModule (upval), v1 (ref), LocalPlayer (upval), p1 (copy), ConstantsModule (upval), SendSystemMessageModule (upval), UseLocalizationResult1 (copy)
							local MutePlayerModuleResult = MutePlayerModule(v1, LocalPlayer, p1.selectedMessage.isUniverseChat)
							
							if MutePlayerModuleResult and MutePlayerModuleResult.key == ConstantsModule.SuccessfulMuteKey then
								SendSystemMessageModule(UseLocalizationResult1.systemMuteMessage)
							end
							p1.onDismiss(MutePlayerModuleResult)
						end,
						text = UseLocalizationResult1.completeMute
					}
				},
				config
			} else { config }
		},
		localizationKeys = p1.localizationKeys,
		onDismiss = function() --[[ Line: 98 ]]
			-- upvalues: p1 (copy)
			p1.onDismiss(nil, "")
		end
	})
end