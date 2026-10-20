local TextService = game:GetService("TextService")
local LoggerModule = require(script.Parent.Parent.Parent.Logger)
local _Vector2 = Vector2.new(2, 2)

return function(Text, Size, p1, Vector, p2)
	-- upvalues: TextService (copy), _Vector2 (copy), LoggerModule (copy)
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Font = Font.fromEnum(p1)
	GetTextBoundsParams.Size = Size
	GetTextBoundsParams.Text = Text
	GetTextBoundsParams.Width = Vector.X
	GetTextBoundsParams.RichText = p2 or false
	local Success, Result = pcall(function()
		-- upvalues: TextService (upval), GetTextBoundsParams (copy)
		return TextService:GetTextBoundsAsync(GetTextBoundsParams)
	end)
	
	if Success then
		return Vector2.new(Result.X, (math.min(Result.Y, Vector.Y))) + _Vector2
	else
		LoggerModule:warning("GetTextBoundsAsync call failed, falling back to frame size. Error: ", Result)
		
		return Vector
	end
end