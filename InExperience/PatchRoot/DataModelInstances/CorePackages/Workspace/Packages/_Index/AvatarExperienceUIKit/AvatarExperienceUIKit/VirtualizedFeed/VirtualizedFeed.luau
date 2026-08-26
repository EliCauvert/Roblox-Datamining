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

local function _(p1)
	if p1.current ~= nil then
		local nativeScrollRef = p1.current:getNativeScrollRef()
		
		return if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
	end
end

local function VirtualizedFeedBackToTopButton(p1)
	-- upvalues: useLocalization (ref), t_2 (ref), reactModule (ref), button (ref), buttonVariant (ref)
	return reactModule.createElement(button, {
		text = p1.text or useLocalization(t_2).backToTop,
		variant = buttonVariant.Link,
		onActivated = p1.onActivated
	})
end

local var1 = if fFlagAXSduiFeedBackToTopAndNavClearance then "row align-x-center align-y-center size-full-0 auto-y padding-xlarge" else "row align-y-center align-x-center padding-xlarge"

local function VirtualizedFeedFooterLayout(p1)
	-- upvalues: reactModule (ref), view (ref), var1 (ref)
	return reactModule.createElement(view, { tag = var1 }, p1.children)
end

local _ = function(p1)
	-- upvalues: reactModule (ref), VirtualizedFeedFooterLayout (ref)
	return if p1.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, p1.footerContent) else p1.footerContent
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: fFlagAXVirtualizedFeedVerticalPadding (ref), fFlagVirtualizedFeedFooterWrapperProp (ref), reactModule (ref), fFlagAXSduiFeedBackToTopAndNavClearance (ref), userGameSettingsService (ref), isFeedContentScrollableModule (ref), VirtualizedFeedBackToTopButton (ref), loading (ref), iconSize (ref), view (ref), VirtualizedFeedFooterLayout (ref), flatList (ref), t (ref), t_1 (ref)
	local var2
	local horizontalPadding = p1.horizontalPadding or 0
	local var3 = if fFlagAXVirtualizedFeedVerticalPadding then p1.verticalPadding or 0 else 0
	
	if fFlagVirtualizedFeedFooterWrapperProp then
		var2 = p1.shouldWrapFooter ~= false
		var2 = nil
	else
		var2 = true
	end
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), p1 (ref)
		var4.current = p3
		local flatListRef = p1.flatListRef
		
		if flatListRef then
			if typeof(flatListRef) == "function" then
				flatListRef(p3)
				
				return
			elseif typeof(flatListRef) == "table" then
				flatListRef.current = p3
			end
		end
	end, { p1.flatListRef })
	local var6, var7 = reactModule.useState(false)
	local var8 = nil
	local _ = nil
	local var9 = nil
	local var10 = nil
	local var11 = nil
	
	if fFlagAXSduiFeedBackToTopAndNavClearance then
		local var12, var13 = reactModule.useState(0)
		var8 = var12
		local var14 = var13
		local var15, var16 = reactModule.useState(0)
		var9 = var15
		var10 = var16
		var11 = reactModule.useCallback(function(_, p3)
			-- upvalues: var14 (write)
			var14(p3)
		end, {})
	end
	local var17 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), userGameSettingsService (copy)
		if var4.current then
			var4.current:scrollToOffset({
				offset = 0,
				animated = if userGameSettingsService.ReducedMotion then false else true
			})
		end
	end, {})
	
	if not fFlagAXSduiFeedBackToTopAndNavClearance then
		local var18
		if var4.current ~= nil then
			local nativeScrollRef = var4.current:getNativeScrollRef()
			var18 = if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef
		end
		reactModule.useEffect(function()
			-- upvalues: var18 (ref), var7 (ref)
			local t = {}
			
			local function sizeChangeHandler()
				-- upvalues: var18 (copy), var7 (copy)
				if var18 == nil or var18.current == nil then
					return
				end
				local current = var18.current
				var7(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
			end
			
			if var18 and var18.current then
				table.insert(t, var18.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(sizeChangeHandler))
				table.insert(t, var18.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(sizeChangeHandler))
				
				if var18 ~= nil and var18.current ~= nil then
					local current = var18.current
					var7(current.AbsoluteWindowSize.Y < current.AbsoluteCanvasSize.Y)
				end
			end
			return function()
				-- upvalues: t (ref)
				for i, v in t do
					v:Disconnect()
				end
			end
		end, { var18 })
	end
	local var19 = nil
	
	if fFlagAXSduiFeedBackToTopAndNavClearance then
		local var20 = if p1.ListFooterComponent then p1.ListFooterComponent elseif isFeedContentScrollableModule(var8 or 0, var9 or 0, var3) and p1.isEndOfList == true then reactModule.createElement(VirtualizedFeedBackToTopButton, { text = p1.scrollToTopLabel, onActivated = var17 }) elseif p1.isLoading then reactModule.createElement(loading, { size = iconSize.Medium }) else nil
		local endOfListBottomPadding = p1.endOfListBottomPadding or 0
		local var21 = reactModule.useMemo(function()
			-- upvalues: endOfListBottomPadding (ref)
			return if endOfListBottomPadding <= 0 then nil else { bottom = UDim.new(0, endOfListBottomPadding) }
		end, { endOfListBottomPadding })
		
		if var21 then
			local var22
			local createElement = reactModule.createElement
			local var23 = view
			local t_2 = { tag = "size-full-0 auto-y", padding = var21 }
			local t_3 = {}
			
			if not var20 then
				var22 = nil
			elseif fFlagVirtualizedFeedFooterWrapperProp then
				local t_4 = { footerContent = var20, shouldWrap = var2 }
				var22 = if t_4.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, t_4.footerContent) else t_4.footerContent
			else
				var22 = reactModule.createElement(VirtualizedFeedFooterLayout, {}, var20)
			end
			t_3.FooterContent = var22
			var19 = createElement(var23, t_2, t_3)
		elseif var20 then
			if fFlagVirtualizedFeedFooterWrapperProp then
				local t_2 = { footerContent = var20, shouldWrap = var2 }
				var19 = if t_2.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, t_2.footerContent) else t_2.footerContent
			else
				var19 = reactModule.createElement(VirtualizedFeedFooterLayout, {}, var20)
			end
		end
	else
		local var24 = if p1.ListFooterComponent then p1.ListFooterComponent elseif p1.isEndOfList and var6 then reactModule.createElement(VirtualizedFeedBackToTopButton, { text = p1.scrollToTopLabel, onActivated = var17 }) elseif p1.isLoading then reactModule.createElement(loading, { size = iconSize.Medium }) else nil
		
		if not var24 then
			var19 = nil
		elseif fFlagVirtualizedFeedFooterWrapperProp then
			local t_2 = { footerContent = var24, shouldWrap = var2 }
			var19 = if t_2.shouldWrap then reactModule.createElement(VirtualizedFeedFooterLayout, {}, t_2.footerContent) else t_2.footerContent
		else
			var19 = reactModule.createElement(VirtualizedFeedFooterLayout, {}, var24)
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundColor3 = p1.backgroundColor,
		BackgroundTransparency = if p1.backgroundTransparency ~= nil then if p1.backgroundColor then 0 else 1 else p1.backgroundTransparency,
		BorderSizePixel = 0,
		Size = p1.Size or UDim2.new(1, 0, 1, 0),
		ClipsDescendants = p1.clipsDescendants ~= nil or p1.clipsDescendants,
		LayoutOrder = p1.LayoutOrder,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), fFlagAXSduiFeedBackToTopAndNavClearance (copy), var10 (write)
			if p1.onContainerWidthChanged then
				p1.onContainerWidthChanged(p3.AbsoluteSize.X)
			end
			if fFlagAXSduiFeedBackToTopAndNavClearance and var10 then
				var10(p3.AbsoluteSize.Y)
			end
		end, { p1.onContainerWidthChanged }),
		ref = p2
	}, {
		UIPadding = if horizontalPadding > 0 or var3 > 0 then reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, horizontalPadding),
			PaddingRight = UDim.new(0, horizontalPadding),
			PaddingTop = UDim.new(0, var3),
			PaddingBottom = UDim.new(0, var3)
		}) else nil,
		FeedFlatList = reactModule.createElement(flatList, {
			UNSTABLE_forceSiblingLayoutUpdate = true,
			showDefaultLoadingIndicators = true,
			data = p1.data,
			renderItem = p1.renderItem,
			windowSize = p1.windowSize or 21,
			initialNumToRender = p1.initialNumToRender or 8,
			maxToRenderPerBatch = p1.maxToRenderPerBatch or 1,
			updateCellsBatchingPeriod = p1.updateCellsBatchingPeriod or 30,
			scrollEventThrottle = p1.scrollEventThrottle or 0,
			ref = var5,
			contentContainerStyle = t,
			style = t_1,
			onScroll = reactModule.useCallback(function(p3)
				-- upvalues: p1 (ref)
				if p1.onScroll then
					p1.onScroll(p3.CanvasPosition.Y)
				end
			end, { p1.onScroll }),
			onContentSizeChange = if fFlagAXSduiFeedBackToTopAndNavClearance then var11 else nil,
			onEndReachedThreshold = p1.onEndReachedThreshold,
			onEndReached = p1.onEndReached,
			ListHeaderComponent = p1.ListHeaderComponent,
			ListFooterComponent = var19,
			scrollEnabled = p1.scrollEnabled
		})
	})
end)