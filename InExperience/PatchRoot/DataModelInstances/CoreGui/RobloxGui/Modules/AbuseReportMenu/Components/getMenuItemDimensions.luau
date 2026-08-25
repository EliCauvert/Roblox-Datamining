local constantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local useStyle = require(game:GetService("CorePackages").Packages.UIBlox).Core.Style.useStyle

function getMenuItemDimensions(p0)
	-- upvalues: useStyle (ref), constantsModule (ref)
	local var1 = useStyle()
	
	return if p0 < constantsModule.SmallLayoutThreshold then {
		LeftWidth = constantsModule.LeftContainerWidthSmall,
		RightWidth = constantsModule.RightContainerWidthSmall,
		TextSize = constantsModule.FieldLabelSizeSmall
	} else {
		LeftWidth = var1.Tokens.Size.Size_2000 * 3,
		RightWidth = var1.Tokens.Size.Size_2000 * 4,
		TextSize = var1.Tokens.FontSize.FontSize_400
	}
end

return getMenuItemDimensions