local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), IconButton (copy), Images (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(IconButton, {
		size = UDim2.new(0, UseDesignTokensResult.Size.Size_600, 0, UseDesignTokensResult.Size.Size_600),
		position = UDim2.new(0, UseDesignTokensResult.Size.Size_200, 0.5, 0),
		anchorPoint = Vector2.new(0, 0.5),
		icon = Images["icons/navigation/close"],
		onActivated = p1.navigateBack
	})
end