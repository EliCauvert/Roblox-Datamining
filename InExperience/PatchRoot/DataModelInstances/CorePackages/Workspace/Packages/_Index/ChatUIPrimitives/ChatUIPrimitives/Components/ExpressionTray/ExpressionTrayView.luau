local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ExpressionEntryButtonViewModule = require(script.Parent.ExpressionEntryButtonView)
local ExpressionFlyOutViewModule = require(script.Parent.ExpressionFlyOutView)
local ExpressionTrayFocusRootModule = require(script.Parent.ExpressionTrayFocusRoot)
local ExpressionTabBarModule = require(script.Parent.ExpressionTabBar)
local ExpressionSheetViewModule = require(script.Parent.ExpressionSheetView)
local ExpressionPillViewModule = require(script.Parent.ExpressionPillView)
local ExpressionKeyFunction = require(script.Parent.expressionKey).expressionKey
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local _ = require(ChatUIPrimitives.Hooks.useLayoutMode)
local GetDefaultCooldownKeyModule = require(ChatUIPrimitives.getDefaultCooldownKey)
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder

local function _(p1)
	return if p1.kind == "plain-text" then p1.text else (if p1.kind == "preset" then p1.text else p1.kind == "emoji" and (p1.unicode or p1.name) or p1.altText) or ""
end

local function buildEntryButton(p1, ButtonRef)
	-- upvalues: ReactModule (copy), ExpressionEntryButtonViewModule (copy), FoundationModule (copy)
	return ReactModule.createElement(ExpressionEntryButtonViewModule, {
		onActivated = p1.onEntryActivated,
		isActive = p1.isOpen,
		size = FoundationModule.Enums.InputSize.Medium,
		buttonRef = ButtonRef
	})
end

local function buildContent(p1, DefaultFocusRef)
	-- upvalues: CreateNextOrderFunction (copy), GetDefaultCooldownKeyModule (copy), ExpressionKeyFunction (copy), ReactModule (copy), ExpressionPillViewModule (copy), FoundationModule (copy), ExpressionTabBarModule (copy)
	local v1 = nil
	
	for _, categoryGroup in p1.categoryGroups do
		if categoryGroup.categoryGroupId == p1.activeGroupId then
			v1 = categoryGroup
			break
		end
	end
	local Tabs = {}
	
	for _, categoryGroup1 in p1.categoryGroups do
		table.insert(Tabs, {
			id = categoryGroup1.categoryGroupId,
			text = categoryGroup1.name or categoryGroup1.categoryGroupId
		})
	end
	local NextOrder = CreateNextOrderFunction()
	local Elements = {}
	local Flag = false
	
	if v1 then
		for _, category in v1.categories do
			local Elements1 = {}
			
			for LayoutOrder, item in category.items do
				local Content = item.content
				local DefaultCooldownKeyModule = GetDefaultCooldownKeyModule(Content)
				local CooldownEndsAtByKeyEntry = if DefaultCooldownKeyModule == nil or p1.cooldownEndsAtByKey == nil then nil else p1.cooldownEndsAtByKey[DefaultCooldownKeyModule]
				local NoFlag: boolean = DefaultFocusRef ~= nil and not Flag
				
				if NoFlag then
					Flag = true
				end
				Elements1[ExpressionKeyFunction(Content)] = ReactModule.createElement(ExpressionPillViewModule, {
					text = if Content.kind == "plain-text" then Content.text else (if Content.kind == "preset" then Content.text else Content.kind == "emoji" and (Content.unicode or Content.name) or Content.altText) or "",
					content = Content,
					layoutOrder = LayoutOrder,
					cooldownDurationSeconds = p1.cooldownDurationSeconds,
					cooldownEndsAt = CooldownEndsAtByKeyEntry,
					onActivated = p1.onExpressionActivated,
					buttonRef = if NoFlag then DefaultFocusRef else nil
				})
			end
			local NextOrder1 = CreateNextOrderFunction()
			Elements["Category_" .. category.categoryId] = ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = NextOrder()
			}, {
				Header = ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full-0 auto-y text-label-medium text-align-x-left content-default",
					LayoutOrder = NextOrder1(),
					Text = category.name or category.categoryId
				}),
				Messages = ReactModule.createElement(FoundationModule.View, {
					tag = "size-full-0 auto-y",
					LayoutOrder = NextOrder1(),
					layout = {
						Wraps = true,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 8)
					}
				}, Elements1)
			})
		end
	end
	if p1.footerText then
		Elements.Footer = ReactModule.createElement(FoundationModule.Text, {
			TextWrapped = true,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted",
			LayoutOrder = NextOrder(),
			Text = p1.footerText,
			selection = if p1.focusNavEnabled == true then { Selectable = true } else nil
		})
	end
	local NextOrder2 = CreateNextOrderFunction()
	
	return ReactModule.createElement(FoundationModule.View, { tag = "col size-full" }, {
		Header = ReactModule.createElement(ExpressionTabBarModule, {
			LayoutOrder = NextOrder2(),
			tabs = Tabs,
			activeTabId = p1.activeGroupId,
			onTabActivated = p1.onGroupActivated,
			onKeyboardActivated = p1.onKeyboardActivated,
			showKeyboardButton = p1.layoutMode == "Tray" and p1.canLocalUserChat,
			focusNavEnabled = p1.focusNavEnabled == true
		}),
		Divider = ReactModule.createElement(FoundationModule.Divider, { LayoutOrder = NextOrder2() }),
		Scroll = ReactModule.createElement(FoundationModule.ScrollView, {
			tag = "grow size-full-0",
			LayoutOrder = NextOrder2(),
			scroll = {
				scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.Always,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0)
			},
			selection = if p1.focusNavEnabled then { Selectable = false } else nil
		}, {
			Categories = ReactModule.createElement(FoundationModule.View, { tag = "col gap-large size-full-0 auto-y padding-large" }, Elements)
		})
	})
