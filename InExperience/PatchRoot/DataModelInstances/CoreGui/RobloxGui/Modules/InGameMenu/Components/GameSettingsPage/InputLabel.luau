local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local var1 = t.strictInterface({
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	Size = t.optional(t.UDim2),
	localizationKey = t.string,
	LayoutOrder = t.optional(t.number)
})

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withLocalizationModule({ text = p1.localizationKey })(function(p2)
		-- upvalues: roact (copy), themedTextLabelModule (copy), p1 (ref)
		return roact.createElement(themedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextDefault",
			LayoutOrder = p1.LayoutOrder,
			AnchorPoint = p1.AnchorPoint or Vector2.new(0, 0.5),
			Position = p1.Position or UDim2.new(0, 0, 0.5, 0),
			Size = p1.Size or UDim2.new(1, -72, 0.5, 0),
			Text = p2.text,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end)
end