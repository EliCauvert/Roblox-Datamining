local textService = game:GetService("TextService")
local parent = script:FindFirstAncestor("Style").Parent
local foundationFontFaceMigration = require(parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local getTextSize = require(parent.UIBlox).Core.Text.GetTextSize
local vector2 = Vector2.new(2, 2)

return function(p1, p2, p3, p4, p5)
	-- upvalues: foundationFontFaceMigration (ref), getTextSize (ref), vector2 (ref), textService (ref)
	if not foundationFontFaceMigration then
		return textService:GetTextSize(p1, p2, p3, p4) + vector2
	end
	local var1 = getTextSize(p1, p2, p3, p4)
	
	return if p5 == nil or p5.addTemporaryPadding ~= false then var1 else var1 - vector2
end