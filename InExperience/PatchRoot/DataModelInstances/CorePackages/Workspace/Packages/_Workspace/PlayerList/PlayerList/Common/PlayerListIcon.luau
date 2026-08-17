local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local image = foundationModule.Image
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local fFlagPlayerListReskinContextMenuIconLayoutModule = require(parent.Flags.FFlagPlayerListReskinContextMenuIconLayout)

return function(p0) --[[ line: 17 | named "PlayerListIcon" ]]
	-- upvalues: reactModule (ref), icon (ref), fFlagPlayerListReskinContextMenuIconLayoutModule (ref), iconSize (ref), image (ref)
	local icon_1 = p0.icon
	
	if icon_1 == nil or icon_1 == "" then
		return nil
	end
	local size = p0.size
	
	return if typeof(icon_1) == "table" and icon_1.isFoundationIcon then reactModule.createElement(icon, {
		name = icon_1.name,
		variant = icon_1.variant,
		size = if fFlagPlayerListReskinContextMenuIconLayoutModule then size else iconSize.Small,
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId
	}) elseif typeof(icon_1) == "string" then reactModule.createElement(image, {
		Image = icon_1,
		Size = UDim2.fromOffset(size, size),
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId
	}) elseif typeof(icon_1) == "table" and icon_1.Image ~= nil then reactModule.createElement(image, {
		Image = icon_1.Image,
		imageRect = {
			offset = icon_1.ImageRectOffset,
			size = icon_1.ImageRectSize
		},
		Size = UDim2.fromOffset(size, size),
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId
	}) else nil
end