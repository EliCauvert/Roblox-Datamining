local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local StrictInterfaceResult = T.strictInterface({
	AnchorPoint = T.optional(T.Vector2),
	Position = T.optional(T.UDim2),
	Size = T.optional(T.UDim2),
	localizationKey = T.string,
	LayoutOrder = T.optional(T.number)
})

return function(Frame: Frame) --[[ Line: 22 ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithLocalizationModule (copy), Roact (copy), ThemedTextLabelModule (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return WithLocalizationModule({ text = Frame.localizationKey })(function(p1) --[[ Line: 29 ]]
		-- upvalues: Roact (upval), ThemedTextLabelModule (upval), Frame (copy)
		return Roact.createElement(ThemedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextDefault",
			LayoutOrder = Frame.LayoutOrder,
			AnchorPoint = Frame.AnchorPoint or Vector2.new(0, 0.5),
			Position = Frame.Position or UDim2.new(0, 0, 0.5, 0),
			Size = Frame.Size or UDim2.new(1, -72, 0.5, 0),
			Text = p1.text,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end)
end