local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAXVirtualizedFeedVerticalPadding = require(Parent.SharedFlags).FFlagAXVirtualizedFeedVerticalPadding
local FFlagAXSduiFeedBackToTopAndNavClearance = require(Parent.AvatarExperienceFlags).FFlagAXSduiFeedBackToTopAndNavClearance
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local FlatList = require(Parent.VirtualizedList).FlatList
local IsFeedContentScrollableModule = require(script.Parent.isFeedContentScrollable)
local FFlagVirtualizedFeedFooterWrapperProp = require(Parent.SharedFlags).FFlagVirtualizedFeedFooterWrapperProp
local FFlagAXScrollTelemetryIntegration2 = require(Parent.SharedFlags).FFlagAXScrollTelemetryIntegration2
local UseFlatListScrollPerformanceTrackerModule = require(script.Parent.useFlatListScrollPerformanceTracker)
local ContentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 }
local Style = {
	Selectable = false,
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	BorderSizePixel = 0,
	ClipsDescendants = false,
	ElasticBehavior = Enum.ElasticBehavior.Always,
	AutomaticCanvasSize = Enum.AutomaticSize.Y
}
local config = { backToTop = "Feature.GamePage.Action.BackToTop" }

local function _(p1)
	if p1.current ~= nil then
		local NativeScrollRef = p1.current:getNativeScrollRef()
		
		if NativeScrollRef ~= nil then
			return NativeScrollRef._nativeRef
		end
	end
	return nil
end

