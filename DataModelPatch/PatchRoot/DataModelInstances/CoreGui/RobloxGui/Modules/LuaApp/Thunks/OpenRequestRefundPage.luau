local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(Detail, OnClose)
	-- upvalues: AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return function(p1)
		-- upvalues: AppPageModule (upval), Detail (copy), OnClose (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		local config = {
			name = AppPageModule.GenericWebPage,
			detail = Detail,
			extraProps = {
				titleKey = "Feature.PaidAccessRefunds.Webview.Title.RequestRefund",
				onClose = OnClose
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownModule(config))
		end
	end
end