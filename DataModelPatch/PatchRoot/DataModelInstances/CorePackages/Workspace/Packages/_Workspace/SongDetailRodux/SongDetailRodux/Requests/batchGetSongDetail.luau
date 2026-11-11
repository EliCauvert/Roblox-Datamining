local Url = require(script:FindFirstAncestor("SongDetailRodux").Parent.Http).Url

local function generateQueryParams(List): string
	local List1 = {}
	
	for _, value in ipairs(List) do
		table.insert(List1, "asset_ids=" .. value)
	end
	return "?" .. table.concat(List1, "&")
end

return function(Callback, p1)
	-- upvalues: generateQueryParams (copy), Url (copy)
	assert(type(p1) == "table", "BatchGetSongDetail request expects songIds to be a table")
	
	if #p1 == 0 or #p1 > 20 then
		error(`BatchGetSongDetail request expects songIds count between 1-{20}`)
	end
	return Callback(string.format("%smusic-discovery/v1/batch-song-details%s", Url.APIS_URL, (generateQueryParams(p1))), "GET")
end