local constantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local useStyle = require(game:GetService("CorePackages").Packages.UIBlox).Core.Style.useStyle

function getMenuItemSizings() --[[ line: 10 ]]
	-- upvalues: useStyle (ref), constantsModule (ref)
	local var1 = useStyle()
	
	return {
		ItemPadding = var1.Tokens.Size.Size_250,
		DropdownTextSize = var1.Tokens.FontSize.FontSize_400,
		FontStyle = constantsModule.ReportMenuFontStyle,
		ButtonSize = constantsModule.ReportMenuButtonSizeConsole,
		ButtonInsideVerticalPadding = var1.Tokens.Size.Size_100
	}
end

return getMenuItemSizings