local CorePackages = game:GetService("CorePackages")
local Actions = require(CorePackages.Packages.RoactNavigation).Actions
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Packages.Dash)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AxRnNavutils = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.navutils")
local AvatarExperienceActionsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(Modules.AvatarExperience.Catalog.SearchTypes)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXGuardNavStateNil = AvatarExperienceFlagsModule.FFlagAXGuardNavStateNil
local FFlagAXGuardNavStateTraversal = AvatarExperienceFlagsModule.FFlagAXGuardNavStateTraversal
local NavigationUtils = {
	instantTransitionConfig = function()
		return {
			transitionSpec = { frequency = 100000, dampingRatio = 1 }
		}
	end
}

function NavigationUtils.navigateToSearch(p1, Detail, SearchParams)
	-- upvalues: NavigationUtils (copy), AvatarScreen (copy), AvatarExperienceActionsModule (copy), Actions (copy)
	NavigationUtils.closeFiltersAndItemDetails(p1)
	NavigationUtils.closeTryOnManager(p1)
	p1.dispatch(AvatarExperienceActionsModule.clearScreens({
		AvatarScreen.CatalogSearch,
		AvatarScreen.CatalogSearchLanding
	}))
	p1.dispatch(Actions.navigate({
		routeName = AvatarScreen.CatalogSearch,
		params = { detail = Detail, searchParams = SearchParams },
		key = tostring(Detail)
	}))
end

function NavigationUtils.isWithinViewContext(p1, Name): boolean
	-- upvalues: CryoModule (copy), Logging (copy)
	if p1 and p1.previousPages and #Name > 0 then
		return #CryoModule.List.filter(p1.previousPages, function(p2): boolean
			-- upvalues: Name (copy)
			return p2.name == Name
		end) > 0
	else
		Logging.warn("NavigationUtils.isWithinViewContext() failed because you forget to provide a valid avatarRoute")
		
		return false
	end
end

function NavigationUtils.isFirstItemDetailsPage(p1)
	return p1 and p1.getParam("isFirstItemDetails")
end

function NavigationUtils.closeFocusedScreen(p1)
	-- upvalues: Actions (copy)
	p1.dispatch(Actions.back(nil))
end

function NavigationUtils.closeFiltersAndItemDetails(p1)
	-- upvalues: AvatarScreen (copy), FFlagAXEnableExpiredUserLookCheckout (copy), AvatarExperienceActionsModule (copy)
	local ExpiredUserLookActionBars = {
		AvatarScreen.ItemDetails,
		AvatarScreen.SortAndFilters,
		AvatarScreen.OutfitDetails,
		AvatarScreen.LookDetails
	}
	
	if FFlagAXEnableExpiredUserLookCheckout then
		table.insert(ExpiredUserLookActionBars, AvatarScreen.ExpiredUserLookActionBar)
	end
	p1.dispatch(AvatarExperienceActionsModule.clearScreens(ExpiredUserLookActionBars))
end

function NavigationUtils.closeExpiredUserLookActionBar(p1)
	-- upvalues: AvatarExperienceActionsModule (copy), AvatarScreen (copy)
	p1.dispatch(AvatarExperienceActionsModule.clearScreens({ AvatarScreen.ExpiredUserLookActionBar }))
end

function NavigationUtils.closeMySharedAvatars(p1)
	-- upvalues: AvatarScreen (copy), AvatarExperienceActionsModule (copy)
	p1.dispatch(AvatarExperienceActionsModule.clearScreens({ AvatarScreen.MySharedAvatars, AvatarScreen.LookDetails }))
end

function NavigationUtils.closeLookComposer(p1)
	-- upvalues: AvatarScreen (copy), AvatarExperienceActionsModule (copy)
	p1.dispatch(AvatarExperienceActionsModule.clearScreens({ AvatarScreen.LookComposerPage, AvatarScreen.LookDetails }))
end

function NavigationUtils.closeSearchLandingPageFocusedWidget(p1)
	-- upvalues: AvatarScreen (copy), AvatarExperienceActionsModule (copy)
	p1.dispatch(AvatarExperienceActionsModule.clearScreens({ AvatarScreen.SearchLandingFocusedWidgetPage }))
end

function NavigationUtils.closeSearchLandingPage(p1)
	-- upvalues: AvatarScreen (copy), AvatarExperienceActionsModule (copy)
	p1.dispatch(AvatarExperienceActionsModule.clearScreens({ AvatarScreen.CatalogSearchLanding }))
end

