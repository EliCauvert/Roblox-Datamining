local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local cryoModule = require(corePackagesService.Packages.Cryo)
local callProtocolModule = require(corePackagesService.Workspace.Packages.CallProtocol)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local contactList = coreGuiService:WaitForChild("RobloxGui").Modules.ContactList
local openOrUpdateDialogModule = require(contactList.Actions.OpenOrUpdateDialog)
local dependenciesModule = require(contactList.dependencies)
local UIBlox = dependenciesModule.UIBlox
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local buttonType = UIBlox.App.Button.Enum.ButtonType
local interactiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local useStyle = UIBlox.Core.Style.useStyle
local errorTypeModule = require(contactList.Enums.ErrorType)
local closeDialogModule = require(contactList.Actions.CloseDialog)
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local enablePlatformNotSupportedError = game:DefineFastFlag("EnablePlatformNotSupportedError", false)
local t = { callProtocol = callProtocolModule.CallProtocol.default }

return function(p0) --[[ line: 44 | named "CallDialogContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useDispatch (ref), useAnalyticsModule (ref), reactModule (ref), useSelector (ref), callProtocolModule (ref), errorTypeModule (ref), openOrUpdateDialogModule (ref), robloxTranslatorModule (ref), eventNamesEnumModule (ref), enablePlatformNotSupportedError (ref), runService (ref), roactModule (ref), coreGuiService (ref), interactiveAlert (ref), buttonType (ref), closeDialogModule (ref)
	local var16 = cryoModule.Dictionary.join(t, p0)
	local theme = useStyle().Theme
	local var17 = useDispatch()
	local var18 = useAnalyticsModule()
	local var19, var20 = reactModule.useState(Vector2.new(0, 0))
	local var21 = useSelector(function(p1) --[[ line: 55 ]]
		return p1.Dialog.title
	end, function(p2, p3) --[[ line: 57 ]]
		return p2 == p3
	end)
	local var22 = useSelector(function(p4) --[[ line: 61 ]]
		return p4.Dialog.bodyText
	end, function(p5, p6) --[[ line: 63 ]]
		return p5 == p6
	end)
	local var23 = useSelector(function(p7) --[[ line: 67 ]]
		return p7.Dialog.dismissCallback
	end, function(p8, p9) --[[ line: 69 ]]
		return p8 == p9
	end)
	local var24 = useSelector(function(p10) --[[ line: 73 ]]
		return p10.Dialog.isOpen
	end, function(p11, p12) --[[ line: 75 ]]
		return p11 == p12
	end)
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var16 (ref), callProtocolModule (copy), errorTypeModule (copy), var17 (ref), openOrUpdateDialogModule (copy), robloxTranslatorModule (copy), var18 (ref), eventNamesEnumModule (copy), enablePlatformNotSupportedError (copy), runService (copy)
		local var25 = var16.callProtocol:listenToHandleCallMessage(function(p13) --[[ line: 80 ]]
			-- upvalues: callProtocolModule (copy), errorTypeModule (copy), var17 (copy), openOrUpdateDialogModule (copy), robloxTranslatorModule (copy), var18 (copy), eventNamesEnumModule (copy), enablePlatformNotSupportedError (copy), runService (copy)
			if p13.messageType == callProtocolModule.Enums.MessageType.CallError.rawValue() then
				if p13.errorType == errorTypeModule.CallerIsInAnotherCall then
					var17(openOrUpdateDialogModule(robloxTranslatorModule:FormatByKey("Feature.Call.Error.Title.CouldntMakeCall"), robloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.AlreadyInCall")))
				elseif p13.errorType == errorTypeModule.CalleeIsInAnotherCall then
					var17(openOrUpdateDialogModule(robloxTranslatorModule:FormatByKey("Feature.Call.Error.Title.FriendBusy"), robloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.FriendBusy", { calleeCombinedName = p13.callInfo.calleeCombinedName })))
				elseif p13.errorType == errorTypeModule.UniverseIsNotVoiceEnabled or p13.errorType == errorTypeModule.PlaceIsNotVoiceEnabled then
					var17(openOrUpdateDialogModule(robloxTranslatorModule:FormatByKey("Feature.Call.Error.Title.ExperienceError"), robloxTranslatorModule:FormatByKey("Feature.Call.Description.ExperienceError")))
					var18.fireEvent(eventNamesEnumModule.PhoneBookCallFriendFailed, {
						errorMsg = "Universe or place is not voice enabled.",
						eventTimestampMs = os.time() * 1000,
						calleeUserId = p13.callInfo.calleeId,
						callerUserId = p13.callInfo.callerId
					})
				elseif p13.errorType == errorTypeModule.CallerIsNotVoiceEnabled then
					var17(openOrUpdateDialogModule(robloxTranslatorModule:FormatByKey("Feature.Call.Modal.EnableChatVoiceTitle"), robloxTranslatorModule:FormatByKey("Feature.Call.Modal.EnableChatVoiceBody")))
					var18.fireEvent(eventNamesEnumModule.PhoneBookCallFriendFailed, {
						errorMsg = "User is not voice enabled.",
						eventTimestampMs = os.time() * 1000,
						calleeUserId = p13.callInfo.calleeId,
						callerUserId = p13.callInfo.callerId
					})
				else
					var17(openOrUpdateDialogModule(robloxTranslatorModule:FormatByKey("Feature.Call.Error.Label.OhNo"), robloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.Generic")))
				end
				if p13.errorType == errorTypeModule.UniverseAgeIsNotValid then
					warn("Experience must be at least one week old to place a call")
					
					return
				elseif p13.errorType == errorTypeModule.ReservedServerAccessCodeIsNotProvided then
					warn("Reserved server access code was not provided via OnCallInviteInvoked callback")
					
					return
				elseif enablePlatformNotSupportedError and p13.errorType == errorTypeModule.PlatformIsNotSupported and runService:IsStudio() then
					warn("Roblox Studio requires Team Test to place a call.")
				end
			end
		end)
		
		return function() --[[ line: 155 ]]
			-- upvalues: var25 (ref)
			var25:Disconnect()
		end
	end, { var16.callProtocol })
	
	return reactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
		CallDialogScreen = reactModule.createElement("ScreenGui", {
			Enabled = var24,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			AutoLocalize = false,
			DisplayOrder = 8,
			[reactModule.Change.AbsoluteSize] = function(p14) --[[ line: 170 ]]
				-- upvalues: var20 (ref)
				var20(p14.AbsoluteSize)
			end
		}, {
			Overlay = reactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Text = "",
				BackgroundColor3 = theme.Overlay.Color,
				BackgroundTransparency = theme.Overlay.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}),
			CallDialog = reactModule.createElement(interactiveAlert, {
				screenSize = var19,
				title = var21,
				bodyText = var22,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = buttonType.PrimarySystem,
							props = {
								text = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Button.Ok"),
								onActivated = function() --[[ line: 192 ]]
									-- upvalues: var23 (ref), var17 (ref), closeDialogModule (copy)
									if var23 then
										var23()
									end
									var17(closeDialogModule())
								end
							}
						}
					}
				}
			})
		})
	})
end