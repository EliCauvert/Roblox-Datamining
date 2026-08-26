local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local expChatSharedModule = require(parent.ExpChatShared)
local localizationModule = require(script.Parent.Localization)
local gameLocalizationModule = require(script.Parent.GameLocalization)
local appContainerModule = require(script.Parent.AppContainer)
local createStoreModule = require(script.Parent.createStore)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local constantsModule = require(expChat.PresetChat.Constants)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatUniverseChatPresetEnabledModule = require(expChat.Flags.FFlagExpChatUniverseChatPresetEnabled)
local expChatPresetChatLoadAnalyticsTimeoutMs = game:DefineFastInt("ExpChatPresetChatLoadAnalyticsTimeoutMs", 20000)
local expChatReconcileOnAgeVerifiedChange = game:DefineFastFlag("ExpChatReconcileOnAgeVerifiedChange", false)
local var1 = if expChatReconcileOnAgeVerifiedChange then require(script.Parent.ExpChatEventReceiver) else nil
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local var2 = if fFlagExpChatEnableFriendsTab then require(script.Parent.FriendsChatEventReceiverConnector) else nil
local focusHotKeyReceiverModule = require(script.Parent.FocusHotKey.FocusHotKeyReceiver)
local getFFlagExpChatTelemetryEventTriggerModule = require(expChat.Flags.getFFlagExpChatTelemetryEventTrigger)

local function computePresetBitmap(value)
	-- upvalues: getPresetChatStoreModule (ref), constantsModule (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), textChatService (ref)
	local var3 = getPresetChatStoreModule(false)
	
	if not var3.getIsEnabled() or var3.getAccessLevel() ~= constantsModule.AccessLevel.Enabled then
		return 0
	end
	local var4 = 0
	
	for i in pairs(value) do
		if i ~= "RBXSystem" then
			var4 = if i == "RBXGeneral" then bit32.bor(var4, 1) else bit32.bor(var4, 4)
		end
	end
	if fFlagExpChatUniverseChatPresetEnabledModule and textChatService:HasAllocatedUniverseChatContext("global") then
		var4 = bit32.bor(var4, 2)
	end
	return var4
end

local app = roactModule.Component:extend("App")
app.defaultProps = {
	isChatWindowVisible = true,
	isChatInputBarVisible = true,
	isChannelBarVisible = false,
	isDefaultChatEnabled = true,
	isSpatialUIEnabled = false,
	store = createStoreModule(),
	translator = {
		FormatByKey = function(_, p1)
			return tostring(p1)
		end
	},
	gameTranslator = {
		TranslateGameText = function(_, _, p1)
			return p1
		end
	}
}

function app.render(p1)
	-- upvalues: roactModule (ref), roactRoduxModule (ref), localizationModule (ref), gameLocalizationModule (ref), expChatReconcileOnAgeVerifiedChange (ref), var1 (ref), fFlagExpChatEnableFriendsTab (ref), var2 (ref), focusHotKeyReceiverModule (ref), appContainerModule (ref)
	return p1.props.isDefaultChatEnabled and roactModule.createElement(roactRoduxModule.StoreProvider, { store = p1.props.store }, {
		localization = roactModule.createElement(localizationModule.Provider, { value = p1.props.translator }, {
			gameLocalization = roactModule.createElement(gameLocalizationModule.Provider, { value = p1.props.gameTranslator }, {
				eventReceiver = if expChatReconcileOnAgeVerifiedChange then roactModule.createElement(var1) else nil,
				friendsChatEventReceiver = if fFlagExpChatEnableFriendsTab then roactModule.createElement(var2) else nil,
				focusHotKeyReceiver = if fFlagExpChatEnableFriendsTab then roactModule.createElement(focusHotKeyReceiverModule) else nil,
				container = roactModule.createElement(appContainerModule, {
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

if getFFlagExpChatTelemetryEventTriggerModule() then
	function app.didMount(p1)
		-- upvalues: fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), expChatPresetChatLoadAnalyticsTimeoutMs (ref), textChatService (ref), computePresetBitmap (ref)
		local expChatLoadStartTime = p1.props.expChatLoadStartTime
		
		if expChatLoadStartTime then
			if fFlagExpChatPresetChatEnabled then
				local var5 = os.clock() - expChatLoadStartTime
				local var6 = getPresetChatStoreModule(false)
				task.spawn(function()
					-- upvalues: var6 (ref), expChatPresetChatLoadAnalyticsTimeoutMs (copy), p1 (ref), textChatService (copy), var5 (ref), computePresetBitmap (copy)
					local processTime = os.clock()
					while var6.getIsLoading() and os.clock() - processTime < expChatPresetChatLoadAnalyticsTimeoutMs / 1000 do
						task.wait()
					end
					local state = p1.props.store:getState()
					textChatService:SendExpChatLoadSuccess(var5, {
						preset_bitmap = computePresetBitmap(if state.TextChannels then state.TextChannels.allTextChannels else {})
					})
				end)
				
				return
			end
			textChatService:SendExpChatLoadSuccess(os.clock() - expChatLoadStartTime)
		end
	end
end
return app