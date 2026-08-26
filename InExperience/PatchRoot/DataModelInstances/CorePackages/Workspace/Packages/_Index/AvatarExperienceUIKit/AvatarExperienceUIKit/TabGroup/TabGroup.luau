local gamepadService = game:GetService("GamepadService")
local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local scrollingFrameWithIndicatorsModule = require(avatarExperienceUIKit.ScrollingFrameWithIndicators.ScrollingFrameWithIndicators)
local makeOtterSpringValueModule = require(avatarExperienceUIKit.Utils.makeOtterSpringValue)
local getCenterScrollOffsetModule = require(avatarExperienceUIKit.Utils.getCenterScrollOffset)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCategoryMenuVisualFixes = avatarExperienceFlagsModule.FFlagAXCategoryMenuVisualFixes
local fFlagAXScrollHighlightedTabIntoView = avatarExperienceFlagsModule.FFlagAXScrollHighlightedTabIntoView
local t = { Transparency = 1 }
local tabGroupTabModule = require(script.Parent.TabGroupTab)
local t_1 = {
	FillDirection = Enum.FillDirection.Horizontal,
	SortOrder = Enum.SortOrder.LayoutOrder,
	HorizontalFlex = Enum.UIFlexAlignment.None
}
local t_2 = { Transparency = 1 }
local t_3 = { dampingRatio = 1, frequency = 5 }

local function getActiveTabPosition(p1)
	return UDim2.new(0, p1, 1, 0)
end

