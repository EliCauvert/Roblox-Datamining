local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local CryoModule = require(Parent.Cryo)
local ArgCheckModule = require(Parent.ArgCheck)
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning

return function(p1, p2, p3, p4: number, p5)
	-- upvalues: ReportWarningFunction (copy), LoggingProtocolModule (copy), FlaggedMutedErrorFunction (copy), ArgCheckModule (copy), CryoModule (copy)
	local FirstIndex: number = p2.firstIndex
	local EntryIndices = p2.entryIndices
	local CountEntryIndices = if EntryIndices then #EntryIndices else nil
	
	if not FirstIndex or not CountEntryIndices or FirstIndex == 1e999 then
		return {}
	end
	if #p1 == 0 then
		ReportWarningFunction(LoggingProtocolModule.default, "getEntitiesForPartialFeedItemEmptyEntries", "Entries were empty in getEntitiesForPartialFeedItem", {
			hasEmphasis = tostring(p3),
			firstIndex = tostring(FirstIndex),
			numberOfTiles = tostring(CountEntryIndices),
			itemsPerRow = tostring(p4)
		})
		
		return {}
	end
	local v1 = 0
	local v2 = 0
	local Flag = false
	
	if p3 then
		if FirstIndex == 1 then
			Flag = true
		elseif FirstIndex > 1 then
			if FirstIndex <= 3 then
				FlaggedMutedErrorFunction("InvalidFirstIndexForSearchFeedItem", `Invalid firstIndex: {FirstIndex} for feed item`)
				
				return {}
			end
			ArgCheckModule.assert(FirstIndex > 3)
			v1 = 3
		end
		v2 = 3
	end
	local JoinResults = {}
	
	for i = FirstIndex - v1, if p5 == 1e999 then #p1 else math.clamp(FirstIndex + CountEntryIndices - v2 - 1, 1, #p1) do
		local v3 = #JoinResults + 1
		local v4: boolean = p4 and v3 <= p4 - 1
		local v5: number = if v4 then 1 else 3
		table.insert(JoinResults, (CryoModule.Dictionary.join(p1[i], {
			uiIndex = if v3 == 1 or not Flag or not p4 then v3 else v3 + v5,
			topicContentsIndex = i
		})))
	end
	return JoinResults
end