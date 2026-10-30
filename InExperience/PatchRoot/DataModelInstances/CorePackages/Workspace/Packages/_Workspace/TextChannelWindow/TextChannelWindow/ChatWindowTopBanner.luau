local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.Signals)
local ChatLineReportingModule = require(Parent.ChatLineReporting)
local ChatLineReportRoot = ChatLineReportingModule.ChatLineReportRoot
local Constants = ChatLineReportingModule.Constants
local UseInExperienceLocalizationFunction = require(Parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local UseDismissOnEscapeOrMenuFunction = require(Parent.ChatUIPrimitives).Hooks.useDismissOnEscapeOrMenu
local ReportMenuFocusRootModule = require(script.Parent.ReportMenuFocusRoot)
local FFlagExpChatTextChannelWindowFocusNavModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFocusNav)
local config = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Menu = FoundationModule.Menu
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign

local function mapMessagesForReport(MessagesSignalResult, TextChannel)
	local Buffer = table.create(#MessagesSignalResult)
	
	for _, value in MessagesSignalResult do
		if value.messageType == "user" then
			table.insert(Buffer, {
				userId = value.senderUserId,
				text = value.content,
				textChannel = TextChannel,
				messageId = value.messageId,
				prefixText = value.prefixText
			})
		end
	end
	return Buffer
end

local function TopBannerView(p1)
	-- upvalues: UseDismissOnEscapeOrMenuFunction (copy), ReactModule (copy), Constants (copy), Menu (copy), InputSize (copy), PopoverSide (copy), PopoverAlign (copy), config (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy)
	UseDismissOnEscapeOrMenuFunction(p1.focusNavEnabled == true and p1.isOpen, p1.onPressedOutside)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Constants.TopBannerSize),
		ZIndex = p1.ZIndex
	}, {
		Menu = ReactModule.createElement(Menu, {
			isOpen = p1.isOpen,
			items = p1.items,
			size = InputSize.Medium,
			side = PopoverSide.Right,
			align = PopoverAlign.Start,
			onPressedOutside = p1.onPressedOutside,
			Position = UDim2.new(1, Constants.IconButtonPositionXOffset, 0, 0),
			ref = if p1.focusNavEnabled then p1.menuContentRef else nil,
			selectionGroup = if p1.focusNavEnabled then config else nil
		}, {
			Button = ReactModule.createElement(View, {
				tag = "align-x-center align-y-center radius-medium",
				Size = UDim2.fromOffset(Constants.IconButtonSize, Constants.IconButtonSize),
				onActivated = p1.onTriggerActivated,
				ref = if p1.focusNavEnabled then p1.triggerRef else nil
			}, {
				icon = ReactModule.createElement(Icon, {
					name = IconName.ThreeDotsHorizontal,
					size = IconSize.Large
				})
			})
		})
	})
end

local function TopBannerFocusNav(p1)
	-- upvalues: ReactModule (copy), TopBannerView (copy), ReportMenuFocusRootModule (copy)
	local IsOpen = p1.isOpen
	local OnOpenChangedFunction = p1.onOpenChanged
	ReactModule.useEffect(function()
		-- upvalues: OnOpenChangedFunction (copy), IsOpen (copy)
		if OnOpenChangedFunction then
			OnOpenChangedFunction(IsOpen)
		end
	end, { IsOpen, OnOpenChangedFunction })
	
	return ReactModule.createElement(ReportMenuFocusRootModule, {
		isOpen = p1.isOpen,
		render = ReactModule.useCallback(function(p2)
			-- upvalues: ReactModule (upval), TopBannerView (upval), p1 (copy)
			return ReactModule.createElement(TopBannerView, {
				ZIndex = p1.ZIndex,
				isOpen = p1.isOpen,
				items = p1.items,
				onTriggerActivated = p1.onTriggerActivated,
				onPressedOutside = p1.onPressedOutside,
				focusNavEnabled = p1.focusNavEnabled,
				menuContentRef = p2.containerRef,
				triggerRef = p2.triggerRef
			})
		end, {
			p1.ZIndex, p1.isOpen, p1.items, p1.onTriggerActivated, p1.onPressedOutside,
			p1.focusNavEnabled
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: UseInExperienceLocalizationFunction (copy), ReactModule (copy), UseEventConnectionFunction (copy), GuiService (copy), ChatLineReportRoot (copy), mapMessagesForReport (copy), IconName (copy), FFlagExpChatTextChannelWindowFocusNavModule (copy), TopBannerFocusNav (copy), TopBannerView (copy)
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	UseEventConnectionFunction(GuiService:GetPropertyChangedSignal("MenuIsOpen"), function()
		-- upvalues: GuiService (upval), UseStateResult2 (copy)
		if GuiService.MenuIsOpen then
			UseStateResult2(false)
		end
	end)
	local FeatureReportAbuseActionEnterChatLineReporting = UseInExperienceLocalizationResult("Feature.ReportAbuse.Action.EnterChatLineReporting")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
		UseStateResult2(not UseStateResult)
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ChatLineReportRoot (upval), mapMessagesForReport (upval), UseStateResult2 (copy)
		ChatLineReportRoot.initialize((mapMessagesForReport(if p1.messagesSignal then p1.messagesSignal(false) else {}, p1.targetChannel)))
		UseStateResult2(false)
	end, { p1.messagesSignal, p1.targetChannel })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IconName (upval), FeatureReportAbuseActionEnterChatLineReporting (copy), UseResult2 (copy)
		return {
			{
				id = "report",
				icon = IconName.SpeechBubbleExclamation,
				text = FeatureReportAbuseActionEnterChatLineReporting,
				onActivated = UseResult2
			}
		}
	end, {
		FeatureReportAbuseActionEnterChatLineReporting,
		UseResult2
	})
	
	return if FFlagExpChatTextChannelWindowFocusNavModule then ReactModule.createElement(TopBannerFocusNav, {
		ZIndex = p1.ZIndex,
		isOpen = UseStateResult,
		items = UseMemoResult,
		onTriggerActivated = UseResult,
		onPressedOutside = UseResult1,
		focusNavEnabled = p1.focusNavEnabled,
		onOpenChanged = p1.onOpenChanged
	}) else ReactModule.createElement(TopBannerView, {
		ZIndex = p1.ZIndex,
		isOpen = UseStateResult,
		items = UseMemoResult,
		onTriggerActivated = UseResult,
		onPressedOutside = UseResult1,
		focusNavEnabled = p1.focusNavEnabled
	})
end)