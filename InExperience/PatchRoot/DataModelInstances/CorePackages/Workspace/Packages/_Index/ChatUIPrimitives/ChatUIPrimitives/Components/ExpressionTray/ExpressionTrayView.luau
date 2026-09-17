local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local expressionEntryButtonViewModule = require(script.Parent.ExpressionEntryButtonView)
local expressionFlyOutViewModule = require(script.Parent.ExpressionFlyOutView)
local expressionTabBarModule = require(script.Parent.ExpressionTabBar)
local expressionSheetViewModule = require(script.Parent.ExpressionSheetView)
local expressionPillViewModule = require(script.Parent.ExpressionPillView)
local firstItemKeyOfModule = require(script.Parent.firstItemKeyOf)
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local _ = require(chatUIPrimitives.Hooks.useLayoutMode)
local useExpressionTrayFocusNavigationModule = require(chatUIPrimitives.Hooks.useExpressionTrayFocusNavigation)
local createNextOrder = require(parent.ReactUtils).createNextOrder
local expressionKey = firstItemKeyOfModule.expressionKey
local firstItemKeyOf = firstItemKeyOfModule.firstItemKeyOf

local function _(p1)
	return if p1.kind == "plain-text" then p1.text elseif p1.kind == "preset" then p1.text or "" elseif p1.kind == "emoji" then p1.unicode or (p1.name or (p1.altText or "")) else p1.altText or ""
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), firstItemKeyOf (ref), useExpressionTrayFocusNavigationModule (ref), expressionEntryButtonViewModule (ref), foundationModule (ref), createNextOrder (ref), expressionKey (ref), expressionPillViewModule (ref), expressionTabBarModule (ref), expressionSheetViewModule (ref), expressionFlyOutViewModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	useExpressionTrayFocusNavigationModule({
		enabled = p1.focusNavEnabled == true,
		isOpen = p1.isOpen,
		firstItemRef = var3,
		firstTabRef = var4,
		triggerRef = var1,
		currentItemKey = if p1.focusNavEnabled == true then firstItemKeyOf(p1.categoryGroups, p1.activeGroupId) else nil
	})
	
	if not p1.isVisible then
		return nil
	end
	local layoutMode = p1.layoutMode or "FlyOut"
	local variant = p1.variant or "entry"
	
	if variant == "overlay" and layoutMode ~= "Tray" then
		return nil
	end
	local var5 = reactModule.createElement(expressionEntryButtonViewModule, {
		onActivated = p1.onEntryActivated,
		isActive = p1.isOpen,
		size = foundationModule.Enums.InputSize.Medium,
		buttonRef = var1
	})
	
	if variant == "entry" and layoutMode == "Tray" then
		return var5
	end
	local v
	local var6 = nil
	
	for i, v in p1.categoryGroups do
		if v.categoryGroupId == p1.activeGroupId then
			var6 = v
			break
		end
	end
	local t = {}
	
	for v, v_1 in p1.categoryGroups do
		table.insert(t, {
			id = v_1.categoryGroupId,
			text = v_1.name or v_1.categoryGroupId
		})
	end
	local var7 = createNextOrder()
	local t_1 = {}
	local var8 = false
	
	if var6 then
		for i_2, v_2 in var6.categories do
			local t_2 = {}
			
			for i_3, v_3 in v_2.items do
				local content = v_3.content
				local var9 = if p1.cooldownKeyForContent ~= nil then content.kind else p1.cooldownKeyForContent(content)
				local var10 = if var9 == nil or p1.cooldownEndsAtByKey == nil then nil else p1.cooldownEndsAtByKey[var9]
				local var11 = p1.focusNavEnabled == true and not var8
				
				if var11 then
					var8 = true
				end
				local var12 = expressionKey(content)
				local createElement = reactModule.createElement
				local var13 = expressionPillViewModule
				local t_3 = {}
				local var14 = if content.kind == "plain-text" then content.text else content.kind ~= "preset" and ((if content.kind ~= "preset" then content.text else nil) or "")
				t_3.text = var14
				t_3.content = content
				t_3.layoutOrder = i_3
				t_3.cooldownDurationSeconds = p1.cooldownDurationSeconds
				t_3.cooldownEndsAt = var10
				t_3.onActivated = p1.onExpressionActivated
				t_3.buttonRef = if var11 then var3 else nil
				t_2[var12] = createElement(var13, t_3)
			end
			local var15 = createNextOrder()
			t_1["Category_" .. v_2.categoryId] = reactModule.createElement(foundationModule.View, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = var7()
			}, {
				Header = reactModule.createElement(foundationModule.Text, {
					tag = "size-full-0 auto-y text-label-medium text-align-x-left content-default",
					LayoutOrder = var15(),
					Text = v_2.name or v_2.categoryId
				}),
				Messages = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y",
					LayoutOrder = var15(),
					layout = {
						Wraps = true,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 8)
					}
				}, t_2)
			})
		end
	end
	if p1.footerText then
		t_1.Footer = reactModule.createElement(foundationModule.Text, {
			TextWrapped = true,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-muted",
			LayoutOrder = var7(),
			Text = p1.footerText
		})
	end
	v = createNextOrder()
	local var16 = reactModule.createElement(foundationModule.View, { tag = "col size-full" }, {
		Header = reactModule.createElement(expressionTabBarModule, {
			LayoutOrder = v(),
			tabs = t,
			activeTabId = p1.activeGroupId,
			onTabActivated = p1.onGroupActivated,
			onKeyboardActivated = p1.onKeyboardActivated,
			showKeyboardButton = p1.layoutMode == "Tray" and p1.canLocalUserChat,
			focusNavEnabled = p1.focusNavEnabled == true,
			firstTabRef = var4
		}),
		Divider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = v() }),
		Scroll = reactModule.createElement(foundationModule.ScrollView, {
			tag = "grow size-full-0",
			LayoutOrder = v(),
			scroll = {
				scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.Always,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0)
			},
			selection = if p1.focusNavEnabled then { Selectable = false } else nil
		}, {
			Categories = reactModule.createElement(foundationModule.View, { tag = "col gap-large size-full-0 auto-y padding-large" }, t_1)
		})
	})
	
	return if variant == "overlay" then reactModule.createElement(expressionSheetViewModule, {
		isOpen = p1.isOpen,
		onPressedOutside = p1.onPressedOutside,
		content = var16
	}) else reactModule.createElement(expressionFlyOutViewModule, {
		isOpen = p1.isOpen,
		onPressedOutside = p1.onPressedOutside,
		anchorContent = var5,
		content = var16,
		contentRef = var2
	})
end)