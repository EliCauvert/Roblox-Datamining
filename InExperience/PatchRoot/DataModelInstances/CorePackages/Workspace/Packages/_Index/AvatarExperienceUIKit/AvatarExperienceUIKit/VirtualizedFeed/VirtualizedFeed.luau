local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagAXVirtualizedFeedVerticalPadding = require(parent.SharedFlags).FFlagAXVirtualizedFeedVerticalPadding
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local view = foundationModule.View
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local flatList = require(parent.VirtualizedList).FlatList
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

local function _(p0) --[[ line: 47 | named "getNativeScrollingFrameRef" ]]
	if p0.current ~= nil then
		local nativeScrollRef = p0.current:getNativeScrollRef()
		
		return if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
	end
end

local function VirtualizedFeedBackToTopButton(p1) --[[ line: 62 ]]
	-- upvalues: useLocalization (ref), t_2 (ref), reactModule (ref), button (ref), buttonVariant (ref)
	return reactModule.createElement(button, {
		text = p1.text or useLocalization(t_2).backToTop,
		variant = buttonVariant.Link,
		onActivated = p1.onActivated
	})
end

local function VirtualizedFeedFooterLayout(p2) --[[ line: 76 ]]
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, { tag = "row align-y-center align-x-center padding-xlarge" }, p2.children)
end

return reactModule.forwardRef(function(p3, p4) --[[ line: 124 | named "VirtualizedFeed" ]]
	-- upvalues: fFlagAXVirtualizedFeedVerticalPadding (ref), reactModule (ref), userGameSettingsService (ref), VirtualizedFeedBackToTopButton (ref), loading (ref), iconSize (ref), flatList (ref), t (ref), t_1 (ref), VirtualizedFeedFooterLayout (ref)
	local var17
	local horizontalPadding = p3.horizontalPadding or 0
	local var10 = if fFlagAXVirtualizedFeedVerticalPadding then p3.verticalPadding or 0 else 0
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useCallback(function(p5) --[[ line: 129 ]]
		-- upvalues: var11 (ref), p3 (ref)
		var11.current = p5
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
	local var13, var14 = reactModule.useState(false)
	local var15 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: var11 (ref), userGameSettingsService (copy)
		if var11.current then
			var11.current:scrollToOffset({
				offset = 0,
				animated = if userGameSettingsService.ReducedMotion then false else true
			})
		end
	end, {})
	
	if var11.current ~= nil then
		local nativeScrollRef = var11.current:getNativeScrollRef()
		var17 = if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
	end
	reactModule.useEffect(function() --[[ line: 155 ]]
		-- upvalues: var17 (ref), var14 (ref)
		local t = {}
		
		local function sizeChangeHandler() --[[ line: 158 ]]
			-- upvalues: var17 (copy), var14 (copy)
			if var17 == nil or var17.current == nil then
				return
			end
			local current = var17.current
			var14(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
		end
		
		if var17 and var17.current then
			table.insert(t, var17.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(sizeChangeHandler))
			table.insert(t, var17.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(sizeChangeHandler))
			
			if var17 ~= nil and var17.current ~= nil then
				local current = var17.current
				var14(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
			end
		end
		return function() --[[ line: 176 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var17 })
	local var18 = if p3.ListFooterComponent then p3.ListFooterComponent elseif p3.isEndOfList and var13 then reactModule.createElement(VirtualizedFeedBackToTopButton, { text = p3.scrollToTopLabel, onActivated = var15 }) elseif p3.isLoading then reactModule.createElement(loading, { size = iconSize.Medium }) else nil
	
	return reactModule.createElement("Frame", {
		BackgroundColor3 = p3.backgroundColor,
		BackgroundTransparency = if p3.backgroundTransparency ~= nil then if p3.backgroundColor then 0 else 1 else p3.backgroundTransparency,
		BorderSizePixel = 0,
		Size = p3.Size or UDim2.new(1, 0, 1, 0),
		ClipsDescendants = p3.clipsDescendants ~= nil or p3.clipsDescendants,
		LayoutOrder = p3.LayoutOrder,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p6) --[[ line: 203 ]]
			-- upvalues: p3 (ref)
			if p3.onContainerWidthChanged then
				p3.onContainerWidthChanged(p6.AbsoluteSize.X)
			end
		end, { p3.onContainerWidthChanged }),
		ref = p4
	}, {
		UIPadding = if horizontalPadding > 0 or var10 > 0 then reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, horizontalPadding),
			PaddingRight = UDim.new(0, horizontalPadding),
			PaddingTop = UDim.new(0, var10),
			PaddingBottom = UDim.new(0, var10)
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
			ref = var12,
			contentContainerStyle = t,
			style = t_1,
			onScroll = reactModule.useCallback(function(p7) --[[ line: 197 ]]
				-- upvalues: p3 (ref)
				if p3.onScroll then
					p3.onScroll(p7.CanvasPosition.Y)
				end
			end, { p3.onScroll }),
			onEndReachedThreshold = p3.onEndReachedThreshold,
			onEndReached = p3.onEndReached,
			ListHeaderComponent = p3.ListHeaderComponent,
			ListFooterComponent = if var18 then reactModule.createElement(VirtualizedFeedFooterLayout, {}, var18) else nil,
			scrollEnabled = p3.scrollEnabled
		})
	})
end)