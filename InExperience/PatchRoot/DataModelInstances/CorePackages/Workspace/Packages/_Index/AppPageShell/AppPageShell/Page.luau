local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = require(Parent.Foundation).View
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local PageContextModule = require(AppPageShell.PageContext)
local PageStickyHeaderModule = require(AppPageShell.PageStickyHeader)
local _ = require(AppPageShell.PageTypes)
local PageWholeContentModule = require(AppPageShell.PageWholeContent)
local PullToRefreshSpinnerModule = require(AppPageShell.PullToRefreshSpinner)
local CreateFeedContextAdapterModule = require(AppPageShell.createFeedContextAdapter)
local CreatePageScrollStoreModule = require(AppPageShell.createPageScrollStore)
local ResolveCompositionTagsModule = require(AppPageShell.resolveCompositionTags)
local ComputeStickyOffsetModule = require(AppPageShell.computeStickyOffset)
local FFlagSduiFeedScrollBarFixes = require(Parent.SharedFlags).FFlagSduiFeedScrollBarFixes
local Frozen = table.freeze({
	contentMode = require(AppPageShell.PageConstants).PageContentMode.Scroll,
	content = table.freeze({})
})

local function _(p1, p2)
	return if p2 then `{p1} {p2}` else p1
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: Frozen (copy), FFlagSduiFeedScrollBarFixes (copy), UseDeviceInsetsFunction (copy), ReactModule (copy), ComputeStickyOffsetModule (copy), CreatePageScrollStoreModule (copy), CreateFeedContextAdapterModule (copy), SignalsModule (copy), ResolveCompositionTagsModule (copy), PageWholeContentModule (copy), PullToRefreshSpinnerModule (copy), PageContextModule (copy), View (copy), PageStickyHeaderModule (copy)
	local ContentConfig = p1.contentConfig or Frozen
	local ContentMode = ContentConfig.contentMode
	local OnScrollToEnd = p1.onScrollToEnd
	local OnScrollToEndThreshold = p1.onScrollToEndThreshold
	local Composition = p1.composition
	local Chrome = p1.chrome
	local StickyHeaderSlot = p1.stickyHeaderSlot
	local Height = if Chrome then Chrome.height else 0
	local ScrollAwayHeight = if Chrome then Chrome.scrollAwayHeight or Chrome.height else 0
	local LiveHeightBinding = if Chrome then Chrome.liveHeightBinding else nil
	local UseMemoResult = nil
	
	if FFlagSduiFeedScrollBarFixes then
		local Top = UseDeviceInsetsFunction().top
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: LiveHeightBinding (copy), Height (copy), ComputeStickyOffsetModule (upval), ScrollAwayHeight (copy), Top (copy)
			return if LiveHeightBinding == nil or Height <= 0 then nil else LiveHeightBinding:map(function(p2): number
				-- upvalues: ComputeStickyOffsetModule (upval), ScrollAwayHeight (upval), Top (upval), Height (upval)
				return (math.clamp(-ComputeStickyOffsetModule(p2, ScrollAwayHeight, Top), 0, Height))
			end)
		end, { LiveHeightBinding, Height, ScrollAwayHeight, Top })
	end
	local UseRefResult = ReactModule.useRef(OnScrollToEnd)
	UseRefResult.current = OnScrollToEnd
	local UseMemoResult1 = ReactModule.useMemo(CreatePageScrollStoreModule, {})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: CreateFeedContextAdapterModule (upval), UseMemoResult1 (copy), UseRefResult1 (copy)
		return CreateFeedContextAdapterModule(UseMemoResult1, UseRefResult1)
	end, { UseMemoResult1, UseRefResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult2 (copy)
		return function()
			-- upvalues: UseMemoResult2 (upval)
			UseMemoResult2.destroy()
		end
	end, { UseMemoResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy), OnScrollToEndThreshold (copy)
		UseMemoResult1.setEndReachedThreshold(OnScrollToEndThreshold)
	end, { UseMemoResult1, OnScrollToEndThreshold })
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseMemoResult1 (copy), UseRefResult (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseMemoResult1 (upval), UseRefResult (upval)
			if UseMemoResult1.getIsEndReached(p2) and UseRefResult.current ~= nil then
				UseRefResult.current()
			end
		end)
	end, { UseMemoResult1 })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: ResolveCompositionTagsModule (upval), Composition (copy)
		return ResolveCompositionTagsModule(Composition)
	end, { Composition })
	local Element = ReactModule.createElement(PageWholeContentModule, {
		layoutOrder = 3,
		zIndex = 1,
		scrollStore = UseMemoResult1,
		scrollingFrameRef = UseRefResult1,
		slots = ContentConfig.content.contentSlot,
		contentTopPadding = p1.contentTopPadding,
		contentBottomPadding = p1.contentBottomPadding,
		chromeDisplacement = if FFlagSduiFeedScrollBarFixes then UseMemoResult else nil,
		tag = UseMemoResult3.body,
		containerTag = if FFlagSduiFeedScrollBarFixes then nil else "fill size-full-0",
		size = if FFlagSduiFeedScrollBarFixes then UDim2.new(1, 0, 0, 0) else nil,
		flexMode = if FFlagSduiFeedScrollBarFixes then Enum.UIFlexMode.Fill else nil
	})
	local OnRefresh = p1.onRefresh
	local Element1 = if OnRefresh == nil then nil else ReactModule.createElement(PullToRefreshSpinnerModule, {
		LayoutOrder = 2,
		onRefresh = OnRefresh,
		scrollingFrameRef = UseRefResult1,
		appEventName = p1.appEventName
	})
	local CreateElementFunction2 = ReactModule.createElement
	local Provider = PageContextModule.Provider
	local config = {
		value = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult2 (copy), UseMemoResult1 (copy), ContentMode (copy)
			return {
				scrollViewPositionChangedSignal = UseMemoResult2.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = UseMemoResult2.verticalScrollingFrameRef,
				scrollStore = UseMemoResult1,
				contentMode = ContentMode
			}
		end, { UseMemoResult1, UseMemoResult2, ContentMode })
	}
	local t = {}
	local CreateElementFunction1 = ReactModule.createElement
	local config1 = {
		tag = "col size-full",
		padding = ReactModule.useMemo(function()
			-- upvalues: Height (copy), FFlagSduiFeedScrollBarFixes (upval), UseMemoResult (ref)
			return if Height <= 0 then nil elseif FFlagSduiFeedScrollBarFixes and UseMemoResult ~= nil then table.freeze({
				top = UseMemoResult:map(function(p2): UDim
					-- upvalues: Height (upval)
					return UDim.new(0, Height - p2)
				end)
			}) else table.freeze({ top = UDim.new(0, Height) })
		end, { Height, UseMemoResult })
	}
	local t1 = {}
	local CreateElementFunction = ReactModule.createElement
	local Root = UseMemoResult3.root
	local config2 = {
		tag = if Root then `col size-full {Root}` else "col size-full",
		ref = Ref
	}
	local t2 = {}
	local Element2 = nil
	
	if StickyHeaderSlot ~= nil and next(StickyHeaderSlot) ~= nil then
		local Header = UseMemoResult3.header
		Element2 = ReactModule.createElement(PageStickyHeaderModule, {
			slots = StickyHeaderSlot,
			chromeHeight = ScrollAwayHeight,
			liveChromeHeightBinding = if FFlagSduiFeedScrollBarFixes then nil else LiveHeightBinding,
			backgroundStyle = p1.stickyBackgroundStyle,
			tag = if Header then `col size-full-0 auto-y {Header}` else "col size-full-0 auto-y",
			topPadding = p1.stickyTopPadding
		})
	else
		Element2 = nil
	end
	t2.Sticky = Element2
	t2.Refresh = Element1
	t2.Content = Element
	t1.Root = CreateElementFunction(View, config2, t2)
	t.ChromeInset = CreateElementFunction1(View, config1, t1)
	
	return CreateElementFunction2(Provider, config, t)
end))