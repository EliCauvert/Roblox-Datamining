local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local chatLineReportingModule = require(parent.ChatLineReporting)
local chatLineReportRoot = chatLineReportingModule.ChatLineReportRoot
local constants = chatLineReportingModule.Constants
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local useReportMenuFocusNavigationModule = require(script.Parent.useReportMenuFocusNavigation)
local fFlagExpChatTextChannelWindowFocusNavModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFocusNav)
local t = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}
local view = foundationModule.View
local icon = foundationModule.Icon
local menu = foundationModule.Menu
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign

local function mapMessagesForReport(p1, p2)
	local list = table.create(#p1)
	
	for i, v in p1 do
		if v.messageType == "user" then
			table.insert(list, {
				userId = v.senderUserId,
				text = v.content,
				textChannel = p2,
				messageId = v.messageId,
				prefixText = v.prefixText
			})
		end
	end
	return list
end

local function TopBannerView(p3)
	-- upvalues: reactModule (ref), constants (ref), menu (ref), inputSize (ref), popoverSide (ref), popoverAlign (ref), t (ref), view (ref), icon (ref), iconName (ref), iconSize (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constants.TopBannerSize),
		ZIndex = p3.ZIndex
	}, {
		Menu = reactModule.createElement(menu, {
			isOpen = p3.isOpen,
			items = p3.items,
			size = inputSize.Medium,
			side = popoverSide.Right,
			align = popoverAlign.Start,
			onPressedOutside = p3.onPressedOutside,
			Position = UDim2.new(1, constants.IconButtonPositionXOffset, 0, 0),
			ref = if p3.focusNavEnabled then p3.menuContentRef else nil,
			selectionGroup = if p3.focusNavEnabled then t else nil
		}, {
			Button = reactModule.createElement(view, {
				tag = "align-x-center align-y-center radius-medium",
				Size = UDim2.fromOffset(constants.IconButtonSize, constants.IconButtonSize),
				onActivated = p3.onTriggerActivated,
				ref = if p3.focusNavEnabled then p3.triggerRef else nil
			}, {
				icon = reactModule.createElement(icon, {
					name = iconName.ThreeDotsHorizontal,
					size = iconSize.Large
				})
			})
		})
	})
end

local function TopBannerFocusNav(p3)
	-- upvalues: reactModule (ref), useReportMenuFocusNavigationModule (ref), TopBannerView (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local setIsOpen = p3.setIsOpen
	useReportMenuFocusNavigationModule({
		enabled = p3.focusNavEnabled == true,
		isOpen = p3.isOpen,
		menuContentRef = var1,
		triggerRef = var2,
		onClose = reactModule.useCallback(function()
			-- upvalues: setIsOpen (ref)
			setIsOpen(false)
		end, { setIsOpen })
	})
	local isOpen = p3.isOpen
	local onOpenChanged = p3.onOpenChanged
	reactModule.useEffect(function()
		-- upvalues: onOpenChanged (ref), isOpen (ref)
		if onOpenChanged then
			onOpenChanged(isOpen)
		end
	end, { isOpen, onOpenChanged })
	
	return reactModule.createElement(TopBannerView, {
		ZIndex = p3.ZIndex,
		isOpen = p3.isOpen,
		items = p3.items,
		onTriggerActivated = p3.onTriggerActivated,
		onPressedOutside = p3.onPressedOutside,
		focusNavEnabled = p3.focusNavEnabled,
		menuContentRef = var1,
		triggerRef = var2
	})
end

return reactModule.memo(function(p3)
	-- upvalues: useInExperienceLocalization (ref), reactModule (ref), useEventConnection (ref), guiService (ref), chatLineReportRoot (ref), mapMessagesForReport (ref), iconName (ref), fFlagExpChatTextChannelWindowFocusNavModule (ref), TopBannerFocusNav (ref), TopBannerView (ref)
	local var1 = useInExperienceLocalization()
	local var2, var3 = reactModule.useState(false)
	useEventConnection(guiService:GetPropertyChangedSignal("MenuIsOpen"), function()
		-- upvalues: guiService (copy), var3 (ref)
		if guiService.MenuIsOpen then
			var3(false)
		end
	end)
	local var4 = var1("Feature.ReportAbuse.Action.EnterChatLineReporting")
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref)
		var3(not var2)
	end, { var2 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	local var7 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), chatLineReportRoot (copy), mapMessagesForReport (copy), var3 (ref)
		chatLineReportRoot.initialize(mapMessagesForReport(if p3.messagesSignal then p3.messagesSignal(false) else {}, p3.targetChannel))
		var3(false)
	end, { p3.messagesSignal, p3.targetChannel })
	local var8 = reactModule.useMemo(function()
		-- upvalues: iconName (copy), var4 (ref), var7 (ref)
		return {
			{
				id = "report",
				icon = iconName.SpeechBubbleExclamation,
				text = var4,
				onActivated = var7
			}
		}
	end, { var4, var7 })
	
	return if fFlagExpChatTextChannelWindowFocusNavModule then reactModule.createElement(TopBannerFocusNav, {
		ZIndex = p3.ZIndex,
		isOpen = var2,
		setIsOpen = var3,
		items = var8,
		onTriggerActivated = var5,
		onPressedOutside = var6,
		focusNavEnabled = p3.focusNavEnabled,
		onOpenChanged = p3.onOpenChanged
	}) else reactModule.createElement(TopBannerView, {
		ZIndex = p3.ZIndex,
		isOpen = var2,
		items = var8,
		onTriggerActivated = var5,
		onPressedOutside = var6,
		focusNavEnabled = p3.focusNavEnabled
	})
end)