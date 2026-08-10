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

local function getActiveTabPosition(p0) --[[ line: 70 ]]
	return UDim2.new(0, p0, 1, 0)
end

local function getActiveTabSize(value) --[[ line: 74 ]]
	return UDim2.new(0, value, 0, 3)
end

return reactModule.forwardRef(function(p1, p2) --[[ line: 78 | named "TabGroup" ]]
	-- upvalues: useTokens (ref), useAnimatedBinding (ref), reactModule (ref), fFlagAXCategoryMenuVisualFixes (ref), makeOtterSpringValueModule (ref), t_3 (ref), reactOtterModule (ref), fFlagAXScrollHighlightedTabIntoView (ref), getCenterScrollOffsetModule (ref), gamepadService (ref), tabGroupTabModule (ref), getActiveTabPosition (ref), getActiveTabSize (ref), view (ref), t_2 (ref), t_1 (ref), scrollingFrameWithIndicatorsModule (ref), t (ref)
	local var16 = useTokens()
	local var17, var18 = useAnimatedBinding(0)
	local var19, var20 = useAnimatedBinding(0)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useCallback(function(p3, p4, p5) --[[ line: 87 ]]
		-- upvalues: fFlagAXCategoryMenuVisualFixes (copy), var19 (ref), var18 (ref), makeOtterSpringValueModule (copy), t_3 (copy), var20 (ref), reactOtterModule (copy)
		if not p5 and (not fFlagAXCategoryMenuVisualFixes or var19:getValue() > 0) then
			var18(makeOtterSpringValueModule(p3, t_3))
			var20(makeOtterSpringValueModule(p4, t_3))
			
			return
		end
		var18(reactOtterModule.instant(p3))
		var20(reactOtterModule.instant(p4))
	end, {})
	local var25 = reactModule.useCallback(function() --[[ line: 100 ]]
		-- upvalues: var23 (ref), var21 (ref), var22 (ref)
		local current = var23.current
		local current_1 = var21.current
		local current_2 = var22.current
		
		if not current or not current_1 or not current_2 then return end
		local scrollingFrame = current.getScrollingFrame()
		
		if not scrollingFrame then return end
		local x = scrollingFrame.AbsoluteSize.X
		
		if x <= 0 then return end
		local x_1 = scrollingFrame.CanvasPosition.X
		local var33 = current_2.AbsolutePosition.X - current_1.AbsolutePosition.X
		local var34 = var33 + current_2.AbsoluteSize.X
		
		if var33 < x_1 then
			current.scrollToOffset(var33)
			
			return
		elseif x_1 + x < var34 then
			current.scrollToOffset(var34 - x)
		end
	end, {})
	local var26 = if fFlagAXScrollHighlightedTabIntoView then reactModule.useCallback(function(p6) --[[ line: 137 ]]
		-- upvalues: var23 (ref), getCenterScrollOffsetModule (copy)
		local current = var23.current
		
		if not current then return end
		local scrollingFrame = current.getScrollingFrame()
		
		if not scrollingFrame then return end
		if not p6 or not p6:IsDescendantOf(game) or not p6:IsDescendantOf(scrollingFrame) then return end
		local x = scrollingFrame.CanvasPosition.X
		local var36 = getCenterScrollOffsetModule(p6.AbsolutePosition.X - scrollingFrame.AbsolutePosition.X + x, p6.AbsoluteSize.X, x, scrollingFrame.AbsoluteWindowSize.X)
		
		if var36 == nil then
			return
		end
		current.scrollToOffset(var36)
	end, {}) else nil
	local var27 = reactModule.useCallback(function(p7) --[[ line: 167 ]]
		-- upvalues: var21 (ref), var22 (ref), p1 (ref), var24 (ref), fFlagAXScrollHighlightedTabIntoView (copy), var26 (write), var25 (ref)
		local current = var21.current
		var22.current = p7
		
		for i, v in p1.items do
			if v.id == p1.activeTabId and v.ref then
				v.ref.current = p7
			end
		end
		if p7 and current then
			var24(p7.AbsolutePosition.X - current.AbsolutePosition.X, p7.AbsoluteSize.X)
			
			if fFlagAXScrollHighlightedTabIntoView and var26 then
				var26(p7)
				
				return
			end
			var25()
		end
	end, {
		p1.activeTabId,
		p1.items,
		var25,
		var26,
		var24
	})
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: var21 (ref), var22 (ref), var24 (ref), fFlagAXCategoryMenuVisualFixes (copy), fFlagAXScrollHighlightedTabIntoView (copy), var26 (write), var25 (ref)
		local current = var21.current
		local current_1 = var22.current
		
		if current_1 and current then
			var24(current_1.AbsolutePosition.X - current.AbsolutePosition.X, current_1.AbsoluteSize.X, fFlagAXCategoryMenuVisualFixes)
			
			if fFlagAXScrollHighlightedTabIntoView and var26 then
				var26(current_1)
				
				return
			end
			var25()
		end
	end, { var25, var26, var24 })
	
	if fFlagAXScrollHighlightedTabIntoView then
		reactModule.useEffect(function() --[[ line: 220 ]]
			-- upvalues: var23 (ref), gamepadService (copy), var26 (write)
			local current = var23.current
			
			if not current then return end
			local scrollingFrame = current.getScrollingFrame()
			
			if scrollingFrame then
				local selectionChangedConnection = scrollingFrame.SelectionChanged:Connect(function(_, _, p8) --[[ line: 232 ]]
					-- upvalues: gamepadService (copy), var26 (copy)
					if gamepadService.GamepadCursorEnabled then return end
					if var26 then
						var26(p8)
					end
				end)
				
				return function() --[[ line: 244 ]]
					-- upvalues: selectionChangedConnection (ref)
					selectionChangedConnection:Disconnect()
				end
			end
		end, {})
	end
	if fFlagAXCategoryMenuVisualFixes then
		reactModule.useEffect(function() --[[ line: 257 ]]
			-- upvalues: p1 (ref), var22 (ref), var18 (ref), reactOtterModule (copy), var20 (ref)
			local var39 = false
			
			if p1.activeTabId ~= nil then
				for i, v in p1.items do
					if v.id == p1.activeTabId then
						var39 = true
						break
					end
				end
			end
			if not var39 then
				var22.current = nil
				var18(reactOtterModule.instant(0))
				var20(reactOtterModule.instant(0))
			end
		end, { p1.activeTabId, p1.items })
		reactModule.useImperativeHandle(p1.controllerRef, function() --[[ line: 276 ]]
			-- upvalues: var23 (ref)
			return {
				scrollToOffset = function(value) --[[ line: 278 ]]
					-- upvalues: var23 (copy)
					local current = var23.current
					
					if current then
						current.scrollToOffset(value)
					end
				end,
				setOffset = function(value) --[[ line: 284 ]]
					-- upvalues: var23 (copy)
					local current = var23.current
					
					if current then
						current.setOffset(value)
					end
				end,
				getScrollingFrame = function() --[[ line: 290 ]]
					-- upvalues: var23 (copy)
					local current = var23.current
					
					return if current then current.getScrollingFrame() else nil
				end
			}
		end, {})
	end
	local t_4 = {}
	
	for i, v in p1.items do
		local var31 = p1.activeTabId == v.id
		t_4[v.id] = reactModule.createElement(tabGroupTabModule, {
			ref = if var31 then var27 else v.ref,
			text = v.text,
			onActivated = if p1.onTabActivated then function() --[[ line: 305 ]]
				-- upvalues: p1 (ref), v (ref)
				p1.onTabActivated(v.id)
			end else nil,
			isActive = var31,
			fontStyle = p1.tabFontStyle,
			padding = p1.tabPadding,
			textStyle = p1.tabTextStyle,
			activeTextStyle = p1.tabActiveTextStyle,
			LayoutOrder = i
		})
	end
	local var29 = reactModule.createElement(view, {
		ZIndex = -1,
		ref = var21,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		backgroundStyle = t_2,
		layout = t_1
	}, t_4)
	local frame = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = reactModule.useMemo(function() --[[ line: 318 ]]
			-- upvalues: var17 (ref), getActiveTabPosition (copy)
			return var17:map(getActiveTabPosition)
		end, {}),
		Size = reactModule.useMemo(function() --[[ line: 322 ]]
			-- upvalues: var19 (ref), getActiveTabSize (copy)
			return var19:map(getActiveTabSize)
		end, {}),
		BackgroundColor3 = var16.Color.Content.Emphasis.Color3,
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
		controllerRef = var23
	}, if fFlagAXCategoryMenuVisualFixes then {
		Content = reactModule.createElement(view, {
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = t
		}, { InnerNavigation = var29, ActiveTabIndicator = frame })
	} else { InnerNavigation = var29, ActiveTabIndicator = frame })
end)