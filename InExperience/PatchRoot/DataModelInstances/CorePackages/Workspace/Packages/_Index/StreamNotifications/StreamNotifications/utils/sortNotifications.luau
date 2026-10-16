local function v0(A, B): boolean --[[ Line: 1 ]]
	if A.eventDate == "" or A.eventDate == nil or B.eventDate == "" or B.eventDate == nil then
		return true
	else
		local _DateTime = DateTime.fromIsoDate(A.eventDate) or nil
		local _DateTime1 = DateTime.fromIsoDate(B.eventDate) or nil
		
		return _DateTime == nil or _DateTime1 == nil or _DateTime1.UnixTimestampMillis < _DateTime.UnixTimestampMillis
	end
end

return function(Tbl) --[[ Line: 16 ]]
	-- upvalues: v0 (copy)
	local Success, Result = pcall(function() --[[ Line: 17 ]]
		-- upvalues: Tbl (copy), v0 (upval)
		local Copy = table.clone(Tbl)
		table.sort(Copy, v0)
		
		return Copy
	end)
	
	return if Success then Result else Tbl
end