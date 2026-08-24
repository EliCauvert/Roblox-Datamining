local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local reactModule = require(parent.React)
local searchBarContainerModule = require(buildExperience.Components.SearchBar.SearchBarContainer)
local searchEmptyStateModule = require(buildExperience.Components.SearchEmptyState.SearchEmptyState)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local headerBar = foundationModule.HeaderBar
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 39 | named "SearchPageView" ]]
	-- upvalues: reactModule (ref), searchEmptyStateModule (ref), view (ref), fFlagBuildDesktopReadinessModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), searchBarContainerModule (ref), headerBar (ref), refreshScrollingFrame (ref)
	local var7 = reactModule.createElement(view, {
		tag = "composition-content-body col size-full-0 auto-y",
		testId = "SearchPage.ContentBody"
	}, if p0.showEmptyState then {
		EmptyState = reactModule.createElement(searchEmptyStateModule, { testId = "SearchPage.EmptyState" })
	} else {
		Content = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			testId = "SearchPage.Content"
		}, p0.children)
	})
	local var8 = reactModule.createElement(view, {
		tag = "composition-content-body row align-y-center gap-small size-full",
		testId = "SearchPage.SearchBarContentBody"
	}, {
		Back = reactModule.createElement(iconButton, {
			LayoutOrder = 1,
			isCircular = true,
			testId = "SearchPage.Back",
			icon = iconName.ChevronLargeLeft,
			onActivated = p0.onBack,
			size = inputSize.Large,
			variant = buttonVariant.Utility
		}),
		Search = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill auto-y" }, {
			SearchBar = reactModule.createElement(searchBarContainerModule, p0.searchBarProps)
		})
	})
	
	return reactModule.createElement(view, { tag = "col size-full", testId = "SearchPage" }, {
		Header = reactModule.createElement(headerBar.Root, { LayoutOrder = 1, testId = "SearchPage.Header" }, {
			Content = reactModule.createElement(headerBar.Content, nil, {
				Layout = if fFlagBuildDesktopReadinessModule then reactModule.createElement(view, {
					tag = "composition-layout-detail size-full",
					testId = "SearchPage.SearchBarLayout"
				}, { ContentBody = var8 }) else var8
			})
		}),
		Results = reactModule.createElement(refreshScrollingFrame, {
			usesBuilderIcon = true,
			createFooter = p0.createFooter,
			onCanvasPositionChangedCallback = p0.onCanvasPositionChangedCallback,
			onCanvasSizeChangedCallback = p0.onCanvasSizeChangedCallback,
			ref = p0.scrollingFrameRef,
			refresh = p0.refresh,
			scrollingElementProps = p0.scrollingElementProps
		}, if fFlagBuildDesktopReadinessModule then {
			ContentLayout = reactModule.createElement(view, {
				tag = "composition-layout-detail size-full-0 auto-y",
				testId = "SearchPage.ContentLayout"
			}, { ContentBody = var7 })
		} else { ContentBody = var7 })
	})
end