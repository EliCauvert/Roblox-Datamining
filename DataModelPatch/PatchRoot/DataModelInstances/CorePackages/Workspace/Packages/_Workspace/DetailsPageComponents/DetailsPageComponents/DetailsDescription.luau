local Parent = script:FindFirstAncestor("DetailsPageComponents").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return ReactModule.memo(function(Frame)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), RetrievalStatus (copy), ReactModule (copy), StyledTextLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local BodyLarge = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.BodyLarge else UseDesignTokensResult.Semantic.Typography.Body) or {}
	local HeadingSmall = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Typography.HeadingSmall else UseDesignTokensResult.Semantic.Typography.Header) or {}
	local IsDataStatusMatch = Frame.dataStatus == RetrievalStatus.Done
	local v1: boolean = Frame.descriptionText and #Frame.descriptionText > 0
	
	return if IsDataStatusMatch and v1 then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, Frame.listPadding or 16)
		}),
		Title = ReactModule.createElement(StyledTextLabel, {
			richText = false,
			fluidSizing = false,
			text = Frame.titleText,
			size = UDim2.fromScale(1, 0),
			fontStyle = HeadingSmall,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.Y
		}),
		Description = ReactModule.createElement(StyledTextLabel, {
			richText = false,
			fluidSizing = false,
			text = Frame.descriptionText,
			size = UDim2.new(1, 0, 0, 0),
			textYAlignment = Enum.TextYAlignment.Top,
			fontStyle = BodyLarge,
			colorStyle = UseStyleResult.Theme.TextDefault,
			automaticSize = Enum.AutomaticSize.Y,
			lineHeight = BodyLarge.LineHeight
		})
	}) else nil
end)