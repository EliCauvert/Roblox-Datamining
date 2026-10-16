local FoundationModule = require(script.Parent.Parent.Parent.Foundation)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GetTextSizeOffsetFunction = FoundationModule.Utility.getTextSizeOffset
local TextService = game:GetService("TextService")

return function(p1) --[[ Line: 9 ]]
	-- upvalues: FoundationFontFaceMigration (copy), GetTextSizeOffsetFunction (copy), TextService (copy)
	if FoundationFontFaceMigration then
		local TextSizeOffset = GetTextSizeOffsetFunction()
		
		return TextSizeOffset ~= nil, TextSizeOffset
	else
		local Success, Result = pcall(function() --[[ Line: 14 ]]
			-- upvalues: TextService (upval), p1 (copy)
			return TextService:GetTextSize("", 0, p1, Vector2.new(1e999, 1e999)).Y
		end)
		
		return Success, Result
	end
end