local textService = game:GetService("TextService")

local function _(p1, p2, p3, p4)
	-- upvalues: textService (ref)
	return textService:GetTextSize(p1, p2, p3, Vector2.new(p4, 1000000)).Y
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: textService (ref)
	if p1 == "" or p4 <= 0 or (p5 <= 0 or p3 <= p6) then
		return p3
	elseif textService:GetTextSize(p1, p3, p2, Vector2.new(p4, 1000000)).Y <= p5 then
		return p3
	end
	local var1 = p6
	local var2 = p3
	
	for _ = 1, 8 do
		local var3 = (var1 + var2) / 2
		
		if textService:GetTextSize(p1, var3, p2, Vector2.new(p4, 1000000)).Y <= p5 then
			var1 = var3
		else
			var2 = var3
		end
	end
	return var1
end