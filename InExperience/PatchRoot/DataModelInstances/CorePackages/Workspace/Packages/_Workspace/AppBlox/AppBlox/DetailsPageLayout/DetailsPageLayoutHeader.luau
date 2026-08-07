local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = responsiveModule.useDeviceInsets
local detailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 45 | named "DetailsPageLayoutHeader" ]]
	-- upvalues: useTokens (ref), useDeviceInsets (ref), reactModule (ref), detailsPageLayoutContextModule (ref), foundationModule (ref), responsiveModule (ref), iconButton (ref), view (ref)
	local var4 = useTokens()
	local var5 = useDeviceInsets()
	local var6 = reactModule.useContext(detailsPageLayoutContextModule)
	local setHasHeader = var6.setHasHeader
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: setHasHeader (ref)
		setHasHeader(true)
		
		return function() --[[ line: 53 ]]
			-- upvalues: setHasHeader (copy)
			setHasHeader(false)
		end
	end, { setHasHeader })
	local hasFullBleed = var6.hasFullBleed
	local headerBarHeight = var6.headerBarHeight
	local stickyHeaderActive = var6.stickyHeaderActive
	local headerOpacity = var6.headerOpacity
	local top = var5.top
	local onClose = var6.onClose
	local isFullscreenOverlay = var6.isFullscreenOverlay
	local onExitFullscreenOverlay = var6.onExitFullscreenOverlay
	local closeIconName = p0.closeIconName or foundationModule.Enums.IconName.ChevronLargeLeft
	local backgroundColor = p0.backgroundColor or var4.Color.Surface.Surface_0
	local var9 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local testId = var6.testId
	assert(testId, "DetailsPageLayout.Header must be used within DetailsPageLayout.Root")
	local var10 = if isFullscreenOverlay and onExitFullscreenOverlay then onExitFullscreenOverlay else onClose
	local var11 = if isFullscreenOverlay then foundationModule.Enums.IconName.ChevronLargeLeft else closeIconName
	local var12 = if isFullscreenOverlay then nil else headerOpacity
	local var13 = if hasFullBleed and var12 then var12:map(function(p2) --[[ line: 85 ]]
		return p2 >= 0.5
	end) else nil
	local var14 = p0.children and (if hasFullBleed then var12 else not hasFullBleed or stickyHeaderActive)
	local var15 = if var10 then reactModule.createElement(iconButton, {
		variant = foundationModule.Enums.ButtonVariant.Utility,
		size = if var9 then foundationModule.Enums.InputSize.Medium else foundationModule.Enums.InputSize.Large,
		icon = var11,
		onActivated = var10,
		testId = if testId then `{testId}--close-button` else nil
	}) else nil
	
	return reactModule.createElement(view, {
		ZIndex = 2,
		tag = "col",
		Size = UDim2.new(1, 0, 0, headerBarHeight),
		backgroundStyle = if hasFullBleed and var12 then var12:map(function(p3) --[[ line: 179 ]]
			-- upvalues: backgroundColor (ref)
			return {
				Color3 = backgroundColor.Color3,
				Transparency = math.lerp(1, backgroundColor.Transparency, p3)
			}
		end) else {
			Color3 = backgroundColor.Color3,
			Transparency = backgroundColor.Transparency
		},
		ref = p1
	}, {
		HeaderContent = if p0.fullWidthContent then reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-full-0" }, {
			CloseButtonOverlay = if var15 then reactModule.createElement(view, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, if var9 then var4.Padding.Medium else var4.Padding.XLarge, 0.5, math.floor(top / 2)),
				tag = {
					["auto-xy radius-medium"] = p0.backgroundColor ~= nil,
					["auto-xy radius-medium bg-over-media-0"] = p0.backgroundColor == nil
				},
				backgroundStyle = if p0.backgroundColor then {
					Color3 = backgroundColor.Color3,
					Transparency = backgroundColor.Transparency
				} else nil
			}, { CloseButton = var15 }) else nil,
			Children = if var14 then reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 1, -top),
				Position = UDim2.new(0, 0, 0, top),
				Visible = var13
			}, {
				Content = reactModule.createElement(reactModule.Fragment, nil, p0.children)
			}) else nil
		}) else reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-y-center fill size-full-0 auto-y padding-x-medium"] = var9,
				["row align-y-center fill size-full-0 auto-y padding-x-xlarge"] = not var9
			},
			padding = if top > 0 then { top = UDim.new(0, top) } else nil
		}, {
			Container = if var15 then reactModule.createElement(view, {
				tag = {
					["auto-xy radius-medium"] = p0.backgroundColor ~= nil,
					["auto-xy radius-medium bg-over-media-0"] = p0.backgroundColor == nil
				},
				backgroundStyle = if p0.backgroundColor then {
					Color3 = backgroundColor.Color3,
					Transparency = backgroundColor.Transparency
				} else nil
			}, { CloseButton = var15 }) else nil,
			Children = if var14 then reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = 1, Visible = var13 }, {
				Content = reactModule.createElement(reactModule.Fragment, nil, p0.children)
			}) else nil
		}),
		BottomBorder = reactModule.createElement(view, {
			LayoutOrder = 2,
			backgroundStyle = if var12 then var12:map(function(p4) --[[ line: 191 ]]
				-- upvalues: var4 (ref)
				return {
					Color3 = var4.Color.Stroke.Muted.Color3,
					Transparency = math.lerp(1, var4.Color.Stroke.Muted.Transparency, p4)
				}
			end) else {
				Color3 = var4.Color.Stroke.Muted.Color3,
				Transparency = var4.Color.Stroke.Muted.Transparency
			},
			testId = if testId then `{testId}--header--bottom-border` else nil,
			Size = UDim2.new(1, 0, 0, var4.Stroke.Standard)
		})
	})
end))