local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local SidePadding = require(GameInvite.GameInviteConstants).Layout.SidePadding

return function(p1) --[[ Line: 20 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), SidePadding (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
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
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Size = UDim2.new(1, 0, 1, 0)
		})
	})
end