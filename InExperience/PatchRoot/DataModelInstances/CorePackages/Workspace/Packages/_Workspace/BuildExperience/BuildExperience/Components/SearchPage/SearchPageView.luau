local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SearchBarContainerModule = require(BuildExperience.Components.SearchBar.SearchBarContainer)
local SearchEmptyStateModule = require(BuildExperience.Components.SearchEmptyState.SearchEmptyState)
local RefreshScrollingFrame = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.RefreshScrollingFrame
local HeaderBar = FoundationModule.HeaderBar
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), SearchEmptyStateModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), SearchBarContainerModule (copy), HeaderBar (copy), RefreshScrollingFrame (copy)
	return ReactModule.createElement(View, { tag = "col size-full", testId = "SearchPage" }, {
		Header = ReactModule.createElement(HeaderBar.Root, { LayoutOrder = 1, testId = "SearchPage.Header" }, {
			Content = ReactModule.createElement(HeaderBar.Content, nil, {
				Layout = ReactModule.createElement(View, {
					tag = "composition-layout-detail size-full",
					testId = "SearchPage.SearchBarLayout"
				}, {
					ContentBody = ReactModule.createElement(View, {
						tag = "composition-content-body row align-y-center gap-small size-full",
						testId = "SearchPage.SearchBarContentBody"
					}, {
						Back = ReactModule.createElement(IconButton, {
							LayoutOrder = 1,
							isCircular = true,
							testId = "SearchPage.Back",
							icon = IconName.ChevronLargeLeft,
							onActivated = p1.onBack,
							size = InputSize.Large,
							variant = ButtonVariant.Utility
						}),
						Search = ReactModule.createElement(View, { LayoutOrder = 2, tag = "fill auto-y" }, {
							SearchBar = ReactModule.createElement(SearchBarContainerModule, p1.searchBarProps)
						})
					})
				})
			})
		}),
		Results = ReactModule.createElement(RefreshScrollingFrame, {
			usesBuilderIcon = true,
			createFooter = p1.createFooter,
			onCanvasPositionChangedCallback = p1.onCanvasPositionChangedCallback,
			onCanvasSizeChangedCallback = p1.onCanvasSizeChangedCallback,
			ref = p1.scrollingFrameRef,
			refresh = p1.refresh,
			scrollingElementProps = p1.scrollingElementProps
		}, {
			ContentLayout = ReactModule.createElement(View, {
				tag = "composition-layout-detail size-full-0 auto-y",
				testId = "SearchPage.ContentLayout"
			}, {
				ContentBody = ReactModule.createElement(View, {
					tag = "composition-content-body col size-full-0 auto-y",
					testId = "SearchPage.ContentBody"
				}, if p1.showEmptyState then {
					EmptyState = ReactModule.createElement(SearchEmptyStateModule, { testId = "SearchPage.EmptyState" })
				} else {
					Content = ReactModule.createElement(View, {
						tag = "col size-full-0 auto-y",
						testId = "SearchPage.Content"
					}, p1.children)
				})
			})
		})
	})
end