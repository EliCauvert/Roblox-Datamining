local parent = script:FindFirstAncestor("GameInvite").Parent
local httpRequestModule = require(parent.HttpRequest)
local url = require(parent.Http).Url
local var1 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("GetRewardMetadataHttpRetryCount", 4) else nil
})
local promiseModule = require(parent.Promise)

return function() --[[ line: 14 ]]
	-- upvalues: promiseModule (ref), url (ref), var1 (ref)
	return if game.GameId == nil or game.GameId == 0 then promiseModule.reject("GameId is nil or 0") else var1(string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", url.APIS_URL, url:makeQueryString({ UniverseId = game.GameId })), "GET")
end