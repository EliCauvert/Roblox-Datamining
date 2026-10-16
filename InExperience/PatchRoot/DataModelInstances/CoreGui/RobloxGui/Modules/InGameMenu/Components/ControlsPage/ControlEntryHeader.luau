local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local StrictInterfaceResult = T.strictInterface({ title = T.string, LayoutOrder = T.integer })

return function(Frame) --[[ Line: 26 | Named "ControlEntry" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithLocalizationModule (copy), Roact (copy), ThemedTextLabelModule (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return WithLocalizationModule({ title = Frame.title })(function(p1) --[[ Line: 33 ]]
		-- upvalues: Roact (upval), Frame (copy), ThemedTextLabelModule (upval)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 45),
			LayoutOrder = Frame.LayoutOrder
		}, {
			HeaderText = Roact.createElement(ThemedTextLabelModule, {
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