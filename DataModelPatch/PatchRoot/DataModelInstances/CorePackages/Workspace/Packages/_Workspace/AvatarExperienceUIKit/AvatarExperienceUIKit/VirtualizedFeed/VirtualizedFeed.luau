local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAXVirtualizedFeedVerticalPadding = require(Parent.SharedFlags).FFlagAXVirtualizedFeedVerticalPadding
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local FlatList = require(Parent.VirtualizedList).FlatList
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

local function VirtualizedFeedFooterLayout(p1)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, { tag = "row align-y-center align-x-center padding-xlarge" }, p1.children)
end

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: FFlagAXVirtualizedFeedVerticalPadding (copy), ReactModule (copy), UserGameSettings (copy), VirtualizedFeedBackToTopButton (copy), Loading (copy), IconSize (copy), FlatList (copy), ContentContainerStyle (copy), Style (copy), VirtualizedFeedFooterLayout (copy)
	local HorizontalPadding = Frame.horizontalPadding or 0
	local VerticalPadding = FFlagAXVirtualizedFeedVerticalPadding and Frame.verticalPadding or 0
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
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult1 = ReactModule.useCallback(function()
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
	local ListFooterComponent = if Frame.ListFooterComponent then Frame.ListFooterComponent elseif Frame.isEndOfList and UseStateResult then ReactModule.createElement(VirtualizedFeedBackToTopButton, { text = Frame.scrollToTopLabel, onActivated = UseResult1 }) elseif Frame.isLoading then ReactModule.createElement(Loading, { size = IconSize.Medium }) else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = Frame.backgroundColor,
		BackgroundTransparency = if Frame.backgroundTransparency == nil then if Frame.backgroundColor then 0 else 1 else Frame.backgroundTransparency,
		BorderSizePixel = 0,
		Size = Frame.Size or UDim2.new(1, 0, 1, 0),
		ClipsDescendants = Frame.clipsDescendants == nil or Frame.clipsDescendants,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame1)
			-- upvalues: Frame (copy)
			if Frame.onContainerWidthChanged then
				Frame.onContainerWidthChanged(Frame1.AbsoluteSize.X)
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
			onEndReachedThreshold = Frame.onEndReachedThreshold,
			onEndReached = Frame.onEndReached,
			ListHeaderComponent = Frame.ListHeaderComponent,
			ListFooterComponent = if ListFooterComponent then ReactModule.createElement(VirtualizedFeedFooterLayout, {}, ListFooterComponent) else nil,
			scrollEnabled = Frame.scrollEnabled
		})
	})
end)