return function(p1, p2, p3, p4)
	return if p1 then if p2 == "Muted" or p2 == "LOCAL_MUTED" then p1("Muted", p4) elseif p2 == "Connecting" then p1("Connecting", p4) elseif p2 == "Inactive" then p1("Unmuted0", p4) elseif p2 == "Talking" then p1("Unmuted" .. tostring(math.floor(0.5 + 5 * p3) * 20), p4) else p1("Error", p4) else ""
end