local Parent = script:FindFirstAncestor("GameInvite").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local Url = require(Parent.Http).Url
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("GetRewardMetadataHttpRetryCount", 4) else nil
})
local PromiseModule = require(Parent.Promise)

return function()
	-- upvalues: PromiseModule (copy), Url (copy), ConfigResult (copy)
	return if game.GameId == nil or game.GameId == 0 then PromiseModule.reject("GameId is nil or 0") else ConfigResult(string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", Url.APIS_URL, (Url:makeQueryString({ UniverseId = game.GameId }))), "GET")
end