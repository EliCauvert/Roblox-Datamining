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
local var14 = if expChatReconcileOnAgeVerifiedChange then require(script.Parent.ExpChatEventReceiver) else nil
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local var15 = if fFlagExpChatEnableFriendsTab then require(script.Parent.FriendsChatEventReceiverConnector) else nil
local focusHotKeyReceiverModule = require(script.Parent.FocusHotKey.FocusHotKeyReceiver)
local getFFlagExpChatTelemetryEventTriggerModule = require(expChat.Flags.getFFlagExpChatTelemetryEventTrigger)

local function computePresetBitmap(value) --[[ line: 41 ]]
	-- upvalues: getPresetChatStoreModule (ref), constantsModule (ref), fFlagExpChatUniverseChatPresetEnabledModule (ref), textChatService (ref)
	local var20 = getPresetChatStoreModule(false)
	
	if not var20.getIsEnabled() or var20.getAccessLevel() ~= constantsModule.AccessLevel.Enabled then
		return 0
	end
	local var21 = 0
	
	for i in pairs(value) do
		if i ~= "RBXSystem" then
			var21 = if i == "RBXGeneral" then bit32.bor(var21, 1) else bit32.bor(var21, 4)
		end
	end
	if fFlagExpChatUniverseChatPresetEnabledModule and textChatService:HasAllocatedUniverseChatContext("global") then
		var21 = bit32.bor(var21, 2)
	end
	return var21
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
		FormatByKey = function(_, p0) --[[ line: 82 ]]
			return tostring(p0)
		end
	},
	gameTranslator = {
		TranslateGameText = function(_, _, p1) --[[ line: 87 ]]
			return p1
		end
	}
}

function app.render(p2) --[[ line: 92 ]]
	-- upvalues: roactModule (ref), roactRoduxModule (ref), localizationModule (ref), gameLocalizationModule (ref), expChatReconcileOnAgeVerifiedChange (ref), var14 (ref), fFlagExpChatEnableFriendsTab (ref), var15 (ref), focusHotKeyReceiverModule (ref), appContainerModule (ref)
	return p2.props.isDefaultChatEnabled and roactModule.createElement(roactRoduxModule.StoreProvider, { store = p2.props.store }, {
		localization = roactModule.createElement(localizationModule.Provider, { value = p2.props.translator }, {
			gameLocalization = roactModule.createElement(gameLocalizationModule.Provider, { value = p2.props.gameTranslator }, {
				eventReceiver = if expChatReconcileOnAgeVerifiedChange then roactModule.createElement(var14) else nil,
				friendsChatEventReceiver = if fFlagExpChatEnableFriendsTab then roactModule.createElement(var15) else nil,
				focusHotKeyReceiver = if fFlagExpChatEnableFriendsTab then roactModule.createElement(focusHotKeyReceiverModule) else nil,
				container = roactModule.createElement(appContainerModule, {
					isChatInputBarVisible = p2.props.isChatInputBarVisible,
					isChatWindowVisible = p2.props.isChatWindowVisible,
					isChannelBarVisible = p2.props.isChannelBarVisible,
					getIconVoiceIndicator = p2.props.getIconVoiceIndicator,
					onClickedVoiceIndicator = p2.props.onClickedVoiceIndicator,
					onClickedCameraIndicator = p2.props.onClickedCameraIndicator,
					selfViewListenerChanged = p2.props.selfViewListenerChanged,
					getPermissions = p2.props.getPermissions,
					displayCameraDeniedToast = p2.props.displayCameraDeniedToast,
					isCamEnabledForUserAndPlace = p2.props.isCamEnabledForUserAndPlace,
					isCameraOnlyUser = p2.props.isCameraOnlyUser,
					isVoiceServiceInitialized = p2.props.isVoiceServiceInitialized,
					isSpatialUIEnabled = p2.props.isSpatialUIEnabled
				})
			})
		})
	})
end

if getFFlagExpChatTelemetryEventTriggerModule() then
	function app.didMount(p3) --[[ line: 133 ]]
		-- upvalues: fFlagExpChatPresetChatEnabled (ref), getPresetChatStoreModule (ref), expChatPresetChatLoadAnalyticsTimeoutMs (ref), textChatService (ref), computePresetBitmap (ref)
		local expChatLoadStartTime = p3.props.expChatLoadStartTime
		
		if expChatLoadStartTime then
			if fFlagExpChatPresetChatEnabled then
				local var22 = os.clock() - expChatLoadStartTime
				local var23 = getPresetChatStoreModule(false)
				task.spawn(function() --[[ line: 142 ]]
					-- upvalues: var23 (ref), expChatPresetChatLoadAnalyticsTimeoutMs (copy), p3 (ref), textChatService (copy), var22 (ref), computePresetBitmap (copy)
					local processTime = os.clock()
					while var23.getIsLoading() and os.clock() - processTime < expChatPresetChatLoadAnalyticsTimeoutMs / 1000 do
						task.wait()
					end
					local state = p3.props.store:getState()
					textChatService:SendExpChatLoadSuccess(var22, {
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