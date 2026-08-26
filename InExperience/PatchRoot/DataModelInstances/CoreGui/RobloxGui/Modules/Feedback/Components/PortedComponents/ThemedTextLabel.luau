local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withStyle = require(corePackagesService.Packages.UIBlox).Core.Style.withStyle
local globalConfigModule = require(script.Parent.Parent.Parent.GlobalConfig)
local var1 = t.strictInterface({
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

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withStyle (ref), cryo (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withStyle(function(p2)
		-- upvalues: p1 (ref), cryo (copy), roact (copy)
		local var2 = p2.Theme[p1.themeKey or "TextDefault"]
		local var3 = p2.Font[p1.fontKey or "Body"]
		
		return roact.createElement("TextLabel", cryo.Dictionary.join({
			TextColor3 = var2.Color,
			TextTransparency = var2.Transparency
		}, p1, {
			BackgroundTransparency = 1,
			fontKey = cryo.None,
			themeKey = cryo.None,
			Font = var3.Font,
			TextSize = var3.RelativeSize * p2.Font.BaseSize
		}))
	end)
end