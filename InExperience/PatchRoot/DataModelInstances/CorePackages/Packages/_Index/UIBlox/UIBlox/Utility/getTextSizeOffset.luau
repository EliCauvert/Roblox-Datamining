local foundationModule = require(script.Parent.Parent.Parent.Foundation)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local getTextSizeOffset = foundationModule.Utility.getTextSizeOffset
local textService = game:GetService("TextService")

return function(p1)
	-- upvalues: foundationFontFaceMigration (ref), getTextSizeOffset (ref), textService (ref)
	if foundationFontFaceMigration then
		local var1 = getTextSizeOffset()
		
		return var1 ~= nil, var1
	end
	local ok, status = pcall(function()
		-- upvalues: textService (copy), p1 (ref)
		return textService:GetTextSize("", 0, p1, Vector2.new(1e999, 1e999)).Y
	end)
	
	return ok, status
end