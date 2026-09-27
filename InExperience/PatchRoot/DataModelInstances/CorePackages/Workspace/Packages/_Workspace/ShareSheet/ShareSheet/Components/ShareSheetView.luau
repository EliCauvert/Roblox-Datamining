local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local divider = foundationModule.Divider
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useOverlay = foundationModule.Hooks.useOverlay
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local fFlagShareSheetFixPeoplePickerCenterSheetOverflowModule = require(shareSheet.Flags.FFlagShareSheetFixPeoplePickerCenterSheetOverflow)
local fFlagShareSheetPeoplePickerEnabledModule = require(shareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local fIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent = require(shareSheet.ShareSheetConstants).FIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent
local var1 = fFlagShareSheetFixPeoplePickerCenterSheetOverflowModule and not require(shareSheet.Flags.FFlagShareSheetUseFoundationCenterSheetHeightFix)
local getCenterSheetHeightModule = require(script.Parent.getCenterSheetHeight)
local peoplePickerModule = require(shareSheet.Components.PeoplePicker)
local shareSheetActionRowModule = require(script.Parent.ShareSheetActionRow)
local shareSheetSocialRowModule = require(script.Parent.ShareSheetSocialRow)
local shareSendRowModule = require(script.Parent.ShareSendRow)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)

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
	local var2 = useOverlay()
	local var3, var4 = reactModule.useState(Vector2.zero)
	local var5 = if var2 then var2.AbsoluteSize else var3
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		if var2 == nil then
			return
		end
		local var6 = var2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: var2 (copy), var4 (copy)
			local absoluteSize = var2.AbsoluteSize
			var4(function(p1)
				-- upvalues: absoluteSize (ref)
				return if p1 == absoluteSize then p1 else absoluteSize
			end)
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, { var2 })
	
	return var5
end

return function(p1)
	-- upvalues: var1 (ref), useTokens (ref), useOverlaySize (ref), useScaledValue (ref), fFlagShareSheetPeoplePickerEnabledModule (ref), fIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent (ref), getCenterSheetHeightModule (ref), reactModule (ref), shareSheetTelemetryModule (ref), sheet (ref), peoplePickerModule (ref), text (ref), setPeoplePickerContentScrollingFrameRef (ref), setDefaultContentScrollingFrameRef (ref), view (ref), shareSheetSocialRowModule (ref), divider (ref), shareSendRowModule (ref), shareSheetActionRowModule (ref)
	local var2 = nil
	local var3 = nil
	local var4 = nil
	
	if var1 then
		var2 = useTokens()
		var3 = useOverlaySize()
		var4 = useScaledValue(600)
	end
	local var5 = next(p1.selectedConversationIds) ~= nil or p1.isSending == true
	local peoplePicker = nil
	local var6 = false
	local list = nil
	local var7 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		peoplePicker = p1.peoplePicker
		var6 = p1.isPeoplePickerDisplayed == true
		
		if var6 then
			local var8 = fIntShareSheetPeoplePickerEnabledSnapPointHundredthsPercent / 10000
			list = { var8 }
			var7 = if var1 then getCenterSheetHeightModule(var3.Y, var2.Margin.Medium * 2, var4, var8) else var8
		end
	end
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		centerSheetHeight = if fFlagShareSheetPeoplePickerEnabledModule then var7 else nil,
		isOpen = p1.isOpen,
		onClose = reactModule.useCallback(function()
			-- upvalues: p1 (ref), shareSheetTelemetryModule (copy)
			p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.UserDismissed)
		end, { p1.onCloseWithReason }),
		snapPoints = if fFlagShareSheetPeoplePickerEnabledModule then list else nil
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagShareSheetPeoplePickerEnabledModule then not var6 else true
		}, if fFlagShareSheetPeoplePickerEnabledModule and var6 then {
			Picker = reactModule.createElement(peoplePickerModule.PeoplePickerHeader, peoplePicker.headerProps)
		} else {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.shareLabel
			})
		}),
		Content = reactModule.createElement(sheet.Content, {
			scrollingFrameRef = if fFlagShareSheetPeoplePickerEnabledModule and var6 then setPeoplePickerContentScrollingFrameRef else setDefaultContentScrollingFrameRef,
			isContentFullBleed = if fFlagShareSheetPeoplePickerEnabledModule then not var6 else true
		}, {
			ContentLayout = reactModule.createElement(view, {
				tag = {
					["col size-full"] = fFlagShareSheetPeoplePickerEnabledModule and var6,
					["col size-full-0 auto-y"] = not (fFlagShareSheetPeoplePickerEnabledModule and var6),
					["gap-xlarge"] = if fFlagShareSheetPeoplePickerEnabledModule then not var6 else true
				}
			}, if fFlagShareSheetPeoplePickerEnabledModule and var6 then {
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
				ActionsRow = if fFlagShareSheetPeoplePickerEnabledModule then nil elseif var5 then reactModule.createElement(shareSendRowModule, {
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
			Footer = if var5 then reactModule.createElement(shareSendRowModule, {
				hasHorizontalPadding = false,
				shouldFillButton = false,
				isLoading = p1.isSending,
				label = p1.sendLabel,
				messagePlaceholder = p1.messagePlaceholder,
				onActivated = p1.onSendActivated,
				onFocusGained = p1.onComposerFocused
			}) elseif not var6 then reactModule.createElement(shareSheetActionRowModule, {
				hasHorizontalPadding = false,
				canShare = p1.canShareLink,
				context = p1.context,
				telemetryId = p1.telemetryId,
				url = p1.url
			}) else nil
		}) else nil
	})
end