local ResultModule = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Result)
local TextSearchEntryModule = {
	new = function()
		return {}
	end
}

function TextSearchEntryModule.fromTextSearchEntryJson(p1)
	-- upvalues: ResultModule (copy), TextSearchEntryModule (copy)
	if type(p1) ~= "table" then
		return ResultModule.error("TextSearchEntry.fromTextSearchEntryJson expects textSearchEntryJson to be a table")
	elseif type(p1.name) ~= "string" then
		return ResultModule.error("TextSearchEntry.fromTextSearchEntryJson expects textSearchEntryJson.name to be a string")
	elseif p1.contentType == "Text" then
		local NewTextSearchEntry = TextSearchEntryModule.new()
		NewTextSearchEntry.text = p1.name
		
		return ResultModule.success(NewTextSearchEntry)
	else
		return ResultModule.error("TextSearchEntry.fromTextSearchEntryJson expects textSearchEntryJson.contentType to be 'Text'")
	end
end

return TextSearchEntryModule