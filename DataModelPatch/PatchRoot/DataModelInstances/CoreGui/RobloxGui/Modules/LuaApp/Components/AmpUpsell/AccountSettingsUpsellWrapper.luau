local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local ReactModule = require(CorePackages.Packages.React)
local AppPageModule = require(Modules.LuaApp.AppPage)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AccountSettingsUpsell = require(CorePackages.Workspace.Packages.AmpUpsell).AccountSettingsUpsell
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local CryoModule = require(CorePackages.Packages.Cryo)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: UseDispatchFunction (copy), AppPageModule (copy), UrlBuilderModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), CryoModule (copy), ReactModule (copy), AccountSettingsUpsell (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(AccountSettingsUpsell, (CryoModule.Dictionary.join(p1 or {}, {
		openAccountSettings = function(Title)
			-- upvalues: AppPageModule (upval), UrlBuilderModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = UrlBuilderModule.static.settings.account(),
				extraProps = { title = Title }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownModule(config))
			end
		end
	})))
end