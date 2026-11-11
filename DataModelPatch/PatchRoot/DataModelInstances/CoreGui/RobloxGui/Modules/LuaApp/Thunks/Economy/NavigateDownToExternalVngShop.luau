local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local ApiFetchVngShopUrlModule = require(Modules.LuaApp.Thunks.Economy.ApiFetchVngShopUrl)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFStringVNGWebshopUrlFunction = SharedFlagsModule.GetFStringVNGWebshopUrl
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(OnClose, p1)
	-- upvalues: ApiFetchVngShopUrlModule (copy), GetFStringVNGWebshopUrlFunction (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetCentralOverlayModule (copy)
	return function(p2)
		-- upvalues: ApiFetchVngShopUrlModule (upval), p1 (copy), GetFStringVNGWebshopUrlFunction (upval), AppPageModule (upval), OnClose (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval), SetCentralOverlayModule (upval)
		p2:dispatch(ApiFetchVngShopUrlModule(p1)):andThen(function(Result)
			-- upvalues: GetFStringVNGWebshopUrlFunction (upval), AppPageModule (upval), OnClose (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p2 (copy), NavigateDownModule (upval), SetCentralOverlayModule (upval)
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = Result.vngShopRedirectUrl or GetFStringVNGWebshopUrlFunction(),
				extraProps = { onClose = OnClose }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			else
				p2:dispatch(NavigateDownModule(config))
			end
			p2:dispatch(SetCentralOverlayModule())
		end):catch(function(_)
			-- upvalues: GetFStringVNGWebshopUrlFunction (upval), AppPageModule (upval), OnClose (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p2 (copy), NavigateDownModule (upval), SetCentralOverlayModule (upval)
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = GetFStringVNGWebshopUrlFunction(),
				extraProps = { onClose = OnClose }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			else
				p2:dispatch(NavigateDownModule(config))
			end
			p2:dispatch(SetCentralOverlayModule())
		end)
	end
end