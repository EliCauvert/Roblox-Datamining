local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local UIBlox = dependenciesModule.UIBlox
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local style = UIBlox.Style
local getTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)
local t = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p1)
	-- upvalues: llama (ref), t (ref), style (ref), roact (ref), styledTextLabel (ref), getTextHeightModule (ref)
	local var1 = llama.Dictionary.join(t, p1)
	
	return style.withStyle(function(p2)
		-- upvalues: roact (copy), styledTextLabel (copy), var1 (ref), getTextHeightModule (copy)
		local font = p2.Font
		
		return roact.createElement(styledTextLabel, {
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			layoutOrder = var1.layoutOrder,
			text = var1.name,
			fontStyle = font.CaptionHeader,
			colorStyle = p2.Theme.TextEmphasis,
			size = UDim2.fromOffset(var1.width, getTextHeightModule(var1.name, font.CaptionHeader.Font, font.BaseSize * font.CaptionHeader.RelativeSize)),
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Center
		})
	end)
end