local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local appFonts = require(parent.Style).AppFonts
local colors = require(parent.Style).Colors
local white = colors.White
local gray2 = colors.Gray2
local _ = roactModule.PureComponent:extend("CountryCodeSelectorButton")
local text = require(parent.AppCommonLib).Text
local getFFlagCountryCodeBoldPrefixEnabledModule = require(authCommon.Flags.GetFFlagCountryCodeBoldPrefixEnabled)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local _ = require(authCommon.Common.Types)

return function(p0) --[[ line: 28 | named "CountryCodeSelectorButton" ]]
	-- upvalues: getFFlagCountryCodeBoldPrefixEnabledModule (ref), text (ref), appFonts (ref), useStyle (ref), roactModule (ref), white (ref), gray2 (ref)
	local localizedName = p0.CountryCode.localizedName or ""
	local text_1 = "+" .. (p0.CountryCode.prefix or "")
	local textSize = p0.ListButtonProps.TextSize
	local boldPrefixEnabled = getFFlagCountryCodeBoldPrefixEnabledModule() and p0.BoldPrefixEnabled
	local textWidth = text.GetTextWidth(text_1, appFonts.default:getDefault(), textSize)
	local formattedText = string.format("%s (%s)", localizedName, text_1)
	local size = p0.Size
	local layoutOrder = p0.LayoutOrder
	local selectionCallback = p0.ListButtonProps.SelectionCallback or function(_) --[[ line: 37 ]] end
	local var9 = useStyle()
	
	return roactModule.createElement("TextButton", {
		Size = size,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Text = "",
		[roactModule.Event.Activated] = function() --[[ line: 82 ]]
			-- upvalues: selectionCallback (ref), p0 (ref)
			selectionCallback(p0.CountryCode)
		end
	}, if boldPrefixEnabled then {
		FullText = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = formattedText,
			Font = var9.Tokens.Typography.BodySmall.Font,
			TextColor3 = var9.Tokens.Color.Shift.Shift_400.Color3,
			TextSize = textSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	} else {
		CountryName = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -textWidth, 1, 0),
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
			TextXAlignment = Enum.TextXAlignment.Right,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end