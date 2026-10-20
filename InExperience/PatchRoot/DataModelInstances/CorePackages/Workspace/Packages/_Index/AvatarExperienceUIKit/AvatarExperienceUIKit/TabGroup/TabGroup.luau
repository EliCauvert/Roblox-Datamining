local GamepadService = game:GetService("GamepadService")
local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local ScrollingFrameWithIndicatorsModule = require(AvatarExperienceUIKit.ScrollingFrameWithIndicators.ScrollingFrameWithIndicators)
local MakeOtterSpringValueModule = require(AvatarExperienceUIKit.Utils.makeOtterSpringValue)
local GetCenterScrollOffsetModule = require(AvatarExperienceUIKit.Utils.getCenterScrollOffset)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCategoryMenuVisualFixes = AvatarExperienceFlagsModule.FFlagAXCategoryMenuVisualFixes
local FFlagAXScrollHighlightedTabIntoView = AvatarExperienceFlagsModule.FFlagAXScrollHighlightedTabIntoView
local BackgroundStyle = { Transparency = 1 }
local TabGroupTabModule = require(script.Parent.TabGroupTab)
local Layout = {
	FillDirection = Enum.FillDirection.Horizontal,
	SortOrder = Enum.SortOrder.LayoutOrder,
	HorizontalFlex = Enum.UIFlexAlignment.None
}
local BackgroundStyle1 = { Transparency = 1 }
local config = { dampingRatio = 1, frequency = 5 }

local function getActiveTabPosition(XOffset): UDim2
	return UDim2.new(0, XOffset, 1, 0)
end

local function getActiveTabSize(XOffset): UDim2
	return UDim2.new(0, XOffset, 0, 3)
end

