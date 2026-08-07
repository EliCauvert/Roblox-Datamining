local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local withStyleModule = require(parent.Core.Style.withStyle)
local tileBanner = roactModule.PureComponent:extend("TileBanner")
tileBanner.validateProps = tModule.strictInterface({ bannerText = tModule.string })

function tileBanner.render(p0) --[[ line: 21 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref)
	local bannerText = p0.props.bannerText
	
	return withStyleModule(function(p1) --[[ line: 24 ]]
		-- upvalues: roactModule (copy), bannerText (ref)
		local font = p1.Font
		local theme = p1.Theme
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = theme.SystemPrimaryDefault.Color,
			BackgroundTransparency = theme.SystemPrimaryDefault.Transparency,
			Size = UDim2.new(1, 0, 0, 6 + font.CaptionBody.RelativeSize * font.BaseSize)
		}, {
			TextLabel = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = font.CaptionBody.Font,
				TextSize = font.CaptionBody.RelativeSize * font.BaseSize,
				Text = bannerText,
				TextColor3 = theme.SystemPrimaryContent.Color,
				TextTransparency = theme.SystemPrimaryContent.Transparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return tileBanner