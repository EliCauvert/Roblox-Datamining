local httpRequestModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpRequest)
local gameDeveloperProductUrlBuilderModule = require(script.Parent.GameDeveloperProductUrlBuilder)
local var2 = httpRequestModule.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequestModule (ref)
		return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
	end
})

local function parseStatusCounts(p3)
	local t = {}
	
	if typeof(p3) ~= "table" then
		return t
	end
	for i, v in ipairs(p3) do
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
	fetch = function(p4, p5)
		-- upvalues: gameDeveloperProductUrlBuilderModule (ref), var2 (ref), parseStatusCounts (ref)
		return var2(gameDeveloperProductUrlBuilderModule.buildStatusesUrl({ playerId = p4, placeId = p5 }), "GET"):andThen(function(p6)
			-- upvalues: p4 (ref), p5 (ref), parseStatusCounts (copy)
			return {
				playerId = p4,
				placeId = p5,
				counts = parseStatusCounts(p6 and p6.responseBody)
			}
		end)
	end,
	_parseStatusCounts = parseStatusCounts
}