local function getActiveTabSize(value)
	return UDim2.new(0, value, 0, 3)
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useAnimatedBinding (ref), reactModule (ref), fFlagAXCategoryMenuVisualFixes (ref), makeOtterSpringValueModule (ref), t_3 (ref), reactOtterModule (ref), fFlagAXScrollHighlightedTabIntoView (ref), getCenterScrollOffsetModule (ref), gamepadService (ref), tabGroupTabModule (ref), getActiveTabPosition (ref), getActiveTabSize (ref), view (ref), t_2 (ref), t_1 (ref), scrollingFrameWithIndicatorsModule (ref), t (ref)
	local var1 = useTokens()
	local var2, var3 = useAnimatedBinding(0)
	local var4, var5 = useAnimatedBinding(0)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: fFlagAXCategoryMenuVisualFixes (copy), var4 (ref), var3 (ref), makeOtterSpringValueModule (copy), t_3 (copy), var5 (ref), reactOtterModule (copy)
		if not p5 and (not fFlagAXCategoryMenuVisualFixes or var4:getValue() > 0) then
			var3(makeOtterSpringValueModule(p3, t_3))
			var5(makeOtterSpringValueModule(p4, t_3))
			
			return
		end
		var3(reactOtterModule.instant(p3))
		var5(reactOtterModule.instant(p4))
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var6 (ref), var7 (ref)
		local current = var8.current
		local current_1 = var6.current
		local current_2 = var7.current
		
		if not current or not current_1 or not current_2 then return end
		local scrollingFrame = current.getScrollingFrame()
		
		if not scrollingFrame then return end
		local x = scrollingFrame.AbsoluteSize.X
		
		if x <= 0 then return end
		local x_1 = scrollingFrame.CanvasPosition.X
		local var11 = current_2.AbsolutePosition.X - current_1.AbsolutePosition.X
		local var12 = var11 + current_2.AbsoluteSize.X
		
		if var11 < x_1 then
			current.scrollToOffset(var11)
			
			return
		elseif x_1 + x < var12 then
			current.scrollToOffset(var12 - x)
		end
	end, {})
	local var11 = if fFlagAXScrollHighlightedTabIntoView then reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), getCenterScrollOffsetModule (copy)
		local current = var8.current
		
		if not current then return end
		local scrollingFrame = current.getScrollingFrame()
		
		if not scrollingFrame then return end
		if not p3 or not p3:IsDescendantOf(game) or not p3:IsDescendantOf(scrollingFrame) then return end
		local x = scrollingFrame.CanvasPosition.X
		local var12 = getCenterScrollOffsetModule(p3.AbsolutePosition.X - scrollingFrame.AbsolutePosition.X + x, p3.AbsoluteSize.X, x, scrollingFrame.AbsoluteWindowSize.X)
		
		if var12 == nil then
			return
		end
		current.scrollToOffset(var12)
	end, {}) else nil
	local var12 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), var7 (ref), p1 (ref), var9 (ref), fFlagAXScrollHighlightedTabIntoView (copy), var11 (write), var10 (ref)
		local current = var6.current
		var7.current = p3
		
		for i, v in p1.items do
			if v.id == p1.activeTabId and v.ref then
				v.ref.current = p3
			end
		end
		if p3 and current then
			var9(p3.AbsolutePosition.X - current.AbsolutePosition.X, p3.AbsoluteSize.X)
			
			if fFlagAXScrollHighlightedTabIntoView and var11 then
				var11(p3)
				
				return
			end
			var10()
		end
	end, {
		p1.activeTabId,
		p1.items,
		var10,
		var11,
		var9
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var7 (ref), var9 (ref), fFlagAXCategoryMenuVisualFixes (copy), fFlagAXScrollHighlightedTabIntoView (copy), var11 (write), var10 (ref)
		local current = var6.current
		local current_1 = var7.current
		
		if current_1 and current then
			var9(current_1.AbsolutePosition.X - current.AbsolutePosition.X, current_1.AbsoluteSize.X, fFlagAXCategoryMenuVisualFixes)
			
			if fFlagAXScrollHighlightedTabIntoView and var11 then
				var11(current_1)
				
				return
			end
			var10()
		end
	end, { var10, var11, var9 })
	
	if fFlagAXScrollHighlightedTabIntoView then
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), gamepadService (copy), var11 (write)
			local current = var8.current
			
			if not current then return end
			local scrollingFrame = current.getScrollingFrame()
			
			if scrollingFrame then
				local selectionChangedConnection = scrollingFrame.SelectionChanged:Connect(function(_, _, p4)
					-- upvalues: gamepadService (copy), var11 (copy)
					if gamepadService.GamepadCursorEnabled then return end
					if var11 then
						var11(p4)
					end
				end)
				
				return function()
					-- upvalues: selectionChangedConnection (ref)
					selectionChangedConnection:Disconnect()
				end
			end
		end, {})
	end
	if fFlagAXCategoryMenuVisualFixes then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var7 (ref), var3 (ref), reactOtterModule (copy), var5 (ref)
			local var13 = false
			
			if p1.activeTabId ~= nil then
				for i, v in p1.items do
					if v.id == p1.activeTabId then
						var13 = true
						break
					end
				end
			end
			if not var13 then
				var7.current = nil
				var3(reactOtterModule.instant(0))
				var5(reactOtterModule.instant(0))
			end
		end, { p1.activeTabId, p1.items })
		reactModule.useImperativeHandle(p1.controllerRef, function()
			-- upvalues: var8 (ref)
			return {
				scrollToOffset = function(value)
					-- upvalues: var8 (copy)
					local current = var8.current
					
					if current then
						current.scrollToOffset(value)
					end
				end,
				setOffset = function(value)
					-- upvalues: var8 (copy)
					local current = var8.current
					
					if current then
						current.setOffset(value)
					end
				end,
				getScrollingFrame = function()
					-- upvalues: var8 (copy)
					local current = var8.current
					
					return if current then current.getScrollingFrame() else nil
				end
			}
		end, {})
	end
	local t_4 = {}
	
	for i, v in p1.items do
		local var13 = p1.activeTabId == v.id
		t_4[v.id] = reactModule.createElement(tabGroupTabModule, {
			ref = if var13 then var12 else v.ref,
			text = v.text,
			onActivated = if p1.onTabActivated then function()
				-- upvalues: p1 (ref), v (ref)
				p1.onTabActivated(v.id)
			end else nil,
			isActive = var13,
			fontStyle = p1.tabFontStyle,
			padding = p1.tabPadding,
			textStyle = p1.tabTextStyle,
			activeTextStyle = p1.tabActiveTextStyle,
			LayoutOrder = i
		})
	end
	local var14 = reactModule.createElement(view, {
		ZIndex = -1,
		ref = var6,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		backgroundStyle = t_2,
		layout = t_1
	}, t_4)
	local frame = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = reactModule.useMemo(function()
			-- upvalues: var2 (ref), getActiveTabPosition (copy)
			return var2:map(getActiveTabPosition)
		end, {}),
		Size = reactModule.useMemo(function()
			-- upvalues: var4 (ref), getActiveTabSize (copy)
			return var4:map(getActiveTabSize)
		end, {}),
		BackgroundColor3 = var1.Color.Content.Emphasis.Color3,
		AnchorPoint = Vector2.new(0, 1)
	})
	
	return reactModule.createElement(scrollingFrameWithIndicatorsModule, {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = p1.BackgroundTransparency,
		BackgroundColor3 = p1.BackgroundColor3,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		ZIndex = p1.ZIndex,
		ref = p2,
		controllerRef = var8
	}, if fFlagAXCategoryMenuVisualFixes then {
		Content = reactModule.createElement(view, {
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = t
		}, { InnerNavigation = var14, ActiveTabIndicator = frame })
	} else { InnerNavigation = var14, ActiveTabIndicator = frame })
end)