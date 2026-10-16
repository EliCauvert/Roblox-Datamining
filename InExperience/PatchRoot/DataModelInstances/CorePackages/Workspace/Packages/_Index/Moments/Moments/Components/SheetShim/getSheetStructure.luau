local function findBackdrop(Parent) --[[ Line: 16 ]]
	local LayerCollector = Parent
	local Backdrop = nil
	
	for _ = 1, 3 do
		if LayerCollector == nil or LayerCollector:IsA("LayerCollector") then
			return nil
		end
		Backdrop = LayerCollector:FindFirstChild("Backdrop")
		
		if Backdrop ~= nil and Backdrop:IsA("GuiObject") then
			return Backdrop
		end
		LayerCollector = LayerCollector.Parent
	end
	return nil
end

return function(Sheet) --[[ Line: 31 | Named "getSheetStructure" ]]
	-- upvalues: findBackdrop (copy)
	local ScrollingFrame = Sheet:FindFirstChildOfClass("ScrollingFrame")
	local SheetContainer = if ScrollingFrame == nil then nil else ScrollingFrame:FindFirstChild("SheetContainer")
	
	return if ScrollingFrame == nil or SheetContainer == nil or not SheetContainer:IsA("GuiObject") then {
		scroller = nil,
		container = nil,
		kind = if Sheet.Position.X.Scale == 1 then "side" else "center",
		sheet = Sheet,
		backdrop = findBackdrop(Sheet.Parent)
	} else {
		kind = "bottom",
		sheet = Sheet,
		scroller = ScrollingFrame,
		container = SheetContainer,
		backdrop = findBackdrop(ScrollingFrame)
	}
end