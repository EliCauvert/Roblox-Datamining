local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local LocalizationModule = require(script.Parent.Localization)
local GameLocalizationModule = require(script.Parent.GameLocalization)
local AppContainerModule = require(script.Parent.AppContainer)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local FFlagExpChatPresetChatEnabled = require(Parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatUniverseChatPresetEnabledModule = require(ExpChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local ExpChatPresetChatLoadAnalyticsTimeoutMs = game:DefineFastInt("ExpChatPresetChatLoadAnalyticsTimeoutMs", 20000)
local ExpChatReconcileOnAgeVerifiedChange = game:DefineFastFlag("ExpChatReconcileOnAgeVerifiedChange", false)
local ExpChatEventReceiverModule = if ExpChatReconcileOnAgeVerifiedChange then require(script.Parent.ExpChatEventReceiver) else nil
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local FriendsChatEventReceiverConnectorModule = if FFlagExpChatEnableFriendsTab then require(script.Parent.FriendsChatEventReceiverConnector) else nil
local GetFFlagExpChatTelemetryEventTriggerModule = require(ExpChat.Flags.getFFlagExpChatTelemetryEventTrigger)

local function computePresetBitmap(AllTextChannels): number
	-- upvalues: GetPresetChatStoreModule (copy), ConstantsModule (copy), FFlagExpChatUniverseChatPresetEnabledModule (copy), TextChatService (copy)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	
	if not PresetChatStoreModule.getIsEnabled() or PresetChatStoreModule.getAccessLevel() ~= ConstantsModule.AccessLevel.Enabled then
		return 0
	end
	local Value = 0
	
	for allTextChannel in pairs(AllTextChannels) do
		if allTextChannel ~= "RBXSystem" then
			if allTextChannel == "RBXGeneral" then
				Value = bit32.bor(Value, 1)
			else
				Value = bit32.bor(Value, 4)
			end
		end
	end
	if FFlagExpChatUniverseChatPresetEnabledModule and TextChatService:HasAllocatedUniverseChatContext("global") then
		Value = bit32.bor(Value, 2)
	end
	return Value
end

local App = RoactModule.Component:extend("App")
App.defaultProps = {
	isChatWindowVisible = true,
	isChatInputBarVisible = true,
	isChannelBarVisible = false,
	isDefaultChatEnabled = true,
	isSpatialUIEnabled = false,
	store = require(script.Parent.createStore)(),
	translator = {
		FormatByKey = function(_, p1): string
			return (tostring(p1))
		end
	},
	gameTranslator = {
		TranslateGameText = function(_, _, p1)
			return p1
		end
	}
}

function App.render(p1)
	-- upvalues: RoactModule (copy), RoactRoduxModule (copy), LocalizationModule (copy), GameLocalizationModule (copy), ExpChatReconcileOnAgeVerifiedChange (copy), ExpChatEventReceiverModule (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatEventReceiverConnectorModule (copy), AppContainerModule (copy)
	return p1.props.isDefaultChatEnabled and RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = p1.props.store }, {
		localization = RoactModule.createElement(LocalizationModule.Provider, { value = p1.props.translator }, {
			gameLocalization = RoactModule.createElement(GameLocalizationModule.Provider, { value = p1.props.gameTranslator }, {
				eventReceiver = if ExpChatReconcileOnAgeVerifiedChange then RoactModule.createElement(ExpChatEventReceiverModule) else nil,
				friendsChatEventReceiver = if FFlagExpChatEnableFriendsTab then RoactModule.createElement(FriendsChatEventReceiverConnectorModule, { isChatWindowVisible = p1.props.isChatWindowVisible }) else nil,
				container = RoactModule.createElement(AppContainerModule, {
					isChatInputBarVisible = p1.props.isChatInputBarVisible,
					isChatWindowVisible = p1.props.isChatWindowVisible,
					isChannelBarVisible = p1.props.isChannelBarVisible,
					getIconVoiceIndicator = p1.props.getIconVoiceIndicator,
					onClickedVoiceIndicator = p1.props.onClickedVoiceIndicator,
					onClickedCameraIndicator = p1.props.onClickedCameraIndicator,
					selfViewListenerChanged = p1.props.selfViewListenerChanged,
					getPermissions = p1.props.getPermissions,
					displayCameraDeniedToast = p1.props.displayCameraDeniedToast,
					isCamEnabledForUserAndPlace = p1.props.isCamEnabledForUserAndPlace,
					isCameraOnlyUser = p1.props.isCameraOnlyUser,
					isVoiceServiceInitialized = p1.props.isVoiceServiceInitialized,
					isSpatialUIEnabled = p1.props.isSpatialUIEnabled
				})
			})
		})
	})
end

if GetFFlagExpChatTelemetryEventTriggerModule() then
	function App.didMount(p1)
		-- upvalues: FFlagExpChatPresetChatEnabled (copy), GetPresetChatStoreModule (copy), ExpChatPresetChatLoadAnalyticsTimeoutMs (copy), TextChatService (copy), computePresetBitmap (copy)
		local ExpChatLoadStartTime = p1.props.expChatLoadStartTime
		
		if ExpChatLoadStartTime then
			if FFlagExpChatPresetChatEnabled then
				local Elapsed = os.clock() - ExpChatLoadStartTime
				local PresetChatStoreModule = GetPresetChatStoreModule(false)
				task.spawn(function()
					-- upvalues: PresetChatStoreModule (copy), ExpChatPresetChatLoadAnalyticsTimeoutMs (upval), p1 (copy), TextChatService (upval), Elapsed (copy), computePresetBitmap (upval)
					local ClockTime = os.clock()
					while PresetChatStoreModule.getIsLoading() and os.clock() - ClockTime < ExpChatPresetChatLoadAnalyticsTimeoutMs / 1000 do
						task.wait()
					end
					local State = p1.props.store:getState()
					TextChatService:SendExpChatLoadSuccess(Elapsed, {
						preset_bitmap = computePresetBitmap(State.TextChannels and State.TextChannels.allTextChannels or {})
					})
				end)
				
				return
			else
				TextChatService:SendExpChatLoadSuccess(os.clock() - ExpChatLoadStartTime)
			end
		end
	end
end
return App