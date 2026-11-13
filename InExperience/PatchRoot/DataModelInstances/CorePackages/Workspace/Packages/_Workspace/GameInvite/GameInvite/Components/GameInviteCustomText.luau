local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local NormalizeFontFaceFunction = require(Parent.Foundation).Utility.normalizeFontFace
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local SidePadding = GameInviteConstantsModule.Layout.SidePadding

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), SidePadding (copy), NormalizeFontFaceFunction (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SidePadding),
			PaddingRight = UDim.new(0, SidePadding)
		}),
		CustomText = ReactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p1.promptMessage,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency,
			FontFace = NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Size = UDim2.new(1, 0, 1, 0)
		})
	})
end