local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local Text = require(Parent.AppCommonLib).Text
local UseMemoFunction = ReactModule.useMemo
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local LinkButton = UIBloxModule.App.Button.LinkButton
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local config = {
	actionText = "PLACEHOLDER Action",
	bodyText = "PLACEHOLDER Body",
	height = 40,
	onActivated = function() --[[ Line: 39 ]] end
}

return ReactModule.memo(function(p1) --[[ Line: 42 | Named "ConversationBanner" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseTokensFunction (copy), UseIsInExperienceModule (copy), UseChatPagePaddingModule (copy), UseMemoFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), ReactModule (copy), NormalizeFontFaceFunction (copy), LinkButton (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = UnionResult.style or UseStyleResult
	local UseTokensResult = UseTokensFunction()
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local Size400 = Style.Tokens.Size.Size_400
	local CaptionBodyFont = Style.Font.CaptionBody.Font
	local ScaledRelativeSize = Style.Font.CaptionBody.RelativeSize * Style.Font.BaseSize
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 55 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), UnionResult (copy), ScaledRelativeSize (copy), UseTokensResult (copy), Text (upval), CaptionBodyFont (copy)
		return (if FoundationFontFaceMigration then GetTextSizeFunction(UnionResult.actionText, ScaledRelativeSize + 2, UseTokensResult.Typography.BodySmall.Font, Vector2.new(250, UnionResult.height)) else Text.GetTextBounds(UnionResult.actionText, CaptionBodyFont, ScaledRelativeSize + 2, Vector2.new(250, UnionResult.height))).X
	end, {
		UnionResult.actionText,
		CaptionBodyFont,
		ScaledRelativeSize,
		UnionResult.height,
		if FoundationFontFaceMigration then UseTokensResult.Typography.BodySmall.Font else nil
	})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = if UseIsInExperienceModuleResult then UseTokensResult.Color.OverMedia.OverMedia_100.Color3 else Style.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = if UseIsInExperienceModuleResult then UseTokensResult.Color.OverMedia.OverMedia_100.Transparency else Style.Theme.BackgroundUIDefault.Transparency,
		Size = UDim2.new(1, 0, 0, UnionResult.height)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, Size400),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseChatPagePaddingModuleResult.left),
			PaddingRight = UDim.new(0, UseChatPagePaddingModuleResult.right)
		}),
		BodyText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Font = if FoundationFontFaceMigration then nil else CaptionBodyFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
			Size = UDim2.new(1, -UseMemoResult - Size400, 1, 0),
			Text = UnionResult.bodyText,
			TextColor3 = Style.Theme.TextEmphasis.Color,
			TextSize = ScaledRelativeSize,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		ActionText = ReactModule.createElement(LinkButton, {
			fontStyle = "CaptionBody",
			layoutOrder = 2,
			size = UDim2.new(0, UseMemoResult, 1, 0),
			text = `<b>{UnionResult.actionText}</b>`,
			onActivated = UnionResult.onActivated
		})
	})
end)