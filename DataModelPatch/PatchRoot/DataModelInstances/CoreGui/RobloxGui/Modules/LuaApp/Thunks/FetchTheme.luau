local GetThemeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.GetTheme)
game:DefineFastFlag("FixFetchThemePromiseRejection", false)

return function(p1, p2)
	-- upvalues: GetThemeModule (copy)
	return GetThemeModule(p1, p2):andThen(function(Entry): string
		local Entry1 = Entry[1]
		
		return if game:GetFastFlag("FixFetchThemePromiseRejection") then if Entry1 then string.lower(Entry1.themeType) else string.lower("light") else string.lower(Entry1.themeType)
	end)
end