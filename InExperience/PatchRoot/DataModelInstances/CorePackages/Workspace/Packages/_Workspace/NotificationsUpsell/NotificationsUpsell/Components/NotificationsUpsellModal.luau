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
local var1 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("NotificationsUpsellModalHttpRetryCount", 4) else nil
})
local followingsPostFollowModule = require(script.Parent.Parent.Requests.FollowingsPostFollow)
local sendEventDeferred = require(parent.NotificationsCommon).sendEventDeferred
local modalEventConstantsModule = require(script.Parent.Parent.Analytics.ModalEventConstants)
local richTextEscapeModule = require(script.Parent.Parent.Util.RichTextEscape)

return function(p1)
	-- upvalues: useLocalization (ref), useCallback (ref), sendEventDeferred (ref), modalEventConstantsModule (ref), playersService (ref), followingsPostFollowModule (ref), var1 (ref), notificationModalsManagerModule (ref), images (ref), useState (ref), useRef (ref), enableConsoleAutoFocusForUEN1 (ref), useEffect (ref), userInputService (ref), guiService (ref), reactModule (ref), reactRobloxModule (ref), interactiveAlert (ref), richTextEscapeModule (ref), buttonType (ref)
	local var2 = useLocalization({
		Cancel = "CommonUI.Controls.Action.Cancel",
		Yes = "CommonUI.Controls.Action.Yes",
		Heading = "Feature.Notifications.Heading.TurnOnNotifications",
		ReceiveUpdates = "Feature.Notifications.Label.ReceiveActivityUpdates",
		ReceiveUpdatesForExperience = "Feature.Notifications.Label.GetUpdatesFromExperience",
		NotificationsEnabledForExperience = "Feature.Notifications.Response.NotificationsEnabledForExperience",
		NotificationsEnabled = "Feature.Notifications.Response.NotificationsEnabled",
		SomethingWentWrong = "Feature.Call.Error.Description.Generic"
	})
	local var3 = useCallback(function()
		-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p1 (ref)
		sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
			[modalEventConstantsModule.Button] = modalEventConstantsModule.Cancel,
			[modalEventConstantsModule.UniverseId] = p1.ExperienceId
		})
		p1.CloseModal()
	end, { p1.CloseModal, p1.ExperienceId })
	local var4 = useCallback(function()
		-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p1 (ref), playersService (copy), followingsPostFollowModule (copy), var1 (copy), notificationModalsManagerModule (copy), images (copy), var2 (ref)
		sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Clicked,
			[modalEventConstantsModule.Button] = modalEventConstantsModule.Confirm,
			[modalEventConstantsModule.UniverseId] = p1.ExperienceId
		})
		local localPlayer = playersService and playersService.LocalPlayer
		
		if p1.ExperienceId ~= "0" and localPlayer then
			sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
				[modalEventConstantsModule.ActionType] = modalEventConstantsModule.BackendRequested,
				[modalEventConstantsModule.UniverseId] = p1.ExperienceId
			})
			followingsPostFollowModule(var1, tostring(localPlayer.UserId), tostring(p1.ExperienceId)):andThen(function()
				-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p1 (copy), notificationModalsManagerModule (copy), images (copy), var2 (copy)
				sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.BackendSuccess,
					[modalEventConstantsModule.UniverseId] = p1.ExperienceId
				})
				notificationModalsManagerModule.SetUIBloxToast({
					iconImage = images["icons/common/notificationOn"],
					toastTitle = if p1.ExperienceName then var2.NotificationsEnabledForExperience:gsub("{experienceName}", p1.ExperienceName) else var2.NotificationsEnabled
				})
			end, function()
				-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p1 (copy), notificationModalsManagerModule (copy), images (copy), var2 (copy)
				sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
					[modalEventConstantsModule.ActionType] = modalEventConstantsModule.BackendFailed,
					[modalEventConstantsModule.UniverseId] = p1.ExperienceId
				})
				notificationModalsManagerModule.SetUIBloxToast({
					iconImage = images["icons/status/alert"],
					toastTitle = var2.SomethingWentWrong
				})
			end)
		end
		p1.CloseModal()
	end, { p1.CloseModal, p1.ExperienceId, var2 })
	local var5, var6 = useState(Vector2.new(800, 600))
	local var7 = useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2.AbsoluteSize)
	end, { var6 })
	local var8 = useRef(nil)
	
	if enableConsoleAutoFocusForUEN1 then
		useEffect(function()
			-- upvalues: userInputService (copy), var8 (ref), guiService (copy)
			if userInputService.GamepadEnabled then
				task.delay(0.3, function()
					-- upvalues: var8 (copy), guiService (copy)
					local buttons = var8.current and var8.current:FindFirstChild("Buttons", true)
					local _2 = buttons and buttons:FindFirstChild("2")
					
					if _2 then
						guiService.SelectedCoreObject = _2
					end
				end)
				
				return function()
					-- upvalues: guiService (copy)
					guiService.SelectedCoreObject = nil
				end
			end
		end, {})
	else
		useEffect(function()
			-- upvalues: userInputService (copy), var8 (ref), guiService (copy)
			if userInputService.GamepadEnabled then
				task.delay(0.3, function()
					-- upvalues: var8 (copy), guiService (copy)
					local buttons = var8.current and var8.current:FindFirstChild("Buttons", true)
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
		ref = var8,
		[reactRobloxModule.Change.AbsoluteSize] = var7
	}, {
		ConfirmationPrompt = reactModule.createElement(interactiveAlert, {
			richText = true,
			screenSize = var5,
			title = var2.Heading,
			bodyText = if p1.ExperienceName then string.gsub(var2.ReceiveUpdatesForExperience, "{experienceName}", "\n<b>" .. richTextEscapeModule(p1.ExperienceName) .. "</b>") else var2.ReceiveUpdates,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = var3, text = var2.Cancel }
					},
					{
						isDefaultChild = false,
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var4, text = var2.Yes }
					}
				}
			}
		})
	})
end