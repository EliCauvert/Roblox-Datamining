local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(appPageShell.PageTypes)
local _ = require(appPageShell.createPageScrollStore)
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local frozen = table.freeze({ Selectable = false })
local frozen_1 = table.freeze({
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.new(1, 0, 0, 0),
	ScrollingDirection = Enum.ScrollingDirection.Y
})

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), scrollView (ref), frozen (ref), frozen_1 (ref), view (ref)
	local scrollStore = p1.scrollStore
	local slots = p1.slots
	local contentTopPadding = p1.contentTopPadding
	local contentBottomPadding = p1.contentBottomPadding
	local var1 = reactModule.useCallback(function(p2)
		-- upvalues: scrollStore (ref)
		scrollStore.setViewportHeight(p2.AbsoluteWindowSize.Y)
		scrollStore.setContentHeight(p2.AbsoluteCanvasSize.Y)
	end, { scrollStore })
	local scrollingFrameRef = p1.scrollingFrameRef
	
	return reactModule.createElement(scrollView, {
		ClipsDescendants = false,
		scrollingFrameRef = reactModule.useCallback(function(p2)
			-- upvalues: scrollStore (ref), scrollingFrameRef (ref)
			scrollStore.setScrollingFrame(p2)
			
			if scrollingFrameRef then
				scrollingFrameRef.current = p2
			end
		end, { scrollStore, scrollingFrameRef }),
		selection = frozen,
		scroll = frozen_1,
		onCanvasPositionChanged = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), scrollStore (ref)
			var1(p2)
			scrollStore.setCanvasPosition(p2.CanvasPosition.Y)
		end, { scrollStore, var1 }),
		onAbsoluteCanvasSizeChanged = var1,
		onAbsoluteWindowSizeChanged = var1,
		tag = p1.containerTag or "size-full",
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, {
		Canvas = reactModule.createElement(view, { tag = `col size-full-0 auto-y {p1.tag or ""}` }, {
			TopSpacer = if contentTopPadding and contentTopPadding > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, contentTopPadding)
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
		})
	})
end)