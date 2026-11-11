local t = {}

return function(Text: string)
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