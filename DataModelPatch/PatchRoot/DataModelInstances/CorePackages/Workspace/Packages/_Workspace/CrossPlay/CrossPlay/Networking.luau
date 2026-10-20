local Players = game:GetService("Players")
local CrossPlay = script:FindFirstAncestor("CrossPlay")
local Parent = CrossPlay.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local ConfigResult = require(Parent.RoduxNetworking).config({
	keyPath = "CrossPlaySettings.NetworkStatus",
	networkImpl = HttpRequestModule.config({
		maxRetryCount = 0,
		requestFunction = function(p1, p2, p3)
			-- upvalues: Players (copy), HttpRequestModule (copy)
			p3.headers = {
				["robloxctx-authenticated-userid"] = if Players and Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
			}
			
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end
	})
})

return {
	roduxNetworking = ConfigResult,
	thunks = require(CrossPlay.Networking.createRequestThunks)({ roduxNetworking = ConfigResult })
}