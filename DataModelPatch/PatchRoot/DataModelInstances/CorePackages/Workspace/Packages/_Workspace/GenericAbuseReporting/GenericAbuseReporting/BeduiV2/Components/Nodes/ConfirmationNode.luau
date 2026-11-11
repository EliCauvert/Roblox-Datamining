local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local SharedFlagsModule = require(Parent.SharedFlags)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Toggle = FoundationModule.Toggle
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseOpenLinkModule = require(GenericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local UserBlockModule = require(GenericAbuseReporting.BeduiV2.Api.userBlock)
local BlockUserFunction = UserBlockModule.blockUser
local IsBlockedUserFunction = UserBlockModule.isBlockedUser
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UnblockUserFunction = UserBlockModule.unblockUser
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagSupportSubmissionOnAllReportNodes = SharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes
local FFlagRemoveHardcodedStringsInReportNodes = SharedFlagsModule.FFlagRemoveHardcodedStringsInReportNodes
local FFlagAbuseReportMenuV2 = SharedFlagsModule.FFlagAbuseReportMenuV2

local function useBlockToggle(BlockToggle)
	-- upvalues: ReactModule (copy), UseAbuseReportAnalyticsFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), IsBlockedUserFunction (copy), TelemetryEventType (copy), DashModule (copy), UnblockUserFunction (copy), BlockUserFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if BlockToggle then "Loading" else "Hidden")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	ReactModule.useEffect(function()
		-- upvalues: BlockToggle (copy), IsBlockedUserFunction (upval), UseRoactServiceResult (copy), UseStateResult2 (copy), SendEventFunction (copy), TelemetryEventType (upval), DashModule (upval)
		if BlockToggle and BlockToggle.userId then
			IsBlockedUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(if Result.responseBody then "Hidden" else "Visible")
			end):catch(function(Err)
				-- upvalues: UseStateResult2 (upval), SendEventFunction (upval), TelemetryEventType (upval), DashModule (upval)
				UseStateResult2("Hidden")
				SendEventFunction({
					sub_event_type = TelemetryEventType.Error,
					error_detail = {
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
			-- upvalues: BlockToggle (copy), UseStateResult1 (copy), UnblockUserFunction (upval), UseRoactServiceResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), SendEventFunction (copy), TelemetryEventType (upval), DashModule (upval), BlockUserFunction (upval)
			if BlockToggle == nil or BlockToggle.userId == nil then return end
			if UseStateResult1 then
				UnblockUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function()
					-- upvalues: UseStateResult2_1 (upval)
					UseStateResult2_1(false)
				end):catch(function(Err)
					-- upvalues: UseStateResult2 (upval), SendEventFunction (upval), TelemetryEventType (upval), DashModule (upval)
					UseStateResult2("Error")
					SendEventFunction({
						sub_event_type = TelemetryEventType.Error,
						error_detail = {
							error_message = "unblockUser: " .. DashModule.pretty(Err, { depth = 10 })
						}
					})
				end)
				SendEventFunction({ sub_event_type = TelemetryEventType.DidUnblockUser })
				
				return
			else
				BlockUserFunction(UseRoactServiceResult, BlockToggle.userId):andThen(function()
					-- upvalues: SendEventFunction (upval), TelemetryEventType (upval), UseStateResult2_1 (upval)
					SendEventFunction({ sub_event_type = TelemetryEventType.DidBlockUser })
					UseStateResult2_1(true)
				end):catch(function(Err)
					-- upvalues: UseStateResult2 (upval), SendEventFunction (upval), TelemetryEventType (upval), DashModule (upval)
					UseStateResult2("Error")
					SendEventFunction({
						sub_event_type = TelemetryEventType.Error,
						error_detail = {
							error_message = "blockUser: " .. DashModule.pretty(Err, { depth = 10 })
						}
					})
				end)
			end
		end, {
			SendEventFunction,
			UseRoactServiceResult,
			BlockToggle and BlockToggle.userId,
			UseStateResult1
		}),
		isBlocked = UseStateResult1
	}
