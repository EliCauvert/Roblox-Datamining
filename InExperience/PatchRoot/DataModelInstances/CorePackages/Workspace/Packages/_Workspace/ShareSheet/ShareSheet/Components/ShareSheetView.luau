local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local DialogSize = FoundationModule.Enums.DialogSize
local Divider = FoundationModule.Divider
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagShareSheetDesktopReadinessModule = require(ShareSheet.Flags.FFlagShareSheetDesktopReadiness)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local FFlagShareSheetUseFoundationCenterSheetHeightFixModule = require(ShareSheet.Flags.FFlagShareSheetUseFoundationCenterSheetHeightFix)
local FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent = require(ShareSheet.ShareSheetConstants).FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent
local GetCenterSheetHeightModule = require(script.Parent.getCenterSheetHeight)
local PeoplePickerModule = require(ShareSheet.Components.PeoplePicker)
local ShareSheetActionRowModule = require(script.Parent.ShareSheetActionRow)
local ShareSheetSocialRowModule = require(script.Parent.ShareSheetSocialRow)
local ShareSendRowModule = require(script.Parent.ShareSendRow)
local _ = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local _ = require(ShareSheet.Types)

local function setDefaultContentScrollingFrameRef(p1)
	if p1 then
		p1.AutomaticSize = Enum.AutomaticSize.Y
		p1.ScrollBarThickness = 0
	end
end

local function setPeoplePickerContentScrollingFrameRef(p1)
	if p1 then
		p1.AutomaticSize = Enum.AutomaticSize.None
		p1.ScrollBarThickness = 0
	end
end

local function useOverlaySize()
	-- upvalues: UseOverlayFunction (copy), ReactModule (copy)
	local UseOverlayResult = UseOverlayFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local AbsoluteSize = if UseOverlayResult then UseOverlayResult.AbsoluteSize else UseStateResult
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseOverlayResult (copy), UseStateResult2 (copy)
		if UseOverlayResult == nil then return end
		local Connection = UseOverlayResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: UseOverlayResult (upval), UseStateResult2 (upval)
			local AbsoluteSize = UseOverlayResult.AbsoluteSize
			UseStateResult2(function(AbsoluteSize1)
				-- upvalues: AbsoluteSize (copy)
				return if AbsoluteSize1 == AbsoluteSize then AbsoluteSize1 else AbsoluteSize
			end)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseOverlayResult })
	
	return AbsoluteSize
end

