local parent = script.Parent.Parent
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local notificationsUpsellModalModule = require(script.Parent.Components.NotificationsUpsellModal)
local getGameNameAndDescription = require(parent.GameDetailRodux).GetGameNameAndDescription
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local sendEventDeferred = require(parent.NotificationsCommon).sendEventDeferred
local modalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local httpRequestModule = require(parent.HttpRequest)
local var4 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SetupNotificationsUpsellHttpRetryCount", 4) else nil
})
local notificationsUpsellDisableBackgroundDismiss = game:DefineFastFlag("NotificationsUpsellDisableBackgroundDismiss", false)

local function openModal(p0)
	-- upvalues: sendEventDeferred (ref), modalEventConstantsModule (ref), notificationModalsManagerModule (ref), getGameNameAndDescription (ref), var4 (ref), notificationsUpsellModalModule (ref), notificationsUpsellDisableBackgroundDismiss (ref)
	local var7 = function()
		-- upvalues: sendEventDeferred (copy), modalEventConstantsModule (copy), p0 (ref)
		game:GetService("ExperienceNotificationService"):InvokeOptInPromptClosed()
		sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
			[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Closed,
			[modalEventConstantsModule.UniverseId] = p0
		})
	end
	
	local var8 = function()
		-- upvalues: notificationModalsManagerModule (copy)
		notificationModalsManagerModule.CloseModal("UENUpsell")
	end
	
	local var9 = false
	local var10 = nil
	
	if p0 ~= "0" and p0 ~= "" then
		local var11, var12 = getGameNameAndDescription(var4, p0):andThen(function(p1)
			return p1 and p1.Name
		end, function()
			return nil
		end):await()
		var9 = var11
		var10 = var12
	end
	sendEventDeferred(modalEventConstantsModule.ModalContext, modalEventConstantsModule.OptInEventName, {
		[modalEventConstantsModule.ActionType] = modalEventConstantsModule.Opened,
		[modalEventConstantsModule.UniverseId] = p0
	})
	notificationModalsManagerModule.OpenModal("UENUpsell", notificationsUpsellModalModule, {
		CloseCallback = var7,
		Props = {
			CloseModal = var8,
			ExperienceId = p0,
			ExperienceName = if var9 then var10 else nil
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