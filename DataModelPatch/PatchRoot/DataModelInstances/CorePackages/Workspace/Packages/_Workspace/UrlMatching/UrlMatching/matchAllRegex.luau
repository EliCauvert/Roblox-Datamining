local _ = require(script.Parent.Parent.RegExp)

local function matchAllRegex(Text: string, p1)
	-- upvalues: matchAllRegex (copy)
	local ExecResult = p1:exec(Text)
	
	if not ExecResult then
		return {}
	end
	local Index = ExecResult.index
	local ExecResultEntry = ExecResult[1]
	local CapturedGroups = {}
	
	if #ExecResult > 1 then
		for i = 2, #ExecResult do
			table.insert(CapturedGroups, ExecResult[i])
		end
	end
	local OffsetResult = utf8.offset(Text, Index)
	
	return {
		{
			index = OffsetResult,
			input = Text,
			matchedText = ExecResultEntry,
			capturedGroups = CapturedGroups
		},
		unpack((matchAllRegex(Text:sub(OffsetResult + #ExecResultEntry), p1)))
	}
end

return matchAllRegex