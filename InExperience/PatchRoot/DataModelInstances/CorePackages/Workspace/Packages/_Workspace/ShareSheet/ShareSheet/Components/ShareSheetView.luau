local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialogSize = foundationModule.Enums.DialogSize
local divider = foundationModule.Divider
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useOverlay = foundationModule.Hooks.useOverlay
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local fFlagShareSheetDesktopReadinessModule = require(shareSheet.Flags.FFlagShareSheetDesktopReadiness)
local fFlagShareSheetPeoplePickerEnabledModule = require(shareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local fFlagShareSheetUseFoundationCenterSheetHeightFixModule = require(shareSheet.Flags.FFlagShareSheetUseFoundationCenterSheetHeightFix)
local fIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent = require(shareSheet.ShareSheetConstants).FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent
local getCenterSheetHeightModule = require(script.Parent.getCenterSheetHeight)
local peoplePickerModule = require(shareSheet.Components.PeoplePicker)
local shareSheetActionRowModule = require(script.Parent.ShareSheetActionRow)
local shareSheetSocialRowModule = require(script.Parent.ShareSheetSocialRow)
local shareSendRowModule = require(script.Parent.ShareSendRow)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local _ = require(shareSheet.Types)

local function setDefaultContentScrollingFrameRef(value)
	if value then
		value.AutomaticSize = Enum.AutomaticSize.Y
		value.ScrollBarThickness = 0
	end
end

local function setPeoplePickerContentScrollingFrameRef(value)
	if value then
		value.AutomaticSize = Enum.AutomaticSize.None
		value.ScrollBarThickness = 0
	end
end

local function useOverlaySize()
	-- upvalues: useOverlay (ref), reactModule (ref)
	local var1 = useOverlay()
	local var2, var3 = reactModule.useState(Vector2.zero)
	local var4 = if var1 then var1.AbsoluteSize else var2
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1 == nil then
			return
		end
		local var5 = var1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: var1 (copy), var3 (copy)
			local absoluteSize = var1.AbsoluteSize
			var3(function(p1)
				-- upvalues: absoluteSize (ref)
				return if p1 == absoluteSize then p1 else absoluteSize
			end)
		end)
		
		return function()
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, { var1 })
	
	return var4
end

return function(p1)
	-- upvalues: fFlagShareSheetUseFoundationCenterSheetHeightFixModule (ref), useTokens (ref), useOverlaySize (ref), useScaledValue (ref), fFlagShareSheetPeoplePickerEnabledModule (ref), fIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent (ref), getCenterSheetHeightModule (ref), reactModule (ref), shareSheetTelemetryModule (ref), sheet (ref), fFlagShareSheetDesktopReadinessModule (ref), dialogSize (ref), peoplePickerModule (ref), text (ref), setPeoplePickerContentScrollingFrameRef (ref), setDefaultContentScrollingFrameRef (ref), view (ref), shareSheetSocialRowModule (ref), divider (ref), shareSendRowModule (ref), shareSheetActionRowModule (ref)
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	if not fFlagShareSheetUseFoundationCenterSheetHeightFixModule then
		var1 = useTokens()
		var2 = useOverlaySize()
		var3 = useScaledValue(600)
	end
	local var4 = next(p1.selectedConversationIds) ~= nil or p1.isSending == true
	local peoplePicker = nil
	local var5 = false
	local list = nil
	local var6 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		peoplePicker = p1.peoplePicker
		var5 = p1.isPeoplePickerDisplayed == true
		
		if var5 then
			local var7 = fIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent / 10000
			list = { var7 }
			var6 = if not fFlagShareSheetUseFoundationCenterSheetHeightFixModule then getCenterSheetHeightModule(var2.Y, var1.Margin.Medium * 2, var3, var7) else var7
		end
	end
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		centerSheetHeight = if fFlagShareSheetPeoplePickerEnabledModule then var6 else nil,
		isOpen = p1.isOpen,
		onClose = reactModule.useCallback(function()
			-- upvalues: p1 (ref), shareSheetTelemetryModule (copy)
			p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.UserDismissed)
		end, { p1.onCloseWithReason }),
		size = if fFlagShareSheetDesktopReadinessModule then dialogSize.Large else nil,
		snapPoints = if fFlagShareSheetPeoplePickerEnabledModule then list else nil
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagShareSheetPeoplePickerEnabledModule then not var5 else true
		}, if fFlagShareSheetPeoplePickerEnabledModule and var5 then {
			Picker = reactModule.createElement(peoplePickerModule.PeoplePickerHeader, peoplePicker.headerProps)
		} else {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.shareLabel
			})
		}),
		Content = reactModule.createElement(sheet.Content, {
			scrollingFrameRef = if fFlagShareSheetPeoplePickerEnabledModule and var5 then setPeoplePickerContentScrollingFrameRef else setDefaultContentScrollingFrameRef,
			isContentFullBleed = if fFlagShareSheetPeoplePickerEnabledModule then not var5 else true
		}, {
			ContentLayout = reactModule.createElement(view, {
				tag = {
					["col size-full"] = fFlagShareSheetPeoplePickerEnabledModule and var5,
					["col size-full-0 auto-y"] = not (fFlagShareSheetPeoplePickerEnabledModule and var5),
					["gap-xlarge"] = if fFlagShareSheetPeoplePickerEnabledModule then not var5 else true
				}
			}, if fFlagShareSheetPeoplePickerEnabledModule and var5 then {
				PeoplePicker = reactModule.createElement(peoplePickerModule.PeoplePickerList, peoplePicker.listProps)
			} else {
				SocialRow = if p1.shouldShowSocialRow then reactModule.createElement(shareSheetSocialRowModule, {
					LayoutOrder = 1,
					conversationEligibility = p1.conversationEligibility,
					isLoading = p1.isSocialRowLoading,
					onConversationActivated = p1.onConversationActivated,
					onMoreActivated = if fFlagShareSheetPeoplePickerEnabledModule then p1.onMoreActivated else nil,
					selectedConversationIds = p1.selectedConversationIds
				}) else nil,
				RowDivider = if p1.shouldShowSocialRow then reactModule.createElement(divider, { LayoutOrder = 2, testId = "share-sheet-row-divider" }) else nil,
				ActionsRow = if fFlagShareSheetPeoplePickerEnabledModule then nil elseif var4 then reactModule.createElement(shareSendRowModule, {
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
		Actions = if fFlagShareSheetPeoplePickerEnabledModule then reactModule.createElement(sheet.Actions, nil, {
			Footer = if var4 then reactModule.createElement(shareSendRowModule, {
				hasHorizontalPadding = false,
				shouldFillButton = false,
				isLoading = p1.isSending,
				label = p1.sendLabel,
				messagePlaceholder = p1.messagePlaceholder,
				onActivated = p1.onSendActivated,
				onFocusGained = p1.onComposerFocused
			}) elseif not var5 then reactModule.createElement(shareSheetActionRowModule, {
				hasHorizontalPadding = false,
				canShare = p1.canShareLink,
				context = p1.context,
				telemetryId = p1.telemetryId,
				url = p1.url
			}) else nil
		}) else nil
	})
end