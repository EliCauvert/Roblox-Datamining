function getMessageText(p0, p1, p2) --[[ line: 2 ]]
	return if p1 == nil or p1 == "" then p2 or "" elseif p0 then p1 or "" else p2 or ""
end

return getMessageText