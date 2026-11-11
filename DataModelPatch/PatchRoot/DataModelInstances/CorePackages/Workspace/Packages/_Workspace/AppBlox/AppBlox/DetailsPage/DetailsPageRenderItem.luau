local Parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(Parent.UIBlox)
local GuiService = game:GetService("GuiService")
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local _ = require(script.Parent.Types)
local ReactModule = require(Parent.React)

local function onSelectionGained(SelectionParent)
	-- upvalues: GuiService (copy)
	GuiService:Select(SelectionParent)
end

return function(p1)
	-- upvalues: ReactModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), onSelectionGained (copy)
	local Item = p1.item
	local SafeArea = p1.safeArea
	local ItemPadding = p1.itemPadding
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Item (copy)
		return Item.renderComponent()
	end, { Item.renderComponent })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement("CanvasGroup", {
		key = Item.key,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = ReactModule.useRef(nil),
		[ReactModule.Change.AbsolutePosition] = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: SafeArea (copy), ItemPadding (copy), UseBindingResult2 (copy)
			local ScrollingFrame = Frame:FindFirstAncestorOfClass("ScrollingFrame")
			
			if ScrollingFrame == nil then
				return nil
			end
			local YDelta = Frame.AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y - SafeArea.Y
			local Negated = -(Frame.AbsoluteSize.Y + ItemPadding)
			
			if YDelta < 1 and Negated < YDelta + SafeArea.Y + 1 then
				UseBindingResult2(YDelta / Negated)
			else
				UseBindingResult2(0)
			end
			return nil
		end, { SafeArea, ItemPadding }),
		GroupTransparency = UseBindingResult,
		BackgroundTransparency = 1,
		Selectable = Item.useSelectionBumper,
		SelectionImageObject = UseSelectionCursorFunction(CursorKind.Invisible),
		[ReactModule.Event.SelectionGained] = onSelectionGained
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SafeArea.X),
			PaddingRight = UDim.new(0, SafeArea.X)
		}),
		View = UseMemoResult
	})
end