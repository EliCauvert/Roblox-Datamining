local TextService = game:GetService("TextService")

local function _(String, FontSize, p1, X)
	-- upvalues: TextService (copy)
	return TextService:GetTextSize(String, FontSize, p1, Vector2.new(X, 1000000)).Y
end

return function(String, p1, FontSize, X: number, p2: number, p3)
	-- upvalues: TextService (copy)
	if String == "" or X <= 0 or p2 <= 0 or FontSize <= p3 then
		return FontSize
	end
	if TextService:GetTextSize(String, FontSize, p1, Vector2.new(X, 1000000)).Y <= p2 then
		return FontSize
	end
	local v1 = p3
	local FontSize1 = FontSize
	
	for _ = 1, 8 do
		local FontSizeRatio = (v1 + FontSize1) / 2
		
		if TextService:GetTextSize(String, FontSizeRatio, p1, Vector2.new(X, 1000000)).Y <= p2 then
			v1 = FontSizeRatio
		else
			FontSize1 = FontSizeRatio
		end
	end
	return v1
end