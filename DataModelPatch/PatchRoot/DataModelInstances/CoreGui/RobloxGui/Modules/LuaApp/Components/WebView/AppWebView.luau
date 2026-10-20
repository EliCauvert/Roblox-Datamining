local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local Object = require(CorePackages.Packages.LuauPolyfill).Object
local UseEarlyIsFocusedFunction = require(CorePackages.Workspace.Packages.Navigation).useEarlyIsFocused
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local MapTransitionAnimationToNativeStringModule = require(Modules.LuaApp.mapTransitionAnimationToNativeString)
local WebViewModule = require(script.Parent.WebView)
local GetFFlagWebViewServiceHasBackButtonVisibilityModule = require(Modules.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility)

local function _(p1, TitleKey)
	-- upvalues: UseLocalizationFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({ titleKey = TitleKey })
	
	return p1 or UseLocalizationResult.titleKey
end

local function useLatestCallbackOnUnmount(Current)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end, { Current })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			local CurrentFunction: () -> () = UseRefResult.current
			
			if CurrentFunction ~= nil then
				CurrentFunction()
			end
		end
	end, {})
end

return function(p1)
	-- upvalues: UseEarlyIsFocusedFunction (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), useLatestCallbackOnUnmount (copy), ReactModule (copy), WebViewModule (copy), Object (copy), MapTransitionAnimationToNativeStringModule (copy), GetFFlagWebViewServiceHasBackButtonVisibilityModule (copy)
	local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
	local UseNavigationResult = UseNavigationFunction()
	local Title = p1.title
	local UseLocalizationResult = UseLocalizationFunction({ titleKey = p1.titleKey })
	local Title1 = Title or UseLocalizationResult.titleKey
	useLatestCallbackOnUnmount(p1.windowCloseCallback)
	
	return if UseEarlyIsFocusedResult then ReactModule.createElement(WebViewModule, Object.assign({}, p1, {
		title = Title1,
		transitionAnimation = MapTransitionAnimationToNativeStringModule(p1.transitionAnimation),
		windowCloseCallback = UseNavigationResult.goBack,
		hasBackButton = if GetFFlagWebViewServiceHasBackButtonVisibilityModule() then p1.hasBackButton else nil
	})) else nil
end