local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useStyle = UIBloxModule.Core.Style.useStyle
local fFlagChatLineReportingFocusFixesEnabled = require(parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled

return function(p0) --[[ line: 25 | named "CommentTextField" ]]
	-- upvalues: reactModule (ref), fFlagChatLineReportingFocusFixesEnabled (ref), useCursor (ref), useStyle (ref)
	local var2, var3 = reactModule.useState("")
	local var4 = if fFlagChatLineReportingFocusFixesEnabled then useCursor() else nil
	local var5 = useStyle()
	local theme = var5.Theme
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundTransparency = if p0.backgroundTransparency ~= nil then var5.Theme.BackgroundDefault.Transparency else p0.backgroundTransparency,
		BackgroundColor3 = p0.backgroundColor3 or var5.Theme.BackgroundDefault.Color,
		LayoutOrder = p0.layoutOrder,
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
			BackgroundColor3 = p0.backgroundColor3 or theme.BackgroundDefault.Color,
			PlaceholderText = p0.placeholderText,
			Font = var5.Font.Body.Font,
			SelectionImageObject = var4,
			Text = p0.text,
			TextSize = var5.Font.BaseSize,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextXAlignment = p0.textXAlignment or Enum.TextXAlignment.Left,
			TextYAlignment = p0.textYAlignment or Enum.TextYAlignment.Top,
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
			Interactable = p0.interactable,
			[reactModule.Change.Text] = reactModule.useCallback(function(p1) --[[ line: 33 ]]
				-- upvalues: var3 (ref), p0 (ref), var2 (ref)
				local text = p1.Text
				
				if p1.TextFits then
					var3(text)
					p0.onUpdate(text)
					
					return
				end
				p1.Text = var2
			end)
		})
	})
end