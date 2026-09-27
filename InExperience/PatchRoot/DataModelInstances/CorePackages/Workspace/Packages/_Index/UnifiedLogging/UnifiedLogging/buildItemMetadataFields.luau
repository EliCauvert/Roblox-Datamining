local parent = script:FindFirstAncestor("UnifiedLogging").Parent
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagUnifiedLoggingCoerceMetadataFieldValues = require(parent.SharedFlags).FFlagUnifiedLoggingCoerceMetadataFieldValues
local t = {
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
	-- upvalues: t (ref)
	return t[p1]
end

return function(p1, p2, p3)
	-- upvalues: t (ref), fFlagUnifiedLoggingCoerceMetadataFieldValues (ref), discoveryEventErrorLogger (ref)
	local v_2
	local t_1 = {}
	
	for i, v in p1 do
		v_2 = if p2 then p2[v] else nil
		
		if v_2 == nil then
			discoveryEventErrorLogger.reportError("buildMetadataFields", "Entry was nil when building item metadataFields for collection", { entryIndex = v, collectionId = p3 })
			continue
		end
		for i_1, v_1 in v_2 do
			if not t[i_1] then
				if t_1[i_1] == nil then
					t_1[i_1] = {}
				end
				local var1 = t_1[i_1]
				
				if fFlagUnifiedLoggingCoerceMetadataFieldValues then
					var1[i] = tostring(v_1)
				else
					var1[i] = v_1
				end
			end
		end
	end
	for i_1, v_1 in t_1 do
		for i_2 = 1, #p1 do
			if t_1[i_1][i_2] == nil then
				t_1[i_1][i_2] = ""
			end
		end
	end
	local t_2 = {}
	
	for i_2, v_2 in t_1 do
		t_2[`{i_2}_arr`] = table.concat(v_2, ",")
	end
	return t_2
end