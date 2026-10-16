local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local GuiService = game:GetService("GuiService")
local ReactModule = require(Parent.React)
local _ = require(Parent.RobloxAppEnums)
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local InlineEventTypeModule = require(Parent.OnPlatformSurveys.InlineEventType)
local InlineSurveyModule = require(Parent.OnPlatformSurveys.InlineSurvey)
local InlineSurveyPresetModule = require(Parent.OnPlatformSurveys.InlineSurveyPreset)
local AbuseReportErrorBoundaryModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportErrorBoundary)
local GetIsInExpSceneSelectionAvailableModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.getIsInExpSceneSelectionAvailable)
local GetUsersModule = require(GenericAbuseReporting.BeduiV2.Loaders.getUsers)
local _ = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local RecentlyLeftSignalsModule = require(GenericAbuseReporting.BeduiV2.Utils.Signals.recentlyLeftSignals)
local SendBoundaryErrorTelemetryModule = require(GenericAbuseReporting.BeduiV2.Analytics.sendBoundaryErrorTelemetry)
local UseInExpCustomSubmitModule = require(GenericAbuseReporting.BeduiV2.Hooks.useInExpCustomSubmit)
local UseInExpCustomSubmitFunction = UseInExpCustomSubmitModule.useInExpCustomSubmit
local UseInExpClientActionHandlersFunction = UseInExpCustomSubmitModule.useInExpClientActionHandlers
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local DynamicReportV2InExpErrorModule = require(script.Parent.DynamicReportV2InExpError)
local DynamicReportV2InExpLoadingModule = require(script.Parent.DynamicReportV2InExpLoading)
local AbuseReportContentInExpModule = require(script.Parent.AbuseReportContentInExp)
local UseDynamicInExpConfigFunction = require(script.Parent.useDynamicInExpConfig).useDynamicInExpConfig
local UseInExpConfigLoadingSkeletonFunction = require(script.Parent.useInExpConfigLoadingSkeleton).useInExpConfigLoadingSkeleton
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local UseIsVoiceChatReportableFunction = require(script.Parent.useIsVoiceChatReportable).useIsVoiceChatReportable
local _ = require(GenericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags)
local FFlagAbuseReportInExpShowConfigLoadingSkeletonModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportInExpShowConfigLoadingSkeleton)
local FFlagInlineSurveyOnInExpReportModule = require(GenericAbuseReporting.Flags.FFlagInlineSurveyOnInExpReport)
local FFlagAbuseReportInExpPlayerListV3 = require(Parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local FFlagAbuseReportSubmissionTargetV4 = require(Parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4
local FFlagAbuseReportVoiceMute = require(Parent.SharedFlags).FFlagAbuseReportVoiceMute

return ReactModule.memo(function(p1) --[[ Line: 73 | Named "DynamicReportV2InExpContainer" ]]
	-- upvalues: ReactModule (copy), UseIsVoiceChatReportableFunction (copy), GetIsInExpSceneSelectionAvailableModule (copy), UseDynamicInExpConfigFunction (copy), UseDeviceOrientationFunction (copy), GuiService (copy), FFlagAbuseReportInExpShowConfigLoadingSkeletonModule (copy), UseInExpConfigLoadingSkeletonFunction (copy), GetUsersModule (copy), FFlagAbuseReportInExpPlayerListV3 (copy), RecentlyLeftSignalsModule (copy), FFlagAbuseReportSubmissionTargetV4 (copy), UseInExpClientActionHandlersFunction (copy), UseInExpCustomSubmitFunction (copy), FFlagInlineSurveyOnInExpReportModule (copy), SendBoundaryErrorTelemetryModule (copy), DynamicReportV2InExpLoadingModule (copy), DynamicReportV2InExpErrorModule (copy), InlineSurveyModule (copy), InlineEventTypeModule (copy), InlineSurveyPresetModule (copy), AbuseReportErrorBoundaryModule (copy), AbuseReportContentInExpModule (copy), FFlagAbuseReportVoiceMute (copy)
	local PreselectedPlayer = p1.preselectedPlayer
	local UseMemoResult = ReactModule.useMemo(function(): string --[[ Line: 76 ]]
		return (tostring(game.GameId))
	end, {})
	local UseIsVoiceChatReportableResult = UseIsVoiceChatReportableFunction(p1.voiceChatServiceManager)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 85 ]]
		-- upvalues: p1 (copy), GetIsInExpSceneSelectionAvailableModule (upval)
		return p1.isReportTabVisible and GetIsInExpSceneSelectionAvailableModule()
	end, { p1.isReportTabVisible })
	local UseDynamicInExpConfigResult = UseDynamicInExpConfigFunction(p1.isReportTabVisible, (ReactModule.useMemo(function() --[[ Line: 89 ]]
		-- upvalues: UseMemoResult (copy), UseIsVoiceChatReportableResult (copy), UseMemoResult1 (copy), PreselectedPlayer (copy)
		local config = {
			experienceTargetId = UseMemoResult,
			isVoiceChatReportable = UseIsVoiceChatReportableResult,
			isSceneSelectionAvailable = UseMemoResult1
		}
		
		if PreselectedPlayer then
			config.preselectedAbuserId = tostring(PreselectedPlayer.UserId)
			config.preselectedAbuserDisplayName = PreselectedPlayer.DisplayName
			config.preselectedAbuserUsername = PreselectedPlayer.Name
		end
		return config
	end, {
		UseMemoResult,
		PreselectedPlayer,
		UseIsVoiceChatReportableResult,
		UseMemoResult1
	})))
	local Config = UseDynamicInExpConfigResult.config
	local HasError = UseDynamicInExpConfigResult.hasError
	local SetHasErrorFunction = UseDynamicInExpConfigResult.setHasError
	local AbuseVector = UseDynamicInExpConfigResult.abuseVector
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local IsViewportDisplaySizeMatch = GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
	local IsLandscape: boolean = UseDeviceOrientationFunction() == "Landscape" or not IsViewportDisplaySizeMatch
	local NoHasError: boolean = p1.isReportTabVisible and (Config == nil and not HasError)
	local UseInExpConfigLoadingSkeletonResult = if FFlagAbuseReportInExpShowConfigLoadingSkeletonModule then UseInExpConfigLoadingSkeletonFunction(p1.isReportTabVisible, NoHasError) else false
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 120 ]]
		-- upvalues: GetUsersModule (upval), p1 (copy)
		local config = { users = { type = "listItem", fetch = GetUsersModule } }
		
		if p1.inExpChatMessagesLoader then
			config.inExpChatMessages = p1.inExpChatMessagesLoader
		end
		if p1.inExpVoiceUsersLoader then
			config.voiceUsers = p1.inExpVoiceUsersLoader
		end
		return config
	end, { p1.inExpChatMessagesLoader, p1.inExpVoiceUsersLoader })
	local UseRefResult = ReactModule.useRef(DateTime.now().UnixTimestampMillis)
	ReactModule.useEffect(function() --[[ Line: 141 ]]
		-- upvalues: p1 (copy), UseRefResult (copy)
		if p1.isReportTabVisible then
			UseRefResult.current = DateTime.now().UnixTimestampMillis
		end
	end, { p1.isReportTabVisible })
	
	if FFlagAbuseReportInExpPlayerListV3 then
		ReactModule.useEffect(function() --[[ Line: 153 ]]
			-- upvalues: RecentlyLeftSignalsModule (upval)
			RecentlyLeftSignalsModule.init()
		end, {})
	end
	ReactModule.useEffect(function() --[[ Line: 158 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		if not p1.isReportTabVisible then
			UseStateResult2(nil)
		end
	end, { p1.isReportTabVisible, UseStateResult2 })
	local config = {
		voiceChatServiceManager = p1.voiceChatServiceManager,
		inExpChatMessagesLoader = p1.inExpChatMessagesLoader,
		menuOpenTimeRef = UseRefResult,
		reportAnythingSnapshotRef = p1.reportAnythingSnapshotRef
	}
	local v1 = nil
	local v2 = nil
	
	if FFlagAbuseReportSubmissionTargetV4 then
		v2 = UseInExpClientActionHandlersFunction(config)
	else
		v1 = UseInExpCustomSubmitFunction(config)
	end
	local v3 = nil
	local UseStateResult2_1 = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagInlineSurveyOnInExpReportModule then
		v3, UseStateResult2_1 = ReactModule.useState(false)
		local OnReportFinishFunction = p1.onReportFinish
		UseResult = ReactModule.useCallback(function(p2) --[[ Line: 190 ]]
			-- upvalues: UseStateResult2_1 (ref), OnReportFinishFunction (copy)
			if p2.didSubmit and UseStateResult2_1 then
				UseStateResult2_1(true)
			end
			if OnReportFinishFunction then
				OnReportFinishFunction(p2)
			end
		end, { OnReportFinishFunction, UseStateResult2_1 })
		UseResult1 = ReactModule.useCallback(function() --[[ Line: 199 ]]
			-- upvalues: UseStateResult2_1 (ref)
			if UseStateResult2_1 then
				UseStateResult2_1(false)
			end
		end, { UseStateResult2_1 })
	end
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 206 ]]
		-- upvalues: SetHasErrorFunction (copy)
		SetHasErrorFunction(true)
	end, { SetHasErrorFunction })
	local UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 210 ]]
		-- upvalues: SendBoundaryErrorTelemetryModule (upval), AbuseVector (copy), UseMemoResult (copy), SetHasErrorFunction (copy)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p2)
		SendBoundaryErrorTelemetryModule(p2, { abuse_vector = AbuseVector, target_id = UseMemoResult })
		SetHasErrorFunction(true)
	end, { AbuseVector, UseMemoResult, SetHasErrorFunction })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 219 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		return {
			pendingInlineAlert = UseStateResult,
			setInlineAlert = UseStateResult2
		}
	end, { UseStateResult, UseStateResult2 })
	
	if UseInExpConfigLoadingSkeletonResult then
		return ReactModule.createElement(DynamicReportV2InExpLoadingModule, { shouldUseOverlaidControls = IsLandscape })
	elseif p1.isReportTabVisible and HasError then
		return ReactModule.createElement(DynamicReportV2InExpErrorModule, nil)
	else
		local Element = if FFlagInlineSurveyOnInExpReportModule and v3 then ReactModule.createElement(InlineSurveyModule, {
			eventType = InlineEventTypeModule.InExperienceReportButtonClicked,
			preset = InlineSurveyPresetModule.ModalInviteToModalSurvey,
			onClose = UseResult1
		}) else nil
		local Element1 = if p1.isReportTabVisible and Config and not HasError then ReactModule.createElement(AbuseReportErrorBoundaryModule, { onError = UseResult3 }, {
			AbuseReportContentInExp = ReactModule.createElement(AbuseReportContentInExpModule, {
				rawConfig = Config,
				abuseVector = AbuseVector,
				targetId = UseMemoResult,
				onClose = p1.onClose,
				onCustomSubmit = if FFlagAbuseReportSubmissionTargetV4 then nil else v1,
				clientActionHandlers = if FFlagAbuseReportSubmissionTargetV4 then v2 else nil,
				onFinish = if FFlagInlineSurveyOnInExpReportModule then UseResult else p1.onReportFinish,
				onResolveError = UseResult2,
				shouldUseOverlaidControls = IsLandscape,
				loaders = UseMemoResult2,
				attemptTrigger = if PreselectedPlayer then "onOpen" else "onFirstAction",
				inlineAlertController = UseMemoResult3,
				voiceChatServiceManager = if FFlagAbuseReportInExpPlayerListV3 or FFlagAbuseReportVoiceMute then p1.voiceChatServiceManager else nil
			})
		}) else nil
		
		return if FFlagInlineSurveyOnInExpReportModule then if Element1 == nil and Element == nil then nil else ReactModule.createElement(ReactModule.Fragment, nil, { Content = Element1, Survey = Element }) else Element1
	end
end)