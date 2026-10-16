local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local BlockingUtilityModule = require(Parent.BlockingUtility)
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local FlaggedMutedErrorFunction = require(Parent.RobloxAppLoggers).flaggedMutedError
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local TextLinkModule = require(GenericAbuseReporting.BeduiV2.Components.TextLink)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseInExpFocusNavigationRefsModule = require(GenericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useInExpFocusNavigationRefs)
local UseInExpOpenLinkModule = require(GenericAbuseReporting.BeduiV2.Hooks.useInExpOpenLink)
local UserBlockModule = require(GenericAbuseReporting.BeduiV2.Api.userBlock)
local UserMuteModule = require(GenericAbuseReporting.BeduiV2.Api.userMute)
local VoiceSpeakingSignalsModule = require(GenericAbuseReporting.BeduiV2.Utils.Signals.voiceSpeakingSignals)
local BlockUserFunction = UserBlockModule.blockUser
local IsBlockedUserFunction = UserBlockModule.isBlockedUser
local IsUserMutedFunction = UserMuteModule.isUserMuted
local MuteUserFunction = UserMuteModule.muteUser
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local FormatErrorDetailForAnalyticsFunction = AnalyticsServiceModule.formatErrorDetailForAnalytics
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)

local function _(p1): string --[[ Line: 86 | Named "computeInitialMuteState" ]]
	-- upvalues: IsUserMutedFunction (copy)
	if p1 and p1.userId then
		local Number: number = tonumber(p1.userId) or 0
		
		return if Number == 0 or IsUserMutedFunction(Number) then "Hidden" else "Visible"
	else
		return "Hidden"
	end
end

