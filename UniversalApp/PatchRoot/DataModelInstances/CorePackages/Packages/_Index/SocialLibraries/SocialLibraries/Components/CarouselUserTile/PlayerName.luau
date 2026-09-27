local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local llama = dependenciesModule.llama
local UIBlox = dependenciesModule.UIBlox
local styledTextLabel = UIBlox.App.Text.StyledTextLabel
local style = UIBlox.Style
local getTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)
local foundationFontFaceMigration = dependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local t = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p1)
	-- upvalues: llama (ref), t (ref), style (ref), foundationFontFaceMigration (ref), getTextHeightModule (ref), roact (ref), styledTextLabel (ref)
	local var1 = llama.Dictionary.join(t, p1)
	
	return style.withStyle(function(p2)
		-- upvalues: foundationFontFaceMigration (copy), getTextHeightModule (copy), var1 (ref), roact (copy), styledTextLabel (copy)
		local theme = p2.Theme
		local font = p2.Font
		local var2 = font.BaseSize * font.CaptionHeader.RelativeSize
		
		return roact.createElement(styledTextLabel, {
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			layoutOrder = var1.layoutOrder,
			text = var1.name,
			fontStyle = font.CaptionHeader,
			colorStyle = theme.TextEmphasis,
			size = UDim2.fromOffset(var1.width, if foundationFontFaceMigration then var2 else getTextHeightModule(var1.name, font.CaptionHeader.Font, var2)),
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Center
		})
	end)
end