function NavigationUtils.closeTryOnManager(p1, p2)
	-- upvalues: AvatarScreen (copy), AvatarExperienceActionsModule (copy)
	p1.dispatch(AvatarExperienceActionsModule.clearScreens(if p2 then p2 else { AvatarScreen.TryOnManager, AvatarScreen.LookDetails }))
end

function NavigationUtils.getRootNavigation(DangerouslyGetParentResult)
	local DangerouslyGetParentResult1 = DangerouslyGetParentResult
	while DangerouslyGetParentResult1 do
		DangerouslyGetParentResult = DangerouslyGetParentResult1
		DangerouslyGetParentResult1 = DangerouslyGetParentResult._dangerouslyGetParent and DangerouslyGetParentResult._dangerouslyGetParent() or nil
	end
	return DangerouslyGetParentResult
end

function NavigationUtils.closeAllDialogs(p1)
	-- upvalues: AvatarScreen (copy)
	p1.navigate(AvatarScreen.AvatarExperienceMainStackNavigator)
end

local function OnOverlayClosed() end

local function _(p1)
	return p1 and p1.state and p1.state.routeName or "<UnknownRoute>"
end

local _ = function(OnOverlayClosed1): string
	-- upvalues: OnOverlayClosed (copy)
	return if OnOverlayClosed1 == OnOverlayClosed then "no-op" elseif OnOverlayClosed1 == nil then "nil" else "callback"
end

function NavigationUtils.removeOnOverlayClosed(p1)
	-- upvalues: OnOverlayClosed (copy), AxRnNavutils (copy)
	local OnOverlayClosed1 = (p1.state.params or {}).onOverlayClosed
	
	if OnOverlayClosed1 then
		p1.setParams({ onOverlayClosed = OnOverlayClosed })
	end
	if AxRnNavutils.active[AxRnNavutils.Levels.Debug] then
		AxRnNavutils:debug("removeOnOverlayClosed, routeName={}", p1 and p1.state and p1.state.routeName or "<UnknownRoute>")
	end
	return OnOverlayClosed1
end

function NavigationUtils.invokeOnOverlayClosed(p1)
	-- upvalues: AxRnNavutils (copy), OnOverlayClosed (copy)
	local OnOverlayClosedParam: () -> () = p1.getParam("onOverlayClosed")
	
	if AxRnNavutils.active[AxRnNavutils.Levels.Debug] then
		AxRnNavutils:debug("invokeOnOverlayClosed, routeName={}, onOverlayClosed={}", p1 and p1.state and p1.state.routeName or "<UnknownRoute>", if OnOverlayClosedParam == OnOverlayClosed then "no-op" elseif OnOverlayClosedParam == nil then "nil" else "callback")
	end
	if OnOverlayClosedParam then
		OnOverlayClosedParam()
	end
end

function NavigationUtils.closeOverlay(p1)
	-- upvalues: NavigationUtils (copy)
	NavigationUtils.invokeOnOverlayClosed(p1)
	p1.goBack()
end

function NavigationUtils.navigateFromOverlay(p1, ...)
	-- upvalues: NavigationUtils (copy)
	NavigationUtils.invokeOnOverlayClosed(p1)
	p1.navigate(...)
end

function NavigationUtils.navigateToNextOverlay(p1, p2, p3, ...)
	-- upvalues: NavigationUtils (copy), AxRnNavutils (copy), OnOverlayClosed (copy), CryoModule (copy)
	local RemoveOnOverlayClosedResult = NavigationUtils.removeOnOverlayClosed(p1)
	
	if AxRnNavutils.active[AxRnNavutils.Levels.Debug] then
		AxRnNavutils:debug("navigateToNextOverlay {} -> {}, onOverlayClosed={}", p1 and p1.state and p1.state.routeName or "<UnknownRoute>", p2, if RemoveOnOverlayClosedResult == OnOverlayClosed then "no-op" elseif RemoveOnOverlayClosedResult == nil then "nil" else "callback")
	end
	p1.replace(p2, CryoModule.Dictionary.join(p3 or {}, { onOverlayClosed = RemoveOnOverlayClosedResult }), ...)
end

function NavigationUtils.getActiveScreenNavigationState(Route)
	-- upvalues: FFlagAXGuardNavStateTraversal (copy), FFlagAXGuardNavStateNil (copy)
	local Route1 = Route
	
	if FFlagAXGuardNavStateTraversal then
		while true do
			if Route1 and Route1.routes then
				Route1 = Route1.routes[Route1.index]
			else
				break
			end
		end
	elseif FFlagAXGuardNavStateNil and not Route then
		return nil
	else
		while Route1.routes do
			Route1 = Route1.routes[Route1.index]
		end
	end
	return Route1
end

return NavigationUtils