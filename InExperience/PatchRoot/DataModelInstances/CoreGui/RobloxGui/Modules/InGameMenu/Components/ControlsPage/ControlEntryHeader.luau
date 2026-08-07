local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local var4 = t.strictInterface({ title = t.string, LayoutOrder = t.integer })

return function(p0) --[[ line: 26 | named "ControlEntry" ]]
	-- upvalues: globalConfigModule (ref), var4 (ref), withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref)
	if globalConfigModule.propValidation then
		assert(var4(p0))
	end
	return withLocalizationModule({ title = p0.title })(function(p1) --[[ line: 33 ]]
		-- upvalues: roact (copy), p0 (ref), themedTextLabelModule (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 45),
			LayoutOrder = p0.LayoutOrder
		}, {
			HeaderText = roact.createElement(themedTextLabelModule, {
				fontKey = "CaptionHeader",
				themeKey = "TextMuted",
				Text = p1.title,
				TextXAlignment = Enum.TextXAlignment.Left,
				Position = UDim2.new(0, 0, 0, 20),
				Size = UDim2.new(1, 0, 0, 17)
			})
		})
	end)
end