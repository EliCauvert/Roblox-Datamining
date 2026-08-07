local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local var4 = t.strictInterface({
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	Size = t.optional(t.UDim2),
	localizationKey = t.string,
	LayoutOrder = t.optional(t.number)
})

return function(p0) --[[ line: 22 ]]
	-- upvalues: globalConfigModule (ref), var4 (ref), withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref)
	if globalConfigModule.propValidation then
		assert(var4(p0))
	end
	return withLocalizationModule({ text = p0.localizationKey })(function(p1) --[[ line: 29 ]]
		-- upvalues: roact (copy), themedTextLabelModule (copy), p0 (ref)
		return roact.createElement(themedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextDefault",
			LayoutOrder = p0.LayoutOrder,
			AnchorPoint = p0.AnchorPoint or Vector2.new(0, 0.5),
			Position = p0.Position or UDim2.new(0, 0, 0.5, 0),
			Size = p0.Size or UDim2.new(1, -72, 0.5, 0),
			Text = p1.text,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end)
end