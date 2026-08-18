local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagAXVirtualizedFeedVerticalPadding = require(parent.SharedFlags).FFlagAXVirtualizedFeedVerticalPadding
local fFlagAXSduiFeedBackToTopAndNavClearance = require(parent.AvatarExperienceFlags).FFlagAXSduiFeedBackToTopAndNavClearance
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local view = foundationModule.View
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local flatList = require(parent.VirtualizedList).FlatList
local isFeedContentScrollableModule = require(script.Parent.isFeedContentScrollable)
local fFlagVirtualizedFeedFooterWrapperProp = require(parent.SharedFlags).FFlagVirtualizedFeedFooterWrapperProp
local t = { BackgroundTransparency = 1, BorderSizePixel = 0 }
local t_1 = {
	Selectable = false,
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	BorderSizePixel = 0,
	ClipsDescendants = false,
	ElasticBehavior = Enum.ElasticBehavior.Always,
	AutomaticCanvasSize = Enum.AutomaticSize.Y
}
local t_2 = { backToTop = "Feature.GamePage.Action.BackToTop" }

local function _(p0) --[[ line: 51 | named "getNativeScrollingFrameRef" ]]
	if p0.current ~= nil then
		local nativeScrollRef = p0.current:getNativeScrollRef()
		
		return if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
	end
end

local function VirtualizedFeedBackToTopButton(p1) --[[ line: 66 ]]
	-- upvalues: useLocalization (ref), t_2 (ref), reactModule (ref), button (ref), buttonVariant (ref)
	return reactModule.createElement(button, {
		text = p1.text or useLocalization(t_2).backToTop,
		variant = buttonVariant.Link,
		onActivated = p1.onActivated
	})
end

local var8 = if fFlagAXSduiFeedBackToTopAndNavClearance then "row align-x-center align-y-center size-full-0 auto-y padding-xlarge" else "row align-y-center align-x-center padding-xlarge"

local function VirtualizedFeedFooterLayout(p2) --[[ line: 84 ]]
	-- upvalues: reactModule (ref), view (ref), var8 (ref)
	return reactModule.createElement(view, { tag = var8 }, p2.children)
end

local _ = function(p3) --[[ line: 137 | named "createFooterComponent" ]]
	-- upvalues: reactModule (ref), VirtualizedFeedFooterLayout (ref)
	return if p3.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, p3.footerContent) else p3.footerContent
end

