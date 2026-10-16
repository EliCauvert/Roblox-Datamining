local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local UIBlox = DependenciesModule.UIBlox
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local Style = UIBlox.Style
local GetTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)
local FoundationFontFaceMigration = DependenciesModule.Foundation.Utility.Flags.FoundationFontFaceMigration
local config = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p1) --[[ Line: 27 ]]
	-- upvalues: Llama (copy), config (copy), Style (copy), FoundationFontFaceMigration (copy), GetTextHeightModule (copy), Roact (copy), StyledTextLabel (copy)
	local JoinResult = Llama.Dictionary.join(config, p1)
	
	return Style.withStyle(function(p2) --[[ Line: 30 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextHeightModule (upval), JoinResult (copy), Roact (upval), StyledTextLabel (upval)
		local _Font = p2.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.CaptionHeader.RelativeSize
		
		return Roact.createElement(StyledTextLabel, {
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			layoutOrder = JoinResult.layoutOrder,
			text = JoinResult.name,
			fontStyle = _Font.CaptionHeader,
			colorStyle = p2.Theme.TextEmphasis,
			size = UDim2.fromOffset(JoinResult.width, if FoundationFontFaceMigration then ScaledBaseSize else GetTextHeightModule(JoinResult.name, _Font.CaptionHeader.Font, ScaledBaseSize)),
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Center
		})
	end)
end