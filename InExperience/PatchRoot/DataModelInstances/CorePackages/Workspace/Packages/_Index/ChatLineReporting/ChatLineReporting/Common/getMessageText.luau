function getMessageText(p1, p2, p3)
	return if p2 == nil or p2 == "" then p3 or "" elseif p1 then p2 or "" else p3 or ""
end

return getMessageText