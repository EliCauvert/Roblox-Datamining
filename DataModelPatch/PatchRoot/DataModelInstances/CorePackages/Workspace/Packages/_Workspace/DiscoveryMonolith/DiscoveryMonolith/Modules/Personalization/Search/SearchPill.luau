local TextService = game:GetService("TextService")
local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

function SearchPill(p1)
	-- upvalues: UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), TextService (copy), ImpressionsTagUtility (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local _Font = p1.font or (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge.Font else UseDesignTokensResult.Semantic.Typography.Body.Font)
	local TextColor = p1.textColor or (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Content.Emphasis else UseDesignTokensResult.Semantic.Color.Text.Emphasis).Color3
	local TextSize = p1.textSize
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: TextService (upval), p1 (copy), TextSize (copy), _Font (copy)
		return TextService:GetTextSize(p1.text, TextSize, _Font, Vector2.new(1e999, TextSize))
	end, { p1.text, TextSize, _Font })
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ImpressionsTagUtility (upval), UseRefResult (copy)
		local ImpressionsTag = p1.impressionsTag
		local Index = p1.index
		
		if p1.impressionsTag and Index then
			ImpressionsTagUtility.AddTag(UseRefResult, ImpressionsTag, Index)
		end
		return function()
			-- upvalues: p1 (upval), Index (copy), ImpressionsTagUtility (upval), UseRefResult (upval), ImpressionsTag (copy)
			if p1.impressionsTag and Index then
				ImpressionsTagUtility.RemoveTag(UseRefResult, ImpressionsTag, Index)
			end
		end
	end, { p1.impressionsTag, p1.index })
	
	return ReactModule.createElement("TextButton", {
		LayoutOrder = p1.layoutOrder or 1,
		Size = UDim2.new(0, UseMemoResult.X + p1.horizontalPadding * 2, 0, TextSize + p1.verticalPadding * 2),
		BackgroundColor3 = p1.backgroundColor,
		BackgroundTransparency = p1.backgroundTransparency,
		BorderSizePixel = 0,
		TextTransparency = 1,
		Text = "",
		Selectable = true,
		[ReactModule.Event.Activated] = p1.onActivated,
		ref = UseRefResult
	}, {
		PillText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(UseMemoResult.X, UseMemoResult.Y),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Font = _Font,
			Text = p1.text,
			TextSize = TextSize,
			TextColor3 = TextColor
		}),
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
	})
end

return SearchPill