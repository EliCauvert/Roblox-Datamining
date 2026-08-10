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

local function _(p0) --[[ line: 50 | named "getNativeScrollingFrameRef" ]]
	if p0.current ~= nil then
		local nativeScrollRef = p0.current:getNativeScrollRef()
		
		return if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
	end
end

local function VirtualizedFeedBackToTopButton(p1) --[[ line: 65 ]]
	-- upvalues: useLocalization (ref), t_2 (ref), reactModule (ref), button (ref), buttonVariant (ref)
	return reactModule.createElement(button, {
		text = p1.text or useLocalization(t_2).backToTop,
		variant = buttonVariant.Link,
		onActivated = p1.onActivated
	})
end

local var8 = if fFlagAXSduiFeedBackToTopAndNavClearance then "row align-x-center align-y-center size-full-0 auto-y padding-xlarge" else "row align-y-center align-x-center padding-xlarge"

local function VirtualizedFeedFooterLayout(p2) --[[ line: 83 ]]
	-- upvalues: reactModule (ref), view (ref), var8 (ref)
	return reactModule.createElement(view, { tag = var8 }, p2.children)
end

return reactModule.forwardRef(function(p3, p4) --[[ line: 135 | named "VirtualizedFeed" ]]
	-- upvalues: fFlagAXVirtualizedFeedVerticalPadding (ref), reactModule (ref), fFlagAXSduiFeedBackToTopAndNavClearance (ref), userGameSettingsService (ref), isFeedContentScrollableModule (ref), VirtualizedFeedBackToTopButton (ref), loading (ref), iconSize (ref), view (ref), VirtualizedFeedFooterLayout (ref), flatList (ref), t (ref), t_1 (ref)
	local horizontalPadding = p3.horizontalPadding or 0
	local var12 = if fFlagAXVirtualizedFeedVerticalPadding then p3.verticalPadding or 0 else 0
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useCallback(function(p5) --[[ line: 140 ]]
		-- upvalues: var13 (ref), p3 (ref)
		var13.current = p5
		local flatListRef = p3.flatListRef
		
		if flatListRef then
			if typeof(flatListRef) == "function" then
				flatListRef(p5)
				
				return
			elseif typeof(flatListRef) == "table" then
				flatListRef.current = p5
			end
		end
	end, { p3.flatListRef })
	local var15, var16 = reactModule.useState(false)
	local var17 = nil
	local _ = nil
	local var18 = nil
	local var19 = nil
	local var20 = nil
	
	if fFlagAXSduiFeedBackToTopAndNavClearance then
		local var21, var22 = reactModule.useState(0)
		var17 = var21
		local var23 = var22
		local var24, var25 = reactModule.useState(0)
		var18 = var24
		var19 = var25
		var20 = reactModule.useCallback(function(_, p6) --[[ line: 170 ]]
			-- upvalues: var23 (write)
			var23(p6)
		end, {})
	end
	local var26 = reactModule.useCallback(function() --[[ line: 175 ]]
		-- upvalues: var13 (ref), userGameSettingsService (copy)
		if var13.current then
			var13.current:scrollToOffset({
				offset = 0,
				animated = if userGameSettingsService.ReducedMotion then false else true
			})
		end
	end, {})
	
	if not fFlagAXSduiFeedBackToTopAndNavClearance then
		local var28
		if var13.current ~= nil then
			local nativeScrollRef = var13.current:getNativeScrollRef()
			var28 = if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
		end
		reactModule.useEffect(function() --[[ line: 187 ]]
			-- upvalues: var28 (ref), var16 (ref)
			local t = {}
			
			local function sizeChangeHandler() --[[ line: 190 ]]
				-- upvalues: var28 (copy), var16 (copy)
				if var28 == nil or var28.current == nil then
					return
				end
				local current = var28.current
				var16(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
			end
			
			if var28 and var28.current then
				table.insert(t, var28.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(sizeChangeHandler))
				table.insert(t, var28.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(sizeChangeHandler))
				
				if var28 ~= nil and var28.current ~= nil then
					local current = var28.current
					var16(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
				end
			end
			return function() --[[ line: 208 ]]
				-- upvalues: t (ref)
				for i, v in t do
					v:Disconnect()
				end
			end
		end, { var28 })
	end
	local var29 = nil
	
	if fFlagAXSduiFeedBackToTopAndNavClearance then
		local var30 = if p3.ListFooterComponent then p3.ListFooterComponent elseif isFeedContentScrollableModule(var17 or 0, var18 or 0, var12) and p3.isEndOfList == true then reactModule.createElement(VirtualizedFeedBackToTopButton, { text = p3.scrollToTopLabel, onActivated = var26 }) elseif p3.isLoading then reactModule.createElement(loading, { size = iconSize.Medium }) else nil
		local endOfListBottomPadding = p3.endOfListBottomPadding or 0
		local var32 = reactModule.useMemo(function() --[[ line: 236 ]]
			-- upvalues: endOfListBottomPadding (ref)
			return if endOfListBottomPadding <= 0 then nil else { bottom = UDim.new(0, endOfListBottomPadding) }
		end, { endOfListBottomPadding })
		
		if var32 then
			var29 = reactModule.createElement(view, { tag = "size-full-0 auto-y", padding = var32 }, {
				FooterContent = if var30 then reactModule.createElement(VirtualizedFeedFooterLayout, {}, var30) else nil
			})
		elseif var30 then
			var29 = reactModule.createElement(VirtualizedFeedFooterLayout, {}, var30)
		end
	else
		local var33 = if p3.ListFooterComponent then p3.ListFooterComponent elseif p3.isEndOfList and var15 then reactModule.createElement(VirtualizedFeedBackToTopButton, { text = p3.scrollToTopLabel, onActivated = var26 }) elseif p3.isLoading then reactModule.createElement(loading, { size = iconSize.Medium }) else nil
		var29 = if var33 then reactModule.createElement(VirtualizedFeedFooterLayout, {}, var33) else nil
	end
	return reactModule.createElement("Frame", {
		BackgroundColor3 = p3.backgroundColor,
		BackgroundTransparency = if p3.backgroundTransparency ~= nil then if p3.backgroundColor then 0 else 1 else p3.backgroundTransparency,
		BorderSizePixel = 0,
		Size = p3.Size or UDim2.new(1, 0, 1, 0),
		ClipsDescendants = p3.clipsDescendants ~= nil or p3.clipsDescendants,
		LayoutOrder = p3.LayoutOrder,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p7) --[[ line: 283 ]]
			-- upvalues: p3 (ref), fFlagAXSduiFeedBackToTopAndNavClearance (copy), var19 (write)
			if p3.onContainerWidthChanged then
				p3.onContainerWidthChanged(p7.AbsoluteSize.X)
			end
			if fFlagAXSduiFeedBackToTopAndNavClearance and var19 then
				var19(p7.AbsoluteSize.Y)
			end
		end, { p3.onContainerWidthChanged }),
		ref = p4
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
			data = p3.data,
			renderItem = p3.renderItem,
			windowSize = p3.windowSize or 21,
			initialNumToRender = p3.initialNumToRender or 8,
			maxToRenderPerBatch = p3.maxToRenderPerBatch or 1,
			updateCellsBatchingPeriod = p3.updateCellsBatchingPeriod or 30,
			scrollEventThrottle = p3.scrollEventThrottle or 0,
			ref = var14,
			contentContainerStyle = t,
			style = t_1,
			onScroll = reactModule.useCallback(function(p8) --[[ line: 277 ]]
				-- upvalues: p3 (ref)
				if p3.onScroll then
					p3.onScroll(p8.CanvasPosition.Y)
				end
			end, { p3.onScroll }),
			onContentSizeChange = if fFlagAXSduiFeedBackToTopAndNavClearance then var20 else nil,
			onEndReachedThreshold = p3.onEndReachedThreshold,
			onEndReached = p3.onEndReached,
			ListHeaderComponent = p3.ListHeaderComponent,
			ListFooterComponent = var29,
			scrollEnabled = p3.scrollEnabled
		})
	})
end)