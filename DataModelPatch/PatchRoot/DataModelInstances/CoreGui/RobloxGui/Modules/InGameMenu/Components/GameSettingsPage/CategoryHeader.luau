local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local ThemedTextLabelModule = require(script.Parent.Parent.ThemedTextLabel)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local StrictInterfaceResult = T.strictInterface({ LayoutOrder = T.integer, localizationKey = T.string })

return function(Frame)
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), Roact (copy), WithLocalizationModule (copy), ThemedTextLabelModule (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 36)
	}, {
		Label = WithLocalizationModule({ text = Frame.localizationKey })(function(p1)
			-- upvalues: Roact (upval), ThemedTextLabelModule (upval)
			return Roact.createElement(ThemedTextLabelModule, {
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