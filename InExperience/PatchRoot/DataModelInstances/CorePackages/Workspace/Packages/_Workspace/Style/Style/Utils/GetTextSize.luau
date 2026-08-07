local textService = game:GetService("TextService")

return function(...) --[[ line: 8 ]]
	-- upvalues: textService (ref)
	return textService:GetTextSize(...) + Vector2.new(2, 2)
end