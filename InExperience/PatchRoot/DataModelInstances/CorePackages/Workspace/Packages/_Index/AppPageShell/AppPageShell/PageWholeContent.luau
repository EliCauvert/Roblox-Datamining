local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseAnimateScrollViewToSelectionFunction = require(Parent.AppBlox).useAnimateScrollViewToSelection
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local CollectionLayoutStoreProvider = require(Parent.CollectionViews).CollectionLayoutStoreProvider
local _ = require(AppPageShell.PageTypes)
local _ = require(AppPageShell.createPageScrollStore)
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiFeedScrollBarFixes = SharedFlagsModule.FFlagSduiFeedScrollBarFixes
local FFlagSduiPageCanvasCollectionLayout = SharedFlagsModule.FFlagSduiPageCanvasCollectionLayout
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies
local Frozen = table.freeze({ Selectable = false })

return ReactModule.memo(function(p1) --[[ Line: 57 | Named "PageWholeContent" ]]
	-- upvalues: FFlagSduiFeedScrollBarFixes (copy), FFlagSduiPageCanvasCollectionLayout (copy), ReactModule (copy), UseAnimateScrollViewToSelectionFunction (copy), UseLastInputModeFunction (copy), UseTokensFunction (copy), IsSubjectToDesktopPoliciesFunction (copy), View (copy), CollectionLayoutStoreProvider (copy), ScrollView (copy), Frozen (copy)
	local ScrollStore = p1.scrollStore
	local Slots = p1.slots
	local ContentTopPadding: number = p1.contentTopPadding
	local ContentBottomPadding: number = p1.contentBottomPadding
	local ChromeDisplacement = if FFlagSduiFeedScrollBarFixes then p1.chromeDisplacement else nil
	local ScrollingFrameRef = p1.scrollingFrameRef
	local Container = nil
	local v1 = nil
	
	if FFlagSduiPageCanvasCollectionLayout then
		Container, v20 = ReactModule.useState(nil)
	end
	UseAnimateScrollViewToSelectionFunction(ScrollingFrameRef, 0.4)
	local IsNotCursor = UseLastInputModeFunction() ~= "Cursor"
	local v2 = nil
	local ScrollBarThickness: number? = nil
	local UseMemoResult = nil
	
	if FFlagSduiFeedScrollBarFixes then
		v2 = UseTokensFunction()
		ScrollBarThickness = if IsSubjectToDesktopPoliciesFunction() then 4 else 0
	else
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 79 ]]
			-- upvalues: IsNotCursor (copy)
			return table.freeze({
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = not IsNotCursor
			})
		end, { IsNotCursor })
	end
	local Callback = nil
	local UseResult = nil
	
	if not FFlagSduiFeedScrollBarFixes then
		Callback = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 92 ]]
			-- upvalues: ScrollStore (copy)
			ScrollStore.setViewportHeight(ScrollFrame.AbsoluteWindowSize.Y)
			ScrollStore.setContentHeight(ScrollFrame.AbsoluteCanvasSize.Y)
		end, { ScrollStore })
		UseResult = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 97 ]]
			-- upvalues: Callback (ref), ScrollStore (copy)
			if Callback ~= nil then
				Callback(ScrollFrame)
			end
			ScrollStore.setCanvasPosition(ScrollFrame.CanvasPosition.Y)
		end, { ScrollStore, Callback })
	end
	local UseResult1 = ReactModule.useCallback(function(Current) --[[ Line: 106 ]]
		-- upvalues: ScrollStore (copy), ScrollingFrameRef (copy)
		ScrollStore.setScrollingFrame(Current)
		ScrollingFrameRef.current = Current
	end, { ScrollStore, ScrollingFrameRef })
	local UseMemoResult1 = if FFlagSduiFeedScrollBarFixes then ReactModule.useMemo(function() --[[ Line: 126 ]]
		-- upvalues: ChromeDisplacement (copy), ContentTopPadding (copy)
		return if ChromeDisplacement == nil then UDim2.new(1, 0, 0, ContentTopPadding or 0) else ChromeDisplacement:map(function(p2): UDim2 --[[ Line: 130 ]]
			-- upvalues: ContentTopPadding (upval)
			return UDim2.new(1, 0, 0, (ContentTopPadding or 0) + p2)
		end)
	end, { ChromeDisplacement, ContentTopPadding }) else nil
	local Element = {
		TopSpacer = if ContentTopPadding and ContentTopPadding > 0 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = if FFlagSduiFeedScrollBarFixes then UseMemoResult1 else UDim2.new(1, 0, 0, ContentTopPadding)
		}) elseif ChromeDisplacement == nil then nil else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = if FFlagSduiFeedScrollBarFixes then UseMemoResult1 else UDim2.new(1, 0, 0, ContentTopPadding)
		}),
		Content = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, (ReactModule.useMemo(function() --[[ Line: 113 ]]
			-- upvalues: Slots (copy)
			if Slots == nil then
				return nil
			end
			local t = {}
			
			for i, slot in Slots do
				t[`Content{i}`] = slot
			end
			return t
		end, { Slots }))),
		BottomSpacer = if ContentBottomPadding and ContentBottomPadding > 0 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, ContentBottomPadding)
		}) else nil
	}
	
	if FFlagSduiPageCanvasCollectionLayout then
		Element = ReactModule.createElement(CollectionLayoutStoreProvider, { container = Container }, Element)
	end
	local config = {
		Canvas = ReactModule.createElement(View, {
			tag = `col size-full-0 auto-y {p1.tag or ""}`,
			ref = if FFlagSduiPageCanvasCollectionLayout then v1 else nil
		}, Element)
	}
	
	return if FFlagSduiFeedScrollBarFixes then ReactModule.createElement("ScrollingFrame", {
		Size = p1.size or UDim2.fromScale(1, 1),
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		AutoLocalize = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(1, 0, 0, 0),
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollingEnabled = not IsNotCursor,
		Selectable = false,
		ClipsDescendants = true,
		ScrollBarThickness = ScrollBarThickness,
		ScrollBarImageColor3 = v2.Color.Shift.Shift_400.Color3,
		ScrollBarImageTransparency = 0,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		[ReactModule.Change.CanvasPosition] = ScrollStore.setCanvasPositionFromScrollingFrame,
		[ReactModule.Change.AbsoluteCanvasSize] = ScrollStore.setExtentsFromScrollingFrame,
		[ReactModule.Change.AbsoluteWindowSize] = ScrollStore.setExtentsFromScrollingFrame,
		ref = UseResult1
	}, {
		FlexItem = if p1.flexMode == nil then nil else ReactModule.createElement("UIFlexItem", { FlexMode = p1.flexMode }),
		Canvas = config.Canvas
	}) else ReactModule.createElement(ScrollView, {
		ClipsDescendants = false,
		scrollingFrameRef = UseResult1,
		selection = Frozen,
		scroll = UseMemoResult,
		onCanvasPositionChanged = UseResult,
		onAbsoluteCanvasSizeChanged = Callback,
		onAbsoluteWindowSizeChanged = Callback,
		tag = p1.containerTag or "size-full",
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, config)
end)