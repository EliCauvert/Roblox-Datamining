local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local Llama = DependenciesModule.llama
local UIBlox = DependenciesModule.UIBlox
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local Style = UIBlox.Style
local GetTextHeightModule = require(script.Parent.getTextHeight)
local _ = require(script.Parent.StyleTypes)
local config = { width = require(script.Parent.Constants).TILE_SIZE }

return function(p1)
	-- upvalues: Llama (copy), config (copy), Style (copy), Roact (copy), StyledTextLabel (copy), GetTextHeightModule (copy)
	local JoinResult = Llama.Dictionary.join(config, p1)
	
	return Style.withStyle(function(p2)
		-- upvalues: Roact (upval), StyledTextLabel (upval), JoinResult (copy), GetTextHeightModule (upval)
		local _Font = p2.Font
		
		return Roact.createElement(StyledTextLabel, {
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			layoutOrder = JoinResult.layoutOrder,
			text = JoinResult.name,
			fontStyle = _Font.CaptionHeader,
			colorStyle = p2.Theme.TextEmphasis,
			size = UDim2.fromOffset(JoinResult.width, GetTextHeightModule(JoinResult.name, _Font.CaptionHeader.Font, _Font.BaseSize * _Font.CaptionHeader.RelativeSize)),
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Left,
			textYAlignment = Enum.TextYAlignment.Center
		})
	end)
end