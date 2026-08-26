local textService = game:GetService("TextService")
local loggerModule = require(script.Parent.Parent.Parent.Logger)
local vector2 = Vector2.new(2, 2)

return function(p1, p2, p3, p4, p5)
	-- upvalues: textService (ref), vector2 (ref), loggerModule (ref)
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Font = Font.fromEnum(p3)
	getTextBoundsParams.Size = p2
	getTextBoundsParams.Text = p1
	getTextBoundsParams.Width = p4.X
	getTextBoundsParams.RichText = p5 or false
	local ok, status = pcall(function()
		-- upvalues: textService (copy), getTextBoundsParams (ref)
		return textService:GetTextBoundsAsync(getTextBoundsParams)
	end)
	
	if ok then
		return Vector2.new(status.X, math.min(status.Y, p4.Y)) + vector2
	end
	loggerModule:warning("GetTextBoundsAsync call failed, falling back to frame size. Error: ", status)
	
	return p4
end