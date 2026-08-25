local parent = script:FindFirstAncestor("AuthCommon").Parent
local roactModule = require(parent.Roact)
local appFonts = require(parent.Style).AppFonts
local colors = require(parent.Style).Colors
local white = colors.White
local gray2 = colors.Gray2
local countryCodeSelectorButton = roactModule.PureComponent:extend("CountryCodeSelectorButton")
local text = require(parent.AppCommonLib).Text

function countryCodeSelectorButton.init(p0)
	function p0.selectionCallback()
		-- upvalues: p0 (ref)
		if p0.props.ListButtonProps.SelectionCallback then
			p0.props.ListButtonProps.SelectionCallback(p0.props.Data)
		end
	end
end

function countryCodeSelectorButton.render(p1)
	-- upvalues: text (ref), appFonts (ref), roactModule (ref), white (ref), gray2 (ref)
	local localizedName = p1.props.Data.localizedName or ""
	local text_1 = "+" .. (p1.props.Data.prefix or "")
	local textSize = p1.props.ListButtonProps.TextSize
	
	return roactModule.createElement("TextButton", {
		Size = p1.props.Size,
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.LayoutOrder,
		Text = "",
		[roactModule.Event.Activated] = p1.selectionCallback
	}, {
		CountryName = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -text.GetTextWidth(text_1, appFonts.default:getDefault(), textSize), 1, 0),
			Text = localizedName,
			Font = appFonts.default:getDefault(),
			TextColor3 = white,
			TextSize = textSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		CountryPrefix = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = text_1,
			Font = appFonts.default:getDefault(),
			TextColor3 = gray2,
			TextSize = textSize,
			TextXAlignment = Enum.TextXAlignment.Right
		})
	})
end

return countryCodeSelectorButton