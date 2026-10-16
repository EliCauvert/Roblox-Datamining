local TextService = game:GetService("TextService")

return function(String, X: number, FontSize, p1, MaxValue: number): number --[[ Line: 9 | Named "measureTextLineCount" ]]
	-- upvalues: TextService (copy)
	if String == "" or X <= 0 then
		return 1
	else
		local _Vector2 = Vector2.new(X, 1e999)
		local Y: number = TextService:GetTextSize("M", FontSize, p1, _Vector2).Y
		
		return if Y <= 0 then 1 else math.clamp(math.ceil(TextService:GetTextSize(String, FontSize, p1, _Vector2).Y / Y), 1, MaxValue)
	end
end