local function useBlockMuteActions(BlockToggle, MuteToggle, Callback) --[[ Line: 97 ]]
	-- upvalues: UseArTranslationFunction (copy), ReactModule (copy), VoiceSpeakingSignalsModule (copy), IsUserMutedFunction (copy), UseAbuseReportAnalyticsFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), IsBlockedUserFunction (copy), TelemetryEventType (copy), FFlagAbuseReportImproveErrorEventsModule (copy), FormatErrorDetailForAnalyticsFunction (copy), DashModule (copy), LocalPlayer (copy), MuteUserFunction (copy), Players (copy), BlockingUtilityModule (copy), BlockUserFunction (copy), FlaggedMutedErrorFunction (copy), ButtonVariant (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseContextResult = ReactModule.useContext(VoiceSpeakingSignalsModule.VoiceChatServiceManagerContext)
	local Hidden, Hidden2 = ReactModule.useState("Hidden")
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): string --[[ Line: 108 ]]
		-- upvalues: MuteToggle (copy), IsUserMutedFunction (upval)
		if MuteToggle and MuteToggle.userId then
			local Number: number = tonumber(MuteToggle.userId) or 0
			
			return if Number == 0 or IsUserMutedFunction(Number) then "Hidden" else "Visible"
		else
			return "Hidden"
		end
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	ReactModule.useEffect(function() --[[ Line: 116 ]]
		-- upvalues: BlockToggle (copy), IsBlockedUserFunction (upval), UseRoactServiceResult (copy), Hidden2 (copy), UseStateResult2_1 (copy), SendEventFunction (copy), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
		if BlockToggle and BlockToggle.userId then
			IsBlockedUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function(Result) --[[ Line: 119 ]]
				-- upvalues: Hidden2 (upval), UseStateResult2_1 (upval)
				Hidden2(if Result.responseBody then "Hidden" else "Visible")
				UseStateResult2_1(true)
			end):catch(function(Err) --[[ Line: 124 ]]
				-- upvalues: SendEventFunction (upval), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval), UseStateResult2_1 (upval)
				SendEventFunction({
					sub_event_type = TelemetryEventType.Error,
					error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("isBlockedUser failed", Err, { includeResponseBody = true }) else {
						error_message = "isBlockedUser: " .. DashModule.pretty(Err, { depth = 10 })
					}
				})
				UseStateResult2_1(true)
			end)
			SendEventFunction({ sub_event_type = TelemetryEventType.IsUserBlockAvailable })
		end
	end, {
		if BlockToggle then BlockToggle.userId else nil,
		UseRoactServiceResult,
		SendEventFunction
	})
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 151 ]]
		-- upvalues: UseStateResult (copy), UseRefResult (copy), SendEventFunction (copy), TelemetryEventType (upval)
		if UseStateResult == "Visible" and not UseRefResult.current then
			UseRefResult.current = true
			SendEventFunction({ sub_event_type = TelemetryEventType.IsUserMuteAvailable })
		end
	end, { UseStateResult, SendEventFunction })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 158 ]]
		-- upvalues: MuteToggle (copy), LocalPlayer (upval), UseStateResult2 (copy), MuteUserFunction (upval), UseContextResult (copy), SendEventFunction (copy), TelemetryEventType (upval), Callback (copy), FFlagAbuseReportImproveErrorEventsModule (upval)
		if not MuteToggle or not MuteToggle.userId then return end
		local Number: number? = tonumber(MuteToggle.userId)
		
		if Number and LocalPlayer then
			UseStateResult2("Loading")
			
			if MuteUserFunction(Number, LocalPlayer, UseContextResult) then
				SendEventFunction({ sub_event_type = TelemetryEventType.DidMuteUser })
				Callback({ didBlockUser = false, didMuteUser = true })
				
				return
			end
			SendEventFunction({
				sub_event_type = TelemetryEventType.Error,
				error_detail = if FFlagAbuseReportImproveErrorEventsModule then {
					error_message = "muteUser failed",
					error_metadata = { target_user_id = tostring(Number) }
				} else { error_message = `muteUser failed for userId: {Number}` }
			})
			Callback({ didBlockUser = false, didMuteUser = false })
		end
	end, {
		MuteToggle,
		SendEventFunction,
		Callback,
		UseContextResult
	})
	local UseResult1 = ReactModule.useCallback(function(UserId) --[[ Line: 191 ]]
		-- upvalues: SendEventFunction (copy), TelemetryEventType (upval), Players (upval), BlockingUtilityModule (upval), FFlagAbuseReportImproveErrorEventsModule (upval)
		if not UserId or UserId == 0 then
			SendEventFunction({
				sub_event_type = TelemetryEventType.Error,
				error_detail = { error_message = "AddPlayerToBlockList invalid userId" }
			})
			
			return
		end
		local Player = Players:GetPlayerByUserId(UserId)
		
		if Player and not BlockingUtilityModule:AddPlayerToBlockList(Player) then
			SendEventFunction({
				sub_event_type = TelemetryEventType.Error,
				error_detail = if FFlagAbuseReportImproveErrorEventsModule then {
					error_message = "AddPlayerToBlockList failed",
					error_metadata = { target_user_id = tostring(UserId) }
				} else {
					error_message = `AddPlayerToBlockList failed for userId: {UserId}`
				}
			})
		end
	end, { SendEventFunction })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 218 ]]
		-- upvalues: BlockToggle (copy), FFlagAbuseReportImproveErrorEventsModule (upval), Hidden2 (copy), BlockUserFunction (upval), UseRoactServiceResult (copy), UseResult1 (copy), FlaggedMutedErrorFunction (upval), Callback (copy), SendEventFunction (copy), TelemetryEventType (upval), FormatErrorDetailForAnalyticsFunction (upval)
		if not BlockToggle or not BlockToggle.userId then return end
		if FFlagAbuseReportImproveErrorEventsModule then
			Hidden2("Loading")
			BlockUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function() --[[ Line: 225 ]]
				-- upvalues: Hidden2 (upval), BlockToggle (upval), UseResult1 (upval), FlaggedMutedErrorFunction (upval), Callback (upval)
				Hidden2("Hidden")
				local Number: number? = tonumber(BlockToggle.userId)
				
				if Number then
					local Success, Result = pcall(function() --[[ Line: 229 ]]
						-- upvalues: UseResult1 (upval), Number (copy)
						UseResult1(Number)
						
						return nil
					end)
					
					if not Success then
						FlaggedMutedErrorFunction("AbuseReportInExpLocalBlockError", (tostring(Result)))
					end
				end
				Callback({ didBlockUser = true, didMuteUser = false })
			end, function(p1) --[[ Line: 238 ]]
				-- upvalues: Hidden2 (upval), SendEventFunction (upval), TelemetryEventType (upval), FormatErrorDetailForAnalyticsFunction (upval)
				Hidden2("Error")
				SendEventFunction({
					sub_event_type = TelemetryEventType.Error,
					error_detail = FormatErrorDetailForAnalyticsFunction("blockUser failed", p1, { includeResponseBody = true })
				})
			end)
			SendEventFunction({ sub_event_type = TelemetryEventType.DidBlockUser })
			
			return
		else
			Hidden2("Loading")
			BlockUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function() --[[ Line: 255 ]]
				-- upvalues: SendEventFunction (upval), TelemetryEventType (upval), BlockToggle (upval), UseResult1 (upval), Callback (upval)
				SendEventFunction({ sub_event_type = TelemetryEventType.DidBlockUser })
				local Number: number? = tonumber(BlockToggle.userId)
				
				if Number then
					UseResult1(Number)
				end
				Callback({ didBlockUser = true, didMuteUser = false })
			end):catch(function() --[[ Line: 263 ]]
				-- upvalues: Hidden2 (upval), SendEventFunction (upval), TelemetryEventType (upval), BlockToggle (upval)
				Hidden2("Error")
				SendEventFunction({
					sub_event_type = TelemetryEventType.Error,
					error_detail = {
						error_message = `blockUser failed for userId: {BlockToggle.userId}`
					}
				})
			end)
		end
	end, {
		BlockToggle,
		Callback,
		UseResult1,
		UseRoactServiceResult,
		SendEventFunction
	})
	local NoBlockToggle = BlockToggle == nil or UseStateResult1
	
	return {
		actions = ReactModule.useMemo(function() --[[ Line: 277 ]]
			-- upvalues: NoBlockToggle (copy), BlockToggle (copy), Hidden (copy), TranslateIntoStringFunction (copy), ButtonVariant (upval), UseResult2 (copy), MuteToggle (copy), UseStateResult (copy), UseResult (copy)
			local List = {}
			
			if not NoBlockToggle then
				return List
			end
			if BlockToggle and Hidden ~= "Hidden" then
				table.insert(List, {
					text = TranslateIntoStringFunction(BlockToggle.label),
					variant = ButtonVariant.Alert,
					onActivated = UseResult2,
					isLoading = Hidden == "Loading"
				})
			end
			if MuteToggle and UseStateResult ~= "Hidden" then
				table.insert(List, {
					text = TranslateIntoStringFunction(MuteToggle.label),
					variant = ButtonVariant.Alert,
					onActivated = UseResult,
					isLoading = UseStateResult == "Loading"
				})
			end
			return List
		end, {
			BlockToggle, MuteToggle, UseResult2, UseResult, TranslateIntoStringFunction,
			Hidden, UseStateResult, NoBlockToggle
		}),
		blockState = Hidden,
		muteState = UseStateResult,
		hasActions = BlockToggle ~= nil or MuteToggle ~= nil,
		hasLoadedActions = NoBlockToggle
	}
