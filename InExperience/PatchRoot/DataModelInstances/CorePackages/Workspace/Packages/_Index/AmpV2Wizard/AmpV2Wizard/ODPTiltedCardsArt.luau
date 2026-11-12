local Parent = script:FindFirstAncestor("AmpV2Wizard").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local _Vector2 = Vector2.new(50, -16)
local _Vector2_1 = Vector2.new(-50, 16)

local function renderCard(p1)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center anchor-center-center stroke-standard stroke-default radius-large bg-surface-0",
		Size = UDim2.fromOffset(112, 112),
		Position = UDim2.new(0.5, p1.offset.X, 0.5, p1.offset.Y),
		Rotation = p1.rotation,
		ZIndex = p1.zIndex
	}, { Glyph = p1.glyph })
end

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), renderCard (copy), _Vector2 (copy), Icon (copy), IconName (copy), _Vector2_1 (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0",
		testId = "amp-v2-wizard-tilted-cards-art",
		Size = UDim2.new(1, 0, 0, 200),
		LayoutOrder = Frame.LayoutOrder
	}, {
		ShieldCard = renderCard({
			rotation = 15,
			zIndex = 1,
			offset = _Vector2,
			glyph = ReactModule.createElement(Icon, {
				size = 64,
				tag = "content-emphasis",
				name = IconName.ShieldCheck
			})
		}),
		PeopleCard = renderCard({
			rotation = -15,
			zIndex = 2,
			offset = _Vector2_1,
			glyph = ReactModule.createElement(Icon, {
				size = 64,
				tag = "content-emphasis",
				name = IconName.PersonWithSmallerPerson
			})
		})
	})
end