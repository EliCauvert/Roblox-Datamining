local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local text = require(parent.AppCommonLib).Text
local fFlagHomepagePYMKPresence = require(parent.SharedFlags).FFlagHomepagePYMKPresence
local t = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p0) --[[ line: 27 ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), text (ref), styledTextLabel (ref), fFlagHomepagePYMKPresence (ref)
	local var4 = cryoModule.Dictionary.join(t, p0)
	local var5 = useStyle()
	local font = var5.Font
	
	return reactModule.createElement(styledTextLabel, {
		lineHeight = 1,
		fluidSizing = false,
		layoutOrder = var4.layoutOrder,
		text = var4.name,
		fontStyle = font.CaptionHeader,
		colorStyle = var5.Theme.TextEmphasis,
		size = UDim2.fromOffset(var4.width, reactModule.useMemo(function() --[[ line: 34 ]]
			-- upvalues: text (copy), var4 (ref), font (ref)
			return text.GetTextHeight(var4.name, font.CaptionHeader.Font, font.BaseSize * font.CaptionHeader.RelativeSize, 10000)
		end, {
			var4.name,
			font.CaptionHeader.Font,
			font.BaseSize * font.CaptionHeader.RelativeSize
		})),
		textTruncate = Enum.TextTruncate.AtEnd,
		textXAlignment = Enum.TextXAlignment.Left,
		textYAlignment = Enum.TextYAlignment.Center,
		richText = if fFlagHomepagePYMKPresence then true else false
	})
end