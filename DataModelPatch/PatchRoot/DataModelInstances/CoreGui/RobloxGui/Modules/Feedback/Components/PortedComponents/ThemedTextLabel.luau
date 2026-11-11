local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.withStyle
local GlobalConfigModule = require(script.Parent.Parent.Parent.GlobalConfig)
local StrictInterfaceResult = T.strictInterface({
	themeKey = T.optional(T.string),
	fontKey = T.optional(T.string),
	AnchorPoint = T.optional(T.Vector2),
	LayoutOrder = T.optional(T.integer),
	Position = T.optional(T.UDim2),
	Size = T.optional(T.UDim2),
	Text = T.string,
	TextColor3 = T.optional(T.Color3),
	TextTransparency = T.optional(T.numberConstrained(0, 1)),
	TextWrapped = T.optional(T.boolean),
	TextXAlignment = T.optional(T.enum(Enum.TextXAlignment)),
	TextYAlignment = T.optional(T.enum(Enum.TextYAlignment)),
	TextTruncate = T.optional(T.enum(Enum.TextTruncate)),
	Visible = T.optional(T.boolean),
	ZIndex = T.optional(T.integer),
	AutomaticSize = T.optional(T.enum(Enum.AutomaticSize)),
	[Roact.Children] = T.optional(T.table)
})

return function(p1)
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithStyleFunction (copy), Cryo (copy), Roact (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), Cryo (upval), Roact (upval)
		local ThemeEntry = p2.Theme[p1.themeKey or "TextDefault"]
		local v1 = p2.Font[p1.fontKey or "Body"]
		
		return Roact.createElement("TextLabel", (Cryo.Dictionary.join({
			TextColor3 = ThemeEntry.Color,
			TextTransparency = ThemeEntry.Transparency
		}, p1, {
			BackgroundTransparency = 1,
			fontKey = Cryo.None,
			themeKey = Cryo.None,
			Font = v1.Font,
			TextSize = v1.RelativeSize * p2.Font.BaseSize
		})))
	end)
end