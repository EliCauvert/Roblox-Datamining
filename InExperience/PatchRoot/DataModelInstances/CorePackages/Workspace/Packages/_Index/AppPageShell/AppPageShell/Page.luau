local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local signalsModule = require(parent.Signals)
local view = foundationModule.View
local useDeviceInsets = responsiveModule.useDeviceInsets
local pageConstantsModule = require(appPageShell.PageConstants)
local pageContextModule = require(appPageShell.PageContext)
local pageStickyHeaderModule = require(appPageShell.PageStickyHeader)
local _ = require(appPageShell.PageTypes)
local pageWholeContentModule = require(appPageShell.PageWholeContent)
local pullToRefreshSpinnerModule = require(appPageShell.PullToRefreshSpinner)
local createFeedContextAdapterModule = require(appPageShell.createFeedContextAdapter)
local createPageScrollStoreModule = require(appPageShell.createPageScrollStore)
local resolveCompositionTagsModule = require(appPageShell.resolveCompositionTags)
local computeStickyOffsetModule = require(appPageShell.computeStickyOffset)
local fFlagSduiFeedScrollBarFixes = require(parent.SharedFlags).FFlagSduiFeedScrollBarFixes
local frozen = table.freeze({
	contentMode = pageConstantsModule.PageContentMode.Scroll,
	content = table.freeze({})
})

local function _(p1, p2)
	return if p2 then `{p1} {p2}` else p1
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: frozen (ref), fFlagSduiFeedScrollBarFixes (ref), useDeviceInsets (ref), reactModule (ref), computeStickyOffsetModule (ref), createPageScrollStoreModule (ref), createFeedContextAdapterModule (ref), signalsModule (ref), resolveCompositionTagsModule (ref), pageWholeContentModule (ref), pullToRefreshSpinnerModule (ref), pageContextModule (ref), view (ref), pageStickyHeaderModule (ref)
	local contentConfig = p1.contentConfig or frozen
	local contentMode = contentConfig.contentMode
	local onScrollToEnd = p1.onScrollToEnd
	local onScrollToEndThreshold = p1.onScrollToEndThreshold
	local composition = p1.composition
	local chrome = p1.chrome
	local stickyHeaderSlot = p1.stickyHeaderSlot
	local var1 = if chrome then chrome.height else 0
	local var2 = if chrome then chrome.scrollAwayHeight or chrome.height else 0
	local var3 = if chrome then chrome.liveHeightBinding else nil
	local var4 = nil
	
	if fFlagSduiFeedScrollBarFixes then
		local top = useDeviceInsets().top
		var4 = reactModule.useMemo(function()
			-- upvalues: var3 (ref), var1 (ref), computeStickyOffsetModule (copy), var2 (ref), top (ref)
			return if var3 == nil or var1 <= 0 then nil else var3:map(function(p3)
				-- upvalues: computeStickyOffsetModule (copy), var2 (copy), top (copy), var1 (copy)
				return math.clamp(-computeStickyOffsetModule(p3, var2, top), 0, var1)
			end)
		end, { var3, var1, var2, top })
	end
	local var5
	local var6 = reactModule.useRef(onScrollToEnd)
	var6.current = onScrollToEnd
	local var7 = reactModule.useMemo(createPageScrollStoreModule, {})
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useMemo(function()
		-- upvalues: createFeedContextAdapterModule (copy), var7 (ref), var8 (ref)
		return createFeedContextAdapterModule(var7, var8)
	end, { var7, var8 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref)
		return function()
			-- upvalues: var9 (copy)
			var9.destroy()
		end
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), onScrollToEndThreshold (ref)
		var7.setEndReachedThreshold(onScrollToEndThreshold)
	end, { var7, onScrollToEndThreshold })
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var7 (ref), var6 (ref)
		return signalsModule.createEffect(function(p3)
			-- upvalues: var7 (copy), var6 (copy)
			if var7.getIsEndReached(p3) and var6.current ~= nil then
				var6.current()
			end
		end)
	end, { var7 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), fFlagSduiFeedScrollBarFixes (copy), var4 (write)
		return if var1 <= 0 then nil elseif fFlagSduiFeedScrollBarFixes and var4 ~= nil then table.freeze({
			top = var4:map(function(p3)
				-- upvalues: var1 (copy)
				return UDim.new(0, var1 - p3)
			end)
		}) else table.freeze({ top = UDim.new(0, var1) })
	end, { var1, var4 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), var7 (ref), contentMode (ref)
		return {
			scrollViewPositionChangedSignal = var9.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = var9.verticalScrollingFrameRef,
			scrollStore = var7,
			contentMode = contentMode
		}
	end, { var7, var9, contentMode })
	local var12 = reactModule.useMemo(function()
		-- upvalues: resolveCompositionTagsModule (copy), composition (ref)
		return resolveCompositionTagsModule(composition)
	end, { composition })
	local var13 = reactModule.createElement(pageWholeContentModule, {
		layoutOrder = 3,
		zIndex = 1,
		scrollStore = var7,
		scrollingFrameRef = var8,
		slots = contentConfig.content.contentSlot,
		contentTopPadding = p1.contentTopPadding,
		contentBottomPadding = p1.contentBottomPadding,
		chromeDisplacement = if fFlagSduiFeedScrollBarFixes then var4 else nil,
		tag = var12.body,
		containerTag = if fFlagSduiFeedScrollBarFixes then nil else "fill size-full-0",
		size = if fFlagSduiFeedScrollBarFixes then UDim2.new(1, 0, 0, 0) else nil,
		flexMode = if fFlagSduiFeedScrollBarFixes then Enum.UIFlexMode.Fill else nil
	})
	local onRefresh = p1.onRefresh
	local var14 = if onRefresh ~= nil then nil else reactModule.createElement(pullToRefreshSpinnerModule, {
		LayoutOrder = 2,
		onRefresh = onRefresh,
		scrollingFrameRef = var8,
		appEventName = p1.appEventName
	})
	local var15 = stickyHeaderSlot ~= nil and next(stickyHeaderSlot) ~= nil
	local createElement = reactModule.createElement
	local provider = pageContextModule.Provider
	local t = { value = var11 }
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = { tag = "col size-full", padding = var10 }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {}
	local root = var12.root
	t_4.tag = if root then `col size-full {root}` else "col size-full"
	t_4.ref = p2
	local t_5 = {}
	
	if var15 then
		var5 = reactModule.createElement
		local var16 = pageStickyHeaderModule
		local t_6 = {
			slots = stickyHeaderSlot,
			chromeHeight = var2,
			liveChromeHeightBinding = if fFlagSduiFeedScrollBarFixes then nil else var3,
			backgroundStyle = p1.stickyBackgroundStyle
		}
		local header = var12.header
		t_6.tag = if header then `col size-full-0 auto-y {header}` else "col size-full-0 auto-y"
		t_6.topPadding = p1.stickyTopPadding
		var5 = var5(var16, t_6)
	else
		var5 = nil
	end
	t_5.Sticky = var5
	t_5.Refresh = var14
	t_5.Content = var13
	t_3.Root = createElement_2(view, t_4, t_5)
	t_1.ChromeInset = createElement_1(view, t_2, t_3)
	
	return createElement(provider, t, t_1)
end))