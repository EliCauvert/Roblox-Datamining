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
local abuseReportContentInExpModule = require(script.Parent.AbuseReportContentInExp)
local useDynamicInExpConfig = require(script.Parent.useDynamicInExpConfig).useDynamicInExpConfig
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local useIsVoiceChatReportable = require(script.Parent.useIsVoiceChatReportable).useIsVoiceChatReportable
local _ = require(genericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags)
local fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule = require(genericAbuseReporting.Flags.FFlagAbuseReportCheckSceneSelectionAvailabilityOnOpen)
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportVoiceMute = require(parent.SharedFlags).FFlagAbuseReportVoiceMute

return reactModule.memo(function(p0) --[[ line: 65 | named "DynamicReportV2InExpContainer" ]]
	-- upvalues: reactModule (ref), useIsVoiceChatReportable (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (ref), getIsInExpSceneSelectionAvailableModule (ref), useDynamicInExpConfig (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), useDeviceOrientation (ref), guiService (ref), getUsersModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), recentlyLeftSignalsModule (ref), useInExpCustomSubmit (ref), sendBoundaryErrorTelemetryModule (ref), dynamicReportV2InExpErrorModule (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentInExpModule (ref), fFlagAbuseReportVoiceMute (ref)
	local preselectedPlayer = p0.preselectedPlayer
	local var12 = reactModule.useMemo(function() --[[ line: 68 ]]
		return tostring(game.GameId)
	end, {})
	local var13 = useIsVoiceChatReportable(p0.voiceChatServiceManager)
	local var14 = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: p0 (ref), getIsInExpSceneSelectionAvailableModule (copy)
		return p0.isReportTabVisible and getIsInExpSceneSelectionAvailableModule()
	end, { p0.isReportTabVisible }) else nil
	local var15 = useDynamicInExpConfig(p0.isReportTabVisible, reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: var12 (ref), var13 (ref), fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule (copy), var14 (write), getIsInExpSceneSelectionAvailableModule (copy), preselectedPlayer (ref)
		local t = {
			experienceTargetId = var12,
			isVoiceChatReportable = var13,
			isSceneSelectionAvailable = if fFlagAbuseReportCheckSceneSelectionAvailabilityOnOpenModule then var14 else getIsInExpSceneSelectionAvailableModule()
		}
		
		if preselectedPlayer then
			t.preselectedAbuserId = tostring(preselectedPlayer.UserId)
			t.preselectedAbuserDisplayName = preselectedPlayer.DisplayName
			t.preselectedAbuserUsername = preselectedPlayer.Name
		end
		return t
	end, { var12, preselectedPlayer, var13, var14 }))
	local config = var15.config
	local hasError = var15.hasError
	local setHasError = var15.setHasError
	local abuseVector = var15.abuseVector
	local var16 = nil
	local var17 = nil
	
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		local var18, var19 = reactModule.useState(nil)
		var16 = var18
		var17 = var19
	end
	local var20 = if useDeviceOrientation() ~= "Landscape" then not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small) else true
	local var21 = reactModule.useMemo(function() --[[ line: 115 ]]
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
	local var22 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	reactModule.useEffect(function() --[[ line: 136 ]]
		-- upvalues: p0 (ref), var22 (ref)
		if p0.isReportTabVisible then
			var22.current = DateTime.now().UnixTimestampMillis
		end
	end, { p0.isReportTabVisible })
	
	if fFlagAbuseReportInExpPlayerListV3 then
		reactModule.useEffect(function() --[[ line: 148 ]]
			-- upvalues: recentlyLeftSignalsModule (copy)
			recentlyLeftSignalsModule.init()
		end, {})
	end
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		reactModule.useEffect(function() --[[ line: 154 ]]
			-- upvalues: p0 (ref), var17 (write)
			if not p0.isReportTabVisible and var17 then
				var17(nil)
			end
		end, { p0.isReportTabVisible, var17 })
	end
	local var27
	local var23 = useInExpCustomSubmit({
		voiceChatServiceManager = p0.voiceChatServiceManager,
		inExpChatMessagesLoader = p0.inExpChatMessagesLoader,
		menuOpenTimeRef = var22,
		reportAnythingSnapshotRef = p0.reportAnythingSnapshotRef
	})
	local var24 = reactModule.useCallback(function() --[[ line: 170 ]]
		-- upvalues: setHasError (ref)
		setHasError(true)
	end, { setHasError })
	local var25 = reactModule.useCallback(function(p1) --[[ line: 174 ]]
		-- upvalues: sendBoundaryErrorTelemetryModule (copy), abuseVector (ref), var12 (ref), setHasError (ref)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p1)
		sendBoundaryErrorTelemetryModule(p1, { abuse_vector = abuseVector, target_id = var12 })
		setHasError(true)
	end, { abuseVector, var12, setHasError })
	local var26 = if fFlagAbuseReportInlineAlertStateOutsideReducerModule then reactModule.useMemo(function() --[[ line: 185 ]]
		-- upvalues: var17 (write), var16 (write)
		return if var17 then { pendingInlineAlert = var16, setInlineAlert = var17 } else nil
	end, { var16, var17 }) else nil
	
	if p0.isReportTabVisible and hasError then
		return reactModule.createElement(dynamicReportV2InExpErrorModule, nil)
	elseif p0.isReportTabVisible and config and not hasError then
		var27 = reactModule.createElement
		var27 = var27(abuseReportErrorBoundaryModule, { onError = var25 }, {
			AbuseReportContentInExp = reactModule.createElement(abuseReportContentInExpModule, {
				rawConfig = config,
				abuseVector = abuseVector,
				targetId = var12,
				onClose = p0.onClose,
				open = p0.isReportTabVisible,
				onCustomSubmit = var23,
				onFinish = p0.onReportFinish,
				onResolveError = var24,
				shouldUseOverlaidControls = var20,
				loaders = var21,
				attemptTrigger = if preselectedPlayer then "onOpen" else "onFirstAction",
				inlineAlertController = var26,
				voiceChatServiceManager = if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then p0.voiceChatServiceManager else nil
			})
		})
	else
		var27 = nil
	end
	return var27
end)