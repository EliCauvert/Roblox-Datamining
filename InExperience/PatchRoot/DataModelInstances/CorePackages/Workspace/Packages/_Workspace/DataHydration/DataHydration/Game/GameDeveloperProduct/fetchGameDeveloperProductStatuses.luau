local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local gameDeveloperProductUrlBuilderModule = require(script.Parent.GameDeveloperProductUrlBuilder)
local var1 = httpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end
})

local function parseStatusCounts(p1)
	local t = {}
	
	if typeof(p1) ~= "table" then
		return t
	end
	for i, v in ipairs(p1) do
		if typeof(v) == "table" and v.actionArgs and v.receipt then
			for i_1, v_1 in ipairs(v.actionArgs) do
				if v_1.Key == "productId" and v_1.Value then
					t[tostring(v_1.Value)] = (t[tostring(v_1.Value)] or 0) + 1
				end
			end
		end
	end
	return t
end

return {
	fetch = function(p2, p3)
		-- upvalues: gameDeveloperProductUrlBuilderModule (ref), var1 (ref), parseStatusCounts (ref)
		return var1(gameDeveloperProductUrlBuilderModule.buildStatusesUrl({ playerId = p2, placeId = p3 }), "GET"):andThen(function(p4)
			-- upvalues: p2 (ref), p3 (ref), parseStatusCounts (copy)
			return {
				playerId = p2,
				placeId = p3,
				counts = parseStatusCounts(p4 and p4.responseBody)
			}
		end)
	end,
	_parseStatusCounts = parseStatusCounts
}