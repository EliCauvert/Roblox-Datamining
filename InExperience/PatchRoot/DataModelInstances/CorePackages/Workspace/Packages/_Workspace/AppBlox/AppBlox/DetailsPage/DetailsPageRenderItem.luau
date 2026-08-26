local parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(parent.UIBlox)
local guiService = game:GetService("GuiService")
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local _ = require(script.Parent.Types)
local reactModule = require(parent.React)

local function onSelectionGained(p1)
	-- upvalues: guiService (ref)
	guiService:Select(p1)
end

return function(p1)
	-- upvalues: reactModule (ref), useSelectionCursor (ref), cursorKind (ref), onSelectionGained (ref)
	local item = p1.item
	local safeArea = p1.safeArea
	local itemPadding = p1.itemPadding
	local var1 = reactModule.useMemo(function()
		-- upvalues: item (ref)
		return item.renderComponent()
	end, { item.renderComponent })
	local var2, var3 = reactModule.useBinding(0)
	
	return reactModule.createElement("CanvasGroup", {
		key = item.key,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = reactModule.useRef(nil),
		[reactModule.Change.AbsolutePosition] = reactModule.useCallback(function(p2)
			-- upvalues: safeArea (ref), itemPadding (ref), var3 (ref)
			local scrollingFrame = p2:FindFirstAncestorOfClass("ScrollingFrame")
			
			if scrollingFrame == nil then
				return nil
			end
			local var4 = p2.AbsolutePosition.Y - scrollingFrame.AbsolutePosition.Y - safeArea.Y
			local var5 = -(p2.AbsoluteSize.Y + itemPadding)
			
			if var4 < 1 and var5 < var4 + safeArea.Y + 1 then
				var3(var4 / var5)
			else
				var3(0)
			end
			return nil
		end, { safeArea, itemPadding }),
		GroupTransparency = var2,
		BackgroundTransparency = 1,
		Selectable = item.useSelectionBumper,
		SelectionImageObject = useSelectionCursor(cursorKind.Invisible),
		[reactModule.Event.SelectionGained] = onSelectionGained
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, safeArea.X),
			PaddingRight = UDim.new(0, safeArea.X)
		}),
		View = var1
	})
end