local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return function(p1)
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function()
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p1 (ref)
		return reactModule.createElement(iconButton, {
			size = UDim2.fromOffset(0, 0),
			iconSize = iconSize.Medium,
			icon = images["icons/navigation/close"],
			onActivated = p1
		})
	end
end