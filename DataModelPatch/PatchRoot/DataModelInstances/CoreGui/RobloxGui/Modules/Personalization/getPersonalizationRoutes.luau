local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.Navigation)
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local CreateLazyComponentFunction = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local FFlagEnableTopSongsSort = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableTopSongsSort
local FFlagLuaAppSortDeeplinkFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix
local FFlagLuaAppBadgesSeeAllEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled
local FFlagLuaAppBadgeDetailsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgeDetailsEnabled
local FFlagLuaAppChartsAppPage = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppChartsAppPage
local FFlagLuaAppDevStoreSeeAllSduiEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDevStoreSeeAllSduiEnabled
local FFlagLuaAppSduiEventDetailsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local FFlagLuaAppSduiLandingPageEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiLandingPageEnabled
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
local FFlagAppIaHomeSubTab = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppIaHomeSubTab

return function()
	-- upvalues: AppPage (copy), CreateLazyComponentFunction (copy), Modules (copy), GlobalNavDisplayOption (copy), ScreenKind (copy), CorePackages (copy), FFlagLuaAppSduiLandingPageEnabled (copy), FFlagAppIaHomeSubTab (copy), FlyoutSidePanelIXP (copy), NavigationRoduxModule (copy), Default (copy), FFlagLuaAppChartsAppPage (copy), FFlagLuaAppBadgesSeeAllEnabled (copy), FFlagLuaAppBadgeDetailsEnabled (copy), FFlagLuaAppDevStoreSeeAllSduiEnabled (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), FFlagEnableTopSongsSort (copy), FFlagLuaAppSortDeeplinkFix (copy)
	local List = {
		{
			[AppPage.GamesList] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Games.GamesList)
				end),
				navigationOptions = {
					enableFocusRestoration = false,
					globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
				}
			}
		},
		{
			[AppPage.ExperienceDetail] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector)
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.SearchPage] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Search.AdaptiveSearchPage)
				end),
				navigationOptions = {
					enableFocusRestoration = false,
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		},
		{
			[AppPage.GameFilterMenuPeekView] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.GameFilters).FilterMenuPeekView
				end),
				navigationOptions = { transparent = true, overlayEnabled = false }
			}
		}
	}
	
	if FFlagLuaAppSduiLandingPageEnabled then
		table.insert(List, {
			[AppPage.SduiLandingPage] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SduiLandingPage).SduiLandingPage
				end),
				navigationOptions = { screenKind = ScreenKind.FullScreen }
			}
		})
	end
	if FFlagAppIaHomeSubTab and FlyoutSidePanelIXP.isHomeSubTabEnabled() then
		table.insert(List, {
			[NavigationRoduxModule.Constants.HomeContainerName] = {
				getScreen = function()
					-- upvalues: Modules (upval)
					return (require(Modules.Personalization.HomeContainer.HomeContainerPage))
				end
			}
		})
	else
		table.insert(List, {
			[AppPage.Home] = CreateLazyComponentFunction(function()
				-- upvalues: Default (upval), Modules (upval)
				Default:logEventOnce("lazily_require_home_page")
				
				return require(Modules.Personalization.Home.HomePage)
			end)
		})
		table.insert(List, {
			[AppPage.Games] = CreateLazyComponentFunction(function()
				-- upvalues: FFlagLuaAppChartsAppPage (upval), Modules (upval)
				return if FFlagLuaAppChartsAppPage then require(Modules.Personalization.Games.SduiChartsPage) else require(Modules.Personalization.Games.GamesPage)
			end)
		})
	end
	if FFlagLuaAppBadgesSeeAllEnabled then
		table.insert(List, {
			[AppPage.BadgesSeeAll] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.Badges).BadgesSeeAllPage
				end),
				navigationOptions = { screenKind = ScreenKind.FullScreen }
			}
		})
	end
	if FFlagLuaAppBadgeDetailsEnabled then
		table.insert(List, {
			[AppPage.BadgeDetails] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.Badges).BadgeDetailsPage
				end),
				navigationOptions = { transparent = true, absorbInput = true }
			}
		})
	end
	if FFlagLuaAppDevStoreSeeAllSduiEnabled then
		table.insert(List, {
			[AppPage.DevStoreSeeAll] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.DevStore).DevStoreSeeAllPage
				end),
				navigationOptions = { screenKind = ScreenKind.FullScreen }
			}
		})
	end
	if FFlagLuaAppSduiEventDetailsEnabled then
		table.insert(List, {
			[AppPage.EventDetails] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.VirtualEvents).SduiEventDetailsPage
				end),
				navigationOptions = { transparent = true, absorbInput = true }
			}
		})
	end
	if FFlagEnableTopSongsSort then
		table.insert(List, {
			[AppPage.SongDetail] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.SongDetails).SongDetailPage
				end),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		})
		table.insert(List, {
			[AppPage.SongList] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.Personalization.Songs.SongGridPage)
				end),
				navigationOptions = { screenKind = ScreenKind.FullScreen }
			}
		})
	end
	if FFlagLuaAppSortDeeplinkFix then
		table.insert(List, {
			[AppPage.DeeplinkGamesList] = {
				screen = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Games.DeeplinkGamesListWrapper)
				end),
				navigationOptions = {
					enableFocusRestoration = false,
					globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
				}
			}
		})
	end
	return List
end