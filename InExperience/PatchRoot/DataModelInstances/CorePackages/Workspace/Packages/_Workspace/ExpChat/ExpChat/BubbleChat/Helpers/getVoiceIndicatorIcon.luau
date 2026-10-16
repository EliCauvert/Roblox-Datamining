return function(Callback, p1, p2: number, p3) --[[ Line: 1 ]]
	return if Callback then if p1 == "Muted" or p1 == "LOCAL_MUTED" then Callback("Muted", p3) elseif p1 == "Connecting" then Callback("Connecting", p3) elseif p1 == "Inactive" then Callback("Unmuted0", p3) elseif p1 == "Talking" then Callback("Unmuted" .. tostring(math.floor(0.5 + 5 * p2) * 20), p3) else Callback("Error", p3) else ""
end