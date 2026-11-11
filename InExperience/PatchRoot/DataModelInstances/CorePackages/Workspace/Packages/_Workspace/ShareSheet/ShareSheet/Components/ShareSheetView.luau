local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local DialogSize = FoundationModule.Enums.DialogSize
local Divider = FoundationModule.Divider
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local FFlagShareSheetDesktopReadinessModule = require(ShareSheet.Flags.FFlagShareSheetDesktopReadiness)
local FFlagShareSheetOmitsEmptyActionsModule = require(ShareSheet.Flags.FFlagShareSheetOmitsEmptyActions)
local FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent = require(ShareSheet.ShareSheetConstants).FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent
local PeoplePickerModule = require(ShareSheet.Components.PeoplePicker)
local ShareSheetActionRowModule = require(script.Parent.ShareSheetActionRow)
local ShareSheetSocialRowModule = require(script.Parent.ShareSheetSocialRow)
local ShareSendRowModule = require(script.Parent.ShareSendRow)
local _ = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Recipients.RecipientSource)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)

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

return function(p1)
	-- upvalues: FFlagShareSheetOmitsEmptyActionsModule (copy), FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent (copy), ReactModule (copy), ShareSheetTelemetryModule (copy), Sheet (copy), FFlagShareSheetDesktopReadinessModule (copy), DialogSize (copy), PeoplePickerModule (copy), Text (copy), setPeoplePickerContentScrollingFrameRef (copy), setDefaultContentScrollingFrameRef (copy), View (copy), ShareSheetSocialRowModule (copy), Divider (copy), ShareSendRowModule (copy), ShareSheetActionRowModule (copy)
	local HasNextEntry: boolean = next(p1.selectedConversationIds) ~= nil or p1.isSending == true
	local PeoplePicker = p1.peoplePicker
	local IsPeoplePickerDisplayed = p1.isPeoplePickerDisplayed
	local HasNextEntry1 = if FFlagShareSheetOmitsEmptyActionsModule then HasNextEntry or not IsPeoplePickerDisplayed else nil
	local SnapPoints = nil
	local CenterSheetHeight: number? = nil
	
	if IsPeoplePickerDisplayed then
		local FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercentRatio = FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent / 10000
		SnapPoints = {
			FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercentRatio
		}
		CenterSheetHeight = FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercentRatio
	end
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		centerSheetHeight = CenterSheetHeight,
		isOpen = p1.isOpen,
		onClose = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), ShareSheetTelemetryModule (upval)
			p1.onCloseWithReason(ShareSheetTelemetryModule.CloseReason.UserDismissed)
		end, { p1.onCloseWithReason }),
		size = if FFlagShareSheetDesktopReadinessModule then DialogSize.Large else nil,
		snapPoints = SnapPoints
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = not IsPeoplePickerDisplayed }, if IsPeoplePickerDisplayed then {
			Picker = ReactModule.createElement(PeoplePickerModule.PeoplePickerHeader, PeoplePicker.headerProps)
		} else {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.shareLabel
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, {
			scrollingFrameRef = if IsPeoplePickerDisplayed then setPeoplePickerContentScrollingFrameRef else setDefaultContentScrollingFrameRef,
			isContentFullBleed = not IsPeoplePickerDisplayed
		}, {
			ContentLayout = ReactModule.createElement(View, {
				tag = {
					["col size-full"] = IsPeoplePickerDisplayed,
					["col size-full-0 auto-y"] = not IsPeoplePickerDisplayed,
					["gap-xlarge"] = not IsPeoplePickerDisplayed
				}
			}, if IsPeoplePickerDisplayed then {
				PeoplePicker = ReactModule.createElement(PeoplePickerModule.PeoplePickerList, PeoplePicker.listProps)
			} else {
				SocialRow = if p1.shouldShowSocialRow then ReactModule.createElement(ShareSheetSocialRowModule, {
					LayoutOrder = 1,
					socialRowRecipients = p1.socialRowRecipients,
					isLoading = p1.isSocialRowLoading,
					onConversationActivated = p1.onConversationActivated,
					onMoreActivated = p1.onMoreActivated,
					selectedConversationIds = p1.selectedConversationIds
				}) else nil,
				RowDivider = if p1.shouldShowSocialRow then ReactModule.createElement(Divider, { LayoutOrder = 2, testId = "share-sheet-row-divider" }) else nil
			})
		}),
		Actions = if FFlagShareSheetOmitsEmptyActionsModule and not HasNextEntry1 then nil else ReactModule.createElement(Sheet.Actions, nil, {
			Footer = if HasNextEntry then ReactModule.createElement(ShareSendRowModule, {
				isLoading = p1.isSending,
				label = p1.sendLabel,
				messagePlaceholder = p1.messagePlaceholder,
				onActivated = p1.onSendActivated,
				onFocusGained = p1.onComposerFocused
			}) elseif IsPeoplePickerDisplayed then nil else ReactModule.createElement(ShareSheetActionRowModule, {
				canShare = p1.canShareLink,
				context = p1.context,
				recipientSource = p1.recipientSource,
				telemetryId = p1.telemetryId,
				url = p1.url
			})
		})
	})
end