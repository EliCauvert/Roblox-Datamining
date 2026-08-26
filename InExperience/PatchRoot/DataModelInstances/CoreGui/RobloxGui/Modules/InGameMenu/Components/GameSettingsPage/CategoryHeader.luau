local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(script.Parent.Parent.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local var1 = t.strictInterface({ LayoutOrder = t.integer, localizationKey = t.string })

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), roact (ref), withLocalizationModule (ref), themedTextLabelModule (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 36)
	}, {
		Label = withLocalizationModule({ text = p1.localizationKey })(function(p2)
			-- upvalues: roact (copy), themedTextLabelModule (copy)
			return roact.createElement(themedTextLabelModule, {
				fontKey = "Footer",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, -48, 0, 14),
				Text = p2.text,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		end)
	})
end