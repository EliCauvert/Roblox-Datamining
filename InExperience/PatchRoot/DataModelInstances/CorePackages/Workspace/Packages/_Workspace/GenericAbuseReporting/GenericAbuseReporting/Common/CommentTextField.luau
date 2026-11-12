local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: ReactModule (copy), UseCursorFunction (copy), UseStyleFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseCursorResult = UseCursorFunction()
	local UseStyleResult = UseStyleFunction()
	local BodyFont = UseStyleResult.Font.Body.Font
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundTransparency = if p1.backgroundTransparency == nil then UseStyleResult.Theme.BackgroundDefault.Transparency else p1.backgroundTransparency,
		BackgroundColor3 = p1.backgroundColor3 or UseStyleResult.Theme.BackgroundDefault.Color,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		CommentField = ReactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 0, 40),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = p1.backgroundColor3 or Theme.BackgroundDefault.Color,
			PlaceholderText = p1.placeholderText,
			Font = if FoundationFontFaceMigration then nil else BodyFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
			SelectionImageObject = UseCursorResult,
			Text = p1.text,
			TextSize = UseStyleResult.Font.BaseSize,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency,
			TextXAlignment = p1.textXAlignment or Enum.TextXAlignment.Left,
			TextYAlignment = p1.textYAlignment or Enum.TextYAlignment.Top,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			RichText = false,
			MultiLine = true,
			TextWrapped = true,
			TextTruncate = Enum.TextTruncate.SplitWord,
			ClearTextOnFocus = false,
			OverlayNativeInput = true,
			ClipsDescendants = true,
			Interactable = p1.interactable,
			[ReactModule.Change.Text] = ReactModule.useCallback(function(p2)
				-- upvalues: UseStateResult2 (copy), p1 (copy), UseStateResult (copy)
				local Text = p2.Text
				
				if p2.TextFits then
					UseStateResult2(Text)
					p1.onUpdate(Text)
					
					return
				else
					p2.Text = UseStateResult
				end
			end)
		})
	})
end