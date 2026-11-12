local TextService = game:GetService("TextService")
local Parent = script:FindFirstAncestor("Style").Parent
local FoundationFontFaceMigration = require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local GetTextSizeFunction = require(Parent.UIBlox).Core.Text.GetTextSize
local _Vector2 = Vector2.new(2, 2)

return function(String, FontSize, p1, FrameSize, p2)
	-- upvalues: FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), _Vector2 (copy), TextService (copy)
	if FoundationFontFaceMigration then
		local TextSize = GetTextSizeFunction(String, FontSize, p1, FrameSize)
		
		return if p2 == nil or p2.addTemporaryPadding ~= false then TextSize else TextSize - _Vector2
	else
		return TextService:GetTextSize(String, FontSize, p1, FrameSize) + _Vector2
	end
end