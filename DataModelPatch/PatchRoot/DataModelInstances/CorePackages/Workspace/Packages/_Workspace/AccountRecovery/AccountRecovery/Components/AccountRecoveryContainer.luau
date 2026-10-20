local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UIBloxModule = require(Parent.UIBlox)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local DarkTheme = UIBloxModule.App.Style.Themes.DarkTheme
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseIOSStatusBarStylerFunction = require(Parent.RoactUtils).Hooks.useIOSStatusBarStyler
local _ = require(AccountRecovery.Store.State)
local AccountRecoveryContextProviderModule = require(AccountRecovery.Store.AccountRecoveryContextProvider)
local AccountRecoveryStackNavigatorModule = require(AccountRecovery.Navigators.AccountRecoveryStackNavigator)
local MemoizeResult = require(Parent.AppCommonLib).memoize(function(p1)
	-- upvalues: RoactNavigationModule (copy)
	return RoactNavigationModule.createAppContainer(p1)
end)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseStyleFunction (copy), MemoizeResult (copy), AccountRecoveryStackNavigatorModule (copy), ReactModule (copy), RoactNavigationModule (copy), UseIOSStatusBarStylerFunction (copy), DarkTheme (copy), AccountRecoveryContextProviderModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local MemoizeResultResult = MemoizeResult(AccountRecoveryStackNavigatorModule)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = Current
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), RoactNavigationModule (upval)
		local CurrentFunction: (any) -> () = UseRefResult.current
		
		if CurrentFunction then
			CurrentFunction(RoactNavigationModule.StackActions.popToTop())
		end
	end, {})
	UseIOSStatusBarStylerFunction(UseStyleResult.Theme == DarkTheme)
	
	return ReactModule.createElement(AccountRecoveryContextProviderModule, {
		parentNavigation = UseNavigationResult,
		monoDeps = p1.monoDeps,
		resetChildNavigationToFirstScreen = UseResult1
	}, {
		NavigationAppContainer = ReactModule.createElement(MemoizeResultResult, { externalDispatchConnector = UseResult })
	})
end