local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useAnimateScrollViewToSelection = require(parent.AppBlox).useAnimateScrollViewToSelection
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local collectionLayoutStoreProvider = require(parent.CollectionViews).CollectionLayoutStoreProvider
local _ = require(appPageShell.PageTypes)
local _ = require(appPageShell.createPageScrollStore)
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiFeedScrollBarFixes = sharedFlagsModule.FFlagSduiFeedScrollBarFixes
local fFlagSduiPageCanvasCollectionLayout = sharedFlagsModule.FFlagSduiPageCanvasCollectionLayout
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies
local frozen = table.freeze({ Selectable = false })

return reactModule.memo(function(p1)
	-- upvalues: fFlagSduiFeedScrollBarFixes (ref), fFlagSduiPageCanvasCollectionLayout (ref), reactModule (ref), useAnimateScrollViewToSelection (ref), useLastInputMode (ref), useTokens (ref), isSubjectToDesktopPolicies (ref), view (ref), collectionLayoutStoreProvider (ref), scrollView (ref), frozen (ref)
	local scrollStore = p1.scrollStore
	local slots = p1.slots
	local contentTopPadding = p1.contentTopPadding
	local contentBottomPadding = p1.contentBottomPadding
	local var1 = if fFlagSduiFeedScrollBarFixes then p1.chromeDisplacement else nil
	local scrollingFrameRef = p1.scrollingFrameRef
	local var2 = nil
	local var3 = nil
	
	if fFlagSduiPageCanvasCollectionLayout then
		local var4, var5 = reactModule.useState(nil)
		var2 = var4
		var3 = var5
	end
	useAnimateScrollViewToSelection(scrollingFrameRef, 0.4)
	local isNotCursor = useLastInputMode() ~= "Cursor"
	local var6 = nil
	local var7 = nil
	local var8 = nil
	
	if fFlagSduiFeedScrollBarFixes then
		var6 = useTokens()
		var7 = if isSubjectToDesktopPolicies() then 4 else 0
	else
		var8 = reactModule.useMemo(function()
			-- upvalues: isNotCursor (ref)
			return table.freeze({
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = not isNotCursor
			})
		end, { isNotCursor })
	end
	local var9 = nil
	local var10 = nil
	
	if not fFlagSduiFeedScrollBarFixes then
		var9 = reactModule.useCallback(function(p2)
			-- upvalues: scrollStore (ref)
			scrollStore.setViewportHeight(p2.AbsoluteWindowSize.Y)
			scrollStore.setContentHeight(p2.AbsoluteCanvasSize.Y)
		end, { scrollStore })
		var10 = reactModule.useCallback(function(p2)
			-- upvalues: var9 (write), scrollStore (ref)
			if var9 ~= nil then
				var9(p2)
			end
			scrollStore.setCanvasPosition(p2.CanvasPosition.Y)
		end, { scrollStore, var9 })
	end
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: scrollStore (ref), scrollingFrameRef (ref)
		scrollStore.setScrollingFrame(p2)
		scrollingFrameRef.current = p2
	end, { scrollStore, scrollingFrameRef })
	local t = {
		TopSpacer = if contentTopPadding and contentTopPadding > 0 or var1 ~= nil then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = if fFlagSduiFeedScrollBarFixes then if fFlagSduiFeedScrollBarFixes then reactModule.useMemo(function()
				-- upvalues: var1 (ref), contentTopPadding (ref)
				return if var1 == nil then UDim2.new(1, 0, 0, contentTopPadding or 0) else var1:map(function(p2)
					-- upvalues: contentTopPadding (copy)
					return UDim2.new(1, 0, 0, (contentTopPadding or 0) + p2)
				end)
			end, { var1, contentTopPadding }) else nil else UDim2.new(1, 0, 0, contentTopPadding)
		}) else nil,
		Content = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, reactModule.useMemo(function()
			-- upvalues: slots (ref)
			if slots == nil then
				return nil
			end
			local t = {}
			
			for i, v in slots do
				t[`Content{i}`] = v
			end
			return t
		end, { slots })),
		BottomSpacer = if contentBottomPadding and contentBottomPadding > 0 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, contentBottomPadding)
		}) else nil
	}
	
	if fFlagSduiPageCanvasCollectionLayout then
		t = reactModule.createElement(collectionLayoutStoreProvider, { container = var2 }, t)
	end
	local t_1 = {
		Canvas = reactModule.createElement(view, {
			tag = `col size-full-0 auto-y {p1.tag or ""}`,
			ref = if fFlagSduiPageCanvasCollectionLayout then var3 else nil
		}, t)
	}
	
	return if fFlagSduiFeedScrollBarFixes then reactModule.createElement("ScrollingFrame", {
		Size = p1.size or UDim2.fromScale(1, 1),
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		AutoLocalize = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(1, 0, 0, 0),
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollingEnabled = not isNotCursor,
		Selectable = false,
		ClipsDescendants = true,
		ScrollBarThickness = var7,
		ScrollBarImageColor3 = var6.Color.Shift.Shift_400.Color3,
		ScrollBarImageTransparency = 0,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		[reactModule.Change.CanvasPosition] = scrollStore.setCanvasPositionFromScrollingFrame,
		[reactModule.Change.AbsoluteCanvasSize] = scrollStore.setExtentsFromScrollingFrame,
		[reactModule.Change.AbsoluteWindowSize] = scrollStore.setExtentsFromScrollingFrame,
		ref = var11
	}, {
		FlexItem = if p1.flexMode ~= nil then nil else reactModule.createElement("UIFlexItem", { FlexMode = p1.flexMode }),
		Canvas = t_1.Canvas
	}) else reactModule.createElement(scrollView, {
		ClipsDescendants = false,
		scrollingFrameRef = var11,
		selection = frozen,
		scroll = var8,
		onCanvasPositionChanged = var10,
		onAbsoluteCanvasSizeChanged = var9,
		onAbsoluteWindowSizeChanged = var9,
		tag = p1.containerTag or "size-full",
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, t_1)
end)