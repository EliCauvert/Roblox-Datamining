local parent = script.Parent.Parent.Parent.Parent
local tModule = require(parent.Parent.t)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)

return tModule.union(tModule.strictInterface({
	BaseSize = tModule.numberMinExclusive(0),
	Title = validateFontInfoModule,
	Header1 = validateFontInfoModule,
	Header2 = validateFontInfoModule,
	SubHeader1 = validateFontInfoModule,
	Body = validateFontInfoModule,
	CaptionHeader = validateFontInfoModule,
	CaptionSubHeader = validateFontInfoModule,
	CaptionBody = validateFontInfoModule,
	Footer = validateFontInfoModule
}), tModule.strictInterface({
	BaseSize = tModule.numberMinExclusive(0),
	Title = validateFontInfoModule,
	Header1 = validateFontInfoModule,
	Header2 = validateFontInfoModule,
	SubHeader1 = validateFontInfoModule,
	Body = validateFontInfoModule,
	CaptionHeader = validateFontInfoModule,
	CaptionSubHeader = validateFontInfoModule,
	CaptionBody = validateFontInfoModule,
	Footer = validateFontInfoModule,
	HeadingLarge = validateFontInfoModule,
	HeadingSmall = validateFontInfoModule,
	TitleLarge = validateFontInfoModule,
	BodyLarge = validateFontInfoModule,
	CaptionLarge = validateFontInfoModule,
	BodySmall = validateFontInfoModule,
	CaptionSmall = validateFontInfoModule
}))