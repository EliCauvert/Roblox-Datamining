local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return if require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then function(Detail, TitleKey)
	-- upvalues: ArgCheckModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	ArgCheckModule.isType(Detail, "string", "url")
	ArgCheckModule.isType(TitleKey, "string", "titleKey")
	
	return function(p1)
		-- upvalues: AppPageModule (upval), Detail (copy), TitleKey (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		local config = {
			name = AppPageModule.GenericWebPage,
			detail = Detail,
			extraProps = { titleKey = TitleKey }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownModule(config))
		end
	end
end else function(Detail, Title)
	-- upvalues: AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	assert(type(Detail) == "string", string.format("OpenWebview thunk expects url to be a string, was %s", (type(Detail))))
	assert(type(Title) == "string", string.format("OpenWebview thunk expects title to be a string, was %s", (type(string))))
	
	return function(p1)
		-- upvalues: AppPageModule (upval), Detail (copy), Title (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		local config = {
			name = AppPageModule.GenericWebPage,
			detail = Detail,
			extraProps = { title = Title }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownModule(config))
		end
	end
end