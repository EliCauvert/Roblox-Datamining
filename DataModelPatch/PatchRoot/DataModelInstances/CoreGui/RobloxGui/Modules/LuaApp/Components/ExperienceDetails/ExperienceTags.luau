local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size900 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_900 else UseDesignTokensResult.Global.Size_450
	local Size400 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_400 else UseDesignTokensResult.Global.Space_200
	local TitleLargeFont = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.TitleLarge.Font else UseDesignTokensResult.Semantic.Typography.Subheader.Font
	local FontSize350 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.FontSize.FontSize_350 else UseDesignTokensResult.Global.FontSize_75
	local Emphasis = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis
	local Hover = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.State.Hover else UseDesignTokensResult.Semantic.Color.Background.OnHover
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(1e999)
	
	local function v12(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.X)
	end
	
	local function v13(p1)
		-- upvalues: ReactModule (upval), Size900 (copy), Hover (copy), Size400 (copy), TitleLargeFont (copy), FontSize350 (copy), Emphasis (copy), UseBindingResult (copy)
		return ReactModule.createElement("TextButton", {
			Size = UDim2.fromOffset(0, Size900),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Hover.Color3,
			BackgroundTransparency = Hover.Transparency,
			BorderSizePixel = 0,
			Text = "",
			Interactable = if p1.onActivated then true else false,
			[ReactModule.Event.Activated] = p1.onActivated
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Size400),
				PaddingRight = UDim.new(0, Size400)
			}),
			TextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 1),
				AutomaticSize = Enum.AutomaticSize.X,
				Text = p1.text,
				Font = TitleLargeFont,
				TextSize = FontSize350,
				TextColor3 = Emphasis.Color3,
				TextTransparency = Emphasis.Transparency,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
					MaxSize = UseBindingResult:map(function(X): Vector2
						return Vector2.new(X, 1e999)
					end)
				})
			})
		})
	end
	
	local Size200 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Space_100
	local t = {}
	
	for i, content in Frame.contents do
		t["Pill" .. i] = v13(content)
	end
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder,
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = v12
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			Wraps = true,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, Size200)
		}),
		Pills = ReactModule.createElement(ReactModule.Fragment, {}, t)
	})
end