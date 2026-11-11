local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Text = require(Parent.AppCommonLib).Text
local FFlagHomepagePYMKPresence = require(Parent.SharedFlags).FFlagHomepagePYMKPresence
local config = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), Text (copy), StyledTextLabel (copy), FFlagHomepagePYMKPresence (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	
	return ReactModule.createElement(StyledTextLabel, {
		lineHeight = 1,
		fluidSizing = false,
		layoutOrder = JoinResult.layoutOrder,
		text = JoinResult.name,
		fontStyle = UseStyleResultFont.CaptionHeader,
		colorStyle = UseStyleResult.Theme.TextEmphasis,
		size = UDim2.fromOffset(JoinResult.width, (ReactModule.useMemo(function()
			-- upvalues: Text (upval), JoinResult (copy), UseStyleResultFont (copy)
			return Text.GetTextHeight(JoinResult.name, UseStyleResultFont.CaptionHeader.Font, UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionHeader.RelativeSize, 10000)
		end, {
			JoinResult.name,
			UseStyleResultFont.CaptionHeader.Font,
			UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionHeader.RelativeSize
		}))),
		textTruncate = Enum.TextTruncate.AtEnd,
		textXAlignment = Enum.TextXAlignment.Left,
		textYAlignment = Enum.TextYAlignment.Center,
		richText = if FFlagHomepagePYMKPresence then true else false
	})
end