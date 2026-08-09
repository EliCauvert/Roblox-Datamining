local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local fFlagRenameDeprecatedUIBloxTokens = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle

return function(p0) --[[ line: 13 | named "ReportTextEntry" ]]
	-- upvalues: useStyle (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref)
	local var2 = useStyle()
	local theme = var2.Theme
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 40 + (if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.Size.Size_600 else var2.Tokens.Global.Space_300) + 20),
		BackgroundTransparency = var2.Theme.BackgroundDefault.Transparency,
		BackgroundColor3 = var2.Theme.BackgroundUIDefault.Color,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		AbuseReportsText = reactModule.createElement("TextBox", {
			Size = UDim2.new(1, 0, 0, 40 + (if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.Size.Size_600 else var2.Tokens.Global.Space_300)),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundColor3 = theme.BackgroundUIDefault.Color,
			PlaceholderText = p0.placeholderText,
			Font = var2.Font.Body.Font,
			Text = p0.text,
			TextSize = if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.FontSize.FontSize_400 else var2.Tokens.Global.FontSize_100,
			TextColor3 = theme.TextDefault.Color,
			TextTransparency = theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			BackgroundTransparency = theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			RichText = false,
			MultiLine = true,
			TextWrapped = true,
			ClearTextOnFocus = false,
			OverlayNativeInput = true,
			[reactModule.Event.FocusLost] = function() --[[ line: 79 ]] end,
			[reactModule.Event.Focused] = function() --[[ line: 80 ]] end,
			[reactModule.Change.AbsoluteSize] = function() --[[ line: 81 ]] end,
			[reactModule.Change.Text] = function(p1) --[[ line: 82 ]]
				-- upvalues: p0 (ref)
				if p0.text ~= p1.Text then
					p0.onUpdate(p1.Text)
				end
			end
		})
	})
end