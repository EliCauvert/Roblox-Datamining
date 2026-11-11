local Http = script:FindFirstAncestor("Http")
local UpdateFetchingStatus = require(Http.Actions).UpdateFetchingStatus
local BatchUpdateFetchingStatus = require(Http.Actions).BatchUpdateFetchingStatus
local CryoModule = require(Http.Parent.Cryo)

local function mapStatusToValue(FetchingStatuses)
	-- upvalues: CryoModule (copy)
	local Nones = {}
	
	for _, fetchingStatus in pairs(FetchingStatuses) do
		local Status = fetchingStatus.status
		Nones[fetchingStatus.key] = if Status == nil then CryoModule.None else Status
	end
	return Nones
end

return function(p1, p2)
	-- upvalues: UpdateFetchingStatus (copy), CryoModule (copy), BatchUpdateFetchingStatus (copy), mapStatusToValue (copy)
	local P1 = p1 or {}
	
	if p2.type == UpdateFetchingStatus.name then
		local Status = p2.status
		P1 = CryoModule.Dictionary.join(P1, {
			[p2.key] = if Status == nil then CryoModule.None else Status
		})
	end
	if p2.type == BatchUpdateFetchingStatus.name then
		P1 = CryoModule.Dictionary.join(P1, (mapStatusToValue(p2.fetchingStatuses)))
	end
	return P1
end