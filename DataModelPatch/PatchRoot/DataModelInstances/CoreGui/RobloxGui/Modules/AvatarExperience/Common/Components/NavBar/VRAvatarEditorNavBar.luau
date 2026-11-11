local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local SearchBarModule = require(Modules.LuaApp.Components.SearchBar)
local SearchUuidModule = require(Modules.LuaApp.SearchUuid)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local Panel3D = UIBloxModule.Core.VR.Panel3D
local CurrentTabContextModule = require(Modules.LuaApp.Navigation.CurrentTabContext)
local SwitchNavigatorVisibleContextModule = require(Modules.LuaApp.Navigation.SwitchNavigatorVisibleContext)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SegmentedControl = UIBloxModule.App.Control.SegmentedControl
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local VR = require(Modules.AvatarExperience.Common.Constants).VR
local SetSearchParametersModule = require(Modules.LuaApp.Actions.SetSearchParameters)
local SetSearchTypeModule = require(Modules.LuaApp.Actions.SetSearchType)
local CatalogSearchEventModule = require(Modules.LuaApp.Analytics.Events.catalogSearchEvent)
local ROUNDEDCORNERRADIUS = require(Modules.LuaApp.Constants).ROUNDED_CORNER_RADIUS
local IconsNavigationPushBack = Images["icons/navigation/pushBack"]
local IconsCommonSearch = Images["icons/common/search"]
local IconsMenuCustomize = Images["icons/menu/customize"]
local IconsMenuShop = Images["icons/menu/shop"]
local list = { AvatarScreen.AvatarEditor, AvatarScreen.Catalog }
local config = {
	[AvatarScreen.AvatarEditor] = 1,
	[AvatarScreen.MySharedAvatars] = 1,
	[AvatarScreen.CatalogSearch] = 2,
	[AvatarScreen.Catalog] = 2
}

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AppEventIngestServiceModule (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), IconButton (copy), IconsNavigationPushBack (copy), IconSize (copy), SearchUuidModule (copy), SetSearchTypeModule (copy), SearchTypes (copy), SetSearchParametersModule (copy), AvatarScreen (copy), CatalogSearchEventModule (copy), NavigationUtilsModule (copy), SearchBarModule (copy), ROUNDEDCORNERRADIUS (copy), SegmentedControl (copy), config (copy), list (copy), IconsMenuCustomize (copy), IconsMenuShop (copy), IconsCommonSearch (copy), CurrentTabContextModule (copy), SwitchNavigatorVisibleContextModule (copy), Panel3D (copy), VR (copy), WithLocalizationFunction (copy), HeaderBar (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppEventIngestServiceModule)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		shop = "Feature.Avatar.Action.Shop",
		customize = "Feature.Catalog.Action.Customize",
		searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
	})
	
	local function v36(OnActivated)
		-- upvalues: ReactModule (upval), IconButton (upval), IconsNavigationPushBack (upval), IconSize (upval), UseStyleResult (copy)
		return ReactModule.createElement(IconButton, {
			layoutOrder = 1,
			showBackground = true,
			size = UDim2.fromOffset(58, 58),
			icon = IconsNavigationPushBack,
			iconSize = IconSize.Medium,
			iconColor3 = UseStyleResult.Theme.SystemPrimaryDefault.Color,
			iconTransparency = UseStyleResult.Theme.SystemPrimaryDefault.Transparency,
			backgroundColor = {
				Color = UseStyleResult.Theme.BackgroundUIDefault.Color,
				Transparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency
			},
			onActivated = OnActivated
		})
	end
	
	local UseResult = ReactModule.useCallback(function(SearchKeyword, p2, p3)
		-- upvalues: SearchUuidModule (upval), UseDispatchResult (copy), SetSearchTypeModule (upval), SearchTypes (upval), SetSearchParametersModule (upval), AvatarScreen (upval), CatalogSearchEventModule (upval), UseRoactServiceModuleResult (copy), NavigationUtilsModule (upval), p1 (copy), UseStateResult2 (copy)
		local SearchUuidModuleResult = SearchUuidModule()
		local config = {
			isKeywordSuggestionEnabled = true,
			searchKeyword = SearchKeyword
		}
		UseDispatchResult(SetSearchTypeModule(SearchUuidModuleResult, SearchTypes.Catalog))
		UseDispatchResult(SetSearchParametersModule(SearchUuidModuleResult, config))
		CatalogSearchEventModule(UseRoactServiceModuleResult, "catalog", SearchKeyword, p2, AvatarScreen.CatalogSearch, p3)
		NavigationUtilsModule.navigateToSearch(p1.navigation, SearchUuidModuleResult, config)
		UseStateResult2(false)
	end)
	local v1 = nil
	local Element = nil
	local Element1 = nil
	local Title: string? = nil
	
	if UseStateResult then
		Element = ReactModule.createElement(SearchBarModule, {
			modernUI = true,
			onFocused = nil,
			onTextCleared = nil,
			isCompactView = false,
			autocomplete = true,
			Size = UDim2.new(1, 0, 1, -ROUNDEDCORNERRADIUS),
			cancelSearch = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end,
			confirmSearch = UseResult,
			placeholderText = UseLocalizationResult.searchPlaceholder,
			searchType = SearchTypes.Catalog,
			isSearching = UseStateResult
		})
	elseif p1.currentPage == AvatarScreen.LayeredClothingSort then
		v1 = v36(function()
			-- upvalues: p1 (copy), AvatarScreen (upval)
			p1.navigation.navigate(AvatarScreen.Catalog)
		end)
		Title = "Feature.Avatar.Title.LCSortPage"
	else
		Element = ReactModule.createElement(SegmentedControl, {
			layoutOrder = 2,
			height = 58,
			selectedTabIndex = config[p1.currentPage] or 1,
			onTabActivated = function(p2)
				-- upvalues: p1 (copy), list (upval)
				p1.navigation.navigate(list[p2])
			end,
			tabs = {
				{
					tabName = UseLocalizationResult.customize,
					icon = IconsMenuCustomize
				},
				{
					tabName = UseLocalizationResult.shop,
					icon = IconsMenuShop
				}
			},
			width = UDim.new(0, 350)
		})
		Element1 = if config[p1.currentPage] == 2 then ReactModule.createElement(IconButton, {
			layoutOrder = 3,
			showBackground = true,
			size = UDim2.fromOffset(58, 58),
			icon = IconsCommonSearch,
			iconSize = IconSize.Medium,
			iconColor3 = UseStyleResult.Theme.SystemPrimaryDefault.Color,
			iconTransparency = UseStyleResult.Theme.SystemPrimaryDefault.Transparency,
			backgroundColor = {
				Color = UseStyleResult.Theme.BackgroundUIDefault.Color,
				Transparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency
			},
			onActivated = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(true)
			end
		}) else nil
	end
	return ReactModule.createElement(CurrentTabContextModule.Consumer, {
		render = function(AvatarExperienceRoot)
			-- upvalues: ReactModule (upval), SwitchNavigatorVisibleContextModule (upval), Panel3D (upval), VR (upval), AvatarScreen (upval), UseStyleResult (copy), ROUNDEDCORNERRADIUS (upval), WithLocalizationFunction (upval), Title (ref), HeaderBar (upval), v1 (ref), Element (ref), Element1 (ref)
			return ReactModule.createElement(SwitchNavigatorVisibleContextModule.Consumer, {
				render = function(p2)
					-- upvalues: ReactModule (upval), Panel3D (upval), VR (upval), AvatarExperienceRoot (copy), AvatarScreen (upval), UseStyleResult (upval), ROUNDEDCORNERRADIUS (upval), WithLocalizationFunction (upval), Title (upval), HeaderBar (upval), v1 (upval), Element (upval), Element1 (upval)
					return ReactModule.createElement(Panel3D, {
						panelName = "AvatarNavBarVR",
						partSize = VR.AvatarEditorNavBarSize,
						offset = CFrame.lookAt(VR.AvatarEditorNavBarPosition, VR.AvatarEditorNavBarOrientation),
						virtualScreenSize = VR.AvatarEditorNavBarResolution,
						hidden = not p2 or AvatarExperienceRoot ~= AvatarScreen.AvatarExperienceRoot
					}, {
						RoundedFrame = ReactModule.createElement("Frame", {
							BackgroundTransparency = 0,
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
						}, {
							UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, ROUNDEDCORNERRADIUS) }),
							UIPadding = ReactModule.createElement("UIPadding", {
								PaddingRight = UDim.new(0, ROUNDEDCORNERRADIUS),
								PaddingLeft = UDim.new(0, ROUNDEDCORNERRADIUS)
							}),
							HeaderBar = WithLocalizationFunction({ title = Title })(function(p3)
								-- upvalues: ReactModule (upval), HeaderBar (upval), VR (upval), v1 (upval), Element (upval), Element1 (upval), Title (upval)
								return ReactModule.createElement(HeaderBar, {
									backgroundTransparency = 0,
									barHeight = VR.AvatarEditorNavBarResolution.Y,
									renderLeft = if v1 then function()
										-- upvalues: v1 (upval)
										return v1
									end else nil,
									renderCenter = Element and function()
										-- upvalues: Element (upval)
										return Element
									end or nil,
									renderRight = Element1 and function()
										-- upvalues: Element1 (upval)
										return Element1
									end or nil,
									title = Title and p3.title or nil
								})
							end)
						})
					})
				end
			})
		end
	})
end