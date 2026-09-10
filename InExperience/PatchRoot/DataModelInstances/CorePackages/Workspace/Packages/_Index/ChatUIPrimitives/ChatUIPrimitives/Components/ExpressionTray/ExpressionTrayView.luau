local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local expressionEntryButtonViewModule = require(script.Parent.ExpressionEntryButtonView)
local expressionFlyOutViewModule = require(script.Parent.ExpressionFlyOutView)
local expressionTabBarModule = require(script.Parent.ExpressionTabBar)
local expressionSheetViewModule = require(script.Parent.ExpressionSheetView)
local expressionPillViewModule = require(script.Parent.ExpressionPillView)
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local _ = require(chatUIPrimitives.Hooks.useLayoutMode)
local createNextOrder = require(parent.ReactUtils).createNextOrder

local function _(p1)
	return if p1.kind == "plain-text" then p1.text elseif p1.kind == "preset" then p1.text or "" elseif p1.kind == "emoji" then p1.unicode or (p1.name or (p1.altText or "")) else p1.altText or ""
end

local _ = function(p1)
	return if p1.kind == "preset" then "preset:" .. p1.presetId elseif p1.kind == "emoji" then "emoji:" .. p1.emojiId elseif p1.kind == "asset" then "asset:" .. p1.assetId else "plain-text"
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), expressionEntryButtonViewModule (ref), foundationModule (ref), createNextOrder (ref), expressionPillViewModule (ref), expressionTabBarModule (ref), expressionSheetViewModule (ref), expressionFlyOutViewModule (ref)
	if not p1.isVisible then
		return nil
	end
	local layoutMode = p1.layoutMode or "FlyOut"
	local variant = p1.variant or "entry"
	
	if variant == "overlay" and layoutMode ~= "Tray" then
		return nil
	end
	local var1 = reactModule.createElement(expressionEntryButtonViewModule, {
		onActivated = p1.onEntryActivated,
		isActive = p1.isOpen,
		size = foundationModule.Enums.InputSize.Medium
	})
	
	if variant == "entry" and layoutMode == "Tray" then
		return var1
	end
	local v
	local var2 = nil
	
	for i, v in p1.categoryGroups do
		if v.categoryGroupId == p1.activeGroupId then
			var2 = v
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
	local var3 = createNextOrder()
	local t_1 = {}
	
	if var2 then
		for i_2, v_2 in var2.categories do
			local t_2 = {}
			
			for i_3, v_3 in v_2.items do
				local content = v_3.content
				local var4 = if p1.cooldownKeyForContent ~= nil then content.kind else p1.cooldownKeyForContent(content)
				local var5 = if var4 == nil or p1.cooldownEndsAtByKey == nil then nil else p1.cooldownEndsAtByKey[var4]
				local var6 = if content.kind == "preset" then "preset:" .. content.presetId elseif content.kind == "emoji" then "emoji:" .. content.emojiId elseif content.kind == "asset" then "asset:" .. content.assetId else "plain-text"
				local createElement = reactModule.createElement
				local var7 = expressionPillViewModule
				local t_3 = {}
				local var8 = if content.kind == "plain-text" then content.text else content.kind ~= "preset" and ((if content.kind ~= "preset" then content.text else nil) or "")
			end
			local var9 = createNextOrder()
			t_1["Category_" .. v_2.categoryId] = reactModule.createElement(foundationModule.View, {
				tag = "col gap-small size-full-0 auto-y",
				LayoutOrder = var3()
			}, {
				Header = reactModule.createElement(foundationModule.Text, {
					tag = "size-full-0 auto-y text-label-medium text-align-x-left content-default",
					LayoutOrder = var9(),
					Text = v_2.name or v_2.categoryId
				}),
				Messages = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y",
					LayoutOrder = var9(),
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
			LayoutOrder = var3(),
			Text = p1.footerText
		})
	end
	local var10 = createNextOrder()
	v = reactModule.createElement(foundationModule.View, { tag = "col size-full" }, {
		Header = reactModule.createElement(expressionTabBarModule, {
			LayoutOrder = var10(),
			tabs = t,
			activeTabId = p1.activeGroupId,
			onTabActivated = p1.onGroupActivated,
			onKeyboardActivated = p1.onKeyboardActivated,
			showKeyboardButton = p1.layoutMode == "Tray" and p1.canLocalUserChat
		}),
		Divider = reactModule.createElement(foundationModule.Divider, { LayoutOrder = var10() }),
		Scroll = reactModule.createElement(foundationModule.ScrollView, {
			tag = "grow size-full-0",
			LayoutOrder = var10(),
			scroll = {
				scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility.Always,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0)
			}
		}, {
			Categories = reactModule.createElement(foundationModule.View, { tag = "col gap-large size-full-0 auto-y padding-large" }, t_1)
		})
	})
	
	return if variant == "overlay" then reactModule.createElement(expressionSheetViewModule, {
		isOpen = p1.isOpen,
		onPressedOutside = p1.onPressedOutside,
		content = v
	}) else reactModule.createElement(expressionFlyOutViewModule, {
		isOpen = p1.isOpen,
		onPressedOutside = p1.onPressedOutside,
		anchorContent = var1,
		content = v
	})
end)