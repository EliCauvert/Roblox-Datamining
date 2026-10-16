function getIconSrc(Text, Text1): string --[[ Line: 4 ]]
	return "rbxasset://textures/ui/VoiceChat/" .. (Text1 and Text1 .. "/" or "") .. Text .. ".png"
end

return function(p1, p2, p3) --[[ Line: 9 ]]
	if p1 == "Unmuted" then
		local ScaledFloored = math.floor(0.5 + 5 * (p3 or math.random())) * 20
		
		return p3 and getIconSrc("Unmuted" .. tostring(ScaledFloored), p2) or getIconSrc("Blank", p2)
	else
		return getIconSrc(p1, p2)
	end
end