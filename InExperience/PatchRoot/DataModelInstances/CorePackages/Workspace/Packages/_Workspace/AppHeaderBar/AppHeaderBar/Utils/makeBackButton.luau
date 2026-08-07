local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return function(p0) --[[ line: 10 | named "makeBackButton" ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconSize (ref), images (ref)
	return function() --[[ line: 11 ]]
		-- upvalues: reactModule (copy), iconButton (copy), iconSize (copy), images (copy), p0 (ref)
		return reactModule.createElement(iconButton, {
			size = UDim2.fromOffset(0, 0),
			iconSize = iconSize.Medium,
			icon = images["icons/navigation/pushBack"],
			onActivated = p0
		})
	end
end