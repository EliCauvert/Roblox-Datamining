local Parent = script:FindFirstAncestor("ChallengeDialog").Parent
local ReactModule = require(Parent.React)
local FitTextLabel = require(Parent.LuaSocialLibrariesDeps).RoactFitComponents.FitTextLabel
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle

return function(p1)
	-- upvalues: WithStyleFunction (copy), ReactModule (copy), FitTextLabel (copy)
	local ContentWidth = p1.contentWidth
	local LayoutOrder = p1.layoutOrder
	local ErrorText = p1.errorText
	
	return WithStyleFunction(function(p2)
		-- upvalues: ReactModule (upval), FitTextLabel (upval), ContentWidth (copy), LayoutOrder (copy), ErrorText (copy)
		return ReactModule.createElement(FitTextLabel, {
			BackgroundTransparency = 1,
			TextWrapped = true,
			width = FitTextLabel.Width.FitToText,
			maximumWidth = ContentWidth,
			Font = p2.Font.Footer.Font,
			LayoutOrder = LayoutOrder or nil,
			Text = ErrorText,
			TextColor3 = p2.Theme.Alert.Color,
			TextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize,
			TextTransparency = p2.Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center,
			AnchorPoint = Vector2.new(0, 0)
		})
	end)
end