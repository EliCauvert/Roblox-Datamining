local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EnableConsoleAutoFocusForUEN1 = game:DefineFastFlag("EnableConsoleAutoFocusForUEN1", false)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local HttpRequestModule = require(Parent.HttpRequest)
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("NotificationsUpsellModalHttpRetryCount", 4) else nil
})
local FollowingsPostFollowModule = require(script.Parent.Parent.Requests.FollowingsPostFollow)
local SendEventDeferredFunction = require(Parent.NotificationsCommon).sendEventDeferred
local ModalEventConstantsModule = require(script.Parent.Parent.Analytics.ModalEventConstants)
local RichTextEscapeModule = require(script.Parent.Parent.Util.RichTextEscape)

return function(p1) --[[ Line: 39 ]]
	-- upvalues: UseLocalizationFunction (copy), UseCallbackFunction (copy), SendEventDeferredFunction (copy), ModalEventConstantsModule (copy), Players (copy), FollowingsPostFollowModule (copy), ConfigResult (copy), NotificationModalsManagerModule (copy), Images (copy), UseStateFunction (copy), UseRefFunction (copy), EnableConsoleAutoFocusForUEN1 (copy), UseEffectFunction (copy), UserInputService (copy), GuiService (copy), ReactModule (copy), ReactRobloxModule (copy), InteractiveAlert (copy), RichTextEscapeModule (copy), ButtonType (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Cancel = "CommonUI.Controls.Action.Cancel",
		Yes = "CommonUI.Controls.Action.Yes",
		Heading = "Feature.Notifications.Heading.TurnOnNotifications",
		ReceiveUpdates = "Feature.Notifications.Label.ReceiveActivityUpdates",
		ReceiveUpdatesForExperience = "Feature.Notifications.Label.GetUpdatesFromExperience",
		NotificationsEnabledForExperience = "Feature.Notifications.Response.NotificationsEnabledForExperience",
		NotificationsEnabled = "Feature.Notifications.Response.NotificationsEnabled",
		SomethingWentWrong = "Feature.Call.Error.Description.Generic"
	})
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 52 ]]
		-- upvalues: SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), p1 (copy)
		SendEventDeferredFunction(ModalEventConstantsModule.ModalContext, ModalEventConstantsModule.OptInEventName, {
			[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Clicked,
			[ModalEventConstantsModule.Button] = ModalEventConstantsModule.Cancel,
			[ModalEventConstantsModule.UniverseId] = p1.ExperienceId
		})
		p1.CloseModal()
	end, { p1.CloseModal, p1.ExperienceId })
	local UseCallbackResult1 = UseCallbackFunction(function() --[[ Line: 61 ]]
		-- upvalues: SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), p1 (copy), Players (upval), FollowingsPostFollowModule (upval), ConfigResult (upval), NotificationModalsManagerModule (upval), Images (upval), UseLocalizationResult (copy)
		SendEventDeferredFunction(ModalEventConstantsModule.ModalContext, ModalEventConstantsModule.OptInEventName, {
			[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Clicked,
			[ModalEventConstantsModule.Button] = ModalEventConstantsModule.Confirm,
			[ModalEventConstantsModule.UniverseId] = p1.ExperienceId
		})
		local LocalPlayer = Players and Players.LocalPlayer
		
		if p1.ExperienceId ~= "0" and LocalPlayer then
			SendEventDeferredFunction(ModalEventConstantsModule.ModalContext, ModalEventConstantsModule.OptInEventName, {
				[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.BackendRequested,
				[ModalEventConstantsModule.UniverseId] = p1.ExperienceId
			})
			FollowingsPostFollowModule(ConfigResult, tostring(LocalPlayer.UserId), (tostring(p1.ExperienceId))):andThen(function() --[[ Line: 74 ]]
				-- upvalues: SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), p1 (upval), NotificationModalsManagerModule (upval), Images (upval), UseLocalizationResult (upval)
				SendEventDeferredFunction(ModalEventConstantsModule.ModalContext, ModalEventConstantsModule.OptInEventName, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.BackendSuccess,
					[ModalEventConstantsModule.UniverseId] = p1.ExperienceId
				})
				NotificationModalsManagerModule.SetUIBloxToast({
					iconImage = Images["icons/common/notificationOn"],
					toastTitle = if p1.ExperienceName then UseLocalizationResult.NotificationsEnabledForExperience:gsub("{experienceName}", p1.ExperienceName) else UseLocalizationResult.NotificationsEnabled
				})
			end, function() --[[ Line: 89 ]]
				-- upvalues: SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), p1 (upval), NotificationModalsManagerModule (upval), Images (upval), UseLocalizationResult (upval)
				SendEventDeferredFunction(ModalEventConstantsModule.ModalContext, ModalEventConstantsModule.OptInEventName, {
					[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.BackendFailed,
					[ModalEventConstantsModule.UniverseId] = p1.ExperienceId
				})
				NotificationModalsManagerModule.SetUIBloxToast({
					iconImage = Images["icons/status/alert"],
					toastTitle = UseLocalizationResult.SomethingWentWrong
				})
			end)
		end
		p1.CloseModal()
	end, { p1.CloseModal, p1.ExperienceId, UseLocalizationResult })
	local UseStateResult, UseStateResult2 = UseStateFunction(Vector2.new(800, 600))
	local UseCallbackResult2 = UseCallbackFunction(function(Frame) --[[ Line: 111 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, { UseStateResult2 })
	local UseRefResult = UseRefFunction(nil)
	
	if EnableConsoleAutoFocusForUEN1 then
		UseEffectFunction(function() --[[ Line: 117 ]]
			-- upvalues: UserInputService (upval), UseRefResult (copy), GuiService (upval)
			if not UserInputService.GamepadEnabled then return end
			task.delay(0.3, function() --[[ Line: 124 ]]
				-- upvalues: UseRefResult (upval), GuiService (upval)
				local Buttons = UseRefResult.current and UseRefResult.current:FindFirstChild("Buttons", true)
				local _2 = Buttons and Buttons:FindFirstChild("2")
				
				if _2 then
					GuiService.SelectedCoreObject = _2
				end
			end)
			
			return function() --[[ Line: 132 ]]
				-- upvalues: GuiService (upval)
				GuiService.SelectedCoreObject = nil
			end
		end, {})
	else
		UseEffectFunction(function() --[[ Line: 137 ]]
			-- upvalues: UserInputService (upval), UseRefResult (copy), GuiService (upval)
			if UserInputService.GamepadEnabled then
				task.delay(0.3, function() --[[ Line: 141 ]]
					-- upvalues: UseRefResult (upval), GuiService (upval)
					local Buttons = UseRefResult.current and UseRefResult.current:FindFirstChild("Buttons", true)
					local _2 = Buttons and Buttons:FindFirstChild("2")
					
					if _2 then
						GuiService.SelectedCoreObject = _2
					end
				end)
			end
		end, {})
	end
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ref = UseRefResult,
		[ReactRobloxModule.Change.AbsoluteSize] = UseCallbackResult2
	}, {
		ConfirmationPrompt = ReactModule.createElement(InteractiveAlert, {
			richText = true,
			screenSize = UseStateResult,
			title = UseLocalizationResult.Heading,
			bodyText = if p1.ExperienceName then string.gsub(UseLocalizationResult.ReceiveUpdatesForExperience, "{experienceName}", "\n<b>" .. RichTextEscapeModule(p1.ExperienceName) .. "</b>") else UseLocalizationResult.ReceiveUpdates,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = {
							onActivated = UseCallbackResult,
							text = UseLocalizationResult.Cancel
						}
					},
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseCallbackResult1,
							text = UseLocalizationResult.Yes
						}
					}
				}
			}
		})
	})
end