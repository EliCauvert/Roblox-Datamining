local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local Parent = ChallengeDialog.Parent
local ReactModule = require(Parent.React)
local ModalTextSizesModule = require(ChallengeDialog.Common.ModalTextSizes)
local FitTextLabel = require(Parent.LuaSocialLibrariesDeps).RoactFitComponents.FitTextLabel
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle

return function(p1)
	-- upvalues: WithStyleFunction (copy), ModalTextSizesModule (copy), ReactModule (copy), FitTextLabel (copy)
	local ContentWidth = p1.contentWidth
	local LayoutOrder = p1.layoutOrder
	local RichText = p1.richText
	local Text = p1.text
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), ModalTextSizesModule (upval), ContentWidth (copy), ReactModule (upval), FitTextLabel (upval), LayoutOrder (copy), RichText (copy), Text (copy)
		return ReactModule.createElement(FitTextLabel, {
			BackgroundTransparency = 1,
			TextWrapped = true,
			width = FitTextLabel.Width.FitToText,
			maximumWidth = ContentWidth,
			Font = if p1.useBold == true then p2.Font.Header1.Font else p2.Font.Body.Font,
			LayoutOrder = LayoutOrder or nil,
			RichText = RichText,
			AutomaticSize = if ContentWidth == 0 or ContentWidth == nil then Enum.AutomaticSize.X else nil,
			Text = Text,
			TextColor3 = if p1.useEmphasis == true then p2.Theme.TextEmphasis.Color else p2.Theme.TextDefault.Color,
			TextSize = (if p1.size == ModalTextSizesModule.Header1 then p2.Font.Header1.RelativeSize elseif p1.size == ModalTextSizesModule.Footer then p2.Font.Footer.RelativeSize else p2.Font.Body.RelativeSize) * p2.Font.BaseSize,
			TextTransparency = p2.Theme.TextDefault.Transparency,
			TextXAlignment = if p1.alignLeft == true then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			AnchorPoint = Vector2.new(0, 0),
			onActivated = p1.onActivated
		})
	end)
end