local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Toggle = FoundationModule.Toggle
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseOpenLinkModule = require(GenericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local UserBlockModule = require(GenericAbuseReporting.BeduiV2.Api.userBlock)
local BlockUserFunction = UserBlockModule.blockUser
local FormatErrorDetailForAnalyticsFunction = AnalyticsServiceModule.formatErrorDetailForAnalytics
local IsBlockedUserFunction = UserBlockModule.isBlockedUser
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local UnblockUserFunction = UserBlockModule.unblockUser
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local FFlagAbuseReportOptimisticBlockToggleModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportOptimisticBlockToggle)
local FFlagSupportSubmissionOnAllReportNodes = require(Parent.SharedFlags).FFlagSupportSubmissionOnAllReportNodes

local function useBlockToggle(BlockToggle)
	-- upvalues: ReactModule (copy), FFlagAbuseReportOptimisticBlockToggleModule (copy), UseAbuseReportAnalyticsFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), IsBlockedUserFunction (copy), TelemetryEventType (copy), FFlagAbuseReportImproveErrorEventsModule (copy), FormatErrorDetailForAnalyticsFunction (copy), DashModule (copy), UnblockUserFunction (copy), BlockUserFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if BlockToggle then "Loading" else "Hidden")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local IsBlockRequestInFlight = nil
	local Callback = nil
	
	if FFlagAbuseReportOptimisticBlockToggleModule then
		IsBlockRequestInFlight, Callback = ReactModule.useState(false)
	end
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	ReactModule.useEffect(function()
		-- upvalues: BlockToggle (copy), IsBlockedUserFunction (upval), UseRoactServiceResult (copy), UseStateResult2 (copy), SendEventFunction (copy), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
		if BlockToggle and BlockToggle.userId then
			IsBlockedUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(if Result.responseBody then "Hidden" else "Visible")
			end):catch(function(Err)
				-- upvalues: UseStateResult2 (upval), SendEventFunction (upval), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
				UseStateResult2("Hidden")
				SendEventFunction({
					sub_event_type = TelemetryEventType.Error,
					error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("isBlockedUser failed", Err, { includeResponseBody = true }) else {
						error_message = "isBlockedUser: " .. DashModule.pretty(Err, { depth = 10 })
					}
				})
			end)
			SendEventFunction({ sub_event_type = TelemetryEventType.IsUserBlockAvailable })
			
			return
		else
			UseStateResult2("Hidden")
		end
	end, {
		BlockToggle and BlockToggle.userId,
		SendEventFunction,
		UseRoactServiceResult
	})
	
	return {
		blockToggleState = UseStateResult,
		handleBlockToggleChange = ReactModule.useCallback(function()
			-- upvalues: BlockToggle (copy), FFlagAbuseReportOptimisticBlockToggleModule (upval), IsBlockRequestInFlight (ref), Callback (ref), UseStateResult2_1 (copy), UseStateResult1 (copy), UnblockUserFunction (upval), UseRoactServiceResult (copy), UseStateResult2 (copy), SendEventFunction (copy), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval), BlockUserFunction (upval)
			if BlockToggle == nil or BlockToggle.userId == nil then return end
			if FFlagAbuseReportOptimisticBlockToggleModule then
				if IsBlockRequestInFlight then return end
				if Callback then
					Callback(true)
				end
				UseStateResult2_1(not UseStateResult1)
			end
			local Promise = nil
			if UseStateResult1 then
				Promise = UnblockUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function()
					-- upvalues: UseStateResult2_1 (upval)
					UseStateResult2_1(false)
				end):catch(function(Err)
					-- upvalues: FFlagAbuseReportOptimisticBlockToggleModule (upval), UseStateResult2_1 (upval), UseStateResult2 (upval), SendEventFunction (upval), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
					if FFlagAbuseReportOptimisticBlockToggleModule then
						UseStateResult2_1(true)
					end
					UseStateResult2("Error")
					SendEventFunction({
						sub_event_type = TelemetryEventType.Error,
						error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("unblockUser failed", Err, { includeResponseBody = true }) else {
							error_message = "unblockUser: " .. DashModule.pretty(Err, { depth = 10 })
						}
					})
				end)
				SendEventFunction({ sub_event_type = TelemetryEventType.DidUnblockUser })
			else
				Promise = BlockUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function()
					-- upvalues: FFlagAbuseReportOptimisticBlockToggleModule (upval), SendEventFunction (upval), TelemetryEventType (upval), UseStateResult2_1 (upval)
					if not FFlagAbuseReportOptimisticBlockToggleModule then
						SendEventFunction({ sub_event_type = TelemetryEventType.DidBlockUser })
					end
					UseStateResult2_1(true)
				end):catch(function(Err)
					-- upvalues: FFlagAbuseReportOptimisticBlockToggleModule (upval), UseStateResult2_1 (upval), UseStateResult2 (upval), SendEventFunction (upval), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
					if FFlagAbuseReportOptimisticBlockToggleModule then
						UseStateResult2_1(false)
					end
					UseStateResult2("Error")
					SendEventFunction({
						sub_event_type = TelemetryEventType.Error,
						error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("blockUser failed", Err, { includeResponseBody = true }) else {
							error_message = "blockUser: " .. DashModule.pretty(Err, { depth = 10 })
						}
					})
				end)
				
				if FFlagAbuseReportOptimisticBlockToggleModule then
					SendEventFunction({ sub_event_type = TelemetryEventType.DidBlockUser })
				end
			end
			if FFlagAbuseReportOptimisticBlockToggleModule then
				Promise:finally(function()
					-- upvalues: Callback (upval)
					if Callback then
						Callback(false)
					end
				end)
			end
		end, {
			SendEventFunction,
			UseRoactServiceResult,
			BlockToggle and BlockToggle.userId,
			UseStateResult1,
			IsBlockRequestInFlight
		}),
		isBlocked = UseStateResult1,
		isBlockRequestInFlight = IsBlockRequestInFlight
	}
