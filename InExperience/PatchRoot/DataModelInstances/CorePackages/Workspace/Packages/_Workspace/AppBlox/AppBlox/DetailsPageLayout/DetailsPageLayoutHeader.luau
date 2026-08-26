local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = responsiveModule.useDeviceInsets
local detailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), reactModule (ref), detailsPageLayoutContextModule (ref), foundationModule (ref), responsiveModule (ref), iconButton (ref), view (ref)
	local var1 = useTokens()
	local var2 = useDeviceInsets()
	local var3 = reactModule.useContext(detailsPageLayoutContextModule)
	local setHasHeader = var3.setHasHeader
	reactModule.useEffect(function()
		-- upvalues: setHasHeader (ref)
		setHasHeader(true)
		
		return function()
			-- upvalues: setHasHeader (copy)
			setHasHeader(false)
		end
	end, { setHasHeader })
	local hasFullBleed = var3.hasFullBleed
	local headerBarHeight = var3.headerBarHeight
	local stickyHeaderActive = var3.stickyHeaderActive
	local headerOpacity = var3.headerOpacity
	local top = var2.top
	local onClose = var3.onClose
	local isFullscreenOverlay = var3.isFullscreenOverlay
	local onExitFullscreenOverlay = var3.onExitFullscreenOverlay
	local closeIconName = p1.closeIconName or foundationModule.Enums.IconName.ChevronLargeLeft
	local backgroundColor = p1.backgroundColor or var1.Color.Surface.Surface_0
	local var4 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local testId = var3.testId
	assert(testId, "DetailsPageLayout.Header must be used within DetailsPageLayout.Root")
	local var5 = if isFullscreenOverlay and onExitFullscreenOverlay then onExitFullscreenOverlay else onClose
	local var6 = if isFullscreenOverlay then foundationModule.Enums.IconName.ChevronLargeLeft else closeIconName
	local var7 = if isFullscreenOverlay then nil else headerOpacity
	local var8 = if hasFullBleed and var7 then var7:map(function(p3)
		return p3 >= 0.5
	end) else nil
	local var9 = p1.children and (if hasFullBleed then var7 else not hasFullBleed or stickyHeaderActive)
	local var10 = if var5 then reactModule.createElement(iconButton, {
		variant = foundationModule.Enums.ButtonVariant.Utility,
		size = if var4 then foundationModule.Enums.InputSize.Medium else foundationModule.Enums.InputSize.Large,
		icon = var6,
		onActivated = var5,
		testId = if testId then `{testId}--close-button` else nil
	}) else nil
	
	return reactModule.createElement(view, {
		ZIndex = 2,
		tag = "col",
		Size = UDim2.new(1, 0, 0, headerBarHeight),
		backgroundStyle = if hasFullBleed and var7 then var7:map(function(p3)
			-- upvalues: backgroundColor (ref)
			return {
				Color3 = backgroundColor.Color3,
				Transparency = math.lerp(1, backgroundColor.Transparency, p3)
			}
		end) else {
			Color3 = backgroundColor.Color3,
			Transparency = backgroundColor.Transparency
		},
		ref = p2
	}, {
		HeaderContent = if p1.fullWidthContent then reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-full-0" }, {
			CloseButtonOverlay = if var10 then reactModule.createElement(view, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, if var4 then var1.Padding.Medium else var1.Padding.XLarge, 0.5, math.floor(top / 2)),
				tag = {
					["auto-xy radius-medium"] = p1.backgroundColor ~= nil,
					["auto-xy radius-medium bg-over-media-0"] = p1.backgroundColor == nil
				},
				backgroundStyle = if p1.backgroundColor then {
					Color3 = backgroundColor.Color3,
					Transparency = backgroundColor.Transparency
				} else nil
			}, { CloseButton = var10 }) else nil,
			Children = if var9 then reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 1, -top),
				Position = UDim2.new(0, 0, 0, top),
				Visible = var8
			}, {
				Content = reactModule.createElement(reactModule.Fragment, nil, p1.children)
			}) else nil
		}) else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-y-center fill size-full-0 auto-y padding-x-medium"] = var4,
				["row align-y-center fill size-full-0 auto-y padding-x-xlarge"] = not var4
			},
			padding = if top > 0 then { top = UDim.new(0, top) } else nil
		}, {
			Container = if var10 then reactModule.createElement(view, {
				tag = {
					["auto-xy radius-medium"] = p1.backgroundColor ~= nil,
					["auto-xy radius-medium bg-over-media-0"] = p1.backgroundColor == nil
				},
				backgroundStyle = if p1.backgroundColor then {
					Color3 = backgroundColor.Color3,
					Transparency = backgroundColor.Transparency
				} else nil
			}, { CloseButton = var10 }) else nil,
			Children = if var9 then reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = 1, Visible = var8 }, {
				Content = reactModule.createElement(reactModule.Fragment, nil, p1.children)
			}) else nil
		}),
		BottomBorder = reactModule.createElement(view, {
			LayoutOrder = 2,
			backgroundStyle = if var7 then var7:map(function(p3)
				-- upvalues: var1 (ref)
				return {
					Color3 = var1.Color.Stroke.Muted.Color3,
					Transparency = math.lerp(1, var1.Color.Stroke.Muted.Transparency, p3)
				}
			end) else {
				Color3 = var1.Color.Stroke.Muted.Color3,
				Transparency = var1.Color.Stroke.Muted.Transparency
			},
			testId = if testId then `{testId}--header--bottom-border` else nil,
			Size = UDim2.new(1, 0, 0, var1.Stroke.Standard)
		})
	})
end))