local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local PromiseModule = require(Parent.Promise)
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

return function(Callback, PunishmentId)
	-- upvalues: ArgCheckModule (copy), Players (copy), PromiseModule (copy), UrlBuilder (copy), HttpService (copy)
	ArgCheckModule.isType(PunishmentId, "number", "PostReactivate expects punishmentId to be a number")
	local LocalPlayer = Players.LocalPlayer
	ArgCheckModule.assert(LocalPlayer, "Players.LocalPlayer should be non-nil")
	
	return if LocalPlayer == nil then PromiseModule.reject("Players.LocalPlayer is nil") else Callback(UrlBuilder.usermoderation.reactivate(), "POST", {
		postBody = HttpService:JSONEncode({
			PunishmentId = PunishmentId,
			PunishedUserId = LocalPlayer.UserId
		})
	})
end