local DiscoveryEventErrorLogger = require(script:FindFirstAncestor("UnifiedLogging").Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	collectionId = true,
	collectionPosition = true,
	contentType = true,
	id = true,
	itemPosition = true,
	itemsPerRow = true,
	rowNumber = true,
	totalNumberOfItems = true
}

local function _(p1)
	-- upvalues: config (copy)
	return config[p1]
end

return function(EntryIndexes, p1, CollectionId)
	-- upvalues: config (copy), DiscoveryEventErrorLogger (copy)
	local t = {}
	
	for i, entryIndex in EntryIndexes do
		local v1 = p1 and p1[entryIndex] or nil
		
		if v1 == nil then
			DiscoveryEventErrorLogger.reportError("buildMetadataFields", "Entry was nil when building item metadataFields for collection", { entryIndex = entryIndex, collectionId = CollectionId })
			continue
		end
		for i1, value in v1 do
			if not config[i1] then
				if t[i1] == nil then
					t[i1] = {}
				end
				t[i1][i] = value
			end
		end
	end
	for i3, _ in t do
		for i2 = 1, #EntryIndexes do
			if t[i3][i2] == nil then
				t[i3][i2] = ""
			end
		end
	end
	local t1 = {}
	
	for i4, value1 in t do
		t1[`{i4}_arr`] = table.concat(value1, ",")
	end
	return t1
end