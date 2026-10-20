local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode

return function(p1, p2)
	-- upvalues: UiMode (copy)
	local config = {
		marginTop = 0,
		textboxHeight = 36,
		textboxLabelPadding = 12,
		textboxPaddingX = 10,
		textboxPaddingY = 7,
		continueButtonHeight = 48,
		crossdeviceButtonHeight = 48,
		qrWidth = 128,
		thumbnailSize = 160,
		spacerSize = 12,
		boxPadding = 4,
		buttonHeight = 36,
		buttonTextSize = 16,
		contentPadding = 5,
		headerPadding = 1,
		dropdownHeight = 72,
		dropdownHorizontalPadding = 36,
		dropdownVerticalPadding = 24,
		dateDropdownWidth = 156
	}
	
	if p1.uiMode == UiMode.TenFoot or p1.uiMode == UiMode.VR then
		config.marginTop = p2.Size.Size_1200
		config.textboxHeight = p2.Size.Size_1200
		config.textHeaderSize = p2.FontSize.FontSize_1000
		config.textCaptionHeaderSize = p2.FontSize.FontSize_500
		config.textBodySize = p2.FontSize.FontSize_400
		config.textSmallSize = p2.FontSize.FontSize_250
		config.signUpContentsPadding = p2.Size.Size_600
		config.boxPadding = p2.Size.Size_400
		config.buttonHeight = p2.Size.Size_1200
		config.buttonTextSize = p2.FontSize.FontSize_500
		config.contentPadding = p2.Size.Size_600
		config.headerPadding = p2.Size.Size_400
		config.dropdownHeight = p2.Size.Size_1200
		config.dropdownHorizontalPadding = p2.Size.Size_600
		config.dropdownVerticalPadding = p2.Size.Size_400
		config.dateDropdownWidth = p2.Size.Size_2600
	end
	return config
end