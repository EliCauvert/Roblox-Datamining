local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildBackButtonChevronModule = require(buildExperience.Flags.FFlagBuildBackButtonChevron)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local var1 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local iconButton = foundationModule.IconButton
local divider = foundationModule.Divider
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var1 (ref), view (ref), fFlagBuildDesktopReadinessModule (ref), iconButton (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), scrollView (ref), divider (ref)
	local testId = p1.testId or "overflow-menu-page"
	local var2 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var1(p1.scrollPerformanceIntervalName, var2)
	end
	local var3 = reactModule.createElement(view, {
		tag = {
			["composition-content-body"] = true,
			["col size-full"] = p1.disableScrolling == true,
			["col size-full-0 auto-y"] = p1.disableScrolling ~= true
		},
		testId = `{testId}-content-body`
	}, { Content = p1.content })
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["composition-layout-detail"] = fFlagBuildDesktopReadinessModule,
			["col align-x-center size-full bg-surface-0"] = true
		},
		testId = testId
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["composition-content-header"] = true,
				["row align-y-center gap-small size-full-0 auto-y padding-y-small"] = true
			},
			testId = `{testId}-header`
		}, {
			Close = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = p1.closeIcon or (if fFlagBuildBackButtonChevronModule then iconName.ChevronLargeLeft else iconName.X),
				onActivated = p1.onClose,
				size = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium,
				testId = `{testId}-close`,
				variant = buttonVariant.Utility
			}),
			Title = if p1.headerContent ~= nil then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = p1.title
			}) else reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "grow auto-y",
				testId = `{testId}-header-content`
			}, { Content = p1.headerContent }),
			Trailing = if p1.headerTrailing ~= nil then nil else reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "auto-xy",
				testId = `{testId}-header-trailing`
			}, { Content = p1.headerTrailing })
		}),
		Body = if p1.disableScrolling then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "fill size-full-0 bg-surface-0",
			testId = `{testId}-body`
		}, { ContentBody = var3 }) else reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0 bg-surface-0",
			scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var2 else nil,
			testId = `{testId}-scroll-view`,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, { ContentBody = var3 }),
		FooterDivider = if p1.footer == nil or p1.footerDivider == false then nil else reactModule.createElement(divider, { LayoutOrder = 3, testId = `{testId}-footer-divider` }),
		Footer = if p1.footer ~= nil then nil else reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = {
				["composition-content-body"] = true,
				["size-full-0 auto-y"] = true
			},
			testId = `{testId}-footer-body`
		}, { Footer = p1.footer })
	})
end