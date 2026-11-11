local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local GuiService = game:GetService("GuiService")
local ReactModule = require(Parent.React)
local _ = require(Parent.RobloxAppEnums)
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local AbuseReportErrorBoundaryModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportErrorBoundary)
local GetIsInExpSceneSelectionAvailableModule = require(GenericAbuseReporting.BeduiV2.Components.Nodes.getIsInExpSceneSelectionAvailable)
local GetUsersModule = require(GenericAbuseReporting.BeduiV2.Loaders.getUsers)
local _ = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local SendBoundaryErrorTelemetryModule = require(GenericAbuseReporting.BeduiV2.Analytics.sendBoundaryErrorTelemetry)
local UseInExpCustomSubmitFunction = require(GenericAbuseReporting.BeduiV2.Hooks.useInExpCustomSubmit).useInExpCustomSubmit
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local DynamicReportV2InExpErrorModule = require(script.Parent.DynamicReportV2InExpError)
local AbuseReportContentInExpModule = require(script.Parent.AbuseReportContentInExp)
local UseDynamicInExpConfigFunction = require(script.Parent.useDynamicInExpConfig).useDynamicInExpConfig
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local UseIsVoiceChatReportableFunction = require(script.Parent.useIsVoiceChatReportable).useIsVoiceChatReportable
local _ = require(GenericAbuseReporting.BeduiV2.Utils.appendReportAnythingTags)
local FFlagAbuseReportInlineAlertStateOutsideReducerModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseIsVoiceChatReportableFunction (copy), GetIsInExpSceneSelectionAvailableModule (copy), UseDynamicInExpConfigFunction (copy), FFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), UseDeviceOrientationFunction (copy), GuiService (copy), GetUsersModule (copy), UseInExpCustomSubmitFunction (copy), SendBoundaryErrorTelemetryModule (copy), DynamicReportV2InExpErrorModule (copy), AbuseReportErrorBoundaryModule (copy), AbuseReportContentInExpModule (copy)
	local PreselectedPlayer = p1.preselectedPlayer
	local UseMemoResult = ReactModule.useMemo(function(): string
		return (tostring(game.GameId))
	end, {})
	local UseIsVoiceChatReportableResult = UseIsVoiceChatReportableFunction(p1.voiceChatServiceManager)
	local UseDynamicInExpConfigResult = UseDynamicInExpConfigFunction(p1.isReportTabVisible, (ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseIsVoiceChatReportableResult (copy), GetIsInExpSceneSelectionAvailableModule (upval), PreselectedPlayer (copy)
		local config = {
			experienceTargetId = UseMemoResult,
			isVoiceChatReportable = UseIsVoiceChatReportableResult,
			isSceneSelectionAvailable = GetIsInExpSceneSelectionAvailableModule()
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
		UseIsVoiceChatReportableResult
	})))
	local Config = UseDynamicInExpConfigResult.config
	local HasError = UseDynamicInExpConfigResult.hasError
	local SetHasErrorFunction = UseDynamicInExpConfigResult.setHasError
	local AbuseVector = UseDynamicInExpConfigResult.abuseVector
	local PendingInlineAlert = nil
	local Callback = nil
	
	if FFlagAbuseReportInlineAlertStateOutsideReducerModule then
		PendingInlineAlert, Callback = ReactModule.useState(nil)
	end
	local IsViewportDisplaySizeMatch = GuiService.ViewportDisplaySize == Enum.DisplaySize.Small
	local IsLandscape: boolean = UseDeviceOrientationFunction() == "Landscape" or not IsViewportDisplaySizeMatch
	local UseMemoResult1 = ReactModule.useMemo(function()
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
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy)
		if p1.isReportTabVisible then
			UseRefResult.current = DateTime.now().UnixTimestampMillis
		end
	end, { p1.isReportTabVisible })
	
	if FFlagAbuseReportInlineAlertStateOutsideReducerModule then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), Callback (ref)
			if not p1.isReportTabVisible and Callback then
				Callback(nil)
			end
		end, { p1.isReportTabVisible, Callback })
	end
	local UseInExpCustomSubmitResult = UseInExpCustomSubmitFunction({
		voiceChatServiceManager = p1.voiceChatServiceManager,
		inExpChatMessagesLoader = p1.inExpChatMessagesLoader,
		menuOpenTimeRef = UseRefResult,
		reportAnythingSnapshotRef = p1.reportAnythingSnapshotRef
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SetHasErrorFunction (copy)
		SetHasErrorFunction(true)
	end, { SetHasErrorFunction })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: SendBoundaryErrorTelemetryModule (upval), AbuseVector (copy), UseMemoResult (copy), SetHasErrorFunction (copy)
		warn("AbuseReportErrorBoundary (in-exp) caught:", p2)
		SendBoundaryErrorTelemetryModule(p2, { abuse_vector = AbuseVector, target_id = UseMemoResult })
		SetHasErrorFunction(true)
	end, { AbuseVector, UseMemoResult, SetHasErrorFunction })
	local UseMemoResult2 = if FFlagAbuseReportInlineAlertStateOutsideReducerModule then ReactModule.useMemo(function()
		-- upvalues: Callback (ref), PendingInlineAlert (ref)
		return if Callback then {
			pendingInlineAlert = PendingInlineAlert,
			setInlineAlert = Callback
		} else nil
	end, { PendingInlineAlert, Callback }) else nil
	
	return if p1.isReportTabVisible and HasError then ReactModule.createElement(DynamicReportV2InExpErrorModule, nil) elseif p1.isReportTabVisible and Config and not HasError then ReactModule.createElement(AbuseReportErrorBoundaryModule, { onError = UseResult1 }, {
		AbuseReportContentInExp = ReactModule.createElement(AbuseReportContentInExpModule, {
			rawConfig = Config,
			abuseVector = AbuseVector,
			targetId = UseMemoResult,
			onClose = p1.onClose,
			open = p1.isReportTabVisible,
			onCustomSubmit = UseInExpCustomSubmitResult,
			onFinish = p1.onReportFinish,
			onResolveError = UseResult,
			shouldUseOverlaidControls = IsLandscape,
			loaders = UseMemoResult1,
			attemptTrigger = if PreselectedPlayer then "onOpen" else "onFirstAction",
			inlineAlertController = UseMemoResult2
		})
	}) else nil
end)