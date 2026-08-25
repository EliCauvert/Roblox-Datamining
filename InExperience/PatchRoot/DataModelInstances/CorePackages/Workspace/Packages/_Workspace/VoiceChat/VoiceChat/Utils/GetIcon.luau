function getIconSrc(p0, p1)
	return "rbxasset://textures/ui/VoiceChat/" .. (if p1 then p1 .. "/" else "") .. p0 .. ".png"
end

return function(p2, p3, p4)
	return if p2 == "Unmuted" then p4 and getIconSrc("Unmuted" .. tostring(math.floor(0.5 + 5 * (p4 or math.random())) * 20), p3) or getIconSrc("Blank", p3) else getIconSrc(p2, p3)
end