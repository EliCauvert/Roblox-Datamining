local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local divider = foundationModule.Divider
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local fFlagSharePplPickerModule = require(shareSheet.Flags.FFlagSharePplPicker)
local fIntSharePplPickerSnapPointHundredthsPercent = require(shareSheet.ShareSheetConstants).FIntSharePplPickerSnapPointHundredthsPercent
local peoplePickerModule = require(shareSheet.Components.PeoplePicker)
local shareSheetActionRowModule = require(script.Parent.ShareSheetActionRow)
local shareSheetSocialRowModule = require(script.Parent.ShareSheetSocialRow)
local shareSendRowModule = require(script.Parent.ShareSendRow)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)

local function setContentScrollingFrameRef(value)
	if value then
		value.AutomaticSize = Enum.AutomaticSize.Y
		value.ScrollBarThickness = 0
	end
end

return function(p1)
	-- upvalues: fFlagSharePplPickerModule (ref), fIntSharePplPickerSnapPointHundredthsPercent (ref), reactModule (ref), shareSheetTelemetryModule (ref), sheet (ref), peoplePickerModule (ref), text (ref), setContentScrollingFrameRef (ref), view (ref), shareSheetSocialRowModule (ref), divider (ref), shareSendRowModule (ref), shareSheetActionRowModule (ref)
	local var1 = next(p1.selectedConversationIds) ~= nil or p1.isSending == true
	local peoplePicker = nil
	local var2 = nil
	local list = nil
	local var3 = nil
	local var4 = nil
	
	if fFlagSharePplPickerModule then
		peoplePicker = p1.peoplePicker
		var2 = p1.isPeoplePickerDisplayed == true
		
		if var2 then
			local var5 = fIntSharePplPickerSnapPointHundredthsPercent / 10000
			list = { var5 }
			var3 = var5
		end
		var4 = reactModule.useCallback(function(p2)
			-- upvalues: var2 (write)
			if p2 then
				p2.AutomaticSize = if var2 then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
				p2.ScrollBarThickness = 0
			end
		end, { var2 })
	end
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		centerSheetHeight = if fFlagSharePplPickerModule then var3 else nil,
		isOpen = p1.isOpen,
		onClose = reactModule.useCallback(function()
			-- upvalues: p1 (ref), shareSheetTelemetryModule (copy)
			p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.UserDismissed)
		end, { p1.onCloseWithReason }),
		snapPoints = if fFlagSharePplPickerModule then list else nil
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagSharePplPickerModule then not var2 else true
		}, if fFlagSharePplPickerModule and var2 then {
			Picker = reactModule.createElement(peoplePickerModule.PeoplePickerHeader, peoplePicker.headerProps)
		} else {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.shareLabel
			})
		}),
		Content = reactModule.createElement(sheet.Content, {
			scrollingFrameRef = if fFlagSharePplPickerModule then var4 else setContentScrollingFrameRef,
			isContentFullBleed = if fFlagSharePplPickerModule then not var2 else true
		}, {
			ContentLayout = reactModule.createElement(view, {
				tag = {
					["col size-full-0 auto-y"] = true,
					["gap-xlarge"] = if fFlagSharePplPickerModule then not var2 else true
				}
			}, if fFlagSharePplPickerModule and var2 then {
				PeoplePicker = reactModule.createElement(peoplePickerModule.PeoplePickerList, peoplePicker.listProps)
			} else {
				SocialRow = if p1.shouldShowSocialRow then reactModule.createElement(shareSheetSocialRowModule, {
					LayoutOrder = 1,
					conversationEligibility = p1.conversationEligibility,
					isLoading = p1.isSocialRowLoading,
					onConversationActivated = p1.onConversationActivated,
					onMoreActivated = if fFlagSharePplPickerModule then p1.onMoreActivated else nil,
					selectedConversationIds = p1.selectedConversationIds
				}) else nil,
				RowDivider = if p1.shouldShowSocialRow then reactModule.createElement(divider, { LayoutOrder = 2, testId = "share-sheet-row-divider" }) else nil,
				ActionsRow = if fFlagSharePplPickerModule then nil elseif var1 then reactModule.createElement(shareSendRowModule, {
					LayoutOrder = 3,
					isLoading = p1.isSending,
					label = p1.sendLabel,
					messagePlaceholder = p1.messagePlaceholder,
					onActivated = p1.onSendActivated,
					onFocusGained = p1.onComposerFocused
				}) else reactModule.createElement(shareSheetActionRowModule, {
					LayoutOrder = 3,
					canShare = p1.canShareLink,
					context = p1.context,
					telemetryId = p1.telemetryId,
					url = p1.url
				})
			})
		}),
		Actions = if fFlagSharePplPickerModule then reactModule.createElement(sheet.Actions, nil, {
			Footer = if var1 then reactModule.createElement(shareSendRowModule, {
				hasHorizontalPadding = false,
				shouldFillButton = false,
				isLoading = p1.isSending,
				label = p1.sendLabel,
				messagePlaceholder = p1.messagePlaceholder,
				onActivated = p1.onSendActivated,
				onFocusGained = p1.onComposerFocused
			}) elseif not var2 then reactModule.createElement(shareSheetActionRowModule, {
				hasHorizontalPadding = false,
				canShare = p1.canShareLink,
				context = p1.context,
				telemetryId = p1.telemetryId,
				url = p1.url
			}) else nil
		}) else nil
	})
end