local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local VerticalEfficiencyExperimentation = require(CorePackages.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local TopBarConstantsModule = require(Modules.LuaApp.Components.TopBar.TopBarConstants)
local UserInfoModule = require(Modules.LuaApp.Components.GridHome.Header.UserInfo)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppMoveProfileIntoTopBar = SharedFlagsModule.FFlagLuaAppMoveProfileIntoTopBar
local FFlagLuaAppMoveProfileIntoTopBarIXP = SharedFlagsModule.FFlagLuaAppMoveProfileIntoTopBarIXP
local FFlagSearchTopResultsTabEnabledForAll = SharedFlagsModule.FFlagSearchTopResultsTabEnabledForAll
local FFlagLuaAppEnableChartsPageProfileLink = SharedFlagsModule.FFlagLuaAppEnableChartsPageProfileLink
local FFlagEnableHomeRobloxLogo = SharedFlagsModule.FFlagEnableHomeRobloxLogo
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagLuaAppChartsStickyHeader = SharedFlagsModule.FFlagLuaAppChartsStickyHeader

local function _(XOffset)
	-- upvalues: ReactModule (copy)
	return function()
		-- upvalues: ReactModule (upval), XOffset (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, XOffset, 1, 0)
		})
	end
end

local Callback = if FFlagLuaAppEnableChartsPageProfileLink then function(Source)
	-- upvalues: ReactModule (copy), UserInfoModule (copy)
	return function(_)
		-- upvalues: ReactModule (upval), UserInfoModule (upval), Source (copy)
		return ReactModule.createElement(UserInfoModule, { source = Source })
	end
end else nil

return function(p1)
	-- upvalues: UseUserExperimentFunction (copy), AppUserLayers (copy), FFlagSearchTopResultsTabEnabledForAll (copy), UseSelectorFunction (copy), FFlagLuaAppEnableChartsPageProfileLink (copy), Callback (ref), UserInfoModule (copy), ReactModule (copy), TopBarModule (copy), TopBarConstantsModule (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FFlagLuaAppMoveProfileIntoTopBarIXP (copy), VerticalEfficiencyExperimentation (copy), FFlagLuaAppChartsStickyHeader (copy), FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy), SearchTypes (copy)
	local UseUserExperimentResult, UseUserExperimentResult2 = UseUserExperimentFunction({ AppUserLayers.OmniSearchResultsPageUXExposureLayer }, function(p2)
		-- upvalues: AppUserLayers (upval), FFlagSearchTopResultsTabEnabledForAll (upval)
		local v1 = p2[AppUserLayers.OmniSearchResultsPageUXExposureLayer] or {}
		local IsSearchTypeAuto = v1.isSearchTypeAuto
		
		if FFlagSearchTopResultsTabEnabledForAll then
			return IsSearchTypeAuto, nil
		else
			return IsSearchTypeAuto, v1.isTopPageEnabled
		end
	end, false)
	local IsXBelow: boolean? = nil
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local RightItems = nil
	
	if p1.useGridPageLayout then
		local XOffset = 0
		RightItems = {
			if FFlagLuaAppEnableChartsPageProfileLink then Callback(p1.profileSource) else UserInfoModule,
			function()
				-- upvalues: ReactModule (upval), XOffset (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, XOffset, 1, 0)
				})
			end,
			TopBarModule.SearchButton,
			TopBarModule.BuyRobuxButton,
			TopBarModule.NotificationsButton
		}
		IsXBelow = UseSelectorResult.X < TopBarConstantsModule.COMPACT_WIDTH_BREAKPOINT
	else
		RightItems = {
			TopBarModule.SearchButton,
			TopBarModule.BuyRobuxButton,
			TopBarModule.NotificationsButton
		}
	end
	local NoFFlagLuaAppMoveProfileIntoTopBarIXP = if FFlagLuaAppMoveProfileIntoTopBar then not p1.useGridPageLayout and (not FFlagLuaAppMoveProfileIntoTopBarIXP or VerticalEfficiencyExperimentation.getIsProfileMovedToTopBar()) else nil
	
	return ReactModule.createElement(TopBarModule.Container, {
		tag = p1.tag,
		titleText = p1.titleText,
		ZIndex = if FFlagLuaAppChartsStickyHeader and p1.zIndexOverride then p1.zIndexOverride else 2,
		forceCompactMode = IsXBelow,
		leftItem = if FFlagLuaAppMoveProfileIntoTopBar and NoFFlagLuaAppMoveProfileIntoTopBarIXP then TopBarModule.PersonalizationLeftItem elseif FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then TopBarModule.PersonalizationLeftItem else TopBarModule.BackButton,
		rightItems = RightItems,
		searchType = if FFlagSearchTopResultsTabEnabledForAll or UseUserExperimentResult2 then SearchTypes.TopResults elseif UseUserExperimentResult then SearchTypes.Auto else nil,
		sideMarginOverride = p1.sideMarginOverride
	})
end