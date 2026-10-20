local AppPageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPage)
game:DefineFastFlag("LuaAppMobileMoreTilesPerRowIXP", false)

return {
	mobileShowMoreTilesPerRowIXPEnabled = function()
		return game:GetFastFlag("LuaAppMobileMoreTilesPerRowIXP")
	end,
	shouldHideGameStats = function(Games, p1): boolean
		-- upvalues: AppPageModule (copy)
		return if Games and (Games == AppPageModule.Home or Games == AppPageModule.Games or Games == AppPageModule.GamesList) and p1 then true else false
	end
}