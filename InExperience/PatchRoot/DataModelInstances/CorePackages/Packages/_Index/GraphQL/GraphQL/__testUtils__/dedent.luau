local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local String1 = LuauPolyfillModule.String

function dedent(p1, ...) --[[ Line: 18 ]]
	-- upvalues: Array (copy)
	local list = { ... }
	local Text = ""
	
	if Array.isArray(p1) then
		for i = 1, #p1 do
			Text ..= p1[i]
			
			if i <= #list then
				Text ..= list[i]
			end
		end
	else
		Text = p1
	end
	local RemoveTrailingSpacesAndTabsResult: string = removeTrailingSpacesAndTabs(removeLeadingNewLines(Text))
	local Text1 = ""
	
	for i1 = 1, string.len(RemoveTrailingSpacesAndTabsResult) do
		local Segment = string.sub(RemoveTrailingSpacesAndTabsResult, i1, i1)
		
		if Segment ~= " " and Segment ~= "\t" then break end
		Text1 ..= Segment
	end
	return removeCommonIndent(RemoveTrailingSpacesAndTabsResult, Text1)
end

function removeLeadingNewLines(Text: string): string --[[ Line: 50 ]]
	-- upvalues: String1 (copy)
	local Or = String1.findOr(Text, { "\n*" })
	
	if Or ~= nil and Or.index == 1 then
		Text = string.sub(Text, string.len(Or.match) + 1)
	end
	return Text
end

function removeTrailingSpacesAndTabs(Text: string): string --[[ Line: 59 ]]
	-- upvalues: String1 (copy)
	local v1 = nil
	local NewIndex = 1
	repeat
		local Or = String1.findOr(Text, { " +", "\t+" }, NewIndex)
		if Or ~= nil then
			if v1 == nil or v1.index + string.len(v1.match) ~= Or.index then
				v1 = Or
			else
				v1 = { index = v1.index, match = v1.match .. Or.match }
			end
			NewIndex = Or.index + string.len(Or.match)
		end
	until Or == nil or string.len(Text) < NewIndex
	return if v1 == nil or v1.index + string.len(v1.match) ~= string.len(Text) + 1 then Text else string.sub(Text, 1, v1.index - 1)
end

function removeCommonIndent(Text: string, Pattern): string --[[ Line: 90 ]]
	return (string.gsub(string.gsub(Text, Pattern, "", 1), "\n" .. Pattern, "\n"))
end

return { dedent = dedent }