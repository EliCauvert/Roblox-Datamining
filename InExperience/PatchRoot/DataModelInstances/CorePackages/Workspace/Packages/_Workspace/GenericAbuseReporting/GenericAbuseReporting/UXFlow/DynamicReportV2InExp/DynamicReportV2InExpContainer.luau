local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local _ = require(parent.RobloxAppEnums)
local useDeviceOrientation = require(parent.RobloxAppHooks).useDeviceOrientation
local inlineEventTypeModule = require(parent.OnPlatformSurveys.InlineEventType)
local inlineSurveyModule = require(parent.OnPlatformSurveys.InlineSurvey)
local inlineSurveyPresetModule = require(parent.OnPlatformSurveys.InlineSurveyPreset)
local abuseReportErrorBoundaryModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportErrorBoundary)
local getIsInExpSceneSelectionAvailableModule = require(genericAbuseReporting.BeduiV2.Components.Nodes.getIsInExpSceneSelectionAvailable)
local getUsersModule = require(genericAbuseReporting.BeduiV2.Loaders.getUsers)
local _ = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local recentlyLeftSignalsModule = require(genericAbuseReporting.BeduiV2.Utils.Signals.recentlyLeftSignals)
local sendBoundaryErrorTelemetryModule = require(genericAbuseReporting.BeduiV2.Analytics.sendBoundaryErrorTelemetry)
local useInExpCustomSubmitModule = require(genericAbuseReporting.BeduiV2.Hooks.useInExpCustomSubmit)
local useInExpCustomSubmit = useInExpCustomSubmitModule.useInExpCustomSubmit
local useInExpClientActionHandlers = useInExpCustomSubmitModule.useInExpClientActionHandlers
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local dynamicReportV2InExpErrorModule = require(script.Parent.DynamicReportV2InExpError)
local dynamicReportV2InExpLoadingModule = require(script.Parent.DynamicReportV2InExpLoading)
local abuseReportContentInExpModule = require(script.Parent.AbuseReportContentInExp)
local useDynamicInExpConfig = require(script.Parent.useDynamicInExpConfig).useDynamicInExpConfig
local useInExpConfigLoadingSkeleton = require(script.Parent.useInExpConfigLoadingSkeleton).useInExpConfigLoadingSkeleton
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local useIsVoiceChatReportable = require(script.Parent.useIsVoiceChatReportable).useIsVoiceChatReportable
local _ = require(genericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags)
local fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule = require(genericAbuseReporting.Flags.FFlagAbuseReportCheckSceneSelectionAvailabilityOnOpen)
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)
local fFlagAbuseReportInExpShowConfigLoadingSkeletonModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInExpShowConfigLoadingSkeleton)
local fFlagInlineSurveyOnInExpReportModule = require(genericAbuseReporting.Flags.FFlagInlineSurveyOnInExpReport)
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportSubmissionTargetV4 = require(parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4
local fFlagAbuseReportVoiceMute = require(parent.SharedFlags).FFlagAbuseReportVoiceMute

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), useIsVoiceChatReportable (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (ref), getIsInExpSceneSelectionAvailableModule (ref), useDynamicInExpConfig (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), useDeviceOrientation (ref), guiService (ref), fFlagAbuseReportInExpShowConfigLoadingSkeletonModule (ref), useInExpConfigLoadingSkeleton (ref), getUsersModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), recentlyLeftSignalsModule (ref), fFlagAbuseReportSubmissionTargetV4 (ref), useInExpClientActionHandlers (ref), useInExpCustomSubmit (ref), fFlagInlineSurveyOnInExpReportModule (ref), sendBoundaryErrorTelemetryModule (ref), dynamicReportV2InExpLoadingModule (ref), dynamicReportV2InExpErrorModule (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref), inlineSurveyPresetModule (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentInExpModule (ref), fFlagAbuseReportVoiceMute (ref)
	local preselectedPlayer = p0.preselectedPlayer
	local var19 = reactModule.useMemo(function()
		return tostring(game.GameId)
	end, {})
	local var20 = useIsVoiceChatReportable(p0.voiceChatServiceManager)
	local var21 = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then reactModule.useMemo(function()
		-- upvalues: p0 (ref), getIsInExpSceneSelectionAvailableModule (copy)
		return p0.isReportTabVisible and getIsInExpSceneSelectionAvailableModule()
	end, { p0.isReportTabVisible }) else nil
	local var22 = useDynamicInExpConfig(p0.isReportTabVisible, reactModule.useMemo(function()
		-- upvalues: var19 (ref), var20 (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (copy), var21 (write), getIsInExpSceneSelectionAvailableModule (copy), preselectedPlayer (ref)
		local t = {
			experienceTargetId = var19,
			isVoiceChatReportable = var20,
			isSceneSelectionAvailable = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then var21 else getIsInExpSceneSelectionAvailableModule()
		}
		
		if preselectedPlayer then
			t.preselectedAbuserId = tostring(preselectedPlayer.UserId)
			t.preselectedAbuserDisplayName = preselectedPlayer.DisplayName
			t.preselectedAbuserUsername = preselectedPlayer.Name
		end
		return t
	end, { var19, preselectedPlayer, var20, var21 }))
	local config = var22.config
	local hasError = var22.hasError
	local setHasError = var22.setHasError
	local abuseVector = var22.abuseVector
	local var23 = nil
	local var24 = nil
	
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		local var25, var26 = reactModule.useState(nil)
		var23 = var25
		var24 = var26
	end
	local var27 = if useDeviceOrientation() ~= "Landscape" then not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small) else true
	local var28 = if fFlagAbuseReportInExpShowConfigLoadingSkeletonModule then useInExpConfigLoadingSkeleton(p0.isReportTabVisible, p0.isReportTabVisible and (config == nil and not hasError)) else false
	local var29 = reactModule.useMemo(function()
		-- upvalues: getUsersModule (copy), p0 (ref)
		local t = { users = { type = "listItem", fetch = getUsersModule } }
		
		if p0.inExpChatMessagesLoader then
			t.inExpChatMessages = p0.inExpChatMessagesLoader
		end
		if p0.inExpVoiceUsersLoader then
			t.voiceUsers = p0.inExpVoiceUsersLoader
		end
		return t
	end, { p0.inExpChatMessagesLoader, p0.inExpVoiceUsersLoader })
	local var30 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var30 (ref)
		if p0.isReportTabVisible then
			var30.current = DateTime.now().UnixTimestampMillis
		end
	end, { p0.isReportTabVisible })
	
	if fFlagAbuseReportInExpPlayerListV3 then
		reactModule.useEffect(function()
			-- upvalues: recentlyLeftSignalsModule (copy)
			recentlyLeftSignalsModule.init()
		end, {})
	end
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		reactModule.useEffect(function()
			-- upvalues: p0 (ref), var24 (write)
			if not p0.isReportTabVisible and var24 then
				var24(nil)
			end
		end, { p0.isReportTabVisible, var24 })
	end
	local t = {
		voiceChatServiceManager = p0.voiceChatServiceManager,
		inExpChatMessagesLoader = p0.inExpChatMessagesLoader,
		menuOpenTimeRef = var30,
		reportAnythingSnapshotRef = p0.reportAnythingSnapshotRef
	}
	local var32 = nil
	local var33 = nil
	
	if fFlagAbuseReportSubmissionTargetV4 then
		var33 = useInExpClientActionHandlers(t)
	else
		var32 = useInExpCustomSubmit(t)
	end
	local var34 = nil
	local _ = nil
	local var35 = nil
	local var36 = nil
	
	if fFlagInlineSurveyOnInExpReportModule then
		local var37, var38 = reactModule.useState(false)
		var34 = var37
		local var39 = var38
		local onReportFinish = p0.onReportFinish
		var35 = reactModule.useCallback(function(p1)
			-- upvalues: var39 (write), onReportFinish (ref)
			if p1.didSubmit and var39 then
				var39(true)
			end
			if onReportFinish then
				onReportFinish(p1)
			end
		end, { onReportFinish, var39 })
		var36 = reactModule.useCallback(function()
			-- upvalues: var39 (write)
			if var39 then
				var39(false)
			end
		end, { var39 })
	end
	local var40 = reactModule.useCallback(function()
		-- upvalues: setHasError (ref)
		setHasError(true)
	end, { setHasError })
	local var41 = reactModule.useCallback(function(p2)
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), abuseVector (ref), var19 (ref), setHasError (ref)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p2)
		sendBoundaryErrorTelemetryModule(p2, { abuse_vector = abuseVector, target_id = var19 })
		setHasError(true)
	end, { abuseVector, var19, setHasError })
	local var42 = if fFlagAbuseReportInlineAlertStateOutsideReducerModule then reactModule.useMemo(function()
		-- upvalues: var24 (write), var23 (write)
		return if var24 then { pendingInlineAlert = var23, setInlineAlert = var24 } else nil
	end, { var23, var24 }) else nil
	
	if var28 then
		return reactModule.createElement(dynamicReportV2InExpLoadingModule, { shouldUseOverlaidControls = var27 })
	elseif p0.isReportTabVisible and hasError then
		return reactModule.createElement(dynamicReportV2InExpErrorModule, nil)
	end
	local var44
	local var43 = if fFlagInlineSurveyOnInExpReportModule and var34 then reactModule.createElement(inlineSurveyModule, {
		eventType = inlineEventTypeModule.InExperienceReportButtonClicked,
		preset = inlineSurveyPresetModule.ModalInviteToModalSurvey,
		onClose = var36
	}) else nil
	
	if p0.isReportTabVisible and config and not hasError then
		var44 = reactModule.createElement
		var44 = var44(abuseReportErrorBoundaryModule, { onError = var41 }, {
			AbuseReportContentInExp = reactModule.createElement(abuseReportContentInExpModule, {
				rawConfig = config,
				abuseVector = abuseVector,
				targetId = var19,
				onClose = p0.onClose,
				onCustomSubmit = if not fFlagAbuseReportSubmissionTargetV4 then var32 else nil,
				clientActionHandlers = if fFlagAbuseReportSubmissionTargetV4 then var33 else nil,
				onFinish = if fFlagInlineSurveyOnInExpReportModule then var35 else p0.onReportFinish,
				onResolveError = var40,
				shouldUseOverlaidControls = var27,
				loaders = var29,
				attemptTrigger = if preselectedPlayer then "onOpen" else "onFirstAction",
				inlineAlertController = var42,
				voiceChatServiceManager = if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then p0.voiceChatServiceManager else nil
			})
		})
	else
		var44 = nil
	end
	return if fFlagInlineSurveyOnInExpReportModule then if var44 == nil and var43 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, { Content = var44, Survey = var43 }) else var44
end)