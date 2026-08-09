local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withStyle = inGameMenuDependenciesModule.UIBlox.Core.Style.withStyle
local globalConfigModule = require(script.Parent.Parent.GlobalConfig)
local var2 = t.strictInterface({
	themeKey = t.optional(t.string),
	fontKey = t.optional(t.string),
	AnchorPoint = t.optional(t.Vector2),
	LayoutOrder = t.optional(t.integer),
	Position = t.optional(t.UDim2),
	Size = t.optional(t.UDim2),
	Text = t.string,
	TextColor3 = t.optional(t.Color3),
	TextTransparency = t.optional(t.numberConstrained(0, 1)),
	TextWrapped = t.optional(t.boolean),
	TextXAlignment = t.optional(t.enum(Enum.TextXAlignment)),
	TextYAlignment = t.optional(t.enum(Enum.TextYAlignment)),
	TextTruncate = t.optional(t.enum(Enum.TextTruncate)),
	Visible = t.optional(t.boolean),
	ZIndex = t.optional(t.integer),
	AutomaticSize = t.optional(t.enum(Enum.AutomaticSize)),
	[roact.Children] = t.optional(t.table)
})

return function(p0) --[[ line: 34 | named "ThemedTextLabel" ]]
	-- upvalues: globalConfigModule (ref), var2 (ref), withStyle (ref), cryo (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var2(p0))
	end
	return withStyle(function(p1) --[[ line: 39 ]]
		-- upvalues: p0 (ref), cryo (copy), roact (copy)
		local var3 = p1.Theme[p0.themeKey or "TextDefault"]
		local var4 = p1.Font[p0.fontKey or "Body"]
		
		return roact.createElement("TextLabel", cryo.Dictionary.join({
			TextColor3 = var3.Color,
			TextTransparency = var3.Transparency
		}, p0, {
			BackgroundTransparency = 1,
			fontKey = cryo.None,
			themeKey = cryo.None,
			Font = var4.Font,
			TextSize = var4.RelativeSize * p1.Font.BaseSize
		}))
	end)
end