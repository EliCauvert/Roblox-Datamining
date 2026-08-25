local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local updateFetchingStatus = require(http.Actions).UpdateFetchingStatus
local batchUpdateFetchingStatus = require(http.Actions).BatchUpdateFetchingStatus
local cryoModule = require(parent.Cryo)

local function mapStatusToValue(p0)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in pairs(p0) do
		local status = v.status
		t[v.key] = if status ~= nil then cryoModule.None else status
	end
	return t
end

return function(p1, p2)
	-- upvalues: updateFetchingStatus (ref), cryoModule (ref), batchUpdateFetchingStatus (ref), mapStatusToValue (ref)
	p1 = p1 or {}
	
	if p2.type == updateFetchingStatus.name then
		local status = p2.status
		p1 = cryoModule.Dictionary.join(p1, {
			[p2.key] = if status ~= nil then cryoModule.None else status
		})
	end
	if p2.type == batchUpdateFetchingStatus.name then
		p1 = cryoModule.Dictionary.join(p1, mapStatusToValue(p2.fetchingStatuses))
	end
	return p1
end