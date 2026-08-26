local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local updateFetchingStatus = require(http.Actions).UpdateFetchingStatus
local batchUpdateFetchingStatus = require(http.Actions).BatchUpdateFetchingStatus
local cryoModule = require(parent.Cryo)

local function mapStatusToValue(p1)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		local status = v.status
		t[v.key] = if status ~= nil then cryoModule.None else status
	end
	return t
end

return function(p2, p3)
	-- upvalues: updateFetchingStatus (ref), cryoModule (ref), batchUpdateFetchingStatus (ref), mapStatusToValue (ref)
	p2 = p2 or {}
	
	if p3.type == updateFetchingStatus.name then
		local status = p3.status
		p2 = cryoModule.Dictionary.join(p2, {
			[p3.key] = if status ~= nil then cryoModule.None else status
		})
	end
	if p3.type == batchUpdateFetchingStatus.name then
		p2 = cryoModule.Dictionary.join(p2, mapStatusToValue(p3.fetchingStatuses))
	end
	return p2
end