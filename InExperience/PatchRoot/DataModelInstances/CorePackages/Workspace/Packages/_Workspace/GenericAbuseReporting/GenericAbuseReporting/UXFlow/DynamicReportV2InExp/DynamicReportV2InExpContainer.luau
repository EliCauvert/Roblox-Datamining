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

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useIsVoiceChatReportable (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (ref), getIsInExpSceneSelectionAvailableModule (ref), useDynamicInExpConfig (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), useDeviceOrientation (ref), guiService (ref), fFlagAbuseReportInExpShowConfigLoadingSkeletonModule (ref), useInExpConfigLoadingSkeleton (ref), getUsersModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), recentlyLeftSignalsModule (ref), fFlagAbuseReportSubmissionTargetV4 (ref), useInExpClientActionHandlers (ref), useInExpCustomSubmit (ref), fFlagInlineSurveyOnInExpReportModule (ref), sendBoundaryErrorTelemetryModule (ref), dynamicReportV2InExpLoadingModule (ref), dynamicReportV2InExpErrorModule (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref), inlineSurveyPresetModule (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentInExpModule (ref), fFlagAbuseReportVoiceMute (ref)
	local preselectedPlayer = p1.preselectedPlayer
	local var1 = reactModule.useMemo(function()
		return tostring(game.GameId)
	end, {})
	local var2 = useIsVoiceChatReportable(p1.voiceChatServiceManager)
	local var3 = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then reactModule.useMemo(function()
		-- upvalues: p1 (ref), getIsInExpSceneSelectionAvailableModule (copy)
		return p1.isReportTabVisible and getIsInExpSceneSelectionAvailableModule()
	end, { p1.isReportTabVisible }) else nil
	local var4 = useDynamicInExpConfig(p1.isReportTabVisible, reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (copy), var3 (write), getIsInExpSceneSelectionAvailableModule (copy), preselectedPlayer (ref)
		local t = {
			experienceTargetId = var1,
			isVoiceChatReportable = var2,
			isSceneSelectionAvailable = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then var3 else getIsInExpSceneSelectionAvailableModule()
		}
		
		if preselectedPlayer then
			t.preselectedAbuserId = tostring(preselectedPlayer.UserId)
			t.preselectedAbuserDisplayName = preselectedPlayer.DisplayName
			t.preselectedAbuserUsername = preselectedPlayer.Name
		end
		return t
	end, { var1, preselectedPlayer, var2, var3 }))
	local config = var4.config
	local hasError = var4.hasError
	local setHasError = var4.setHasError
	local abuseVector = var4.abuseVector
	local var5 = nil
	local var6 = nil
	
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		local var7, var8 = reactModule.useState(nil)
		var5 = var7
		var6 = var8
	end
	local var9 = if useDeviceOrientation() ~= "Landscape" then not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small) else true
	local var10 = if fFlagAbuseReportInExpShowConfigLoadingSkeletonModule then useInExpConfigLoadingSkeleton(p1.isReportTabVisible, p1.isReportTabVisible and (config == nil and not hasError)) else false
	local var11 = reactModule.useMemo(function()
		-- upvalues: getUsersModule (copy), p1 (ref)
		local t = { users = { type = "listItem", fetch = getUsersModule } }
		
		if p1.inExpChatMessagesLoader then
			t.inExpChatMessages = p1.inExpChatMessagesLoader
		end
		if p1.inExpVoiceUsersLoader then
			t.voiceUsers = p1.inExpVoiceUsersLoader
		end
		return t
	end, { p1.inExpChatMessagesLoader, p1.inExpVoiceUsersLoader })
	local var12 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var12 (ref)
		if p1.isReportTabVisible then
			var12.current = DateTime.now().UnixTimestampMillis
		end
	end, { p1.isReportTabVisible })
	
	if fFlagAbuseReportInExpPlayerListV3 then
		reactModule.useEffect(function()
			-- upvalues: recentlyLeftSignalsModule (copy)
			recentlyLeftSignalsModule.init()
		end, {})
	end
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var6 (write)
			if not p1.isReportTabVisible and var6 then
				var6(nil)
			end
		end, { p1.isReportTabVisible, var6 })
	end
	local t = {
		voiceChatServiceManager = p1.voiceChatServiceManager,
		inExpChatMessagesLoader = p1.inExpChatMessagesLoader,
		menuOpenTimeRef = var12,
		reportAnythingSnapshotRef = p1.reportAnythingSnapshotRef
	}
	local var13 = nil
	local var14 = nil
	
	if fFlagAbuseReportSubmissionTargetV4 then
		var14 = useInExpClientActionHandlers(t)
	else
		var13 = useInExpCustomSubmit(t)
	end
	local var15 = nil
	local _ = nil
	local var16 = nil
	local var17 = nil
	
	if fFlagInlineSurveyOnInExpReportModule then
		local var18, var19 = reactModule.useState(false)
		var15 = var18
		local var20 = var19
		local onReportFinish = p1.onReportFinish
		var16 = reactModule.useCallback(function(p2)
			-- upvalues: var20 (write), onReportFinish (ref)
			if p2.didSubmit and var20 then
				var20(true)
			end
			if onReportFinish then
				onReportFinish(p2)
			end
		end, { onReportFinish, var20 })
		var17 = reactModule.useCallback(function()
			-- upvalues: var20 (write)
			if var20 then
				var20(false)
			end
		end, { var20 })
	end
	local var21 = reactModule.useCallback(function()
		-- upvalues: setHasError (ref)
		setHasError(true)
	end, { setHasError })
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), abuseVector (ref), var1 (ref), setHasError (ref)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p2)
		sendBoundaryErrorTelemetryModule(p2, { abuse_vector = abuseVector, target_id = var1 })
		setHasError(true)
	end, { abuseVector, var1, setHasError })
	local var23 = if fFlagAbuseReportInlineAlertStateOutsideReducerModule then reactModule.useMemo(function()
		-- upvalues: var6 (write), var5 (write)
		return if var6 then { pendingInlineAlert = var5, setInlineAlert = var6 } else nil
	end, { var5, var6 }) else nil
	
	if var10 then
		return reactModule.createElement(dynamicReportV2InExpLoadingModule, { shouldUseOverlaidControls = var9 })
	elseif p1.isReportTabVisible and hasError then
		return reactModule.createElement(dynamicReportV2InExpErrorModule, nil)
	end
	local var24
	local var25 = if fFlagInlineSurveyOnInExpReportModule and var15 then reactModule.createElement(inlineSurveyModule, {
		eventType = inlineEventTypeModule.InExperienceReportButtonClicked,
		preset = inlineSurveyPresetModule.ModalInviteToModalSurvey,
		onClose = var17
	}) else nil
	
	if p1.isReportTabVisible and config and not hasError then
		var24 = reactModule.createElement
		var24 = var24(abuseReportErrorBoundaryModule, { onError = var22 }, {
			AbuseReportContentInExp = reactModule.createElement(abuseReportContentInExpModule, {
				rawConfig = config,
				abuseVector = abuseVector,
				targetId = var1,
				onClose = p1.onClose,
				onCustomSubmit = if not fFlagAbuseReportSubmissionTargetV4 then var13 else nil,
				clientActionHandlers = if fFlagAbuseReportSubmissionTargetV4 then var14 else nil,
				onFinish = if fFlagInlineSurveyOnInExpReportModule then var16 else p1.onReportFinish,
				onResolveError = var21,
				shouldUseOverlaidControls = var9,
				loaders = var11,
				attemptTrigger = if preselectedPlayer then "onOpen" else "onFirstAction",
				inlineAlertController = var23,
				voiceChatServiceManager = if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then p1.voiceChatServiceManager else nil
			})
		})
	else
		var24 = nil
	end
	return if fFlagInlineSurveyOnInExpReportModule then if var24 == nil and var25 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, { Content = var24, Survey = var25 }) else var24
end)