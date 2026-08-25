local parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(parent.UIBlox)
local guiService = game:GetService("GuiService")
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local _ = require(script.Parent.Types)
local reactModule = require(parent.React)

local function onSelectionGained(p0)
	-- upvalues: guiService (ref)
	guiService:Select(p0)
end

return function(p1)
	-- upvalues: reactModule (ref), useSelectionCursor (ref), cursorKind (ref), onSelectionGained (ref)
	local item = p1.item
	local safeArea = p1.safeArea
	local itemPadding = p1.itemPadding
	local var4 = reactModule.useMemo(function()
		-- upvalues: item (ref)
		return item.renderComponent()
	end, { item.renderComponent })
	local var5, var6 = reactModule.useBinding(0)
	
	return reactModule.createElement("CanvasGroup", {
		key = item.key,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = reactModule.useRef(nil),
		[reactModule.Change.AbsolutePosition] = reactModule.useCallback(function(p2)
			-- upvalues: safeArea (ref), itemPadding (ref), var6 (ref)
			local scrollingFrame = p2:FindFirstAncestorOfClass("ScrollingFrame")
			
			if scrollingFrame == nil then
				return nil
			end
			local var8 = p2.AbsolutePosition.Y - scrollingFrame.AbsolutePosition.Y - safeArea.Y
			local var9 = -(p2.AbsoluteSize.Y + itemPadding)
			
			if var8 < 1 and var9 < var8 + safeArea.Y + 1 then
				var6(var8 / var9)
			else
				var6(0)
			end
			return nil
		end, { safeArea, itemPadding }),
		GroupTransparency = var5,
		BackgroundTransparency = 1,
		Selectable = item.useSelectionBumper,
		SelectionImageObject = useSelectionCursor(cursorKind.Invisible),
		[reactModule.Event.SelectionGained] = onSelectionGained
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, safeArea.X),
			PaddingRight = UDim.new(0, safeArea.X)
		}),
		View = var4
	})
end