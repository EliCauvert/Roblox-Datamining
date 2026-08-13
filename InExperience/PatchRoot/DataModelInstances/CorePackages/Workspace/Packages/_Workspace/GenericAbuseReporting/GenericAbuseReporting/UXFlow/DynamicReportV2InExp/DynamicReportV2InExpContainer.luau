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
local useInExpCustomSubmit = require(genericAbuseReporting.BeduiV2.Hooks.useInExpCustomSubmit).useInExpCustomSubmit
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
local fFlagAbuseReportVoiceMute = require(parent.SharedFlags).FFlagAbuseReportVoiceMute

return reactModule.memo(function(p0) --[[ line: 74 | named "DynamicReportV2InExpContainer" ]]
	-- upvalues: reactModule (ref), useIsVoiceChatReportable (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (ref), getIsInExpSceneSelectionAvailableModule (ref), useDynamicInExpConfig (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), useDeviceOrientation (ref), guiService (ref), fFlagAbuseReportInExpShowConfigLoadingSkeletonModule (ref), useInExpConfigLoadingSkeleton (ref), getUsersModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), recentlyLeftSignalsModule (ref), useInExpCustomSubmit (ref), fFlagInlineSurveyOnInExpReportModule (ref), sendBoundaryErrorTelemetryModule (ref), dynamicReportV2InExpLoadingModule (ref), dynamicReportV2InExpErrorModule (ref), inlineSurveyModule (ref), inlineEventTypeModule (ref), inlineSurveyPresetModule (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentInExpModule (ref), fFlagAbuseReportVoiceMute (ref)
	local preselectedPlayer = p0.preselectedPlayer
	local var18 = reactModule.useMemo(function() --[[ line: 77 ]]
		return tostring(game.GameId)
	end, {})
	local var19 = useIsVoiceChatReportable(p0.voiceChatServiceManager)
	local var20 = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then reactModule.useMemo(function() --[[ line: 88 ]]
		-- upvalues: p0 (ref), getIsInExpSceneSelectionAvailableModule (copy)
		return p0.isReportTabVisible and getIsInExpSceneSelectionAvailableModule()
	end, { p0.isReportTabVisible }) else nil
	local var21 = useDynamicInExpConfig(p0.isReportTabVisible, reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: var18 (ref), var19 (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (copy), var20 (write), getIsInExpSceneSelectionAvailableModule (copy), preselectedPlayer (ref)
		local t = {
			experienceTargetId = var18,
			isVoiceChatReportable = var19,
			isSceneSelectionAvailable = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then var20 else getIsInExpSceneSelectionAvailableModule()
		}
		
		if preselectedPlayer then
			t.preselectedAbuserId = tostring(preselectedPlayer.UserId)
			t.preselectedAbuserDisplayName = preselectedPlayer.DisplayName
			t.preselectedAbuserUsername = preselectedPlayer.Name
		end
		return t
	end, { var18, preselectedPlayer, var19, var20 }))
	local config = var21.config
	local hasError = var21.hasError
	local setHasError = var21.setHasError
	local abuseVector = var21.abuseVector
	local var22 = nil
	local var23 = nil
	
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		local var24, var25 = reactModule.useState(nil)
		var22 = var24
		var23 = var25
	end
	local var26 = if useDeviceOrientation() ~= "Landscape" then not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small) else true
	local var27 = if fFlagAbuseReportInExpShowConfigLoadingSkeletonModule then useInExpConfigLoadingSkeleton(p0.isReportTabVisible, p0.isReportTabVisible and (config == nil and not hasError)) else false
	local var28 = reactModule.useMemo(function() --[[ line: 129 ]]
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
	local var29 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	reactModule.useEffect(function() --[[ line: 150 ]]
		-- upvalues: p0 (ref), var29 (ref)
		if p0.isReportTabVisible then
			var29.current = DateTime.now().UnixTimestampMillis
		end
	end, { p0.isReportTabVisible })
	
	if fFlagAbuseReportInExpPlayerListV3 then
		reactModule.useEffect(function() --[[ line: 162 ]]
			-- upvalues: recentlyLeftSignalsModule (copy)
			recentlyLeftSignalsModule.init()
		end, {})
	end
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		reactModule.useEffect(function() --[[ line: 168 ]]
			-- upvalues: p0 (ref), var23 (write)
			if not p0.isReportTabVisible and var23 then
				var23(nil)
			end
		end, { p0.isReportTabVisible, var23 })
	end
	local var30 = useInExpCustomSubmit({
		voiceChatServiceManager = p0.voiceChatServiceManager,
		inExpChatMessagesLoader = p0.inExpChatMessagesLoader,
		menuOpenTimeRef = var29,
		reportAnythingSnapshotRef = p0.reportAnythingSnapshotRef
	})
	local var31 = nil
	local _ = nil
	local var32 = nil
	local var33 = nil
	
	if fFlagInlineSurveyOnInExpReportModule then
		local var34, var35 = reactModule.useState(false)
		var31 = var34
		local var36 = var35
		local onReportFinish = p0.onReportFinish
		var32 = reactModule.useCallback(function(p1) --[[ line: 194 ]]
			-- upvalues: var36 (write), onReportFinish (ref)
			if p1.didSubmit and var36 then
				var36(true)
			end
			if onReportFinish then
				onReportFinish(p1)
			end
		end, { onReportFinish, var36 })
		var33 = reactModule.useCallback(function() --[[ line: 203 ]]
			-- upvalues: var36 (write)
			if var36 then
				var36(false)
			end
		end, { var36 })
	end
	local var37 = reactModule.useCallback(function() --[[ line: 210 ]]
		-- upvalues: setHasError (ref)
		setHasError(true)
	end, { setHasError })
	local var38 = reactModule.useCallback(function(p2) --[[ line: 214 ]]
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), abuseVector (ref), var18 (ref), setHasError (ref)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p2)
		sendBoundaryErrorTelemetryModule(p2, { abuse_vector = abuseVector, target_id = var18 })
		setHasError(true)
	end, { abuseVector, var18, setHasError })
	local var39 = if fFlagAbuseReportInlineAlertStateOutsideReducerModule then reactModule.useMemo(function() --[[ line: 225 ]]
		-- upvalues: var23 (write), var22 (write)
		return if var23 then { pendingInlineAlert = var22, setInlineAlert = var23 } else nil
	end, { var22, var23 }) else nil
	
	if var27 then
		return reactModule.createElement(dynamicReportV2InExpLoadingModule, { shouldUseOverlaidControls = var26 })
	elseif p0.isReportTabVisible and hasError then
		return reactModule.createElement(dynamicReportV2InExpErrorModule, nil)
	end
	local var41
	local var40 = if fFlagInlineSurveyOnInExpReportModule and var31 then reactModule.createElement(inlineSurveyModule, {
		eventType = inlineEventTypeModule.InExperienceReportButtonClicked,
		preset = inlineSurveyPresetModule.ModalInviteToModalSurvey,
		onClose = var33
	}) else nil
	
	if p0.isReportTabVisible and config and not hasError then
		var41 = reactModule.createElement
		var41 = var41(abuseReportErrorBoundaryModule, { onError = var38 }, {
			AbuseReportContentInExp = reactModule.createElement(abuseReportContentInExpModule, {
				rawConfig = config,
				abuseVector = abuseVector,
				targetId = var18,
				onClose = p0.onClose,
				onCustomSubmit = var30,
				onFinish = if fFlagInlineSurveyOnInExpReportModule then var32 else p0.onReportFinish,
				onResolveError = var37,
				shouldUseOverlaidControls = var26,
				loaders = var28,
				attemptTrigger = if preselectedPlayer then "onOpen" else "onFirstAction",
				inlineAlertController = var39,
				voiceChatServiceManager = if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then p0.voiceChatServiceManager else nil
			})
		})
	else
		var41 = nil
	end
	return if fFlagInlineSurveyOnInExpReportModule then if var41 == nil and var40 == nil then nil else reactModule.createElement(reactModule.Fragment, nil, { Content = var41, Survey = var40 }) else var41
end)