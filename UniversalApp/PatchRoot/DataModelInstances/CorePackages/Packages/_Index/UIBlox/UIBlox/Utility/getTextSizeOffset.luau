local _ = script.Parent.Parent
local textService = game:GetService("TextService")

return function(p1)
	-- upvalues: textService (ref)
	local ok, status = pcall(function()
		-- upvalues: textService (copy), p1 (ref)
		return textService:GetTextSize("", 0, p1, Vector2.new(1e999, 1e999)).Y
	end)
	
	return ok, status
end