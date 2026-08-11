local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local _ = require(parent.RobloxAppEnums)
local useDeviceOrientation = require(parent.RobloxAppHooks).useDeviceOrientation
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
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportVoiceMute = require(parent.SharedFlags).FFlagAbuseReportVoiceMute

return reactModule.memo(function(p0) --[[ line: 69 | named "DynamicReportV2InExpContainer" ]]
	-- upvalues: reactModule (ref), useIsVoiceChatReportable (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (ref), getIsInExpSceneSelectionAvailableModule (ref), useDynamicInExpConfig (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), useDeviceOrientation (ref), guiService (ref), fFlagAbuseReportInExpShowConfigLoadingSkeletonModule (ref), useInExpConfigLoadingSkeleton (ref), getUsersModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), recentlyLeftSignalsModule (ref), useInExpCustomSubmit (ref), sendBoundaryErrorTelemetryModule (ref), dynamicReportV2InExpLoadingModule (ref), dynamicReportV2InExpErrorModule (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentInExpModule (ref), fFlagAbuseReportVoiceMute (ref)
	local preselectedPlayer = p0.preselectedPlayer
	local var14 = reactModule.useMemo(function() --[[ line: 72 ]]
		return tostring(game.GameId)
	end, {})
	local var15 = useIsVoiceChatReportable(p0.voiceChatServiceManager)
	local var16 = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then reactModule.useMemo(function() --[[ line: 83 ]]
		-- upvalues: p0 (ref), getIsInExpSceneSelectionAvailableModule (copy)
		return p0.isReportTabVisible and getIsInExpSceneSelectionAvailableModule()
	end, { p0.isReportTabVisible }) else nil
	local var17 = useDynamicInExpConfig(p0.isReportTabVisible, reactModule.useMemo(function() --[[ line: 88 ]]
		-- upvalues: var14 (ref), var15 (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (copy), var16 (write), getIsInExpSceneSelectionAvailableModule (copy), preselectedPlayer (ref)
		local t = {
			experienceTargetId = var14,
			isVoiceChatReportable = var15,
			isSceneSelectionAvailable = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then var16 else getIsInExpSceneSelectionAvailableModule()
		}
		
		if preselectedPlayer then
			t.preselectedAbuserId = tostring(preselectedPlayer.UserId)
			t.preselectedAbuserDisplayName = preselectedPlayer.DisplayName
			t.preselectedAbuserUsername = preselectedPlayer.Name
		end
		return t
	end, { var14, preselectedPlayer, var15, var16 }))
	local config = var17.config
	local hasError = var17.hasError
	local setHasError = var17.setHasError
	local abuseVector = var17.abuseVector
	local var18 = nil
	local var19 = nil
	
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		local var20, var21 = reactModule.useState(nil)
		var18 = var20
		var19 = var21
	end
	local var22 = if useDeviceOrientation() ~= "Landscape" then not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small) else true
	local var23 = if fFlagAbuseReportInExpShowConfigLoadingSkeletonModule then useInExpConfigLoadingSkeleton(p0.isReportTabVisible, p0.isReportTabVisible and (config == nil and not hasError)) else false
	local var24 = reactModule.useMemo(function() --[[ line: 124 ]]
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
	local var25 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: p0 (ref), var25 (ref)
		if p0.isReportTabVisible then
			var25.current = DateTime.now().UnixTimestampMillis
		end
	end, { p0.isReportTabVisible })
	
	if fFlagAbuseReportInExpPlayerListV3 then
		reactModule.useEffect(function() --[[ line: 157 ]]
			-- upvalues: recentlyLeftSignalsModule (copy)
			recentlyLeftSignalsModule.init()
		end, {})
	end
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		reactModule.useEffect(function() --[[ line: 163 ]]
			-- upvalues: p0 (ref), var19 (write)
			if not p0.isReportTabVisible and var19 then
				var19(nil)
			end
		end, { p0.isReportTabVisible, var19 })
	end
	local var30
	local var26 = useInExpCustomSubmit({
		voiceChatServiceManager = p0.voiceChatServiceManager,
		inExpChatMessagesLoader = p0.inExpChatMessagesLoader,
		menuOpenTimeRef = var25,
		reportAnythingSnapshotRef = p0.reportAnythingSnapshotRef
	})
	local var27 = reactModule.useCallback(function() --[[ line: 179 ]]
		-- upvalues: setHasError (ref)
		setHasError(true)
	end, { setHasError })
	local var28 = reactModule.useCallback(function(p1) --[[ line: 183 ]]
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), abuseVector (ref), var14 (ref), setHasError (ref)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p1)
		sendBoundaryErrorTelemetryModule(p1, { abuse_vector = abuseVector, target_id = var14 })
		setHasError(true)
	end, { abuseVector, var14, setHasError })
	local var29 = if fFlagAbuseReportInlineAlertStateOutsideReducerModule then reactModule.useMemo(function() --[[ line: 194 ]]
		-- upvalues: var19 (write), var18 (write)
		return if var19 then { pendingInlineAlert = var18, setInlineAlert = var19 } else nil
	end, { var18, var19 }) else nil
	
	if var23 then
		return reactModule.createElement(dynamicReportV2InExpLoadingModule, { shouldUseOverlaidControls = var22 })
	elseif p0.isReportTabVisible and hasError then
		return reactModule.createElement(dynamicReportV2InExpErrorModule, nil)
	elseif p0.isReportTabVisible and config and not hasError then
		var30 = reactModule.createElement
		var30 = var30(abuseReportErrorBoundaryModule, { onError = var28 }, {
			AbuseReportContentInExp = reactModule.createElement(abuseReportContentInExpModule, {
				rawConfig = config,
				abuseVector = abuseVector,
				targetId = var14,
				onClose = p0.onClose,
				open = p0.isReportTabVisible,
				onCustomSubmit = var26,
				onFinish = p0.onReportFinish,
				onResolveError = var27,
				shouldUseOverlaidControls = var22,
				loaders = var24,
				attemptTrigger = if preselectedPlayer then "onOpen" else "onFirstAction",
				inlineAlertController = var29,
				voiceChatServiceManager = if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then p0.voiceChatServiceManager else nil
			})
		})
	else
		var30 = nil
	end
	return var30
end)