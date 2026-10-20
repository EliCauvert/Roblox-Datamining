local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)

return function(Callback, PunishmentId)
	-- upvalues: ArgCheckModule (copy), Players (copy), UrlBuilderModule (copy), HttpService (copy)
	ArgCheckModule.isType(PunishmentId, "number", "PostReactivate expects punishmentId to be a number")
	
	return Callback(UrlBuilderModule.usermoderation.reactivate(), "POST", {
		postBody = HttpService:JSONEncode({
			PunishmentId = PunishmentId,
			PunishedUserId = Players.LocalPlayer.UserId
		})
	})
end