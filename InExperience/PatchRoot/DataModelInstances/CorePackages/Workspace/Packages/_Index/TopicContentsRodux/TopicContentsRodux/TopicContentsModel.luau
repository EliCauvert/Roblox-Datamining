local topicContentsRodux = script:FindFirstAncestor("TopicContentsRodux")
local topicContentsEntryModelModule = require(topicContentsRodux.TopicContentsEntryModel)
local _ = require(topicContentsRodux.Parent.DiscoveryTypes)
local t = {
	new = function() --[[ line: 11 ]]
		return {
			entries = {},
			rowsRequested = 0,
			hasMoreRows = false,
			nextPageExclusiveStartId = 0,
			updatedTimestamp = nil,
			nextPageToken = ""
		}
	end
}

function t.mock() --[[ line: 25 ]]
	-- upvalues: t (ref), topicContentsEntryModelModule (ref)
	local var3 = t.new()
	var3.entries = { topicContentsEntryModelModule.mock() }
	var3.rowsRequested = 1
	var3.hasMoreRows = false
	var3.nextPageExclusiveStartId = 0
	var3.updatedTimestamp = nil
	var3.nextPageToken = ""
	
	return var3
end

function t.fromData(p0) --[[ line: 39 ]]
	return {
		entries = p0.entries,
		rowsRequested = p0.rowsRequested,
		hasMoreRows = p0.hasMoreRows,
		nextPageExclusiveStartId = p0.nextPageExclusiveStartId,
		updatedTimestamp = p0.updatedTimestamp,
		nextPageToken = if p0.nextPageToken then p0.nextPageToken else ""
	}
end

function t.fromContentList(p1, p2, p3, p4) --[[ line: 53 ]]
	-- upvalues: t (ref), topicContentsEntryModelModule (ref)
	local var4 = t.new()
	var4.updatedTimestamp = p4
	var4.entries = {}
	var4.hasMoreRows = false
	
	if p1 then
		for i, v in ipairs(p1) do
			if not var4.hasMoreRows then
				topicContentsEntryModelModule.fromOmniRecommendations(v):match(function(p6) --[[ line: 72 ]]
					-- upvalues: v (ref), p2 (ref), p3 (ref), var4 (ref)
					local var5 = p2(v.contentType)
					
					if var5 ~= nil then
						local var6 = p3(p6, var5)
						
						if var6 ~= nil then
							table.insert(var4.entries, var6)
							
							return
						end
						var4.hasMoreRows = true
					end
				end):matchError(function(p5) --[[ line: 84 ]]
					warn(p5)
				end)
				continue
			end
			return var4
		end
	end
	return var4
end

return t