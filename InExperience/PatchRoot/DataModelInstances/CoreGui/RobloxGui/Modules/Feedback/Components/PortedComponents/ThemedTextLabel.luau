local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local t = inGameMenuDependenciesModule.t
local withStyle = UIBloxModule.Core.Style.withStyle
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local globalConfigModule = require(script.Parent.Parent.Parent.GlobalConfig)
local t_1 = {
	Title = "HeadingLarge",
	Header1 = "HeadingSmall",
	Header2 = "TitleLarge",
	SubHeader1 = "TitleLarge",
	Body = "BodyLarge",
	CaptionHeader = "CaptionMedium",
	CaptionSubHeader = "CaptionMedium",
	CaptionBody = "BodySmall",
	Footer = "CaptionSmall"
}
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
	-- upvalues: globalConfigModule (ref), var1 (ref), withStyle (ref), cryo (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), t_1 (ref), roact (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withStyle(function(p2)
		-- upvalues: p1 (ref), cryo (copy), foundationFontFaceMigration (copy), normalizeFontFace (copy), t_1 (copy), roact (copy)
		local var2 = p2.Theme[p1.themeKey or "TextDefault"]
		local var3 = p2.Font[p1.fontKey or "Body"]
		
		return roact.createElement("TextLabel", cryo.Dictionary.join({
			TextColor3 = var2.Color,
			TextTransparency = var2.Transparency
		}, p1, {
			BackgroundTransparency = 1,
			fontKey = cryo.None,
			themeKey = cryo.None,
			Font = if foundationFontFaceMigration then cryo.None else var3.Font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(p2.Tokens.Typography[t_1[p1.fontKey or "Body"]].Font) else nil,
			TextSize = var3.RelativeSize * p2.Font.BaseSize
		}))
	end)
end