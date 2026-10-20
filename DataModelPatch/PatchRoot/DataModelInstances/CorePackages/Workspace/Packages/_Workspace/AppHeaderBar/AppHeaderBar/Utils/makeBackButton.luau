local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return function(OnActivated)
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	return function()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), OnActivated (copy)
		return ReactModule.createElement(IconButton, {
			size = UDim2.fromOffset(0, 0),
			iconSize = IconSize.Medium,
			icon = Images["icons/navigation/pushBack"],
			onActivated = OnActivated
		})
	end
end