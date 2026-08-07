local _ = script.Parent.Parent
local textService = game:GetService("TextService")

return function(p0) --[[ line: 5 ]]
	-- upvalues: textService (ref)
	local ok, status = pcall(function() --[[ line: 6 ]]
		-- upvalues: textService (copy), p0 (ref)
		return textService:GetTextSize("", 0, p0, Vector2.new(1e999, 1e999)).Y
	end)
	
	return ok, status
end