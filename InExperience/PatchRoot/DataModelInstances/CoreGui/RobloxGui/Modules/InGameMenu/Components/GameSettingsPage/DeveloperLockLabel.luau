local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local StrictInterfaceResult = T.strictInterface({
	Position = T.UDim2,
	Size = T.UDim2,
	AnchorPoint = T.Vector2
})

return function(p1) --[[ Line: 20 ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithLocalizationModule (copy), Roact (copy), ThemedTextLabelModule (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithLocalizationModule({
		lockedText = "CoreScripts.InGameMenu.GameSettings.LockedByDeveloper"
	})(function(p2) --[[ Line: 27 ]]
		-- upvalues: Roact (upval), ThemedTextLabelModule (upval)
		return Roact.createElement(ThemedTextLabelModule, {
			themeKey = "TextDefault",
			fontKey = "CaptionBody",
			TextTransparency = 0.5,
			Text = p2.lockedText,
			Size = UDim2.new(1, -72, 0.25, 0),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Bottom
		})
	end)
end