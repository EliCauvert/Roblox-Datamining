local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local WithStyleModule = require(Parent.Core.Style.withStyle)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local TileBanner = RoactModule.PureComponent:extend("TileBanner")
TileBanner.validateProps = TModule.strictInterface({ bannerText = TModule.string })

function TileBanner.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local BannerText = p1.props.bannerText
	
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), BannerText (copy)
		local _Font = p2.Font
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.SystemPrimaryDefault.Color,
			BackgroundTransparency = Theme.SystemPrimaryDefault.Transparency,
			Size = UDim2.new(1, 0, 0, 6 + _Font.CaptionBody.RelativeSize * _Font.BaseSize)
		}, {
			TextLabel = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = if FoundationFontFaceMigration then nil else _Font.CaptionBody.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(_Font.CaptionBody.Font) else nil,
				TextSize = _Font.CaptionBody.RelativeSize * _Font.BaseSize,
				Text = BannerText,
				TextColor3 = Theme.SystemPrimaryContent.Color,
				TextTransparency = Theme.SystemPrimaryContent.Transparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return TileBanner