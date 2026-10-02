local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local expressionEntryButtonViewModule = require(script.Parent.ExpressionEntryButtonView)
local expressionFlyOutViewModule = require(script.Parent.ExpressionFlyOutView)
local expressionTrayFocusRootModule = require(script.Parent.ExpressionTrayFocusRoot)
local expressionTabBarModule = require(script.Parent.ExpressionTabBar)
local expressionSheetViewModule = require(script.Parent.ExpressionSheetView)
local expressionPillViewModule = require(script.Parent.ExpressionPillView)
local expressionKey = require(script.Parent.expressionKey).expressionKey
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local _ = require(chatUIPrimitives.Hooks.useLayoutMode)
local createNextOrder = require(parent.ReactUtils).createNextOrder

local function _(p1)
	return if p1.kind == "plain-text" then p1.text elseif p1.kind == "preset" then p1.text or "" elseif p1.kind == "emoji" then p1.unicode or (p1.name or (p1.altText or "")) else p1.altText or ""
end

local function buildEntryButton(p1, p2)
	-- upvalues: reactModule (ref), expressionEntryButtonViewModule (ref), foundationModule (ref)
	return reactModule.createElement(expressionEntryButtonViewModule, {
		onActivated = p1.onEntryActivated,
		isActive = p1.isOpen,
		size = foundationModule.Enums.InputSize.Medium,
		buttonRef = p2
	})
end

local function buildContent(p1, p2)
	-- upvalues: createNextOrder (ref), expressionKey (ref), reactModule (ref), expressionPillViewModule (ref), foundationModule (ref), expressionTabBarModule (ref)
	local v
	local var1 = nil
	
	for i, v in p1.categoryGroups do
		if v.categoryGroupId == p1.activeGroupId then
			var1 = v
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
	local var2 = createNextOrder()
	local t_1 = {}
	local var3 = false
	
	if var1 then
		for i_2, v_2 in var1.categories do
			local t_2 = {}
			
			for i_3, v_3 in v_2.items do
				local content = v_3.content
				local var4 = if p1.cooldownKeyForContent ~= nil then content.kind else p1.cooldownKeyForContent(content)
				local var5 = if var4 == nil or p1.cooldownEndsAtByKey == nil then nil else p1.cooldownEndsAtByKey[var4]
				local var6 = p2 ~= nil and not var3
				
				if var6 then
					var3 = true
				end
				local var7 = expressionKey(content)
				local createElement = reactModule.createElement
				local var8 = expressionPillViewModule
				local t_3 = {}
				local var9 = if content.kind == "plain-text" then content.text else content.kind ~= "preset" and ((if content.kind ~= "preset" then content.text else nil) or "")
				t_3.text = var9
				t_3.content = content
				t_3.layoutOrder = i_3
				t_3.cooldownDurationSeconds = p1.cooldownDurationSeconds
				t_3.cooldownEndsAt = var5
				t_3.onActivated = p1.onExpressionActivated
				t_3.buttonRef = if var6 then p2 else nil
				t_2[var7] = createElement(var8, t_3)
			end
			local var10 = createNextOrder()
			t_1["Category_" .. v_2.categoryId] = reactModule.createElement(foundationModule.View, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = var2()
			}, {
				Header = reactModule.createElement(foundationModule.Text, {
					tag = "size-full-0 auto-y text-label-medium text-align-x-left content-default",
					LayoutOrder = var10(),
					Text = v_2.name or v_2.categoryId
				}),
				Messages = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y",
					LayoutOrder = var10(),
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
			LayoutOrder = var2(),
			Text = p1.footerText,
			selection = if p1.focusNavEnabled == true then { Selectable = true } else nil
		})
	end
	v = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, { tag = "col size-full" }, {
		Header = reactModule.createElement(expressionTabBarModule, {
			LayoutOrder = v(),
			tabs = t,
			activeTabId = p1.activeGroupId,
			onTabActivated = p1.onGroupActivated,
			onKeyboardActivated = p1.onKeyboardActivated,
			showKeyboardButton = p1.layoutMode == "Tray" and p1.canLocalUserChat,
			focusNavEnabled = p1.focusNavEnabled == true
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
end

local function buildFlyOut(p3, p4)
	-- upvalues: reactModule (ref), expressionFlyOutViewModule (ref), expressionEntryButtonViewModule (ref), foundationModule (ref), buildContent (ref)
	return reactModule.createElement(expressionFlyOutViewModule, {
		isOpen = p3.isOpen,
		focusNavEnabled = p3.focusNavEnabled,
		onPressedOutside = p3.onPressedOutside,
		anchorContent = reactModule.createElement(expressionEntryButtonViewModule, {
			onActivated = p3.onEntryActivated,
			isActive = p3.isOpen,
			size = foundationModule.Enums.InputSize.Medium,
			buttonRef = if p4 then p4.entryButtonRef else nil
		}),
		content = buildContent(p3, if p4 then p4.defaultFocusRef else nil),
		contentRef = if p4 then p4.containerRef else nil
	})
end

return reactModule.memo(function(p3)
	-- upvalues: buildEntryButton (ref), reactModule (ref), expressionSheetViewModule (ref), buildContent (ref), expressionTrayFocusRootModule (ref), buildFlyOut (ref)
	if not p3.isVisible then
		return nil
	end
	local layoutMode = p3.layoutMode or "FlyOut"
	local variant = p3.variant or "entry"
	
	return if variant == "overlay" and layoutMode ~= "Tray" then nil elseif variant == "entry" and layoutMode == "Tray" then buildEntryButton(p3, nil) elseif variant == "overlay" then reactModule.createElement(expressionSheetViewModule, {
		isOpen = p3.isOpen,
		onPressedOutside = p3.onPressedOutside,
		content = buildContent(p3, nil)
	}) elseif p3.focusNavEnabled == true then reactModule.createElement(expressionTrayFocusRootModule, {
		isOpen = p3.isOpen,
		render = function(p4)
			-- upvalues: buildFlyOut (copy), p3 (ref)
			return buildFlyOut(p3, p4)
		end
	}) else buildFlyOut(p3, nil)
end)