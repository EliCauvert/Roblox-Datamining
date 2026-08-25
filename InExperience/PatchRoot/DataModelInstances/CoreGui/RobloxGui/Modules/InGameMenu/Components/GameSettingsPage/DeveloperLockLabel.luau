local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local withLocalizationModule = require(parent.Localization.withLocalization)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local var4 = t.strictInterface({
	Position = t.UDim2,
	Size = t.UDim2,
	AnchorPoint = t.Vector2
})

return function(p0)
	-- upvalues: globalConfigModule (ref), var4 (ref), withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref)
	if globalConfigModule.propValidation then
		assert(var4(p0))
	end
	return withLocalizationModule({
		lockedText = "CoreScripts.InGameMenu.GameSettings.LockedByDeveloper"
	})(function(p1)
		-- upvalues: roact (copy), themedTextLabelModule (copy)
		return roact.createElement(themedTextLabelModule, {
			themeKey = "TextDefault",
			fontKey = "CaptionBody",
			TextTransparency = 0.5,
			Text = p1.lockedText,
			Size = UDim2.new(1, -72, 0.25, 0),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom
		})
	end)
end