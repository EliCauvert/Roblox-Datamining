local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildBackButtonChevronModule = require(buildExperience.Flags.FFlagBuildBackButtonChevron)
local var5 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local iconButton = foundationModule.IconButton
local divider = foundationModule.Divider
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 36 | named "OverflowMenuPageShell" ]]
	-- upvalues: reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var5 (ref), view (ref), iconButton (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), scrollView (ref), divider (ref)
	local testId = p0.testId or "overflow-menu-page"
	local var7 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var5(p0.scrollPerformanceIntervalName, var7)
	end
	return reactModule.createElement(view, {
		tag = "col align-x-center size-full bg-surface-0",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-small",
			testId = `{testId}-header`
		}, {
			Close = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = p0.closeIcon or (if fFlagBuildBackButtonChevronModule then iconName.ChevronLargeLeft else iconName.X),
				onActivated = p0.onClose,
				size = inputSize.Medium,
				testId = `{testId}-close`,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = p0.title
			}),
			Trailing = if p0.headerTrailing ~= nil then nil else reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "auto-xy",
				testId = `{testId}-header-trailing`
			}, { Content = p0.headerTrailing })
		}),
		Body = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0 bg-surface-0",
			scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var7 else nil,
			testId = `{testId}-scroll-view`,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			ContentBody = reactModule.createElement(view, {
				tag = "composition-content-body col size-full-0 auto-y",
				testId = `{testId}-content-body`
			}, { Content = p0.content })
		}),
		FooterDivider = if p0.footer ~= nil then nil else reactModule.createElement(divider, { LayoutOrder = 3 }),
		Footer = if p0.footer ~= nil then nil else reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "composition-content-body size-full-0 auto-y",
			testId = `{testId}-footer-body`
		}, { Footer = p0.footer })
	})
end