local ConstantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local UseStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Core.Style.useStyle

function getMenuItemDimensions(p1) --[[ Line: 9 ]]
	-- upvalues: UseStyleFunction (copy), ConstantsModule (copy)
	local UseStyleResult = UseStyleFunction()
	
	return if p1 < ConstantsModule.SmallLayoutThreshold then {
		LeftWidth = ConstantsModule.LeftContainerWidthSmall,
		RightWidth = ConstantsModule.RightContainerWidthSmall,
		TextSize = ConstantsModule.FieldLabelSizeSmall
	} else {
		LeftWidth = UseStyleResult.Tokens.Size.Size_2000 * 3,
		RightWidth = UseStyleResult.Tokens.Size.Size_2000 * 4,
		TextSize = UseStyleResult.Tokens.FontSize.FontSize_400
	}
end

return getMenuItemDimensions