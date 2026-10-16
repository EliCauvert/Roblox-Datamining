local Parent = script:FindFirstAncestor("AuthCommon").Parent
local RoactModule = require(Parent.Roact)
local AppFonts = require(Parent.Style).AppFonts
local Colors = require(Parent.Style).Colors
local White = Colors.White
local Gray2 = Colors.Gray2
local CountryCodeSelectorButton = RoactModule.PureComponent:extend("CountryCodeSelectorButton")
local Text = require(Parent.AppCommonLib).Text

function CountryCodeSelectorButton.init(p1) --[[ Line: 14 ]]
	function p1.selectionCallback() --[[ Line: 15 ]]
		-- upvalues: p1 (copy)
		if p1.props.ListButtonProps.SelectionCallback then
			p1.props.ListButtonProps.SelectionCallback(p1.props.Data)
		end
	end
end

function CountryCodeSelectorButton.render(p1) --[[ Line: 22 ]]
	-- upvalues: Text (copy), AppFonts (copy), RoactModule (copy), White (copy), Gray2 (copy)
	local Text1 = "+" .. (p1.props.Data.prefix or "")
	local TextSize = p1.props.ListButtonProps.TextSize
	
	return RoactModule.createElement("TextButton", {
		Size = p1.props.Size,
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.LayoutOrder,
		Text = "",
		[RoactModule.Event.Activated] = p1.selectionCallback
	}, {
		CountryName = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -Text.GetTextWidth(Text1, AppFonts.default:getDefault(), TextSize), 1, 0),
			Text = p1.props.Data.localizedName or "",
			Font = AppFonts.default:getDefault(),
			TextColor3 = White,
			TextSize = TextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		CountryPrefix = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = Text1,
			Font = AppFonts.default:getDefault(),
			TextColor3 = Gray2,
			TextSize = TextSize,
			TextXAlignment = Enum.TextXAlignment.Right
		})
	})
end

return CountryCodeSelectorButton