local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent.Parent
local playersService = game:GetService("Players")
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local useState = reactModule.useState
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useLocalization = require(parent.Localization).Hooks.useLocalization
local enableConsoleAutoFocusForUEN1 = game:DefineFastFlag("EnableConsoleAutoFocusForUEN1", false)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local httpRequestModule = require(parent.HttpRequest)
local var9 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("NotificationsUpsellModalHttpRetryCount", 4) else nil
})
local followingsPostFollowModule = require(script.Parent.Parent.Requests.FollowingsPostFollow)
local sendEventDeferred = require(parent.NotificationsCommon).sendEventDeferred
local modalEventConstantsModule = require(script.Parent.Parent.Analytics.ModalEventConstants)
local richTextEscapeModule = require(script.Parent.Parent.Util.RichTextEscape)

return function(p0) --[[ line: 39 ]]
	-- upvalues: useLocalization (ref), useCallback (ref), sendEventDeferred (ref), modalEventConstantsModule (ref), playersService (ref), followingsPostFollowModule (ref), var9 (ref), notificationModalsManagerModule (ref), images (ref), useState (ref), useRef (ref), enableConsoleAutoFocusForUEN1 (ref), useEffect (ref), userInputService (ref), guiService (ref), reactModule (ref), reactRobloxModule (ref), interactiveAlert (ref), richTextEscapeModule (ref), buttonType (ref)
	local var13 = useLocalization({
		Cancel = "CommonUI.Controls.Action.Cancel",
		Yes = "CommonUI.Controls.Action.Yes",
		Heading = "Feature.Notifications.Heading.TurnOnNotifications",
		ReceiveUpdates = "Feature.Notifications.Label.ReceiveActivityUpdates",
		ReceiveUpdatesForExperience = "Feature.Notifications.Label.GetUpdatesFromExperience",
		NotificationsEnabledForExperience = "Feature.Notifications.Response.NotificationsEnabledForExperience",
		NotificationsEnabled = "Feature.Notifications.Response.NotificationsEnabled",
		SomethingWentWrong = "Feature.Call.Error.Description.Generic"
	})
	local var14 = useCallback(function() --[[ line: 52 ]]
		-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p0 (ref)
		sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
			[modalEventConstantsModule.Button] = modalEventConstantsModule.Cancel,
			[modalEventConstantsModule.UniverseId] = p0.ExperienceId
		})
		p0.CloseModal()
	end, { p0.CloseModal, p0.ExperienceId })
	local var15 = useCallback(function() --[[ line: 61 ]]
		-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p0 (ref), playersService (copy), followingsPostFollowModule (copy), var9 (copy), notificationModalsManagerModule (copy), images (copy), var13 (ref)
		sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
			[modalEventConstantsModule.Button] = modalEventConstantsModule.Confirm,
			[modalEventConstantsModule.UniverseId] = p0.ExperienceId
		})
		local localPlayer = playersService and playersService.LocalPlayer
		
		if p0.ExperienceId ~= "0" and localPlayer then
			sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.BackendRequested,
				[modalEventConstantsModule.UniverseId] = p0.ExperienceId
			})
			followingsPostFollowModule(var9, tostring(localPlayer.UserId), tostring(p0.ExperienceId)):andThen(function() --[[ line: 74 ]]
				-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p0 (copy), notificationModalsManagerModule (copy), images (copy), var13 (copy)
				sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.BackendSuccess,
					[modalEventConstantsModule.UniverseId] = p0.ExperienceId
				})
				notificationModalsManagerModule.SetUIBloxToast({
					iconImage = images["icons/common/notificationOn"],
					toastTitle = if p0.ExperienceName then var13.NotificationsEnabledForExperience:gsub("{experienceName}", p0.ExperienceName) else var13.NotificationsEnabled
				})
			end, function() --[[ line: 89 ]]
				-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p0 (copy), notificationModalsManagerModule (copy), images (copy), var13 (copy)
				sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.BackendFailed,
					[modalEventConstantsModule.UniverseId] = p0.ExperienceId
				})
				notificationModalsManagerModule.SetUIBloxToast({
					iconImage = images["icons/status/alert"],
					toastTitle = var13.SomethingWentWrong
				})
			end)
		end
		p0.CloseModal()
	end, { p0.CloseModal, p0.ExperienceId, var13 })
	local var16, var17 = useState(Vector2.new(800, 600))
	local var18 = useCallback(function(p1) --[[ line: 111 ]]
		-- upvalues: var17 (ref)
		var17(p1.AbsoluteSize)
	end, { var17 })
	local var19 = useRef(nil)
	
	if enableConsoleAutoFocusForUEN1 then
		useEffect(function() --[[ line: 117 ]]
			-- upvalues: userInputService (copy), var19 (ref), guiService (copy)
			if userInputService.GamepadEnabled then
				task.delay(0.3, function() --[[ line: 124 ]]
					-- upvalues: var19 (copy), guiService (copy)
					local buttons = var19.current and var19.current:FindFirstChild("Buttons", true)
					local _2 = buttons and buttons:FindFirstChild("2")
					
					if _2 then
						guiService.SelectedCoreObject = _2
					end
				end)
				
				return function() --[[ line: 132 ]]
					-- upvalues: guiService (copy)
					guiService.SelectedCoreObject = nil
				end
			end
		end, {})
	else
		useEffect(function() --[[ line: 137 ]]
			-- upvalues: userInputService (copy), var19 (ref), guiService (copy)
			if userInputService.GamepadEnabled then
				task.delay(0.3, function() --[[ line: 141 ]]
					-- upvalues: var19 (copy), guiService (copy)
					local buttons = var19.current and var19.current:FindFirstChild("Buttons", true)
					local _2 = buttons and buttons:FindFirstChild("2")
					
					if _2 then
						guiService.SelectedCoreObject = _2
					end
				end)
			end
		end, {})
	end
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ref = var19,
		[reactRobloxModule.Change.AbsoluteSize] = var18
	}, {
		ConfirmationPrompt = reactModule.createElement(interactiveAlert, {
			richText = true,
			screenSize = var16,
			title = var13.Heading,
			bodyText = if p0.ExperienceName then string.gsub(var13.ReceiveUpdatesForExperience, "{experienceName}", "\n<b>" .. richTextEscapeModule(p0.ExperienceName) .. "</b>") else var13.ReceiveUpdates,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = var14, text = var13.Cancel }
					},
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var15, text = var13.Yes }
					}
				}
			}
		})
	})
end