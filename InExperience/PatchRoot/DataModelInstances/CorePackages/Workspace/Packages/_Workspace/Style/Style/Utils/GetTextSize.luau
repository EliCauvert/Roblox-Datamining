local textService = game:GetService("TextService")

return function(...)
	-- upvalues: textService (ref)
	return textService:GetTextSize(...) + Vector2.new(2, 2)
end