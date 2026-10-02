local _ = require(script.Parent.SheetShimTypes)
local _ = require(script.Parent.getSheetStructure)

return function(value)
	local sheet = value.sheet
	local scroller = value.scroller
	local container = value.container
	
	if scroller == nil or container == nil then
		return if value.kind == "side" then {
			bottom = 0,
			right = math.clamp(-sheet.Position.X.Offset, 0, sheet.Size.X.Offset)
		} else { bottom = 0, right = 0 }
	end
	local parent = sheet.Parent
	
	return {
		right = 0,
		bottom = math.clamp(scroller.CanvasPosition.Y - (scroller.CanvasSize.Y.Offset + container.Position.Y.Offset), 0, if parent == nil or not parent:IsA("GuiBase2d") then sheet.AbsoluteSize.Y else parent.AbsoluteSize.Y)
	}
end