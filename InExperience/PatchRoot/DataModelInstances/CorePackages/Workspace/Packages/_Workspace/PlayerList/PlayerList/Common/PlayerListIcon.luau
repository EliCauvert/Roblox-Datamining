local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local icon = foundationModule.Icon

return function(p0) --[[ line: 14 | named "PlayerListIcon" ]]
	-- upvalues: reactModule (ref), icon (ref), image (ref)
	local icon_1 = p0.icon
	
	if icon_1 == nil or icon_1 == "" then
		return nil
	end
	local size = p0.size
	
	return if typeof(icon_1) == "table" and icon_1.isFoundationIcon then reactModule.createElement(icon, {
		name = icon_1.name,
		variant = icon_1.variant,
		size = size,
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