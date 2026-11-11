local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local TextService = game:GetService("TextService")
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images

return function(p1, p2)
	-- upvalues: TextService (copy), Images (copy), UiMode (copy)
	local config = {
		loginContentsPadding = 30,
		marginY = 40,
		textboxHeight = TextService:GetTextSize("", p2.FontSize.FontSize_500, Enum.Font.BuilderSans, Vector2.new(1e999, 1e999)).Y + 11,
		textboxLabelPadding = 12,
		textboxPaddingX = 10,
		textboxPaddingY = 7,
		continueButtonHeight = 48,
		crossdeviceButtonHeight = 48,
		qrWidth = 128,
		thumbnailSize = 160,
		spacerSize = 12,
		boxPadding = 4,
		linkAccountPadding = p2.Size.Size_400,
		errorTextSize = p2.FontSize.FontSize_250,
		errorTextPadding = p2.Size.Size_200,
		disclaimerPadding = p2.Size.Size_600,
		textboxLabelHeight = p2.FontSize.FontSize_500,
		textboxTextSize = 16,
		lockPadding = 98,
		loginTextSize = p2.FontSize.FontSize_500,
		qrPadding = UDim.new(0, p2.Size.Size_400),
		dividerPadding = 0,
		dividerSize = 0,
		disclaimerIconSize = p2.Size.Size_700,
		disclaimerIconPadding = p2.Size.Size_400,
		disclaimerElementHeight = 84,
		linkIcon = Images["icons/navigation/externallink_medium"],
		qrErrorPadding = 280,
		dualLayoutPadding = 140,
		credentialPaddingRight = 100,
		xOffset = 166,
		textSmallSize = p2.FontSize.FontSize_400,
		forgotLinkHeight = 30,
		quickLinkCodeViewBottomPadding = p2.Size.Size_1200,
		quickLinkCodeViewTopPadding = p2.Size.Size_800,
		quickLinkCodeViewCodeBoxHorizontalPadding = p2.Size.Size_400,
		quickLinkCodeViewCodeBoxVertialPadding = p2.Size.Size_200,
		quickLinkCodeViewCodeTextSize = p2.Size.Size_600
	}
	
	if p1.uiMode == UiMode.TenFoot or p1.uiMode == UiMode.VR then
		config.textboxHeight = p2.Size.Size_1200
		config.textboxLabelPadding = p2.Size.Size_400
		config.continueButtonHeight = p2.Size.Size_1200
		config.textHeaderSize = p2.FontSize.FontSize_500
		config.cdlDeviceCodeSize = if p1.uiMode == UiMode.VR then p2.FontSize.FontSize_2100 else p2.FontSize.FontSize_500
		config.textBodySize = p2.FontSize.FontSize_500
		config.loginContentsPadding = p2.Size.Size_800
		config.qrWidth = 280
		config.boxPadding = p2.Size.Size_400
		config.textboxTextSize = p2.FontSize.FontSize_400
		config.qrPadding = UDim.new(0, p2.Size.Size_800)
		config.dividerPadding = p2.Size.Size_800
		config.dividerSize = p2.Size.Size_300
		config.dualLayoutPadding = p2.Size.Size_600
		config.credentialPaddingRight = p2.Size.Size_1200
		config.errorTextSize = p2.FontSize.FontSize_400
		config.errorTextPadding = p2.Size.Size_200
	end
	return config
end