local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local GroupsModule = require(CorePackages.Workspace.Packages.Groups)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AppPageModule = require(Modules.LuaApp.AppPage)
local ContainerModule = require(Modules.LuaApp.Navigation.AndroidBackButtonNavigationHandler.Container)
local IsRootRouteInRNModule = require(Modules.LuaApp.Navigation.isRootRouteInRN)
local UrlBuilderModule = require(CorePackages.Packages.UrlBuilder)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local UrlBase = UrlBuilderModule.UrlBase
local GroupsNavigatorWithProviders = GroupsModule.Navigation.GroupsNavigatorWithProviders
local GroupsWrapperContext = GroupsModule.Contexts.GroupsWrapperContext

local function v15(_)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseLocalUserIdFunction (copy), UseNavigationPropsFunction (copy), ReactModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), UrlBuilder (copy), UrlBase (copy), GroupsWrapperContext (copy), GroupsNavigatorWithProviders (copy), ContainerModule (copy), IsRootRouteInRNModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UserId = UseNavigationPropsFunction(function(UserId, _)
		return { userId = UserId }
	end).userId or (UseLocalUserIdResult and tostring(UseLocalUserIdResult) or "")
	local UseResult = ReactModule.useCallback(function(Detail)
		-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval)
		local config = { name = AppPageModule.GenericWebPage, detail = Detail }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownModule(config))
		end
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function(GroupId)
		-- upvalues: UseResult (copy), UrlBuilder (upval)
		UseResult(UrlBuilder.user.group({ groupId = GroupId }))
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UrlBuilder (upval), UrlBase (upval)
		UseResult(UrlBuilder.new({ path = "search/communities", base = UrlBase.WWW })())
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UrlBuilder (upval), UrlBase (upval)
		UseResult(UrlBuilder.new({ path = "communities/create", base = UrlBase.WWW })())
	end, { UseResult })
	
	return ReactModule.createElement(GroupsWrapperContext.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy), UserId (copy)
			return {
				navigateTo = {
					webView = UseResult,
					groupDetails = UseResult1,
					seeAllGroups = UseResult2,
					createGroup = UseResult3
				},
				userId = UserId
			}
		end, {
			UseResult,
			UseResult1,
			UseResult2,
			UseResult3,
			UserId
		})
	}, {
		GroupsNavigator = ReactModule.createElement(GroupsNavigatorWithProviders, {}),
		AndroidBackButtonNavigationHandler = ReactModule.createElement(ContainerModule, {
			canGoBackInRN = not IsRootRouteInRNModule(UseNavigationResult.state),
			navigateBackInRN = UseNavigationResult.pop
		})
	})
end

local ClassWrapper = ReactModule.PureComponent:extend("classWrapper")

function ClassWrapper.render(p1)
	-- upvalues: ReactModule (copy), v15 (copy)
	return ReactModule.createElement(v15, p1.props)
end

return ClassWrapper