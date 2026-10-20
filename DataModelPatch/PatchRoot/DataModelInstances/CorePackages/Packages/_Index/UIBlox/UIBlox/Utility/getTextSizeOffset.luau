local _ = script.Parent.Parent
local TextService = game:GetService("TextService")

return function(p1)
	-- upvalues: TextService (copy)
	local Success, Result = pcall(function()
		-- upvalues: TextService (upval), p1 (copy)
		return TextService:GetTextSize("", 0, p1, Vector2.new(1e999, 1e999)).Y
	end)
	
	return Success, Result
end