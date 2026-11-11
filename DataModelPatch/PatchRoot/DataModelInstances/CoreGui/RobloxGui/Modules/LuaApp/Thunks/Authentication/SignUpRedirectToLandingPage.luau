local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local ClearSignUpInfoModule = require(Modules.LuaApp.Actions.Authentication.ClearSignUpInfo)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local FFlagRemoveUnusedSignUpInfoRoduxSlice = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagRemoveUnusedSignUpInfoRoduxSlice

return function(_)
	-- upvalues: FFlagRemoveUnusedSignUpInfoRoduxSlice (copy), ClearSignUpInfoModule (copy), ResetNavigationHistoryModule (copy), AppPageModule (copy)
	return function(p1)
		-- upvalues: FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), ClearSignUpInfoModule (upval), ResetNavigationHistoryModule (upval), AppPageModule (upval)
		if not FFlagRemoveUnusedSignUpInfoRoduxSlice then
			p1:dispatch(ClearSignUpInfoModule())
		end
		p1:dispatch(ResetNavigationHistoryModule({ { name = AppPageModule.Landing } }))
	end
end