return function(p1)
	-- upvalues: FFlagShareSheetUseFoundationCenterSheetHeightFixModule (copy), UseTokensFunction (copy), useOverlaySize (copy), UseScaledValueFunction (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent (copy), GetCenterSheetHeightModule (copy), ReactModule (copy), ShareSheetTelemetryModule (copy), Sheet (copy), FFlagShareSheetDesktopReadinessModule (copy), DialogSize (copy), PeoplePickerModule (copy), Text (copy), setPeoplePickerContentScrollingFrameRef (copy), setDefaultContentScrollingFrameRef (copy), View (copy), ShareSheetSocialRowModule (copy), FFlagShareSheetFriendsSort (copy), Divider (copy), ShareSendRowModule (copy), ShareSheetActionRowModule (copy)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if not FFlagShareSheetUseFoundationCenterSheetHeightFixModule then
		v1 = UseTokensFunction()
		v2 = useOverlaySize()
		v3 = UseScaledValueFunction(600)
	end
	local HasNextEntry: boolean = next(p1.selectedConversationIds) ~= nil or p1.isSending == true
	local PeoplePicker = nil
	local IsIsPeoplePickerDisplayed = false
	local v4 = nil
	local v5 = nil
	
	if FFlagShareSheetPeoplePickerEnabledModule then
		PeoplePicker = p1.peoplePicker
		IsIsPeoplePickerDisplayed = p1.isPeoplePickerDisplayed == true
		
		if IsIsPeoplePickerDisplayed then
			local FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercentRatio = FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent / 10000
			v4 = {
				FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercentRatio
			}
			v5 = if FFlagShareSheetUseFoundationCenterSheetHeightFixModule then FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercentRatio else GetCenterSheetHeightModule(v2.Y, v1.Margin.Medium * 2, v3, FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercentRatio)
		end
	end
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		centerSheetHeight = if FFlagShareSheetPeoplePickerEnabledModule then v5 else nil,
		isOpen = p1.isOpen,
		onClose = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), ShareSheetTelemetryModule (upval)
			p1.onCloseWithReason(ShareSheetTelemetryModule.CloseReason.UserDismissed)
		end, { p1.onCloseWithReason }),
		size = if FFlagShareSheetDesktopReadinessModule then DialogSize.Large else nil,
		snapPoints = if FFlagShareSheetPeoplePickerEnabledModule then v4 else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, {
			hasCloseAffordance = not FFlagShareSheetPeoplePickerEnabledModule or not IsIsPeoplePickerDisplayed
		}, if FFlagShareSheetPeoplePickerEnabledModule and IsIsPeoplePickerDisplayed then {
			Picker = ReactModule.createElement(PeoplePickerModule.PeoplePickerHeader, PeoplePicker.headerProps)
		} else {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.shareLabel
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, {
			scrollingFrameRef = if FFlagShareSheetPeoplePickerEnabledModule and IsIsPeoplePickerDisplayed then setPeoplePickerContentScrollingFrameRef else setDefaultContentScrollingFrameRef,
			isContentFullBleed = not FFlagShareSheetPeoplePickerEnabledModule or not IsIsPeoplePickerDisplayed
		}, {
			ContentLayout = ReactModule.createElement(View, {
				tag = {
					["col size-full"] = FFlagShareSheetPeoplePickerEnabledModule and IsIsPeoplePickerDisplayed,
					["col size-full-0 auto-y"] = not (FFlagShareSheetPeoplePickerEnabledModule and IsIsPeoplePickerDisplayed),
					["gap-xlarge"] = not FFlagShareSheetPeoplePickerEnabledModule or not IsIsPeoplePickerDisplayed
				}
			}, if FFlagShareSheetPeoplePickerEnabledModule and IsIsPeoplePickerDisplayed then {
				PeoplePicker = ReactModule.createElement(PeoplePickerModule.PeoplePickerList, PeoplePicker.listProps)
			} else {
				SocialRow = if p1.shouldShowSocialRow then ReactModule.createElement(ShareSheetSocialRowModule, {
					LayoutOrder = 1,
					conversationEligibility = if FFlagShareSheetFriendsSort then nil else p1.conversationEligibility,
					eligibleRecipients = if FFlagShareSheetFriendsSort then p1.eligibleRecipients else nil,
					isLoading = p1.isSocialRowLoading,
					onConversationActivated = p1.onConversationActivated,
					onMoreActivated = if FFlagShareSheetPeoplePickerEnabledModule then p1.onMoreActivated else nil,
					selectedConversationIds = p1.selectedConversationIds
				}) else nil,
				RowDivider = if p1.shouldShowSocialRow then ReactModule.createElement(Divider, { LayoutOrder = 2, testId = "share-sheet-row-divider" }) else nil,
				ActionsRow = if FFlagShareSheetPeoplePickerEnabledModule then nil elseif HasNextEntry then ReactModule.createElement(ShareSendRowModule, {
					LayoutOrder = 3,
					isLoading = p1.isSending,
					label = p1.sendLabel,
					messagePlaceholder = p1.messagePlaceholder,
					onActivated = p1.onSendActivated,
					onFocusGained = p1.onComposerFocused
				}) else ReactModule.createElement(ShareSheetActionRowModule, {
					LayoutOrder = 3,
					canShare = p1.canShareLink,
					context = p1.context,
					recipientSource = p1.recipientSource,
					telemetryId = p1.telemetryId,
					url = p1.url
				})
			})
		}),
		Actions = if FFlagShareSheetPeoplePickerEnabledModule then ReactModule.createElement(Sheet.Actions, nil, {
			Footer = if HasNextEntry then ReactModule.createElement(ShareSendRowModule, {
				hasHorizontalPadding = false,
				shouldFillButton = false,
				isLoading = p1.isSending,
				label = p1.sendLabel,
				messagePlaceholder = p1.messagePlaceholder,
				onActivated = p1.onSendActivated,
				onFocusGained = p1.onComposerFocused
			}) elseif IsIsPeoplePickerDisplayed then nil else ReactModule.createElement(ShareSheetActionRowModule, {
				hasHorizontalPadding = false,
				canShare = p1.canShareLink,
				context = p1.context,
				recipientSource = p1.recipientSource,
				telemetryId = p1.telemetryId,
				url = p1.url
			})
		}) else nil
	})
end