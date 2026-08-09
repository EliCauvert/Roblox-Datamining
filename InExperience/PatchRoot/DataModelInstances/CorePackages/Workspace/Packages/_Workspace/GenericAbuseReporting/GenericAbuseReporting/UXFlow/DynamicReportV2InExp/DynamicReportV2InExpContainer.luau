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
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

return reactModule.memo(function(p0) --[[ line: 59 | named "DynamicReportV2InExpContainer" ]]
	-- upvalues: reactModule (ref), useIsVoiceChatReportable (ref), getIsInExpSceneSelectionAvailableModule (ref), useDynamicInExpConfig (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), useDeviceOrientation (ref), guiService (ref), getUsersModule (ref), useInExpCustomSubmit (ref), sendBoundaryErrorTelemetryModule (ref), dynamicReportV2InExpErrorModule (ref), abuseReportErrorBoundaryModule (ref), abuseReportContentInExpModule (ref)
	local preselectedPlayer = p0.preselectedPlayer
	local var10 = reactModule.useMemo(function() --[[ line: 62 ]]
		return tostring(game.GameId)
	end, {})
	local var11 = useIsVoiceChatReportable(p0.voiceChatServiceManager)
	local var12 = useDynamicInExpConfig(p0.isReportTabVisible, reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: var10 (ref), var11 (ref), getIsInExpSceneSelectionAvailableModule (copy), preselectedPlayer (ref)
		local t = {
			experienceTargetId = var10,
			isVoiceChatReportable = var11,
			isSceneSelectionAvailable = getIsInExpSceneSelectionAvailableModule()
		}
		
		if preselectedPlayer then
			t.preselectedAbuserId = tostring(preselectedPlayer.UserId)
			t.preselectedAbuserDisplayName = preselectedPlayer.DisplayName
			t.preselectedAbuserUsername = preselectedPlayer.Name
		end
		return t
	end, { var10, preselectedPlayer, var11 }))
	local config = var12.config
	local hasError = var12.hasError
	local setHasError = var12.setHasError
	local abuseVector = var12.abuseVector
	local var13 = nil
	local var14 = nil
	
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		local var15, var16 = reactModule.useState(nil)
		var13 = var15
		var14 = var16
	end
	local var17 = if useDeviceOrientation() ~= "Landscape" then not (guiService.ViewportDisplaySize == Enum.DisplaySize.Small) else true
	local var18 = reactModule.useMemo(function() --[[ line: 97 ]]
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
	local var19 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	reactModule.useEffect(function() --[[ line: 118 ]]
		-- upvalues: p0 (ref), var19 (ref)
		if p0.isReportTabVisible then
			var19.current = DateTime.now().UnixTimestampMillis
		end
	end, { p0.isReportTabVisible })
	
	if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
		reactModule.useEffect(function() --[[ line: 125 ]]
			-- upvalues: p0 (ref), var14 (write)
			if not p0.isReportTabVisible and var14 then
				var14(nil)
			end
		end, { p0.isReportTabVisible, var14 })
	end
	return if p0.isReportTabVisible and hasError then reactModule.createElement(dynamicReportV2InExpErrorModule, nil) elseif p0.isReportTabVisible and config and not hasError then reactModule.createElement(abuseReportErrorBoundaryModule, {
		onError = reactModule.useCallback(function(p1) --[[ line: 145 ]]
			-- upvalues: sendBoundaryErrorTelemetryModule (copy), abuseVector (ref), var10 (ref), setHasError (ref)
			warn("AbuseReportErrorBoundary (in-exp) caught:", p1)
			sendBoundaryErrorTelemetryModule(p1, { abuse_vector = abuseVector, target_id = var10 })
			setHasError(true)
		end, { abuseVector, var10, setHasError })
	}, {
		AbuseReportContentInExp = reactModule.createElement(abuseReportContentInExpModule, {
			rawConfig = config,
			abuseVector = abuseVector,
			targetId = var10,
			onClose = p0.onClose,
			open = p0.isReportTabVisible,
			onCustomSubmit = useInExpCustomSubmit({
				voiceChatServiceManager = p0.voiceChatServiceManager,
				inExpChatMessagesLoader = p0.inExpChatMessagesLoader,
				menuOpenTimeRef = var19,
				reportAnythingSnapshotRef = p0.reportAnythingSnapshotRef
			}),
			onFinish = p0.onReportFinish,
			onResolveError = reactModule.useCallback(function() --[[ line: 141 ]]
				-- upvalues: setHasError (ref)
				setHasError(true)
			end, { setHasError }),
			shouldUseOverlaidControls = var17,
			loaders = var18,
			attemptTrigger = if preselectedPlayer then "onOpen" else "onFirstAction",
			inlineAlertController = if fFlagAbuseReportInlineAlertStateOutsideReducerModule then reactModule.useMemo(function() --[[ line: 156 ]]
				-- upvalues: var14 (write), var13 (write)
				return if var14 then { pendingInlineAlert = var13, setInlineAlert = var14 } else nil
			end, { var13, var14 }) else nil
		})
	}) else nil
end)