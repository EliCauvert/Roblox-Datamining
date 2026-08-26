local parent = script.Parent.Parent
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local notificationsUpsellModalModule = require(script.Parent.Components.NotificationsUpsellModal)
local getGameNameAndDescription = require(parent.GameDetailRodux).GetGameNameAndDescription
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local sendEventDeferred = require(parent.NotificationsCommon).sendEventDeferred
local modalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local httpRequestModule = require(parent.HttpRequest)
local var1 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SetupNotificationsUpsellHttpRetryCount", 4) else nil
})
local notificationsUpsellDisableBackgroundDismiss = game:DefineFastFlag("NotificationsUpsellDisableBackgroundDismiss", false)

local function openModal(p1)
	-- upvalues: sendEventDeferred (ref), modalEventConstantsModule (ref), notificationModalsManagerModule (ref), getGameNameAndDescription (ref), var1 (ref), notificationsUpsellModalModule (ref), notificationsUpsellDisableBackgroundDismiss (ref)
	local var2 = function()
		-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p1 (ref)
		game:GetService("ExperienceNotificationService"):InvokeOptInPromptClosed()
		sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Closed,
			[modalEventConstantsModule.UniverseId] = p1
		})
	end
	
	local var3 = function()
		-- upvalues: notificationModalsManagerModule (copy)
		notificationModalsManagerModule.CloseModal("UENUpsell")
	end
	
	local var4 = false
	local var5 = nil
	
	if p1 ~= "0" and p1 ~= "" then
		local var6, var7 = getGameNameAndDescription(var1, p1):andThen(function(p2)
			return p2 and p2.Name
		end, function()
			return nil
		end):await()
		var4 = var6
		var5 = var7
	end
	sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
		[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened,
		[modalEventConstantsModule.UniverseId] = p1
	})
	notificationModalsManagerModule.OpenModal("UENUpsell", notificationsUpsellModalModule, {
		CloseCallback = var2,
		Props = {
			CloseModal = var3,
			ExperienceId = p1,
			ExperienceName = if var4 then var5 else nil
		},
		DisableBackgroundDismiss = if notificationsUpsellDisableBackgroundDismiss then true else nil
	})
end

return function()
	-- upvalues: openModal (ref)
	game:GetService("ExperienceNotificationService").PromptOptInRequested:Connect(function()
		-- upvalues: openModal (copy)
		openModal(tostring(game.GameId))
	end)
end