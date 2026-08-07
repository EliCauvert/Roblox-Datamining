-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

local textService = game:GetService("TextService")
local loggerModule = require(script.Parent.Parent.Parent.Logger)
local vector2 = Vector2.new(2, 2)

return function(p0, p1, p2, p3, p4) --[[ line: 12 | named "getTextSize" ]]
	-- upvalues: textService (ref), vector2 (ref), loggerModule (ref)
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Font = Font.fromEnum(p2)
	getTextBoundsParams.Size = p1
	getTextBoundsParams.Text = p0
	getTextBoundsParams.Width = p3.X
	getTextBoundsParams.RichText = p4 or false
	local ok, status = pcall(function() --[[ line: 21 ]]
		-- upvalues: textService (copy), getTextBoundsParams (ref)
		return textService:GetTextBoundsAsync(getTextBoundsParams)
	end)
	
	if ok then
		return Vector2.new(status.X, math.min(status.Y, p3.Y)) + vector2
	end
	loggerModule:warning("GetTextBoundsAsync call failed, falling back to frame size. Error: ", status)
	
	return p3
end