local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseDeviceInsetsFunction = ResponsiveModule.useDeviceInsets
local DetailsPageLayoutContextModule = require(script.Parent.DetailsPageLayoutContext)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), ReactModule (copy), DetailsPageLayoutContextModule (copy), FoundationModule (copy), ResponsiveModule (copy), IconButton (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseContextResult = ReactModule.useContext(DetailsPageLayoutContextModule)
	local SetHasHeaderFunction = UseContextResult.setHasHeader
	ReactModule.useEffect(function()
		-- upvalues: SetHasHeaderFunction (copy)
		SetHasHeaderFunction(true)
		
		return function()
			-- upvalues: SetHasHeaderFunction (upval)
			SetHasHeaderFunction(false)
		end
	end, { SetHasHeaderFunction })
	local HasFullBleed = UseContextResult.hasFullBleed
	local HeaderBarHeight = UseContextResult.headerBarHeight
	local StickyHeaderActive = UseContextResult.stickyHeaderActive
	local HeaderOpacity = UseContextResult.headerOpacity
	local Top: number = UseDeviceInsetsResult.top
	local OnClose = UseContextResult.onClose
	local IsFullscreenOverlay = UseContextResult.isFullscreenOverlay
	local OnExitFullscreenOverlay = UseContextResult.onExitFullscreenOverlay
	local CloseIconName = p1.closeIconName or FoundationModule.Enums.IconName.ChevronLargeLeft
	local BackgroundColor = p1.backgroundColor or UseTokensResult.Color.Surface.Surface_0
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.Keys.Small)
	local TestId = UseContextResult.testId
	assert(TestId, "DetailsPageLayout.Header must be used within DetailsPageLayout.Root")
	local OnExitFullscreenOverlay1 = if IsFullscreenOverlay and OnExitFullscreenOverlay then OnExitFullscreenOverlay else OnClose
	local ChevronLargeLeft = if IsFullscreenOverlay then FoundationModule.Enums.IconName.ChevronLargeLeft else CloseIconName
	local HeaderOpacity1 = if IsFullscreenOverlay then nil else HeaderOpacity
	local MapResult = if HasFullBleed and HeaderOpacity1 then HeaderOpacity1:map(function(p2: number): boolean
		return p2 >= 0.5
	end) else nil
	local HeaderOpacity1_1 = p1.children and (HasFullBleed and HeaderOpacity1 or (not HasFullBleed or StickyHeaderActive))
	local Element = if OnExitFullscreenOverlay1 then ReactModule.createElement(IconButton, {
		variant = FoundationModule.Enums.ButtonVariant.Utility,
		size = if UseBreakpointXOrSmallerResult then FoundationModule.Enums.InputSize.Medium else FoundationModule.Enums.InputSize.Large,
		icon = ChevronLargeLeft,
		onActivated = OnExitFullscreenOverlay1,
		testId = if TestId then `{TestId}--close-button` else nil
	}) else nil
	
	return ReactModule.createElement(View, {
		ZIndex = 2,
		tag = "col",
		Size = UDim2.new(1, 0, 0, HeaderBarHeight),
		backgroundStyle = if HasFullBleed and HeaderOpacity1 then HeaderOpacity1:map(function(Alpha: number)
			-- upvalues: BackgroundColor (copy)
			return {
				Color3 = BackgroundColor.Color3,
				Transparency = math.lerp(1, BackgroundColor.Transparency, Alpha)
			}
		end) else {
			Color3 = BackgroundColor.Color3,
			Transparency = BackgroundColor.Transparency
		},
		ref = Ref
	}, {
		HeaderContent = if p1.fullWidthContent then ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill size-full-0" }, {
			CloseButtonOverlay = if Element then ReactModule.createElement(View, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, if UseBreakpointXOrSmallerResult then UseTokensResult.Padding.Medium else UseTokensResult.Padding.XLarge, 0.5, (math.floor(Top / 2))),
				tag = {
					["auto-xy radius-medium"] = p1.backgroundColor ~= nil,
					["auto-xy radius-medium bg-over-media-0"] = p1.backgroundColor == nil
				},
				backgroundStyle = if p1.backgroundColor then {
					Color3 = BackgroundColor.Color3,
					Transparency = BackgroundColor.Transparency
				} else nil
			}, { CloseButton = Element }) else nil,
			Children = if HeaderOpacity1_1 then ReactModule.createElement(View, {
				Size = UDim2.new(1, 0, 1, -Top),
				Position = UDim2.new(0, 0, 0, Top),
				Visible = MapResult
			}, {
				Content = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
			}) else nil
		}) else ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["row align-y-center fill size-full-0 auto-y padding-x-medium"] = UseBreakpointXOrSmallerResult,
				["row align-y-center fill size-full-0 auto-y padding-x-xlarge"] = not UseBreakpointXOrSmallerResult
			},
			padding = if Top > 0 then { top = UDim.new(0, Top) } else nil
		}, {
			Container = if Element then ReactModule.createElement(View, {
				tag = {
					["auto-xy radius-medium"] = p1.backgroundColor ~= nil,
					["auto-xy radius-medium bg-over-media-0"] = p1.backgroundColor == nil
				},
				backgroundStyle = if p1.backgroundColor then {
					Color3 = BackgroundColor.Color3,
					Transparency = BackgroundColor.Transparency
				} else nil
			}, { CloseButton = Element }) else nil,
			Children = if HeaderOpacity1_1 then ReactModule.createElement(View, {
				tag = "fill auto-y",
				LayoutOrder = 1,
				Visible = MapResult
			}, {
				Content = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
			}) else nil
		}),
		BottomBorder = ReactModule.createElement(View, {
			LayoutOrder = 2,
			backgroundStyle = if HeaderOpacity1 then HeaderOpacity1:map(function(Alpha: number)
				-- upvalues: UseTokensResult (copy)
				return {
					Color3 = UseTokensResult.Color.Stroke.Muted.Color3,
					Transparency = math.lerp(1, UseTokensResult.Color.Stroke.Muted.Transparency, Alpha)
				}
			end) else {
				Color3 = UseTokensResult.Color.Stroke.Muted.Color3,
				Transparency = UseTokensResult.Color.Stroke.Muted.Transparency
			},
			testId = if TestId then `{TestId}--header--bottom-border` else nil,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Stroke.Standard)
		})
	})
end))