return ReactModule.forwardRef(function(Frame: Frame, Ref)
	-- upvalues: UseTokensFunction (copy), UseAnimatedBindingFunction (copy), ReactModule (copy), FFlagAXCategoryMenuVisualFixes (copy), MakeOtterSpringValueModule (copy), config (copy), ReactOtterModule (copy), FFlagAXScrollHighlightedTabIntoView (copy), GetCenterScrollOffsetModule (copy), GamepadService (copy), TabGroupTabModule (copy), getActiveTabPosition (copy), getActiveTabSize (copy), View (copy), BackgroundStyle1 (copy), Layout (copy), ScrollingFrameWithIndicatorsModule (copy), BackgroundStyle (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p1, p2, p3)
		-- upvalues: FFlagAXCategoryMenuVisualFixes (upval), UseAnimatedBindingResult1 (copy), UseAnimatedBindingResult2 (copy), MakeOtterSpringValueModule (upval), config (upval), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
		if not p3 and (not FFlagAXCategoryMenuVisualFixes or UseAnimatedBindingResult1:getValue() > 0) then
			UseAnimatedBindingResult2(MakeOtterSpringValueModule(p1, config))
			UseAnimatedBindingResult2_1(MakeOtterSpringValueModule(p2, config))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.instant(p1))
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(p2))
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult2.current
		local Current1 = UseRefResult.current
		local Current2 = UseRefResult1.current
		
		if not Current or not Current1 or not Current2 then return end
		local ScrollingFrame = Current.getScrollingFrame()
		
		if not ScrollingFrame then return end
		local X: number = ScrollingFrame.AbsoluteSize.X
		
		if X <= 0 then return end
		local X1: number = ScrollingFrame.CanvasPosition.X
		local XDelta = Current2.AbsolutePosition.X - Current1.AbsolutePosition.X
		local NewXDelta = XDelta + Current2.AbsoluteSize.X
		
		if XDelta < X1 then
			Current.scrollToOffset(XDelta)
			
			return
		end
		if X1 + X < NewXDelta then
			Current.scrollToOffset(NewXDelta - X)
		end
	end, {})
	local UseResult2 = if FFlagAXScrollHighlightedTabIntoView then ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseRefResult2 (copy), GetCenterScrollOffsetModule (upval)
		local Current = UseRefResult2.current
		
		if not Current then return end
		local ScrollingFrame = Current.getScrollingFrame()
		
		if not ScrollingFrame then return end
		if not Frame or not Frame:IsDescendantOf(game) or not Frame:IsDescendantOf(ScrollingFrame) then return end
		local X = ScrollingFrame.CanvasPosition.X
		local CenterScrollOffsetModule = GetCenterScrollOffsetModule(Frame.AbsolutePosition.X - ScrollingFrame.AbsolutePosition.X + X, Frame.AbsoluteSize.X, X, ScrollingFrame.AbsoluteWindowSize.X)
		
		if CenterScrollOffsetModule ~= nil then
			Current.scrollToOffset(CenterScrollOffsetModule)
			
			return
		end
	end, {}) else nil
	local UseResult3 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), Frame (copy), UseResult (copy), FFlagAXScrollHighlightedTabIntoView (upval), UseResult2 (ref), UseResult1 (copy)
		local Current1 = UseRefResult.current
		UseRefResult1.current = Current
		
		for _, item in Frame.items do
			if item.id == Frame.activeTabId and item.ref then
				item.ref.current = Current
			end
		end
		if Current and Current1 then
			UseResult(Current.AbsolutePosition.X - Current1.AbsolutePosition.X, Current.AbsoluteSize.X)
			
			if FFlagAXScrollHighlightedTabIntoView and UseResult2 then
				UseResult2(Current)
				
				return
			end
			UseResult1()
		end
	end, {
		Frame.activeTabId,
		Frame.items,
		UseResult1,
		UseResult2,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseResult (copy), FFlagAXCategoryMenuVisualFixes (upval), FFlagAXScrollHighlightedTabIntoView (upval), UseResult2 (ref), UseResult1 (copy)
		local Current = UseRefResult.current
		local Current1 = UseRefResult1.current
		
		if Current1 and Current then
			UseResult(Current1.AbsolutePosition.X - Current.AbsolutePosition.X, Current1.AbsoluteSize.X, FFlagAXCategoryMenuVisualFixes)
			
			if FFlagAXScrollHighlightedTabIntoView and UseResult2 then
				UseResult2(Current1)
				
				return
			end
			UseResult1()
		end
	end, { UseResult1, UseResult2, UseResult })
	
	if FFlagAXScrollHighlightedTabIntoView then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult2 (copy), GamepadService (upval), UseResult2 (ref)
			local Current = UseRefResult2.current
			
			if not Current then return end
			local ScrollingFrame = Current.getScrollingFrame()
			
			if not ScrollingFrame then return end
			local SelectionChangedConnection = ScrollingFrame.SelectionChanged:Connect(function(_, _, p1)
				-- upvalues: GamepadService (upval), UseResult2 (upval)
				if GamepadService.GamepadCursorEnabled then return end
				if UseResult2 then
					UseResult2(p1)
				end
			end)
			
			return function()
				-- upvalues: SelectionChangedConnection (copy)
				SelectionChangedConnection:Disconnect()
			end
		end, {})
	end
	if FFlagAXCategoryMenuVisualFixes then
		ReactModule.useEffect(function()
			-- upvalues: Frame (copy), UseRefResult1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2_1 (copy)
			local Flag = false
			
			if Frame.activeTabId ~= nil then
				for _, item in Frame.items do
					if item.id == Frame.activeTabId then
						Flag = true
						break
					end
				end
			end
			if not Flag then
				UseRefResult1.current = nil
				UseAnimatedBindingResult2(ReactOtterModule.instant(0))
				UseAnimatedBindingResult2_1(ReactOtterModule.instant(0))
			end
		end, { Frame.activeTabId, Frame.items })
		ReactModule.useImperativeHandle(Frame.controllerRef, function()
			-- upvalues: UseRefResult2 (copy)
			return {
				scrollToOffset = function(XDelta)
					-- upvalues: UseRefResult2 (upval)
					local Current = UseRefResult2.current
					
					if Current then
						Current.scrollToOffset(XDelta)
					end
				end,
				setOffset = function(p1)
					-- upvalues: UseRefResult2 (upval)
					local Current = UseRefResult2.current
					
					if Current then
						Current.setOffset(p1)
					end
				end,
				getScrollingFrame = function()
					-- upvalues: UseRefResult2 (upval)
					local Current = UseRefResult2.current
					
					return if Current then Current.getScrollingFrame() else nil
				end
			}
		end, {})
	end
	local Elements = {}
	
	for LayoutOrder, item in Frame.items do
		local IsActiveTabIdMatch = Frame.activeTabId == item.id
		Elements[item.id] = ReactModule.createElement(TabGroupTabModule, {
			ref = if IsActiveTabIdMatch then UseResult3 else item.ref,
			text = item.text,
			onActivated = if Frame.onTabActivated then function()
				-- upvalues: Frame (copy), item (copy)
				Frame.onTabActivated(item.id)
			end else nil,
			isActive = IsActiveTabIdMatch,
			fontStyle = Frame.tabFontStyle,
			padding = Frame.tabPadding,
			textStyle = Frame.tabTextStyle,
			activeTextStyle = Frame.tabActiveTextStyle,
			LayoutOrder = LayoutOrder
		})
	end
	local Element = ReactModule.createElement(View, {
		ZIndex = -1,
		ref = UseRefResult,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		backgroundStyle = BackgroundStyle1,
		layout = Layout
	}, Elements)
	local Frame1 = ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = ReactModule.useMemo(function()
			-- upvalues: UseAnimatedBindingResult (copy), getActiveTabPosition (upval)
			return UseAnimatedBindingResult:map(getActiveTabPosition)
		end, {}),
		Size = ReactModule.useMemo(function()
			-- upvalues: UseAnimatedBindingResult1 (copy), getActiveTabSize (upval)
			return UseAnimatedBindingResult1:map(getActiveTabSize)
		end, {}),
		BackgroundColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
		AnchorPoint = Vector2.new(0, 1)
	})
	
	return ReactModule.createElement(ScrollingFrameWithIndicatorsModule, {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = Frame.BackgroundTransparency,
		BackgroundColor3 = Frame.BackgroundColor3,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		ZIndex = Frame.ZIndex,
		ref = Ref,
		controllerRef = UseRefResult2
	}, if FFlagAXCategoryMenuVisualFixes then {
		Content = ReactModule.createElement(View, {
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = BackgroundStyle
		}, { InnerNavigation = Element, ActiveTabIndicator = Frame1 })
	} else { InnerNavigation = Element, ActiveTabIndicator = Frame1 })
end)