local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local getTextSize = require(parent.Style).GetTextSize
local foundationFontFaceMigration = require(parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local text = require(parent.AppCommonLib).Text
local t = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), foundationFontFaceMigration (ref), reactModule (ref), getTextSize (ref), text (ref), styledTextLabel (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyle()
	local font = var2.Font
	
	return reactModule.createElement(styledTextLabel, {
		lineHeight = 1,
		fluidSizing = false,
		richText = true,
		layoutOrder = var1.layoutOrder,
		text = var1.name,
		fontStyle = font.CaptionHeader,
		colorStyle = var2.Theme.TextEmphasis,
		size = UDim2.fromOffset(var1.width, if foundationFontFaceMigration then reactModule.useMemo(function()
			-- upvalues: getTextSize (copy), var1 (ref), font (ref), var2 (ref)
			return getTextSize(var1.name, font.BaseSize * font.CaptionHeader.RelativeSize, var2.Tokens.Typography.CaptionLarge.Font, Vector2.new(10000, 10000)).Y
		end, {
			var1.name,
			font.BaseSize * font.CaptionHeader.RelativeSize,
			var2.Tokens.Typography.CaptionLarge.Font
		}) else reactModule.useMemo(function()
			-- upvalues: text (copy), var1 (ref), font (ref)
			return text.GetTextHeight(var1.name, font.CaptionHeader.Font, font.BaseSize * font.CaptionHeader.RelativeSize, 10000)
		end, {
			var1.name,
			font.CaptionHeader.Font,
			font.BaseSize * font.CaptionHeader.RelativeSize
		})),
		textTruncate = Enum.TextTruncate.AtEnd,
		textXAlignment = Enum.TextXAlignment.Left,
		textYAlignment = Enum.TextYAlignment.Center
	})
end