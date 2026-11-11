return function(Entry, p1)
	local CountEntry = #Entry
	local CountEntry1 = if p1 == nil or CountEntry >= p1 then CountEntry else p1
	
	if CountEntry1 <= 0 or CountEntry == 0 then
		return ""
	elseif CountEntry1 == 1 then
		return Entry[1]
	elseif CountEntry1 == 2 and CountEntry >= 2 then
		return `{Entry[1]} & {Entry[2]}`
	else
		local CountEntryDelta = CountEntry1 - 1
		
		return `{Entry[1]} & {CountEntryDelta} {if CountEntryDelta == 1 then "other" else "others"}`
	end
end