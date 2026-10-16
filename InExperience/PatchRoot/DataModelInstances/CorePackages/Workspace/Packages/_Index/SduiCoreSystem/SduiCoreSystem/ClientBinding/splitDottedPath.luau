local t = {}

return function(Text: string) --[[ Line: 21 | Named "splitDottedPath" ]]
	-- upvalues: t (copy)
	local Entry = t[Text]
	
	if Entry == nil then
		local Parts = string.split(Text, ".")
		table.freeze(Parts)
		t[Text] = Parts
		
		return Parts
	else
		return Entry
	end
end