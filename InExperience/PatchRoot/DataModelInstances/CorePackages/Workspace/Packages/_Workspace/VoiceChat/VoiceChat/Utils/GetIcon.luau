function getIconSrc(p1, p2)
	return "rbxasset://textures/ui/VoiceChat/" .. (if p2 then p2 .. "/" else "") .. p0 .. ".png"
end

return function(p1, p2, p3)
	return if p1 == "Unmuted" then p3 and getIconSrc("Unmuted" .. tostring(math.floor(0.5 + 5 * (p3 or math.random())) * 20), p2) or getIconSrc("Blank", p2) else getIconSrc(p1, p2)
end