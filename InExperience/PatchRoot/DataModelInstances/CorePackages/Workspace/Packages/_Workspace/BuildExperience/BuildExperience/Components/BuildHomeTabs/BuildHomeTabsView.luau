local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local BuildTabStripModule = require(BuildExperience.Components.BuildTabStrip.BuildTabStrip)
local _ = require(script.Parent.useBuildHomeTabsViewModel)
local View = require(Parent.Foundation).View
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local BUILDHOMETAB = require(BuildExperience.Stores.GetBuildHomeTabStore.createBuildHomeTabStore).BUILD_HOME_TAB

local function _(p1, p2, p3)
	return p3 or math.abs(p1 - p2) < 1
end

return function(Frame)
	-- upvalues: CreateNextOrderFunction (copy), ReactModule (copy), View (copy), BuildTabStripModule (copy), BUILDHOMETAB (copy)
	local TabOrder = Frame.tabOrder
	local PageOffset = Frame.pageOffset
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
					activeOffset = PageOffset,
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
			GamesPage = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "BuildHomeTabs.GamesPage",
				Position = PageOffset:map(function(p1): UDim2
					-- upvalues: TabOrder (copy), BUILDHOMETAB (upval)
					return UDim2.fromScale(TabOrder[BUILDHOMETAB.Games] - p1, 0)
				end)
			}, {
				Content = ReactModule.createElement(View, {
					tag = "size-full",
					testId = "BuildHomeTabs.GamesContent",
					Visible = PageOffset:map(function(p1): boolean
						-- upvalues: TabOrder (copy), BUILDHOMETAB (upval), Frame (copy)
						local TabOrderEntry = TabOrder[BUILDHOMETAB.Games]
						
						return Frame.activeTab == BUILDHOMETAB.Games or math.abs(TabOrderEntry - p1) < 1
					end)
				}, { Content = Frame.gamesContent })
			}),
			PreviewsPage = ReactModule.createElement(View, {
				tag = "size-full",
				testId = "BuildHomeTabs.PreviewsPage",
				Position = PageOffset:map(function(p1): UDim2
					-- upvalues: TabOrder (copy), BUILDHOMETAB (upval)
					return UDim2.fromScale(TabOrder[BUILDHOMETAB.Previews] - p1, 0)
				end)
			}, {
				Content = ReactModule.createElement(View, {
					tag = "size-full",
					testId = "BuildHomeTabs.PreviewsContent",
					Visible = PageOffset:map(function(p1): boolean
						-- upvalues: TabOrder (copy), BUILDHOMETAB (upval), Frame (copy)
						local TabOrderEntry = TabOrder[BUILDHOMETAB.Previews]
						
						return Frame.activeTab == BUILDHOMETAB.Previews or math.abs(TabOrderEntry - p1) < 1
					end)
				}, { Content = Frame.previewsContent })
			})
		})
	})
end