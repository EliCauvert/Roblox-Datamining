return function(p0, p1, p2, p3) --[[ line: 1 ]]
	return if p0 then if p1 == "Muted" or p1 == "LOCAL_MUTED" then p0("Muted", p3) elseif p1 == "Connecting" then p0("Connecting", p3) elseif p1 == "Inactive" then p0("Unmuted0", p3) elseif p1 == "Talking" then p0("Unmuted" .. tostring(math.floor(0.5 + 5 * p2) * 20), p3) else p0("Error", p3) else ""
end