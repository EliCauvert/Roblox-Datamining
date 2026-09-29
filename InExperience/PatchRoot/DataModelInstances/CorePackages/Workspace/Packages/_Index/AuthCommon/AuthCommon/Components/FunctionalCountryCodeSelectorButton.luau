local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local foundationModule = require(parent.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local appFonts = require(parent.Style).AppFonts
local getTextSize = require(parent.Style).GetTextSize
local colors = require(parent.Style).Colors
local white = colors.White
local gray2 = colors.Gray2
local _ = roactModule.PureComponent:extend("CountryCodeSelectorButton")
local text = require(parent.AppCommonLib).Text
local getFFlagCountryCodeBoldPrefixEnabledModule = require(authCommon.Flags.GetFFlagCountryCodeBoldPrefixEnabled)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local _ = require(authCommon.Common.Types)

return function(p1)
	-- upvalues: getFFlagCountryCodeBoldPrefixEnabledModule (ref), foundationFontFaceMigration (ref), foundationModule (ref), getTextSize (ref), text (ref), appFonts (ref), useStyle (ref), roactModule (ref), normalizeFontFace (ref), white (ref), gray2 (ref)
	local localizedName = p1.CountryCode.localizedName or ""
	local text_1 = "+" .. (p1.CountryCode.prefix or "")
	local textSize = p1.ListButtonProps.TextSize
	local boldPrefixEnabled = getFFlagCountryCodeBoldPrefixEnabledModule() and p1.BoldPrefixEnabled
	local var1 = if foundationFontFaceMigration then foundationModule.Hooks.useTokens() else nil
	local var2 = if foundationFontFaceMigration then getTextSize(text_1, textSize, var1.Typography.BodySmall.Font, Vector2.new(10000, 10000)).X else text.GetTextWidth(text_1, appFonts.default:getDefault(), textSize)
	local formattedText = string.format("%s (%s)", localizedName, text_1)
	local size = p1.Size
	local layoutOrder = p1.LayoutOrder
	local selectionCallback = p1.ListButtonProps.SelectionCallback or function(_) end
	local var3 = useStyle()
	
	return roactModule.createElement("TextButton", {
		Size = size,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Text = "",
		[roactModule.Event.Activated] = function()
			-- upvalues: selectionCallback (ref), p1 (ref)
			selectionCallback(p1.CountryCode)
		end
	}, if boldPrefixEnabled then {
		FullText = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = formattedText,
			Font = if foundationFontFaceMigration then nil else var3.Tokens.Typography.BodySmall.Font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(var1.Typography.BodySmall.Font) else nil,
			TextColor3 = var3.Tokens.Color.Shift.Shift_400.Color3,
			TextSize = textSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	} else {
		CountryName = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -var2, 1, 0),
			Text = localizedName,
			Font = if foundationFontFaceMigration then nil else appFonts.default:getDefault(),
			FontFace = if foundationFontFaceMigration then normalizeFontFace(var1.Typography.BodySmall.Font) else nil,
			TextColor3 = white,
			TextSize = textSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		CountryPrefix = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = text_1,
			Font = if foundationFontFaceMigration then nil else appFonts.default:getDefault(),
			FontFace = if foundationFontFaceMigration then normalizeFontFace(var1.Typography.BodySmall.Font) else nil,
			TextColor3 = gray2,
			TextSize = textSize,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end