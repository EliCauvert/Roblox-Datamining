local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AppBloxModule = require(Parent.AppBlox)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local FFlagSduiPageEntryUseSharedHooks = require(Parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local GetSidebarEntryIdentifierModule = require(Groups.Common.getSidebarEntryIdentifier)
local GroupOverviewPaneModule = require(Groups.Components.GroupOverviewPane)
local GroupSidebarSkeletonModule = require(script.Parent.GroupSidebarSkeleton)
local GroupSidebarHeaderBarModule = require(script.Parent.GroupSidebarHeaderBar)

local function pageEntry(p1, p2, UseSignalStateResult, LoadingSlot)
	-- upvalues: ReactModule (copy), SduiSharedUtilitiesModule (copy), AppPage (copy), FFlagSduiPageEntryUseSharedHooks (copy)
	local IsGroupSidebar = p2 == "groupSidebar"
	
	return ReactModule.createElement(SduiSharedUtilitiesModule.SduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		disableRootPadding = true,
		appPage = AppPage.Groups,
		routeName = p1.routeName,
		configKey = p1.configKey,
		identifier = if UseSignalStateResult == nil or FFlagSduiPageEntryUseSharedHooks then UseSignalStateResult else `{p1.configKey}_{UseSignalStateResult}`,
		pageTimer = if IsGroupSidebar then p1.pageTimer else nil,
		refresh = p1.refresh,
		loadingSlot = LoadingSlot
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), SignalsModule (copy), GetSidebarEntryIdentifierModule (copy), SignalsReactModule (copy), GroupSidebarHeaderBarModule (copy), pageEntry (copy), GroupSidebarSkeletonModule (copy), GroupOverviewPaneModule (copy), AppBloxModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ShowOverview = p1.showOverview
	local SelectedId = p1.selectedId
	local Element = ReactModule.createElement(FoundationModule.View, {
		testId = "GroupSidebarPage.Sidebar",
		LayoutOrder = 1,
		tag = "col bg-surface-0",
		Size = if ShowOverview then UDim2.new(0, p1.sidebarWidth, 1, 0) else UDim2.fromScale(1, 1)
	}, {
		Header = ReactModule.createElement(GroupSidebarHeaderBarModule, {
			LayoutOrder = 1,
			title = p1.title,
			createLabel = p1.createLabel,
			canCreate = p1.canCreate,
			onBack = p1.onClose,
			onCreate = p1.onCreate,
			isCompactTouch = p1.isCompactTouch
		}),
		Content = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = {
				["fill size-full-0"] = true,
				["padding-top-medium"] = not p1.isCompactTouch
			}
		}, {
			Entry = pageEntry(p1, "groupSidebar", SignalsReactModule.useSignalState((ReactModule.useMemo(function()
				-- upvalues: SignalsModule (upval), GetSidebarEntryIdentifierModule (upval), p1 (copy)
				return SignalsModule.createComputed(function(p2)
					-- upvalues: GetSidebarEntryIdentifierModule (upval), p1 (upval)
					return GetSidebarEntryIdentifierModule(p1.configKey, p2)
				end)
			end, { p1.configKey }))), ReactModule.createElement(GroupSidebarSkeletonModule))
		})
	})
	local Element1 = if ShowOverview then ReactModule.createElement(FoundationModule.View, {
		LayoutOrder = 2,
		tag = "fill size-0-full clip",
		testId = "GroupSidebarPage.Overview"
	}, {
		Content = if SelectedId and SelectedId ~= "" then if p1.isOverviewEmbedded then pageEntry(p1, "overviewPane", "overviewPane") else ReactModule.createElement(GroupOverviewPaneModule, { source = "communitySidebar", groupId = SelectedId }) else nil
	}) else nil
	
	return ReactModule.createElement(AppBloxModule.FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
	}, {
		Layout = ReactModule.createElement(FoundationModule.View, { tag = "size-full", testId = "GroupSidebarPage" }, {
			Content = if ShowOverview then ReactModule.createElement(FoundationModule.View, { tag = "row size-full" }, { Sidebar = Element, Overview = Element1 }) else Element
		})
	})
end)