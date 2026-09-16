local textService = game:GetService("TextService")

return function(p1, p2, p3, p4, p5)
	-- upvalues: textService (ref)
	if p1 == "" or p2 <= 0 then
		return 1
	end
	local vector2 = Vector2.new(p2, 1e999)
	local y = textService:GetTextSize("M", p3, p4, vector2).Y
	
	return if y <= 0 then 1 else math.clamp(math.ceil(textService:GetTextSize(p1, p3, p4, vector2).Y / y), 1, p5)
end