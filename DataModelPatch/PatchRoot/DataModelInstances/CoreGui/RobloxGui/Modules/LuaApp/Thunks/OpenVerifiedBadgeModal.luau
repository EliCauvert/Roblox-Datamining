local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateFromWebViewModule = require(Modules.LuaApp.Thunks.NavigateFromWebView)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local AppPageModule = require(Modules.LuaApp.AppPage)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function()
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), AppPageModule (copy), NavigateFromWebViewModule (copy), NavigateDownModule (copy)
	return function(p1)
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackModule (upval), AppPageModule (upval), NavigateFromWebViewModule (upval), NavigateDownModule (upval)
		local function onClose()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p1 (copy), NavigateBackModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				p1:dispatch(NavigateBackModule())
			end
		end
		
		local config = {
			name = AppPageModule.VerifiedBadgeModal,
			extraProps = {
				onConfirm = function()
					-- upvalues: AppPageModule (upval), onClose (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), p1 (copy), NavigateFromWebViewModule (upval)
					local config = {
						detail = "https://en.help.roblox.com/hc/en-us/articles/7997207259156",
						name = AppPageModule.GenericWebPage,
						extraProps = { onClose = onClose }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.fromWebView(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						p1:dispatch(NavigateFromWebViewModule(config))
					end
				end,
				onClose = onClose
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