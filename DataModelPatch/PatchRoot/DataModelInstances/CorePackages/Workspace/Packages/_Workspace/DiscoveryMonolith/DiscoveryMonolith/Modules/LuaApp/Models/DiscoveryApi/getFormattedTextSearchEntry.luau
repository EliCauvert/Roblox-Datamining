local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local TextSearchEntryModule = require(script.Parent.TextSearchEntry)

return function(Entry)
	-- upvalues: ReportWarningFunction (copy), LoggingProtocolModule (copy), TextSearchEntryModule (copy)
	if not Entry then
		ReportWarningFunction(LoggingProtocolModule.default, "TextSearchEntryNoResults", "Text search results is nil")
		
		return nil
	elseif Entry and #Entry == 0 then
		ReportWarningFunction(LoggingProtocolModule.default, "TextSearchEntryNoResults", "Text search results is empty")
		
		return nil
	else
		local v1 = nil
		TextSearchEntryModule.fromTextSearchEntryJson(Entry[1]):match(function(p1)
			-- upvalues: v1 (ref)
			v1 = p1
		end):matchError(function(p1)
			-- upvalues: ReportWarningFunction (upval), LoggingProtocolModule (upval)
			ReportWarningFunction(LoggingProtocolModule.default, "TextSearchEntryParseError", p1)
		end)
		
		return v1
	end
end