local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagBuildAdsUiPolishModule = require(BuildExperience.Flags.FFlagBuildAdsUiPolish)
local UseScrollPerformanceTrackerModule = require(BuildExperience.Telemetry.useScrollPerformanceTracker)
local IconButton = FoundationModule.IconButton
local Divider = FoundationModule.Divider
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), UseScrollPerformanceTrackerModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), ScrollView (copy), Divider (copy), FFlagBuildAdsUiPolishModule (copy)
	local TestId = p1.testId or "overflow-menu-page"
	local UseRefResult = ReactModule.useRef(nil)
	UseScrollPerformanceTrackerModule(p1.scrollPerformanceIntervalName or "BuildOverflowMenuPageShell", UseRefResult)
	local Element = ReactModule.createElement(View, {
		tag = {
			["composition-content-body"] = true,
			["col size-full"] = p1.disableScrolling == true,
			["col size-full-0 auto-y"] = p1.disableScrolling ~= true
		},
		testId = `{TestId}-content-body`
	}, { Content = p1.content })
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["composition-layout-detail"] = true,
			["col align-x-center size-full bg-surface-0"] = true
		},
		testId = TestId
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			},
			testId = `{TestId}-header`
		}, {
			Close = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = p1.closeIcon or IconName.ChevronLargeLeft,
				onActivated = p1.onClose,
				size = InputSize.Large,
				testId = `{TestId}-close`,
				variant = ButtonVariant.Utility
			}),
			Title = if p1.headerContent == nil then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = p1.title
			}) else ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "grow auto-y",
				testId = `{TestId}-header-content`
			}, { Content = p1.headerContent }),
			Trailing = if p1.headerTrailing == nil then nil else ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "auto-xy",
				testId = `{TestId}-header-trailing`
			}, { Content = p1.headerTrailing })
		}),
		Body = if p1.disableScrolling then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "fill size-full-0 bg-surface-0",
			testId = `{TestId}-body`
		}, { ContentBody = Element }) else ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0 bg-surface-0",
			scrollingFrameRef = UseRefResult,
			testId = `{TestId}-scroll-view`,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, { ContentBody = Element }),
		FooterDivider = if p1.footer == nil or p1.footerDivider == false then nil else ReactModule.createElement(Divider, { LayoutOrder = 3, testId = `{TestId}-footer-divider` }),
		Footer = if p1.footer == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 4,
			ZIndex = if FFlagBuildAdsUiPolishModule then 2 else nil,
			tag = {
				["composition-content-body"] = true,
				["size-full-0 auto-y"] = true
			},
			testId = `{TestId}-footer-body`
		}, { Footer = p1.footer })
	})
end