end

return ReactModule.memo(function(p1)
	-- upvalues: UseArTranslationFunction (copy), UseOpenLinkModule (copy), UseAbuseReportAnalyticsFunction (copy), useBlockToggle (copy), UseLayoutSlotsFunction (copy), FFlagAbuseReportMenuV2 (copy), ReactModule (copy), TelemetryEventType (copy), EyebrowModule (copy), TextWithTranslationModule (copy), View (copy), Toggle (copy), Button (copy), ButtonVariant (copy), FooterModule (copy), FFlagRemoveHardcodedStringsInReportNodes (copy), FillBehavior (copy), FFlagSupportSubmissionOnAllReportNodes (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseOpenLinkModuleResult = UseOpenLinkModule()
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseBlockToggleResult = useBlockToggle(p1.blockToggle)
	local BlockToggleState = UseBlockToggleResult.blockToggleState
	local HandleBlockToggleChange = UseBlockToggleResult.handleBlockToggleChange
	local IsBlocked = UseBlockToggleResult.isBlocked
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	local Body = UseLayoutSlotsResult.Body
	local Actions = UseLayoutSlotsResult.Actions
	local Title = UseLayoutSlotsResult.Title
	local Layout = if FFlagAbuseReportMenuV2 then UseLayoutSlotsResult.Layout else nil
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
	local config = {
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
			tag = "size-full-0 auto-y col padding-large radius-medium gap-xsmall bg-action-standard",
			LayoutOrder = 3,
			onActivated = HandleBlockToggleChange
		}, {
			TextContainer = ReactModule.createElement(View, {
				tag = "auto-y size-full-0 row gap-small flex-x-between",
				LayoutOrder = 1
			}, {
				Label = ReactModule.createElement(TextWithTranslationModule, {
					tag = "text-title-large content-emphasis auto-xy",
					layoutOrder = 1,
					input = p1.blockToggle.label or ""
				}),
				Toggle = ReactModule.createElement(Toggle, {
					label = "",
					Selectable = false,
					LayoutOrder = 2,
					isChecked = IsBlocked,
					onActivated = HandleBlockToggleChange
				})
			}),
			Description = if p1.blockToggle.description then ReactModule.createElement(TextWithTranslationModule, {
				tag = "text-body-small auto-xy text-wrap",
				layoutOrder = 2,
				input = p1.blockToggle.description or ""
			}) else nil
		}) else nil,
		Error = if BlockToggleState == "Error" and p1.blockToggle then ReactModule.createElement(TextWithTranslationModule, {
			tag = "size-full-0 auto-y content-system-alert text-body-small padding-bottom-medium align-x-left",
			layoutOrder = 3,
			input = p1.blockToggle.errorLabel or ""
		}) else nil,
		InformationContainer = if p1.helpline and p1.helpline.heading and BlockToggleState ~= "Loading" then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-medium",
			LayoutOrder = 4
		}, {
			InformationHeader = ReactModule.createElement(TextWithTranslationModule, {
				tag = "text-title-small content-emphasis auto-xy",
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
		Footer = if FFlagAbuseReportMenuV2 and p1.footerItems then ReactModule.createElement(FooterModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 5,
			footerItems = p1.footerItems
		}) else nil
	}
	local Element = if p1.onNext then ReactModule.createElement(Button, {
		text = if FFlagRemoveHardcodedStringsInReportNodes then TranslateIntoStringFunction(p1.nextButtonText) else "Close",
		variant = ButtonVariant.Emphasis,
		fillBehavior = FillBehavior.Fill,
		isLoading = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
		isDisabled = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
		onActivated = UseResult
	}) else nil
	
	return if FFlagAbuseReportMenuV2 then ReactModule.createElement(Layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, config),
		actions = Element
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement(Body, nil, config),
		Actions = if Element then ReactModule.createElement(Actions, nil, { Button = Element }) else nil
	})
end)