end

local function useDelayedTrue(Delay) --[[ Line: 322 ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 324 ]]
		-- upvalues: Delay (copy), UseStateResult2 (copy)
		local DelayedThread = task.delay(Delay, function() --[[ Line: 325 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		
		return function() --[[ Line: 328 ]]
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { Delay })
	
	return UseStateResult
end

return ReactModule.memo(function(p1) --[[ Line: 340 | Named "InExpConfirmationNode" ]]
	-- upvalues: UseArTranslationFunction (copy), UseInExpOpenLinkModule (copy), UseAbuseReportAnalyticsFunction (copy), useBlockMuteActions (copy), useDelayedTrue (copy), UseLayoutSlotsFunction (copy), ReactModule (copy), TelemetryEventType (copy), UseInExpFocusNavigationRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), Dialog (copy), DialogSize (copy), View (copy), TextWithTranslationModule (copy), TextLinkModule (copy), FooterModule (copy), Orientation (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseInExpOpenLinkModuleResult = UseInExpOpenLinkModule()
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseBlockMuteActionsResult = useBlockMuteActions(p1.blockToggle, p1.muteToggle, p1.onNext)
	local Actions = UseBlockMuteActionsResult.actions
	local BlockState = UseBlockMuteActionsResult.blockState
	local MuteState = UseBlockMuteActionsResult.muteState
	local HasActions = UseBlockMuteActionsResult.hasActions
	local HasLoadedActions = UseBlockMuteActionsResult.hasLoadedActions
	local UseDelayedTrueResult = useDelayedTrue(0.6)
	local IsStoryMode = p1.isStoryMode or (UseDelayedTrueResult or (not HasActions or HasLoadedActions))
	local Layout = UseLayoutSlotsFunction().Layout
	ReactModule.useEffect(function() --[[ Line: 364 ]]
		-- upvalues: SendEventFunction (copy), IsStoryMode (copy), p1 (copy), TelemetryEventType (upval)
		if SendEventFunction and IsStoryMode and p1.helpline and p1.helpline.href then
			SendEventFunction({ sub_event_type = TelemetryEventType.HelplineShown })
		end
	end, { p1.helpline and p1.helpline.href, IsStoryMode })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 372 ]]
		-- upvalues: p1 (copy), UseInExpOpenLinkModuleResult (copy), SendEventFunction (copy), TelemetryEventType (upval)
		if p1.helpline and p1.helpline.href then
			UseInExpOpenLinkModuleResult(p1.helpline.href)
			
			if SendEventFunction then
				SendEventFunction({ sub_event_type = TelemetryEventType.HelplineOpened })
			end
		end
	end, { p1.helpline, UseInExpOpenLinkModuleResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 381 ]]
		-- upvalues: p1 (copy)
		p1.onNext({ didBlockUser = false, didMuteUser = false })
	end, { p1.onNext })
	local UseInExpFocusNavigationRefsModuleResult = UseInExpFocusNavigationRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseResult1)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement(Layout, { body = nil, actions = nil }),
		ConfirmationDialog = if IsStoryMode then ReactModule.createElement(Dialog.Root, {
			ref = UseInExpFocusNavigationRefsModuleResult,
			size = DialogSize.Small,
			hasBackdrop = not p1.isStoryMode,
			disablePortal = if p1.isStoryMode then true else false,
			onClose = UseResult1
		}, {
			DialogTitle = ReactModule.createElement(Dialog.Title, { text = TranslateIntoStringFunction(p1.title) }),
			DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
				DialogContentView = ReactModule.createElement(View, { tag = "col gap-small size-full-0 auto-y" }, {
					Message = ReactModule.createElement(TextWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium",
						layoutOrder = 2,
						input = p1.message
					}),
					Helpline = p1.helpline and ReactModule.createElement(View, {
						tag = "col gap-small size-full-0 auto-y",
						LayoutOrder = 3
					}, {
						Heading = ReactModule.createElement(TextWithTranslationModule, {
							tag = "size-full-0 auto-y text-body-medium",
							layoutOrder = 1,
							input = p1.helpline.heading
						}),
						Link = ReactModule.createElement(TextLinkModule, {
							tag = "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis",
							layoutOrder = 2,
							text = TranslateIntoStringFunction(p1.helpline.buttonText),
							onActivated = UseResult
						})
					}),
					ErrorMessage = if BlockState == "Error" or MuteState == "Error" then ReactModule.createElement(TextWithTranslationModule, {
						tag = "size-full-0 auto-y text-body-medium content-system-alert",
						layoutOrder = 4,
						input = if BlockState == "Error" and p1.blockToggle then p1.blockToggle.errorLabel elseif MuteState == "Error" and p1.muteToggle then p1.muteToggle.errorLabel else ""
					}) else nil,
					Footer = p1.footerItems and ReactModule.createElement(FooterModule, {
						additionalTag = "padding-top-medium",
						layoutOrder = 5,
						footerItems = p1.footerItems
					})
				})
			}),
			DialogActions = ReactModule.createElement(Dialog.Actions, {
				LayoutOrder = 4,
				actions = Actions,
				orientation = Orientation.Vertical
			})
		}) else nil
	})
end)