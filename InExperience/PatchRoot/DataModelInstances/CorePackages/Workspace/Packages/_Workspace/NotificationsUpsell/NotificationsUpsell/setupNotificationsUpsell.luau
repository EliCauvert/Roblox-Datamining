local Parent = script.Parent.Parent
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local NotificationsUpsellModalModule = require(script.Parent.Components.NotificationsUpsellModal)
local GetGameNameAndDescriptionFunction = require(Parent.GameDetailRodux).GetGameNameAndDescription
local SendEventDeferredFunction = require(Parent.NotificationsCommon).sendEventDeferred
local ModalEventConstantsModule = require(script.Parent.Analytics.ModalEventConstants)
local HttpRequestModule = require(Parent.HttpRequest)
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SetupNotificationsUpsellHttpRetryCount", 4) else nil
})
local NotificationsUpsellDisableBackgroundDismiss = game:DefineFastFlag("NotificationsUpsellDisableBackgroundDismiss", false)

local function openModal(ExperienceId) --[[ Line: 22 ]]
	-- upvalues: SendEventDeferredFunction (copy), ModalEventConstantsModule (copy), NotificationModalsManagerModule (copy), GetGameNameAndDescriptionFunction (copy), ConfigResult (copy), NotificationsUpsellModalModule (copy), NotificationsUpsellDisableBackgroundDismiss (copy)
	local function CloseCallback() --[[ Line: 23 ]]
		-- upvalues: SendEventDeferredFunction (upval), ModalEventConstantsModule (upval), ExperienceId (copy)
		game:GetService("ExperienceNotificationService"):InvokeOptInPromptClosed()
		SendEventDeferredFunction(ModalEventConstantsModule.ModalContext, ModalEventConstantsModule.OptInEventName, {
			[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Closed,
			[ModalEventConstantsModule.UniverseId] = ExperienceId
		})
	end
	
	local function CloseModal() --[[ Line: 30 ]]
		-- upvalues: NotificationModalsManagerModule (upval)
		NotificationModalsManagerModule.CloseModal("UENUpsell")
	end
	
	local v1 = false
	local v2 = nil
	
	if ExperienceId ~= "0" and ExperienceId ~= "" then
		v1, v11 = GetGameNameAndDescriptionFunction(ConfigResult, ExperienceId):andThen(function(Result) --[[ Line: 36 ]]
			return Result and Result.Name
		end, function() --[[ Line: 38 ]]
			return nil
		end):await()
	end
	SendEventDeferredFunction(ModalEventConstantsModule.ModalContext, ModalEventConstantsModule.OptInEventName, {
		[ModalEventConstantsModule.ActionType] = ModalEventConstantsModule.Opened,
		[ModalEventConstantsModule.UniverseId] = ExperienceId
	})
	NotificationModalsManagerModule.OpenModal("UENUpsell", NotificationsUpsellModalModule, {
		CloseCallback = CloseCallback,
		Props = {
			CloseModal = CloseModal,
			ExperienceId = ExperienceId,
			ExperienceName = if v1 then v2 else nil
		},
		DisableBackgroundDismiss = if NotificationsUpsellDisableBackgroundDismiss then true else nil
	})
end

return function() --[[ Line: 59 ]]
	-- upvalues: openModal (copy)
	game:GetService("ExperienceNotificationService").PromptOptInRequested:Connect(function() --[[ Line: 60 ]]
		-- upvalues: openModal (upval)
		openModal((tostring(game.GameId)))
	end)
end