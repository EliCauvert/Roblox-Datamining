local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useStyle = UIBloxModule.Core.Style.useStyle
local fFlagChatLineReportingFocusFixesEnabled = require(parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled

return function(p1)
	-- upvalues: reactModule (ref), fFlagChatLineReportingFocusFixesEnabled (ref), useCursor (ref), useStyle (ref)
	local var1, var2 = reactModule.useState("")
	local var3 = if fFlagChatLineReportingFocusFixesEnabled then useCursor() else nil
	local var4 = useStyle()
	local theme = var4.Theme
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundTransparency = if p1.backgroundTransparency ~= nil then var4.Theme.BackgroundDefault.Transparency else p1.backgroundTransparency,
		BackgroundColor3 = p1.backgroundColor3 or var4.Theme.BackgroundDefault.Color,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		CommentField = reactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 0, 40),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = p1.backgroundColor3 or theme.BackgroundDefault.Color,
			PlaceholderText = p1.placeholderText,
			Font = var4.Font.Body.Font,
			SelectionImageObject = var3,
			Text = p1.text,
			TextSize = var4.Font.BaseSize,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
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
			[reactModule.Change.Text] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref), p1 (ref), var1 (ref)
				local text = p2.Text
				
				if p2.TextFits then
					var2(text)
					p1.onUpdate(text)
					
					return
				end
				p2.Text = var1
			end)
		})
	})
end