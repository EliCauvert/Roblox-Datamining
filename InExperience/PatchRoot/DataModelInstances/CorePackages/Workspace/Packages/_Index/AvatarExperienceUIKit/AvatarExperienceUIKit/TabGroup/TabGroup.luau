local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local useAnimatedBinding = require(parent.ReactOtter).useAnimatedBinding
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local scrollingFrameWithIndicatorsModule = require(avatarExperienceUIKit.ScrollingFrameWithIndicators.ScrollingFrameWithIndicators)
local makeOtterSpringValueModule = require(avatarExperienceUIKit.Utils.makeOtterSpringValue)
local tabGroupTabModule = require(script.Parent.TabGroupTab)
local t = {
	FillDirection = Enum.FillDirection.Horizontal,
	SortOrder = Enum.SortOrder.LayoutOrder,
	HorizontalFlex = Enum.UIFlexAlignment.None
}
local t_1 = { Transparency = 1 }
local t_2 = { dampingRatio = 1, frequency = 5 }

local function getActiveTabPosition(p0) --[[ line: 59 ]]
	return UDim2.new(0, p0, 1, 0)
end

local function getActiveTabSize(value) --[[ line: 63 ]]
	return UDim2.new(0, value, 0, 3)
end

return reactModule.forwardRef(function(p1, p2) --[[ line: 67 | named "TabGroup" ]]
	-- upvalues: useTokens (ref), useAnimatedBinding (ref), reactModule (ref), makeOtterSpringValueModule (ref), t_2 (ref), tabGroupTabModule (ref), getActiveTabPosition (ref), getActiveTabSize (ref), scrollingFrameWithIndicatorsModule (ref), view (ref), t_1 (ref), t (ref)
	local var11 = useTokens()
	local var12, var13 = useAnimatedBinding(0)
	local var14, var15 = useAnimatedBinding(0)
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useCallback(function() --[[ line: 78 ]]
		-- upvalues: var18 (ref), var16 (ref), var17 (ref)
		local current = var18.current
		local current_1 = var16.current
		local current_2 = var17.current
		
		if not current or not current_1 or not current_2 then return end
		local scrollingFrame = current.getScrollingFrame()
		
		if not scrollingFrame then return end
		local x = scrollingFrame.AbsoluteSize.X
		
		if x <= 0 then return end
		local x_1 = scrollingFrame.CanvasPosition.X
		local var24 = current_2.AbsolutePosition.X - current_1.AbsolutePosition.X
		local var25 = var24 + current_2.AbsoluteSize.X
		
		if var24 < x_1 then
			current.scrollToOffset(var24)
			
			return
		elseif x_1 + x < var25 then
			current.scrollToOffset(var25 - x)
		end
	end, {})
	local var20 = reactModule.useCallback(function(p3) --[[ line: 107 ]]
		-- upvalues: var16 (ref), var17 (ref), p1 (ref), var13 (ref), makeOtterSpringValueModule (copy), t_2 (copy), var15 (ref), var19 (ref)
		local current = var16.current
		var17.current = p3
		
		for i, v in p1.items do
			if v.id == p1.activeTabId and v.ref then
				v.ref.current = p3
			end
		end
		if p3 and current then
			var13(makeOtterSpringValueModule(p3.AbsolutePosition.X - current.AbsolutePosition.X, t_2))
			var15(makeOtterSpringValueModule(p3.AbsoluteSize.X, t_2))
			var19()
		end
	end, { p1.activeTabId, p1.items, var19 })
	reactModule.useEffect(function() --[[ line: 130 ]]
		-- upvalues: var16 (ref), var17 (ref), var13 (ref), makeOtterSpringValueModule (copy), t_2 (copy), var15 (ref), var19 (ref)
		local current = var16.current
		local current_1 = var17.current
		
		if current_1 and current then
			var13(makeOtterSpringValueModule(current_1.AbsolutePosition.X - current.AbsolutePosition.X, t_2))
			var15(makeOtterSpringValueModule(current_1.AbsoluteSize.X, t_2))
			var19()
		end
	end, { var19 })
	local t_3 = {}
	
	for i, v in p1.items do
		local var22 = p1.activeTabId == v.id
		t_3[v.id] = reactModule.createElement(tabGroupTabModule, {
			ref = if var22 then var20 else v.ref,
			text = v.text,
			onActivated = if p1.onTabActivated then function() --[[ line: 152 ]]
				-- upvalues: p1 (ref), v (ref)
				p1.onTabActivated(v.id)
			end else nil,
			isActive = var22,
			fontStyle = p1.tabFontStyle,
			padding = p1.tabPadding,
			textStyle = p1.tabTextStyle,
			activeTextStyle = p1.tabActiveTextStyle,
			LayoutOrder = i
		})
	end
	return reactModule.createElement(scrollingFrameWithIndicatorsModule, {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = p1.BackgroundTransparency,
		BackgroundColor3 = p1.BackgroundColor3,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		ZIndex = p1.ZIndex,
		ref = p2,
		controllerRef = var18
	}, {
		InnerNavigation = reactModule.createElement(view, {
			ClipsDescendants = false,
			ZIndex = -1,
			ref = var16,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = t_1,
			layout = t
		}, t_3),
		ActiveTabIndicator = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = reactModule.useMemo(function() --[[ line: 165 ]]
				-- upvalues: var12 (ref), getActiveTabPosition (copy)
				return var12:map(getActiveTabPosition)
			end, {}),
			Size = reactModule.useMemo(function() --[[ line: 169 ]]
				-- upvalues: var14 (ref), getActiveTabSize (copy)
				return var14:map(getActiveTabSize)
			end, {}),
			BackgroundColor3 = var11.Color.Content.Emphasis.Color3,
			AnchorPoint = Vector2.new(0, 1)
		})
	})
end)