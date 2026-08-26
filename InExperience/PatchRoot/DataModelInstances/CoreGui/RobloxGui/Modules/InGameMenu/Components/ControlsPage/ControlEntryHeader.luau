local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local var1 = t.strictInterface({ title = t.string, LayoutOrder = t.integer })

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withLocalizationModule({ title = p1.title })(function(p2)
		-- upvalues: roact (copy), p1 (ref), themedTextLabelModule (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 45),
			LayoutOrder = p1.LayoutOrder
		}, {
			HeaderText = roact.createElement(themedTextLabelModule, {
				fontKey = "CaptionHeader",
				themeKey = "TextMuted",
				Text = p2.title,
				TextXAlignment = Enum.TextXAlignment.Left,
				Position = UDim2.new(0, 0, 0, 20),
				Size = UDim2.new(1, 0, 0, 17)
			})
		})
	end)
end