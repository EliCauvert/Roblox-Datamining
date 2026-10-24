local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local BuildTabStripModule = require(BuildExperience.Components.BuildTabStrip.BuildTabStrip)
local _ = require(script.Parent.useBuildHomeTabsViewModel)
local View = require(Parent.Foundation).View
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local BUILDHOMETAB = require(BuildExperience.Stores.GetBuildHomeTabStore.createBuildHomeTabStore).BUILD_HOME_TAB

return function(Frame)
	-- upvalues: CreateNextOrderFunction (copy), ReactModule (copy), View (copy), BuildTabStripModule (copy), BUILDHOMETAB (copy)
	local TabOrder = Frame.tabOrder
	local IsSliding = Frame.isSliding
	local NextOrder = CreateNextOrderFunction()
	
	return ReactModule.createElement(View, {
		tag = "col fill size-full",
		testId = "BuildHomeTabs",
		LayoutOrder = Frame.LayoutOrder
	}, {
		TabsLayout = if Frame.showTabs then ReactModule.createElement(View, {
			tag = "composition-layout-detail size-full-0 auto-y",
			LayoutOrder = NextOrder()
		}, {
			TabsBody = ReactModule.createElement(View, { tag = "composition-content-body col size-full-0 auto-y" }, {
				Tabs = ReactModule.createElement(BuildTabStripModule, {
					testId = "BuildHomeTabs.Tabs",
					activeTabId = Frame.activeTab,
					onActivated = Frame.onTabActivated,
					tabs = Frame.tabs
				})
			})
		}) else nil,
		Panes = ReactModule.createElement(View, {
			tag = "fill size-full clip",
			testId = "BuildHomeTabs.Panes",
			LayoutOrder = NextOrder()
		}, {
			PageLayout = ReactModule.createElement("UIPageLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				EasingStyle = Enum.EasingStyle.Quad,
				EasingDirection = Enum.EasingDirection.Out,
				Circular = false,
				GamepadInputEnabled = false,
				ScrollWheelInputEnabled = false,
				TouchInputEnabled = false,
				[ReactModule.Event.Stopped] = Frame.onStopped,
				ref = Frame.layoutRef
			}),
			GamesPage = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "BuildHomeTabs.GamesPage",
				LayoutOrder = TabOrder[BUILDHOMETAB.Games]
			}, {
				Content = ReactModule.createElement(View, {
					tag = "size-full",
					testId = "BuildHomeTabs.GamesContent",
					Visible = Frame.activeTab == BUILDHOMETAB.Games or IsSliding
				}, { Content = Frame.gamesContent })
			}),
			PreviewsPage = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "BuildHomeTabs.PreviewsPage",
				LayoutOrder = TabOrder[BUILDHOMETAB.Previews]
			}, {
				Content = ReactModule.createElement(View, {
					tag = "size-full",
					testId = "BuildHomeTabs.PreviewsContent",
					Visible = Frame.activeTab == BUILDHOMETAB.Previews or IsSliding
				}, { Content = Frame.previewsContent })
			})
		})
	})
end