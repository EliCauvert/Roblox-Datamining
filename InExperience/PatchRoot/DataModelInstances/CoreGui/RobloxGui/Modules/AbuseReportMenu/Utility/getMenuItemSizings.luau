local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local fFlagRenameDeprecatedUIBloxTokens = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle

function getMenuItemSizings() --[[ line: 12 ]]
	-- upvalues: useStyle (ref), fFlagRenameDeprecatedUIBloxTokens (ref), constantsModule (ref)
	local var2 = useStyle()
	
	return {
		ItemPadding = if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.Size.Size_250 else var2.Tokens.Global.Space_125,
		DropdownTextSize = if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.FontSize.FontSize_400 else var2.Tokens.Global.FontSize_100,
		FontStyle = constantsModule.ReportMenuFontStyle,
		ButtonSize = constantsModule.ReportMenuButtonSizeConsole,
		ButtonInsideVerticalPadding = if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.Size.Size_100 else var2.Tokens.Global.Space_50
	}
end

return getMenuItemSizings