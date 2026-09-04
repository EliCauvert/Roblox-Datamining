local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = foundationModule.View
local pageConstantsModule = require(appPageShell.PageConstants)
local pageContextModule = require(appPageShell.PageContext)
local pageStickyHeaderModule = require(appPageShell.PageStickyHeader)
local _ = require(appPageShell.PageTypes)
local pageWholeContentModule = require(appPageShell.PageWholeContent)
local pullToRefreshSpinnerModule = require(appPageShell.PullToRefreshSpinner)
local createFeedContextAdapterModule = require(appPageShell.createFeedContextAdapter)
local createPageScrollStoreModule = require(appPageShell.createPageScrollStore)
local resolveCompositionTagsModule = require(appPageShell.resolveCompositionTags)
local frozen = table.freeze({
	contentMode = pageConstantsModule.PageContentMode.Scroll,
	content = table.freeze({})
})

local function _(p1, p2)
	return if p2 then `{p1} {p2}` else p1
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: frozen (ref), reactModule (ref), createPageScrollStoreModule (ref), createFeedContextAdapterModule (ref), signalsModule (ref), resolveCompositionTagsModule (ref), pageWholeContentModule (ref), pullToRefreshSpinnerModule (ref), pageContextModule (ref), view (ref), pageStickyHeaderModule (ref)
	local var1
	local contentConfig = p1.contentConfig or frozen
	local contentMode = contentConfig.contentMode
	local onScrollToEnd = p1.onScrollToEnd
	local onScrollToEndThreshold = p1.onScrollToEndThreshold
	local composition = p1.composition
	local chrome = p1.chrome
	local stickyHeaderSlot = p1.stickyHeaderSlot
	local var2 = if chrome then chrome.height else 0
	local var3 = if chrome then chrome.scrollAwayHeight or chrome.height else 0
	local var4 = if chrome then chrome.liveHeightBinding else nil
	local var5 = reactModule.useRef(onScrollToEnd)
	var5.current = onScrollToEnd
	local var6 = reactModule.useMemo(createPageScrollStoreModule, {})
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useMemo(function()
		-- upvalues: createFeedContextAdapterModule (copy), var6 (ref), var7 (ref)
		return createFeedContextAdapterModule(var6, var7)
	end, { var6, var7 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		return function()
			-- upvalues: var8 (copy)
			var8.destroy()
		end
	end, { var8 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), onScrollToEndThreshold (ref)
		var6.setEndReachedThreshold(onScrollToEndThreshold)
	end, { var6, onScrollToEndThreshold })
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var6 (ref), var5 (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var6 (copy), var5 (copy)
			if var6.getIsEndReached(p3) and var5.current ~= nil then
				var5.current()
			end
		end)
	end, { var6 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return if var2 <= 0 then nil else table.freeze({ top = UDim.new(0, var2) })
	end, { var2 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var6 (ref), contentMode (ref)
		return {
			scrollViewPositionChangedSignal = var8.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = var8.verticalScrollingFrameRef,
			scrollStore = var6,
			contentMode = contentMode
		}
	end, { var6, var8, contentMode })
	local var11 = reactModule.useMemo(function()
		-- upvalues: resolveCompositionTagsModule (copy), composition (ref)
		return resolveCompositionTagsModule(composition)
	end, { composition })
	local var12 = reactModule.createElement(pageWholeContentModule, {
		containerTag = "fill size-full-0",
		layoutOrder = 3,
		zIndex = 1,
		scrollStore = var6,
		scrollingFrameRef = var7,
		slots = contentConfig.content.contentSlot,
		contentTopPadding = p1.contentTopPadding,
		contentBottomPadding = p1.contentBottomPadding,
		tag = var11.body
	})
	local onRefresh = p1.onRefresh
	local var13 = if onRefresh ~= nil then nil else reactModule.createElement(pullToRefreshSpinnerModule, {
		LayoutOrder = 2,
		onRefresh = onRefresh,
		scrollingFrameRef = var7,
		appEventName = p1.appEventName
	})
	local var14 = stickyHeaderSlot ~= nil and next(stickyHeaderSlot) ~= nil
	local createElement = reactModule.createElement
	local provider = pageContextModule.Provider
	local t = { value = var10 }
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = { tag = "col size-full", padding = var9 }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {}
	local root = var11.root
	t_4.tag = if root then `col size-full {root}` else "col size-full"
	t_4.ref = p2
	local t_5 = {}
	
	if var14 then
		var1 = reactModule.createElement
		local var15 = pageStickyHeaderModule
		local t_6 = {
			slots = stickyHeaderSlot,
			chromeHeight = var3,
			liveChromeHeightBinding = var4,
			backgroundStyle = p1.stickyBackgroundStyle
		}
		local header = var11.header
		t_6.tag = if header then `col size-full-0 auto-y {header}` else "col size-full-0 auto-y"
		t_6.topPadding = p1.stickyTopPadding
		var1 = var1(var15, t_6)
	else
		var1 = nil
	end
	t_5.Sticky = var1
	t_5.Refresh = var13
	t_5.Content = var12
	t_3.Root = createElement_2(view, t_4, t_5)
	t_1.ChromeInset = createElement_1(view, t_2, t_3)
	
	return createElement(provider, t, t_1)
end))