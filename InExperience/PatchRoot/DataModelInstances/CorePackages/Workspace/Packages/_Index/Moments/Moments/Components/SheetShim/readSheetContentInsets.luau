local _ = require(script.Parent.SheetShimTypes)
local _ = require(script.Parent.getSheetStructure)

return function(p1) --[[ Line: 7 | Named "readSheetContentInsets" ]]
	local Sheet = p1.sheet
	local Scroller = p1.scroller
	local Container = p1.container
	
	if Scroller == nil or Container == nil then
		return if p1.kind == "side" then {
			bottom = 0,
			right = math.clamp(-Sheet.Position.X.Offset, 0, Sheet.Size.X.Offset)
		} else { bottom = 0, right = 0 }
	else
		local Parent = Sheet.Parent
		
		return {
			right = 0,
			bottom = math.clamp(Scroller.CanvasPosition.Y - (Scroller.CanvasSize.Y.Offset + Container.Position.Y.Offset), 0, if Parent == nil or not Parent:IsA("GuiBase2d") then Sheet.AbsoluteSize.Y else Parent.AbsoluteSize.Y)
		}
	end
end