end

local function buildFlyOut(p2, p3)
	-- upvalues: ReactModule (copy), ExpressionFlyOutViewModule (copy), ExpressionEntryButtonViewModule (copy), FoundationModule (copy), buildContent (copy)
	return ReactModule.createElement(ExpressionFlyOutViewModule, {
		isOpen = p2.isOpen,
		focusNavEnabled = p2.focusNavEnabled,
		onPressedOutside = p2.onPressedOutside,
		anchorContent = ReactModule.createElement(ExpressionEntryButtonViewModule, {
			onActivated = p2.onEntryActivated,
			isActive = p2.isOpen,
			size = FoundationModule.Enums.InputSize.Medium,
			buttonRef = if p3 then p3.entryButtonRef else nil
		}),
		content = buildContent(p2, if p3 then p3.defaultFocusRef else nil),
		contentRef = if p3 then p3.containerRef else nil
	})
end

return ReactModule.memo(function(p2)
	-- upvalues: buildEntryButton (copy), ReactModule (copy), ExpressionSheetViewModule (copy), buildContent (copy), ExpressionTrayFocusRootModule (copy), buildFlyOut (copy)
	if p2.isVisible then
		local LayoutMode = p2.layoutMode or "FlyOut"
		local Variant = p2.variant or "entry"
		
		return if Variant == "overlay" and LayoutMode ~= "Tray" then nil elseif Variant == "entry" and LayoutMode == "Tray" then buildEntryButton(p2, nil) elseif Variant == "overlay" then ReactModule.createElement(ExpressionSheetViewModule, {
			isOpen = p2.isOpen,
			onPressedOutside = p2.onPressedOutside,
			content = buildContent(p2, nil)
		}) elseif p2.focusNavEnabled == true then ReactModule.createElement(ExpressionTrayFocusRootModule, {
			isOpen = p2.isOpen,
			render = function(p3)
				-- upvalues: buildFlyOut (upval), p2 (copy)
				return buildFlyOut(p2, p3)
			end
		}) else buildFlyOut(p2, nil)
	else
		return nil
	end
end)