local textService = game:GetService("TextService")
local parent = script.Parent.Parent.Parent
local foundationModule = require(parent.Parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local loggerModule = require(parent.Logger)
local getLegacyFontModule = require(script.Parent.GetLegacyFont)
local vector2 = Vector2.new(2, 2)

return function(p1, p2, p3, p4, p5)
	-- upvalues: foundationFontFaceMigration (ref), getLegacyFontModule (ref), textService (ref), normalizeFontFace (ref), vector2 (ref), loggerModule (ref)
	local ok, status, var1 = pcall(function()
		-- upvalues: foundationFontFaceMigration (copy), p5 (ref), getLegacyFontModule (copy), p3 (ref), p4 (ref), textService (copy), p1 (ref), p2 (ref), normalizeFontFace (copy)
		if not foundationFontFaceMigration or p5 then
			local getTextBoundsParams = Instance.new("GetTextBoundsParams")
			getTextBoundsParams.Font = if foundationFontFaceMigration then normalizeFontFace(p3) else Font.fromEnum(p3)
			getTextBoundsParams.Size = p2
			getTextBoundsParams.Text = p1
			getTextBoundsParams.Width = p4.X
			getTextBoundsParams.RichText = p5 or false
			
			return textService:GetTextBoundsAsync(getTextBoundsParams), false
		end
		local var2, var3 = getLegacyFontModule(p3)
		
		if var2 == nil then
			return nil, var3
		end
		local var4 = var3 and var2 == Enum.Font.Cartoon
		local x = p4.X
		
		if not (x > 0 and x < 1e999) then
			x = 1e999
		elseif var4 then
			x /= 1.01
		end
		return textService:GetTextSize(p1, p2, var2, Vector2.new(x, 1e999)), var4
	end)
	
	if ok and status then
		local vector2_1 = Vector2.new(status.X, math.min(status.Y, p4.Y))
		
		if var1 then
			local ceiled = math.ceil(vector2_1.X * 1.01)
			
			if p4.X > 0 and p4.X < 1e999 then
				ceiled = math.min(ceiled, p4.X)
			end
			vector2_1 = Vector2.new(ceiled, vector2_1.Y)
		end
		return vector2_1 + vector2
	elseif ok then
		loggerModule:warning("Font cannot be measured, falling back to frame size")
		
		return p4
	end
	loggerModule:warning(`Text measurement failed, falling back to frame size. Error: {status}`)
	
	return p4
end