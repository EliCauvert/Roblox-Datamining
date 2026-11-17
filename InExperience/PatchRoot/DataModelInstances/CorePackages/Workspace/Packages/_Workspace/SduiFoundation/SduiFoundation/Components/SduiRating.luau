local Parent = script:FindFirstAncestor("SduiFoundation").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChipSize = FoundationModule.Enums.ChipSize
local Rating = FoundationModule.Rating
local RatingValue = FoundationModule.Enums.RatingValue

local function noop() end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Rating (copy), ChipSize (copy), RatingValue (copy), noop (copy)
	return ReactModule.createElement(Rating, {
		text = p1.text or "",
		size = if p1.size then ChipSize[p1.size] else nil,
		value = p1.value or RatingValue.None,
		onThumbUp = p1.onThumbUp or noop,
		onThumbDown = p1.onThumbDown or noop,
		Selectable = p1.selectable,
		testId = p1.testId,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Visible = p1.visible,
		ZIndex = p1.zIndex
	})
end)