return reactModule.forwardRef(function(p4, p5) --[[ line: 146 | named "VirtualizedFeed" ]]
	-- upvalues: fFlagAXVirtualizedFeedVerticalPadding (ref), fFlagVirtualizedFeedFooterWrapperProp (ref), reactModule (ref), fFlagAXSduiFeedBackToTopAndNavClearance (ref), userGameSettingsService (ref), isFeedContentScrollableModule (ref), VirtualizedFeedBackToTopButton (ref), loading (ref), iconSize (ref), view (ref), VirtualizedFeedFooterLayout (ref), flatList (ref), t (ref), t_1 (ref)
	local var13
	local horizontalPadding = p4.horizontalPadding or 0
	local var12 = if fFlagAXVirtualizedFeedVerticalPadding then p4.verticalPadding or 0 else 0
	
	if fFlagVirtualizedFeedFooterWrapperProp then
		var13 = p4.shouldWrapFooter ~= false
		var13 = nil
	else
		var13 = true
	end
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useCallback(function(p6) --[[ line: 152 ]]
		-- upvalues: var14 (ref), p4 (ref)
		var14.current = p6
		local flatListRef = p4.flatListRef
		
		if flatListRef then
			if typeof(flatListRef) == "function" then
				flatListRef(p6)
				
				return
			elseif typeof(flatListRef) == "table" then
				flatListRef.current = p6
			end
		end
	end, { p4.flatListRef })
	local var16, var17 = reactModule.useState(false)
	local var18 = nil
	local _ = nil
	local var19 = nil
	local var20 = nil
	local var21 = nil
	
	if fFlagAXSduiFeedBackToTopAndNavClearance then
		local var22, var23 = reactModule.useState(0)
		var18 = var22
		local var24 = var23
		local var25, var26 = reactModule.useState(0)
		var19 = var25
		var20 = var26
		var21 = reactModule.useCallback(function(_, p7) --[[ line: 182 ]]
			-- upvalues: var24 (write)
			var24(p7)
		end, {})
	end
	local var27 = reactModule.useCallback(function() --[[ line: 187 ]]
		-- upvalues: var14 (ref), userGameSettingsService (copy)
		if var14.current then
			var14.current:scrollToOffset({
				offset = 0,
				animated = if userGameSettingsService.ReducedMotion then false else true
			})
		end
	end, {})
	
	if not fFlagAXSduiFeedBackToTopAndNavClearance then
		local var29
		if var14.current ~= nil then
			local nativeScrollRef = var14.current:getNativeScrollRef()
			var29 = if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
		end
		reactModule.useEffect(function() --[[ line: 199 ]]
			-- upvalues: var29 (ref), var17 (ref)
			local t = {}
			
			local function sizeChangeHandler() --[[ line: 202 ]]
				-- upvalues: var29 (copy), var17 (copy)
				if var29 == nil or var29.current == nil then
					return
				end
				local current = var29.current
				var17(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
			end
			
			if var29 and var29.current then
				table.insert(t, var29.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(sizeChangeHandler))
				table.insert(t, var29.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(sizeChangeHandler))
				
				if var29 ~= nil and var29.current ~= nil then
					local current = var29.current
					var17(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
				end
			end
			return function() --[[ line: 220 ]]
				-- upvalues: t (ref)
				for i, v in t do
					v:Disconnect()
				end
			end
		end, { var29 })
	end
	local var30 = nil
	
	if fFlagAXSduiFeedBackToTopAndNavClearance then
		local var31 = if p4.ListFooterComponent then p4.ListFooterComponent elseif isFeedContentScrollableModule(var18 or 0, var19 or 0, var12) and p4.isEndOfList == true then reactModule.createElement(VirtualizedFeedBackToTopButton, { text = p4.scrollToTopLabel, onActivated = var27 }) elseif p4.isLoading then reactModule.createElement(loading, { size = iconSize.Medium }) else nil
		local endOfListBottomPadding = p4.endOfListBottomPadding or 0
		local var33 = reactModule.useMemo(function() --[[ line: 248 ]]
			-- upvalues: endOfListBottomPadding (ref)
			return if endOfListBottomPadding <= 0 then nil else { bottom = UDim.new(0, endOfListBottomPadding) }
		end, { endOfListBottomPadding })
		
		if var33 then
			local var39
			local createElement = reactModule.createElement
			local var35 = view
			local t_2 = { tag = "size-full-0 auto-y", padding = var33 }
			local t_3 = {}
			
			if not var31 then
				var39 = nil
			elseif fFlagVirtualizedFeedFooterWrapperProp then
				local t_4 = { footerContent = var31, shouldWrap = var13 }
				var39 = if t_4.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, t_4.footerContent) else t_4.footerContent
			else
				var39 = reactModule.createElement(VirtualizedFeedFooterLayout, {}, var31)
			end
			t_3.FooterContent = var39
			var30 = createElement(var35, t_2, t_3)
		elseif var31 then
			if fFlagVirtualizedFeedFooterWrapperProp then
				local t_2 = { footerContent = var31, shouldWrap = var13 }
				var30 = if t_2.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, t_2.footerContent) else t_2.footerContent
			else
				var30 = reactModule.createElement(VirtualizedFeedFooterLayout, {}, var31)
			end
		end
	else
		local var40 = if p4.ListFooterComponent then p4.ListFooterComponent elseif p4.isEndOfList and var16 then reactModule.createElement(VirtualizedFeedBackToTopButton, { text = p4.scrollToTopLabel, onActivated = var27 }) elseif p4.isLoading then reactModule.createElement(loading, { size = iconSize.Medium }) else nil
		
		if not var40 then
			var30 = nil
		elseif fFlagVirtualizedFeedFooterWrapperProp then
			local t_2 = { footerContent = var40, shouldWrap = var13 }
			var30 = if t_2.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, t_2.footerContent) else t_2.footerContent
		else
			var30 = reactModule.createElement(VirtualizedFeedFooterLayout, {}, var40)
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundColor3 = p4.backgroundColor,
		BackgroundTransparency = if p4.backgroundTransparency ~= nil then if p4.backgroundColor then 0 else 1 else p4.backgroundTransparency,
		BorderSizePixel = 0,
		Size = p4.Size or UDim2.new(1, 0, 1, 0),
		ClipsDescendants = p4.clipsDescendants ~= nil or p4.clipsDescendants,
		LayoutOrder = p4.LayoutOrder,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p8) --[[ line: 312 ]]
			-- upvalues: p4 (ref), fFlagAXSduiFeedBackToTopAndNavClearance (copy), var20 (write)
			if p4.onContainerWidthChanged then
				p4.onContainerWidthChanged(p8.AbsoluteSize.X)
			end
			if fFlagAXSduiFeedBackToTopAndNavClearance and var20 then
				var20(p8.AbsoluteSize.Y)
			end
		end, { p4.onContainerWidthChanged }),
		ref = p5
	}, {
		UIPadding = if horizontalPadding > 0 or var12 > 0 then reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, horizontalPadding),
			PaddingRight = UDim.new(0, horizontalPadding),
			PaddingTop = UDim.new(0, var12),
			PaddingBottom = UDim.new(0, var12)
		}) else nil,
		FeedFlatList = reactModule.createElement(flatList, {
			UNSTABLE_forceSiblingLayoutUpdate = true,
			showDefaultLoadingIndicators = true,
			data = p4.data,
			renderItem = p4.renderItem,
			windowSize = p4.windowSize or 21,
			initialNumToRender = p4.initialNumToRender or 8,
			maxToRenderPerBatch = p4.maxToRenderPerBatch or 1,
			updateCellsBatchingPeriod = p4.updateCellsBatchingPeriod or 30,
			scrollEventThrottle = p4.scrollEventThrottle or 0,
			ref = var15,
			contentContainerStyle = t,
			style = t_1,
			onScroll = reactModule.useCallback(function(p9) --[[ line: 306 ]]
				-- upvalues: p4 (ref)
				if p4.onScroll then
					p4.onScroll(p9.CanvasPosition.Y)
				end
			end, { p4.onScroll }),
			onContentSizeChange = if fFlagAXSduiFeedBackToTopAndNavClearance then var21 else nil,
			onEndReachedThreshold = p4.onEndReachedThreshold,
			onEndReached = p4.onEndReached,
			ListHeaderComponent = p4.ListHeaderComponent,
			ListFooterComponent = var30,
			scrollEnabled = p4.scrollEnabled
		})
	})
end)