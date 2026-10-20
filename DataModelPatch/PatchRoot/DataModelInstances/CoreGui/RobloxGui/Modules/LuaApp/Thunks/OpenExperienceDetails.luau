local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

local function _(p1, p2)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(p2))
		
		return
	else
		p1:dispatch(NavigateDownModule(p2))
	end
end

return function(p1, ExtraProps)
	-- upvalues: AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return function(p2)
		-- upvalues: AppPageModule (upval), p1 (copy), ExtraProps (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		local config = {
			name = AppPageModule.ExperienceDetail,
			detail = tostring(p1),
			extraProps = ExtraProps
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p2:dispatch(NavigateDownModule(config))
		end
	end
end