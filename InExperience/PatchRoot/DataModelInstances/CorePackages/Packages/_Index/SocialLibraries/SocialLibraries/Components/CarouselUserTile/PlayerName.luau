local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local UIBlox = dependenciesModule.UIBlox
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local style = UIBlox.Style
local getTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)
local t = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p0) --[[ line: 25 ]]
	-- upvalues: llama (ref), t (ref), style (ref), roact (ref), styledTextLabel (ref), getTextHeightModule (ref)
	local var3 = llama.Dictionary.join(t, p0)
	
	return style.withStyle(function(p1) --[[ line: 28 ]]
		-- upvalues: roact (copy), styledTextLabel (copy), var3 (ref), getTextHeightModule (copy)
		local font = p1.Font
		
		return roact.createElement(styledTextLabel, {
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			layoutOrder = var3.layoutOrder,
			text = var3.name,
			fontStyle = font.CaptionHeader,
			colorStyle = p1.Theme.TextEmphasis,
			size = UDim2.fromOffset(var3.width, getTextHeightModule(var3.name, font.CaptionHeader.Font, font.BaseSize * font.CaptionHeader.RelativeSize)),
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Center
		})
	end)
end