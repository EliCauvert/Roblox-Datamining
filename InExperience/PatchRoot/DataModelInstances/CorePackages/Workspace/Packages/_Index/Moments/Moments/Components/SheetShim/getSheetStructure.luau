local function findBackdrop(p1)
	local var1 = p1
	
	for _ = 1, 3 do
		if var1 ~= nil and not var1:IsA("LayerCollector") then
			local backdrop = var1:FindFirstChild("Backdrop")
			
			if backdrop == nil or not backdrop:IsA("GuiObject") then
				var1 = var1.Parent
				continue
			end
			return backdrop
		end
		return nil
	end
	return nil
end

return function(p2)
	-- upvalues: findBackdrop (ref)
	local scrollingFrame = p2:FindFirstChildOfClass("ScrollingFrame")
	local var2 = if scrollingFrame ~= nil then nil else scrollingFrame:FindFirstChild("SheetContainer")
	
	return if scrollingFrame == nil or var2 == nil or not var2:IsA("GuiObject") then {
		scroller = nil,
		container = nil,
		kind = if p2.Position.X.Scale == 1 then "side" else "center",
		sheet = p2,
		backdrop = findBackdrop(p2.Parent)
	} else {
		kind = "bottom",
		sheet = p2,
		scroller = scrollingFrame,
		container = var2,
		backdrop = findBackdrop(scrollingFrame)
	}
end