local function VirtualizedFeedBackToTopButton(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), Button (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(Button, {
		text = p1.text or UseLocalizationResult.backToTop,
		variant = ButtonVariant.Link,
		onActivated = p1.onActivated
	})
end

local RowAlignXCenterAlignYCenterSizeFull0AutoYPaddingXlarge: string = if FFlagAXSduiFeedBackToTopAndNavClearance then "row align-x-center align-y-center size-full-0 auto-y padding-xlarge" else "row align-y-center align-x-center padding-xlarge"

local function VirtualizedFeedFooterLayout(p1)
	-- upvalues: ReactModule (copy), View (copy), RowAlignXCenterAlignYCenterSizeFull0AutoYPaddingXlarge (copy)
	return ReactModule.createElement(View, {
		tag = RowAlignXCenterAlignYCenterSizeFull0AutoYPaddingXlarge
	}, p1.children)
end

local _ = function(p1)
	-- upvalues: ReactModule (copy), VirtualizedFeedFooterLayout (copy)
	return if p1.shouldWrap then ReactModule.createElement(VirtualizedFeedFooterLayout, {}, p1.footerContent) else p1.footerContent
end

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: FFlagAXVirtualizedFeedVerticalPadding (copy), FFlagVirtualizedFeedFooterWrapperProp (copy), ReactModule (copy), FFlagAXScrollTelemetryIntegration2 (copy), UseFlatListScrollPerformanceTrackerModule (copy), FFlagAXSduiFeedBackToTopAndNavClearance (copy), UserGameSettings (copy), IsFeedContentScrollableModule (copy), VirtualizedFeedBackToTopButton (copy), Loading (copy), IconSize (copy), View (copy), VirtualizedFeedFooterLayout (copy), FlatList (copy), ContentContainerStyle (copy), Style (copy)
	local HorizontalPadding = Frame.horizontalPadding or 0
	local VerticalPadding = FFlagAXVirtualizedFeedVerticalPadding and Frame.verticalPadding or 0
	local NoFFlagVirtualizedFeedFooterWrapperProp: boolean = not FFlagVirtualizedFeedFooterWrapperProp or Frame.shouldWrapFooter ~= false
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), Frame (copy)
		UseRefResult.current = Current
		local FlatListRefFunction: (any) -> () = Frame.flatListRef
		
		if FlatListRefFunction then
			if typeof(FlatListRefFunction) == "function" then
				FlatListRefFunction(Current)
				
				return
			end
			if typeof(FlatListRefFunction) == "table" then
				FlatListRefFunction.current = Current
			end
		end
	end, { Frame.flatListRef })
	
	if FFlagAXScrollTelemetryIntegration2 then
		UseFlatListScrollPerformanceTrackerModule(Frame.scrollPerformanceIntervalName, UseRefResult)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v1 = nil
	local UseStateResult2_1 = nil
	local v2 = nil
	local Callback = nil
	local UseResult1 = nil
	
	if FFlagAXSduiFeedBackToTopAndNavClearance then
		v1, UseStateResult2_1 = ReactModule.useState(0)
		v2, Callback = ReactModule.useState(0)
		UseResult1 = ReactModule.useCallback(function(_, p1)
			-- upvalues: UseStateResult2_1 (ref)
			UseStateResult2_1(p1)
		end, {})
	end
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UserGameSettings (upval)
		if UseRefResult.current then
			UseRefResult.current:scrollToOffset({
				offset = 0,
				animated = not UserGameSettings.ReducedMotion
			})
		end
	end, {})
	local NativeRef = nil
	repeat
		if FFlagAXSduiFeedBackToTopAndNavClearance then break end
		repeat
			if UseRefResult.current ~= nil then
				local NativeScrollRef = UseRefResult.current:getNativeScrollRef()
				
				if NativeScrollRef ~= nil then
					NativeRef = NativeScrollRef._nativeRef
					break
				end
			end
			NativeRef = nil
		until true
		ReactModule.useEffect(function()
			-- upvalues: NativeRef (copy), UseStateResult2 (copy)
			local List = {}
			
			local function sizeChangeHandler()
				-- upvalues: NativeRef (upval), UseStateResult2 (upval)
				if NativeRef ~= nil and NativeRef.current ~= nil then
					local Current = NativeRef.current
					UseStateResult2(Current.AbsoluteWindowSize.Y < Current.AbsoluteCanvasSize.Y)
					
					return
				end
			end
			
			if NativeRef and NativeRef.current then
				table.insert(List, NativeRef.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(sizeChangeHandler))
				table.insert(List, NativeRef.current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(sizeChangeHandler))
				
				if NativeRef ~= nil and NativeRef.current ~= nil then
					local Current = NativeRef.current
					UseStateResult2(Current.AbsoluteWindowSize.Y < Current.AbsoluteCanvasSize.Y)
				end
			end
			return function()
				-- upvalues: List (copy)
				for _, Connection in List do
					Connection:Disconnect()
				end
			end
		end, { NativeRef })
	until true
	local Element = nil
	
	if FFlagAXSduiFeedBackToTopAndNavClearance then
		local IsIsEndOfList: boolean = IsFeedContentScrollableModule(v1 or 0, v2 or 0, VerticalPadding) and Frame.isEndOfList == true
		local ListFooterComponent = if Frame.ListFooterComponent then Frame.ListFooterComponent elseif IsIsEndOfList then ReactModule.createElement(VirtualizedFeedBackToTopButton, { text = Frame.scrollToTopLabel, onActivated = UseResult2 }) elseif Frame.isLoading then ReactModule.createElement(Loading, { size = IconSize.Medium }) else nil
		local EndOfListBottomPadding = Frame.endOfListBottomPadding or 0
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: EndOfListBottomPadding (copy)
			return if EndOfListBottomPadding <= 0 then nil else { bottom = UDim.new(0, EndOfListBottomPadding) }
		end, { EndOfListBottomPadding })
		
		if UseMemoResult then
			local CreateElementFunction = ReactModule.createElement
			local config = { tag = "size-full-0 auto-y", padding = UseMemoResult }
			local t = {}
			local Element1 = nil
			
			if ListFooterComponent then
				if FFlagVirtualizedFeedFooterWrapperProp then
					local config1 = {
						footerContent = ListFooterComponent,
						shouldWrap = NoFFlagVirtualizedFeedFooterWrapperProp
					}
					Element1 = if config1.shouldWrap then ReactModule.createElement(VirtualizedFeedFooterLayout, {}, config1.footerContent) else config1.footerContent
				else
					Element1 = ReactModule.createElement(VirtualizedFeedFooterLayout, {}, ListFooterComponent)
				end
			else
				Element1 = nil
			end
			t.FooterContent = Element1
			Element = CreateElementFunction(View, config, t)
		elseif ListFooterComponent then
			if FFlagVirtualizedFeedFooterWrapperProp then
				local config = {
					footerContent = ListFooterComponent,
					shouldWrap = NoFFlagVirtualizedFeedFooterWrapperProp
				}
				Element = if config.shouldWrap then ReactModule.createElement(VirtualizedFeedFooterLayout, {}, config.footerContent) else config.footerContent
			else
				Element = ReactModule.createElement(VirtualizedFeedFooterLayout, {}, ListFooterComponent)
			end
		end
	else
		local ListFooterComponent1 = if Frame.ListFooterComponent then Frame.ListFooterComponent elseif Frame.isEndOfList and UseStateResult then ReactModule.createElement(VirtualizedFeedBackToTopButton, { text = Frame.scrollToTopLabel, onActivated = UseResult2 }) elseif Frame.isLoading then ReactModule.createElement(Loading, { size = IconSize.Medium }) else nil
		
		if ListFooterComponent1 then
			if FFlagVirtualizedFeedFooterWrapperProp then
				local config = {
					footerContent = ListFooterComponent1,
					shouldWrap = NoFFlagVirtualizedFeedFooterWrapperProp
				}
				Element = if config.shouldWrap then ReactModule.createElement(VirtualizedFeedFooterLayout, {}, config.footerContent) else config.footerContent
			else
				Element = ReactModule.createElement(VirtualizedFeedFooterLayout, {}, ListFooterComponent1)
			end
		else
			Element = nil
		end
	end
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = Frame.backgroundColor,
		BackgroundTransparency = if Frame.backgroundTransparency == nil then if Frame.backgroundColor then 0 else 1 else Frame.backgroundTransparency,
		BorderSizePixel = 0,
		Size = Frame.Size or UDim2.new(1, 0, 1, 0),
		ClipsDescendants = Frame.clipsDescendants == nil or Frame.clipsDescendants,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame1: Frame)
			-- upvalues: Frame (copy), FFlagAXSduiFeedBackToTopAndNavClearance (upval), Callback (ref)
			if Frame.onContainerWidthChanged then
				Frame.onContainerWidthChanged(Frame1.AbsoluteSize.X)
			end
			if FFlagAXSduiFeedBackToTopAndNavClearance and Callback then
				Callback(Frame1.AbsoluteSize.Y)
			end
		end, { Frame.onContainerWidthChanged }),
		ref = Ref
	}, {
		UIPadding = if HorizontalPadding > 0 or VerticalPadding > 0 then ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, HorizontalPadding),
			PaddingRight = UDim.new(0, HorizontalPadding),
			PaddingTop = UDim.new(0, VerticalPadding),
			PaddingBottom = UDim.new(0, VerticalPadding)
		}) else nil,
		FeedFlatList = ReactModule.createElement(FlatList, {
			UNSTABLE_forceSiblingLayoutUpdate = true,
			showDefaultLoadingIndicators = true,
			data = Frame.data,
			renderItem = Frame.renderItem,
			windowSize = Frame.windowSize or 21,
			initialNumToRender = Frame.initialNumToRender or 8,
			maxToRenderPerBatch = Frame.maxToRenderPerBatch or 1,
			updateCellsBatchingPeriod = Frame.updateCellsBatchingPeriod or 30,
			scrollEventThrottle = Frame.scrollEventThrottle or 0,
			ref = UseResult,
			contentContainerStyle = ContentContainerStyle,
			style = Style,
			onScroll = ReactModule.useCallback(function(ScrollFrame)
				-- upvalues: Frame (copy)
				if Frame.onScroll then
					Frame.onScroll(ScrollFrame.CanvasPosition.Y)
				end
			end, { Frame.onScroll }),
			onContentSizeChange = if FFlagAXSduiFeedBackToTopAndNavClearance then UseResult1 else nil,
			onEndReachedThreshold = Frame.onEndReachedThreshold,
			onEndReached = Frame.onEndReached,
			ListHeaderComponent = Frame.ListHeaderComponent,
			ListFooterComponent = Element,
			scrollEnabled = Frame.scrollEnabled
		})
	})
end)