local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local config = { bodyText = "" }

return ReactModule.memo(function(p1) --[[ Line: 35 | Named "Label" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), ReactModule (copy), ImageSetLabel (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local Size100 = Style.Tokens.Size.Size_100
	local Size300 = Style.Tokens.Size.Size_300
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = JoinResult.backgroundColor3 or Style.Theme.BackgroundDefault.Color,
		BackgroundTransparency = JoinResult.backgroundTransparency or Style.Theme.BackgroundDefault.Transparency,
		Size = UDim2.new(0, 0, 0, Style.Tokens.Size.Size_500),
		LayoutOrder = JoinResult.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, Size100)
		}),
		ContentPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Size100),
			PaddingRight = UDim.new(0, Style.Tokens.Size.Size_150),
			PaddingBottom = UDim.new(0, Size100),
			PaddingTop = UDim.new(0, Size100)
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Style.Tokens.Radius.Small) }),
		IconImage = if JoinResult.iconImage then ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, Size300, 0, Size300),
			Image = JoinResult.iconImage,
			ImageColor3 = JoinResult.imageColor3 or Style.Theme.IconEmphasis.Color,
			ImageTransparency = JoinResult.imageTransparency or Style.Theme.IconEmphasis.Transparency
		}) else nil,
		BodyText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.X,
			Font = if FoundationFontFaceMigration then nil else Style.Font.Body.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Style.Tokens.Typography.BodyLarge.Font) else nil,
			Size = UDim2.new(0, 0, 1, 0),
			Text = JoinResult.bodyText,
			TextColor3 = JoinResult.bodyTextColor3 or Style.Theme.TextEmphasis.Color,
			TextSize = Style.Tokens.FontSize.FontSize_250,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end)