local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local fFlagRenameDeprecatedUIBloxTokens = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle

function getMenuItemDimensions(p0) --[[ line: 11 ]]
	-- upvalues: useStyle (ref), constantsModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var2 = useStyle()
	
	return if p0 < constantsModule.SmallLayoutThreshold then {
		LeftWidth = constantsModule.LeftContainerWidthSmall,
		RightWidth = constantsModule.RightContainerWidthSmall,
		TextSize = constantsModule.FieldLabelSizeSmall
	} else {
		LeftWidth = (if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.Size.Size_2000 else var2.Tokens.Global.Space_1000) * 3,
		RightWidth = (if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.Size.Size_2000 else var2.Tokens.Global.Space_1000) * 4,
		TextSize = if fFlagRenameDeprecatedUIBloxTokens then var2.Tokens.FontSize.FontSize_400 else var2.Tokens.Global.FontSize_100
	}
end

return getMenuItemDimensions