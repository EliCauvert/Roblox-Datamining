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
local fFlagAbuseReportInExpShowConfigLoadingSkeletonModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInExpShowConfigLoadingSkeleton)
local fFlagInlineSurveyOnInExpReportModule = require(genericAbuseReporting.Flags.FFlagInlineSurveyOnInExpReport)
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportSubmissionTargetV4 = require(parent.SharedFlags).FFlagAbuseReportSubmissionTargetV4
local fFlagAbuseReportVoiceMute = require(parent.SharedFlags).FFlagAbuseReportVoiceMute

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useIsVoiceChatReportable (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (ref), getIsInExpSceneSelectionAvailableModule (ref), useDynamicInExpConfig (ref), useDeviceOrientation (ref), guiService (ref), fFlagAbuseReportInExpShowConfigLoadingSkeletonModule (ref), useInExpConfigLoadingSkeleton (ref), getUsersModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), recentlyLeftSignalsModule (ref), fFlagAbuseReportSubmissionTargetV4 (ref), useInExpClientActionHandlers (ref), useInExpCustomSubmit (ref), fFlagInlineSurveyOnInExpReportModule (ref), sendBoundaryErrorTelemetryModule (ref), dynamicReportV2InExpLoadingModule (ref), dynamicReportV2InExpErrorModule (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref), inlineSurveyPresetModule (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentInExpModule (ref), fFlagAbuseReportVoiceMute (ref)
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
	local var5, var6 = reactModule.useState(nil)
	local var7 = if useDeviceOrientation() ~= "Landscape" then not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small) else true
	local var8 = if fFlagAbuseReportInExpShowConfigLoadingSkeletonModule then useInExpConfigLoadingSkeleton(p1.isReportTabVisible, p1.isReportTabVisible and (config == nil and not hasError)) else false
	local var9 = reactModule.useMemo(function()
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
	local var10 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var10 (ref)
		if p1.isReportTabVisible then
			var10.current = DateTime.now().UnixTimestampMillis
		end
	end, { p1.isReportTabVisible })
	
	if fFlagAbuseReportInExpPlayerListV3 then
		reactModule.useEffect(function()
			-- upvalues: recentlyLeftSignalsModule (copy)
			recentlyLeftSignalsModule.init()
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref)
		if not p1.isReportTabVisible then
			var6(nil)
		end
	end, { p1.isReportTabVisible, var6 })
	local t = {
		voiceChatServiceManager = p1.voiceChatServiceManager,
		inExpChatMessagesLoader = p1.inExpChatMessagesLoader,
		menuOpenTimeRef = var10,
		reportAnythingSnapshotRef = p1.reportAnythingSnapshotRef
	}
	local var11 = nil
	local var12 = nil
	
	if fFlagAbuseReportSubmissionTargetV4 then
		var12 = useInExpClientActionHandlers(t)
	else
		var11 = useInExpCustomSubmit(t)
	end
	local var13 = nil
	local _ = nil
	local var14 = nil
	local var15 = nil
	
	if fFlagInlineSurveyOnInExpReportModule then
		local var16, var17 = reactModule.useState(false)
		var13 = var16
		local var18 = var17
		local onReportFinish = p1.onReportFinish
		var14 = reactModule.useCallback(function(p2)
			-- upvalues: var18 (write), onReportFinish (ref)
			if p2.didSubmit and var18 then
				var18(true)
			end
			if onReportFinish then
				onReportFinish(p2)
			end
		end, { onReportFinish, var18 })
		var15 = reactModule.useCallback(function()
			-- upvalues: var18 (write)
			if var18 then
				var18(false)
			end
		end, { var18 })
	end
	local var19 = reactModule.useCallback(function()
		-- upvalues: setHasError (ref)
		setHasError(true)
	end, { setHasError })
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), abuseVector (ref), var1 (ref), setHasError (ref)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p2)
		sendBoundaryErrorTelemetryModule(p2, { abuse_vector = abuseVector, target_id = var1 })
		setHasError(true)
	end, { abuseVector, var1, setHasError })
	local var21 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var6 (ref)
		return { pendingInlineAlert = var5, setInlineAlert = var6 }
	end, { var5, var6 })
	
	if var8 then
		return reactModule.createElement(dynamicReportV2InExpLoadingModule, { shouldUseOverlaidControls = var7 })
	elseif p1.isReportTabVisible and hasError then
		return reactModule.createElement(dynamicReportV2InExpErrorModule, nil)
	end
	local var22
	local var23 = if fFlagInlineSurveyOnInExpReportModule and var13 then reactModule.createElement(inlineSurveyModule, {
		eventType = inlineEventTypeModule.InExperienceReportButtonClicked,
		preset = inlineSurveyPresetModule.ModalInviteToModalSurvey,
		onClose = var15
	}) else nil
	
	if p1.isReportTabVisible and config and not hasError then
		var22 = reactModule.createElement
		var22 = var22(abuseReportErrorBoundaryModule, { onError = var20 }, {
			AbuseReportContentInExp = reactModule.createElement(abuseReportContentInExpModule, {
				rawConfig = config,
				abuseVector = abuseVector,
				targetId = var1,
				onClose = p1.onClose,
				onCustomSubmit = if not fFlagAbuseReportSubmissionTargetV4 then var11 else nil,
				clientActionHandlers = if fFlagAbuseReportSubmissionTargetV4 then var12 else nil,
				onFinish = if fFlagInlineSurveyOnInExpReportModule then var14 else p1.onReportFinish,
				onResolveError = var19,
				shouldUseOverlaidControls = var7,
				loaders = var9,
				attemptTrigger = if preselectedPlayer then "onOpen" else "onFirstAction",
				inlineAlertController = var21,
				voiceChatServiceManager = if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then p1.voiceChatServiceManager else nil
			})
		})
	else
		var22 = nil
	end
	return if fFlagInlineSurveyOnInExpReportModule then if var22 == nil and var23 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, { Content = var22, Survey = var23 }) else var22
end)