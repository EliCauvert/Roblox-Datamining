local HttpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local GameDeveloperProductUrlBuilderModule = require(script.Parent.GameDeveloperProductUrlBuilder)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 18 ]]
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end
})

local function parseStatusCounts(ResponseBody) --[[ Line: 23 ]]
	local t = {}
	
	if typeof(ResponseBody) ~= "table" then
		return t
	end
	for _, value in ipairs(ResponseBody) do
		if typeof(value) == "table" and value.actionArgs and value.receipt then
			for _, actionArg in ipairs(value.actionArgs) do
				if actionArg.Key == "productId" and actionArg.Value then
					t[tostring(actionArg.Value)] = (t[tostring(actionArg.Value)] or 0) + 1
				end
			end
		end
	end
	return t
end

return {
	fetch = function(PlayerId, PlaceId) --[[ Line: 40 ]]
		-- upvalues: GameDeveloperProductUrlBuilderModule (copy), ConfigResult (copy), parseStatusCounts (copy)
		return ConfigResult(GameDeveloperProductUrlBuilderModule.buildStatusesUrl({ playerId = PlayerId, placeId = PlaceId }), "GET"):andThen(function(Result) --[[ Line: 42 ]]
			-- upvalues: PlayerId (copy), PlaceId (copy), parseStatusCounts (upval)
			return {
				playerId = PlayerId,
				placeId = PlaceId,
				counts = parseStatusCounts(Result and Result.responseBody)
			}
		end)
	end,
	_parseStatusCounts = parseStatusCounts
}