local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local CallProtocolModule = require(CorePackages.Workspace.Packages.CallProtocol)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ContactList = CoreGui:WaitForChild("RobloxGui").Modules.ContactList
local OpenOrUpdateDialogModule = require(ContactList.Actions.OpenOrUpdateDialog)
local DependenciesModule = require(ContactList.dependencies)
local UIBlox = DependenciesModule.UIBlox
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local UseStyleFunction = UIBlox.Core.Style.useStyle
local ErrorTypeModule = require(ContactList.Enums.ErrorType)
local CloseDialogModule = require(ContactList.Actions.CloseDialog)
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local EnablePlatformNotSupportedError = game:DefineFastFlag("EnablePlatformNotSupportedError", false)
local config = { callProtocol = CallProtocolModule.CallProtocol.default }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseAnalyticsModule (copy), ReactModule (copy), UseSelectorFunction (copy), CallProtocolModule (copy), ErrorTypeModule (copy), OpenOrUpdateDialogModule (copy), RobloxTranslatorModule (copy), EventNamesEnumModule (copy), EnablePlatformNotSupportedError (copy), RunService (copy), RoactModule (copy), CoreGui (copy), InteractiveAlert (copy), ButtonType (copy), CloseDialogModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Theme = UseStyleFunction().Theme
	local UseDispatchResult = UseDispatchFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.Dialog.title
	end, function(p2, p3): boolean
		return p2 == p3
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.Dialog.bodyText
	end, function(p2, p3): boolean
		return p2 == p3
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		return p2.Dialog.dismissCallback
	end, function(p2, p3): boolean
		return p2 == p3
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		return p2.Dialog.isOpen
	end, function(p2, p3): boolean
		return p2 == p3
	end)
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy), CallProtocolModule (upval), ErrorTypeModule (upval), UseDispatchResult (copy), OpenOrUpdateDialogModule (upval), RobloxTranslatorModule (upval), UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), EnablePlatformNotSupportedError (upval), RunService (upval)
		local ListenToHandleCallMessageResult = JoinResult.callProtocol:listenToHandleCallMessage(function(p2)
			-- upvalues: CallProtocolModule (upval), ErrorTypeModule (upval), UseDispatchResult (upval), OpenOrUpdateDialogModule (upval), RobloxTranslatorModule (upval), UseAnalyticsModuleResult (upval), EventNamesEnumModule (upval), EnablePlatformNotSupportedError (upval), RunService (upval)
			if p2.messageType == CallProtocolModule.Enums.MessageType.CallError.rawValue() then
				if p2.errorType == ErrorTypeModule.CallerIsInAnotherCall then
					UseDispatchResult(OpenOrUpdateDialogModule(RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Title.CouldntMakeCall"), RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.AlreadyInCall")))
				elseif p2.errorType == ErrorTypeModule.CalleeIsInAnotherCall then
					UseDispatchResult(OpenOrUpdateDialogModule(RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Title.FriendBusy"), RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.FriendBusy", { calleeCombinedName = p2.callInfo.calleeCombinedName })))
				elseif p2.errorType == ErrorTypeModule.UniverseIsNotVoiceEnabled or p2.errorType == ErrorTypeModule.PlaceIsNotVoiceEnabled then
					UseDispatchResult(OpenOrUpdateDialogModule(RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Title.ExperienceError"), RobloxTranslatorModule:FormatByKey("Feature.Call.Description.ExperienceError")))
					UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookCallFriendFailed, {
						errorMsg = "Universe or place is not voice enabled.",
						eventTimestampMs = os.time() * 1000,
						calleeUserId = p2.callInfo.calleeId,
						callerUserId = p2.callInfo.callerId
					})
				elseif p2.errorType == ErrorTypeModule.CallerIsNotVoiceEnabled then
					UseDispatchResult(OpenOrUpdateDialogModule(RobloxTranslatorModule:FormatByKey("Feature.Call.Modal.EnableChatVoiceTitle"), RobloxTranslatorModule:FormatByKey("Feature.Call.Modal.EnableChatVoiceBody")))
					UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookCallFriendFailed, {
						errorMsg = "User is not voice enabled.",
						eventTimestampMs = os.time() * 1000,
						calleeUserId = p2.callInfo.calleeId,
						callerUserId = p2.callInfo.callerId
					})
				else
					UseDispatchResult(OpenOrUpdateDialogModule(RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Label.OhNo"), RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.Generic")))
				end
				if p2.errorType == ErrorTypeModule.UniverseAgeIsNotValid then
					warn("Experience must be at least one week old to place a call")
					
					return
				end
				if p2.errorType == ErrorTypeModule.ReservedServerAccessCodeIsNotProvided then
					warn("Reserved server access code was not provided via OnCallInviteInvoked callback")
					
					return
				end
				if EnablePlatformNotSupportedError and p2.errorType == ErrorTypeModule.PlatformIsNotSupported and RunService:IsStudio() then
					warn("Roblox Studio requires Team Test to place a call.")
				end
			end
		end)
		
		return function()
			-- upvalues: ListenToHandleCallMessageResult (copy)
			ListenToHandleCallMessageResult:Disconnect()
		end
	end, { JoinResult.callProtocol })
	
	return ReactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		CallDialogScreen = ReactModule.createElement("ScreenGui", {
			Enabled = UseSelectorResult3,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			AutoLocalize = false,
			DisplayOrder = 8,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize)
			end
		}, {
			Overlay = ReactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BorderSizePixel = 0,
				Text = "",
				BackgroundColor3 = Theme.Overlay.Color,
				BackgroundTransparency = Theme.Overlay.Transparency,
				Size = UDim2.new(1, 0, 1, 0)
			}),
			CallDialog = ReactModule.createElement(InteractiveAlert, {
				screenSize = UseStateResult,
				title = UseSelectorResult,
				bodyText = UseSelectorResult1,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								text = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Button.Ok"),
								onActivated = function()
									-- upvalues: UseSelectorResult2 (copy), UseDispatchResult (copy), CloseDialogModule (upval)
									if UseSelectorResult2 then
										UseSelectorResult2()
									end
									UseDispatchResult(CloseDialogModule())
								end
							}
						}
					}
				}
			})
		})
	})
end