end

return ReactModule.memo(function(p1)
	-- upvalues: UseArTranslationFunction (copy), UseOpenLinkModule (copy), UseAbuseReportAnalyticsFunction (copy), useBlockToggle (copy), UseLayoutSlotsFunction (copy), ReactModule (copy), TelemetryEventType (copy), EyebrowModule (copy), TextWithTranslationModule (copy), View (copy), Toggle (copy), Button (copy), ButtonVariant (copy), FooterModule (copy), FillBehavior (copy), FFlagSupportSubmissionOnAllReportNodes (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseOpenLinkModuleResult = UseOpenLinkModule()
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseBlockToggleResult = useBlockToggle(p1.blockToggle)
	local BlockToggleState = UseBlockToggleResult.blockToggleState
	local HandleBlockToggleChange = UseBlockToggleResult.handleBlockToggleChange
	local IsBlocked = UseBlockToggleResult.isBlocked
	local IsBlockRequestInFlight = UseBlockToggleResult.isBlockRequestInFlight
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	local Title = UseLayoutSlotsResult.Title
	local Layout = UseLayoutSlotsResult.Layout
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SendEventFunction (copy), TelemetryEventType (upval)
		if p1.helpline and p1.helpline.href then
			SendEventFunction({ sub_event_type = TelemetryEventType.HelplineShown })
		end
	end, { p1.helpline and p1.helpline.href, SendEventFunction })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onNext then
			p1.onNext()
		end
	end, { p1.onNext })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseOpenLinkModuleResult (copy), TranslateIntoStringFunction (copy), SendEventFunction (copy), TelemetryEventType (upval)
		if p1.helpline and p1.helpline.href then
			UseOpenLinkModuleResult(TranslateIntoStringFunction(p1.helpline.heading or ""), p1.helpline.href)
			SendEventFunction({ sub_event_type = TelemetryEventType.HelplineOpened })
		end
	end, {
		p1.helpline and p1.helpline.href,
		UseOpenLinkModuleResult,
		TranslateIntoStringFunction,
		p1.helpline and p1.helpline.heading,
		SendEventFunction
	})
	
	return ReactModule.createElement(Layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, {
			Eyebrow = ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = ReactModule.createElement(Title, {
				layoutOrder = 1,
				input = p1.title,
				subtitle = p1.subtitle
			}),
			Message = ReactModule.createElement(TextWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = p1.message
			}),
			ToggleContainer = if p1.blockToggle and BlockToggleState == "Visible" then ReactModule.createElement(View, {
				tag = "col gap-xsmall size-full-0 auto-y padding-large radius-medium bg-action-standard",
				LayoutOrder = 3,
				testId = "ConfirmationNode.BlockToggleContainer",
				onActivated = HandleBlockToggleChange
			}, {
				TextContainer = ReactModule.createElement(View, {
					tag = "row flex-x-between gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Label = ReactModule.createElement(TextWithTranslationModule, {
						tag = "auto-xy text-title-large content-emphasis",
						layoutOrder = 1,
						input = p1.blockToggle.label or ""
					}),
					Toggle = ReactModule.createElement(Toggle, {
						label = "",
						Selectable = false,
						LayoutOrder = 2,
						testId = "ConfirmationNode.BlockToggle",
						isChecked = IsBlocked,
						isDisabled = IsBlockRequestInFlight,
						onActivated = HandleBlockToggleChange
					})
				}),
				Description = if p1.blockToggle.description then ReactModule.createElement(TextWithTranslationModule, {
					tag = "auto-xy text-body-small text-wrap",
					layoutOrder = 2,
					input = p1.blockToggle.description or ""
				}) else nil
			}) else nil,
			Error = if BlockToggleState == "Error" and p1.blockToggle then ReactModule.createElement(TextWithTranslationModule, {
				tag = "align-x-left size-full-0 auto-y padding-bottom-medium text-body-small content-system-alert",
				layoutOrder = 3,
				input = p1.blockToggle.errorLabel or ""
			}) else nil,
			InformationContainer = if p1.helpline and p1.helpline.heading and BlockToggleState ~= "Loading" then ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 4
			}, {
				InformationHeader = ReactModule.createElement(TextWithTranslationModule, {
					tag = "auto-xy text-title-small content-emphasis",
					layoutOrder = 1,
					input = p1.helpline.heading
				}),
				ViewInformationButton = if p1.helpline and p1.helpline.href then ReactModule.createElement(Button, {
					icon = "icons/navigation/externallink",
					LayoutOrder = 2,
					text = TranslateIntoStringFunction(p1.helpline.buttonText),
					variant = ButtonVariant.Standard,
					width = UDim.new(1, 0),
					onActivated = UseResult1
				}) else nil
			}) else nil,
			Footer = if p1.footerItems then ReactModule.createElement(FooterModule, {
				additionalTag = "padding-top-medium",
				layoutOrder = 5,
				footerItems = p1.footerItems
			}) else nil
		}),
		actions = if p1.onNext then ReactModule.createElement(Button, {
			text = TranslateIntoStringFunction(p1.nextButtonText),
			variant = ButtonVariant.Emphasis,
			fillBehavior = FillBehavior.Fill,
			isLoading = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
			isDisabled = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
			onActivated = UseResult
		}) else nil
	})
end)