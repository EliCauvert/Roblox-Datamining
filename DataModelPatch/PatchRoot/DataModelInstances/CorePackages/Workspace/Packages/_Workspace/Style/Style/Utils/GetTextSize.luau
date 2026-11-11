local TextService = game:GetService("TextService")

return function(...): Vector2
	-- upvalues: TextService (copy)
	return TextService:GetTextSize(...) + Vector2.new(2, 2)
end