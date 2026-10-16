local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle

return function(p1) --[[ Line: 16 | Named "ReportTextEntry" ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseStyleResult = UseStyleFunction()
	local BodyFont = UseStyleResult.Font.Body.Font
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		ReportCommentTextBox = ReactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 0, 40),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			PlaceholderText = p1.placeholderText,
			Font = if FoundationFontFaceMigration then nil else BodyFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
			Text = p1.text,
			TextSize = UseStyleResult.Font.BaseSize,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			RichText = false,
			MultiLine = true,
			TextWrapped = true,
			ClearTextOnFocus = false,
			OverlayNativeInput = true,
			ClipsDescendants = true,
			[ReactModule.Change.Text] = function(p2) --[[ Line: 62 ]]
				-- upvalues: p1 (copy)
				if p1.text ~= p2.Text then
					p1.onUpdate(p2.Text)
				end
			end
		})
	})
end