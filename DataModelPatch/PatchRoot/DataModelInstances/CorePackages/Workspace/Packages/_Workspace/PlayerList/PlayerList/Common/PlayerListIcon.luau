local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize

return function(p1)
	-- upvalues: ReactModule (copy), Icon (copy), IconSize (copy), Image (copy)
	local Icon1 = p1.icon
	
	if Icon1 == nil or Icon1 == "" then
		return nil
	else
		local Size = p1.size
		
		return if typeof(Icon1) == "table" and Icon1.isFoundationIcon then ReactModule.createElement(Icon, {
			name = Icon1.name,
			variant = Icon1.variant,
			size = IconSize.Small,
			LayoutOrder = p1.layoutOrder
		}) elseif typeof(Icon1) == "string" then ReactModule.createElement(Image, {
			Image = Icon1,
			Size = UDim2.fromOffset(Size, Size),
			LayoutOrder = p1.layoutOrder
		}) elseif typeof(Icon1) == "table" and Icon1.Image ~= nil then ReactModule.createElement(Image, {
			Image = Icon1.Image,
			imageRect = {
				offset = Icon1.ImageRectOffset,
				size = Icon1.ImageRectSize
			},
			Size = UDim2.fromOffset(Size, Size),
			LayoutOrder = p1.layoutOrder
		}) else nil
	end
end