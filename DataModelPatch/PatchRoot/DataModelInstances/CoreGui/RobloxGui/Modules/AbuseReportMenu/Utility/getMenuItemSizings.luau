local ConstantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local UseStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Core.Style.useStyle

function getMenuItemSizings()
	-- upvalues: UseStyleFunction (copy), ConstantsModule (copy)
	local UseStyleResult = UseStyleFunction()
	
	return {
		ItemPadding = UseStyleResult.Tokens.Size.Size_250,
		DropdownTextSize = UseStyleResult.Tokens.FontSize.FontSize_400,
		FontStyle = ConstantsModule.ReportMenuFontStyle,
		ButtonSize = ConstantsModule.ReportMenuButtonSizeConsole,
		ButtonInsideVerticalPadding = UseStyleResult.Tokens.Size.Size_100
	}
end

return getMenuItemSizings