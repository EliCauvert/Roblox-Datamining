local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(script.Parent.Parent.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local var4 = t.strictInterface({ LayoutOrder = t.integer, localizationKey = t.string })

return function(p0) --[[ line: 20 ]]
	-- upvalues: globalConfigModule (ref), var4 (ref), roact (ref), withLocalizationModule (ref), themedTextLabelModule (ref)
	if globalConfigModule.propValidation then
		assert(var4(p0))
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 36)
	}, {
		Label = withLocalizationModule({ text = p0.localizationKey })(function(p1) --[[ line: 32 ]]
			-- upvalues: roact (copy), themedTextLabelModule (copy)
			return roact.createElement(themedTextLabelModule, {
				fontKey = "Footer",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, -48, 0, 14),
				Text = p1.text,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		end)
	})
end