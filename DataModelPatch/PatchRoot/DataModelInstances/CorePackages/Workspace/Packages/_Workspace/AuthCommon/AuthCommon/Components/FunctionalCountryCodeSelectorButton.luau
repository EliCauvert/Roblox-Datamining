local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local AppFonts = require(Parent.Style).AppFonts
local Colors = require(Parent.Style).Colors
local White = Colors.White
local Gray2 = Colors.Gray2
local _ = RoactModule.PureComponent:extend("CountryCodeSelectorButton")
local Text = require(Parent.AppCommonLib).Text
local GetFFlagCountryCodeBoldPrefixEnabledModule = require(AuthCommon.Flags.GetFFlagCountryCodeBoldPrefixEnabled)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local _ = require(AuthCommon.Common.Types)

return function(Frame)
	-- upvalues: GetFFlagCountryCodeBoldPrefixEnabledModule (copy), Text (copy), AppFonts (copy), UseStyleFunction (copy), RoactModule (copy), White (copy), Gray2 (copy)
	local LocalizedName = Frame.CountryCode.localizedName or ""
	local Text1 = "+" .. (Frame.CountryCode.prefix or "")
	local TextSize = Frame.ListButtonProps.TextSize
	local BoldPrefixEnabled = GetFFlagCountryCodeBoldPrefixEnabledModule() and Frame.BoldPrefixEnabled
	local TextWidth = Text.GetTextWidth(Text1, AppFonts.default:getDefault(), TextSize)
	local Formatted = string.format("%s (%s)", LocalizedName, Text1)
	local Size = Frame.Size
	local LayoutOrder = Frame.LayoutOrder
	local SelectionCallback = Frame.ListButtonProps.SelectionCallback or function(_) end
	local UseStyleResult = UseStyleFunction()
	
	return RoactModule.createElement("TextButton", {
		Size = Size,
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		Text = "",
		[RoactModule.Event.Activated] = function()
			-- upvalues: SelectionCallback (copy), Frame (copy)
			SelectionCallback(Frame.CountryCode)
		end
	}, if BoldPrefixEnabled then {
		FullText = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = Formatted,
			Font = UseStyleResult.Tokens.Typography.BodySmall.Font,
			TextColor3 = UseStyleResult.Tokens.Color.Shift.Shift_400.Color3,
			TextSize = TextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	} else {
		CountryName = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -TextWidth, 1, 0),
			Text = LocalizedName,
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
			TextXAlignment = Enum.TextXAlignment.Right,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end