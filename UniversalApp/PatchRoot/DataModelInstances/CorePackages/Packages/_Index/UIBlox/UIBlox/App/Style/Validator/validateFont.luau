local Parent = script.Parent.Parent.Parent.Parent
local TModule = require(Parent.Parent.t)
local ValidateFontInfoModule = require(Parent.Core.Style.Validator.validateFontInfo)

return TModule.union(TModule.strictInterface({
	BaseSize = TModule.numberMinExclusive(0),
	Title = ValidateFontInfoModule,
	Header1 = ValidateFontInfoModule,
	Header2 = ValidateFontInfoModule,
	SubHeader1 = ValidateFontInfoModule,
	Body = ValidateFontInfoModule,
	CaptionHeader = ValidateFontInfoModule,
	CaptionSubHeader = ValidateFontInfoModule,
	CaptionBody = ValidateFontInfoModule,
	Footer = ValidateFontInfoModule
}), (TModule.strictInterface({
	BaseSize = TModule.numberMinExclusive(0),
	Title = ValidateFontInfoModule,
	Header1 = ValidateFontInfoModule,
	Header2 = ValidateFontInfoModule,
	SubHeader1 = ValidateFontInfoModule,
	Body = ValidateFontInfoModule,
	CaptionHeader = ValidateFontInfoModule,
	CaptionSubHeader = ValidateFontInfoModule,
	CaptionBody = ValidateFontInfoModule,
	Footer = ValidateFontInfoModule,
	HeadingLarge = ValidateFontInfoModule,
	HeadingSmall = ValidateFontInfoModule,
	TitleLarge = ValidateFontInfoModule,
	BodyLarge = ValidateFontInfoModule,
	CaptionLarge = ValidateFontInfoModule,
	BodySmall = ValidateFontInfoModule,
	CaptionSmall = ValidateFontInfoModule
})))