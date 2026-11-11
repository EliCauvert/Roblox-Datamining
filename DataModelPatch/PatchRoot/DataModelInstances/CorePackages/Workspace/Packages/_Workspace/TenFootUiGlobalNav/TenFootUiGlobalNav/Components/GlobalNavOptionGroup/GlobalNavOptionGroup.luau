local TenFootUiGlobalNav = script:FindFirstAncestor("TenFootUiGlobalNav")
local Parent = TenFootUiGlobalNav.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local GlobalNavOptionModule = require(script.Parent.GlobalNavOption)
local GlobalNavOptionTooltipModule = require(script.Parent.GlobalNavOptionTooltip)
local EraseKeysModule = require(TenFootUiGlobalNav.Components.utils.eraseKeys)

local function makeButtonTooltipMap(Frame, Items)
	-- upvalues: CryoModule (copy)
	return CryoModule.List.foldLeft(CryoModule.List.filter(Frame:GetDescendants(), function(Button, _)
		return Button:IsA("ImageButton")
	end), function(Labels, Key, p1)
		-- upvalues: Items (copy)
		Labels[Key] = if Items[p1] then Items[p1].label else nil
		
		return Labels
	end, {})
end

local function makeToolTipProps(Frame, Frame1, p1)
	local Label = p1[Frame]
	
	return if Label then {
		label = Label,
		xOffset = Frame.AbsolutePosition.X - Frame1.AbsolutePosition.X + Frame.Size.X.Offset / 2,
		yOffset = Frame.Position.Y.Offset + Frame.Size.Y.Offset - 10
	} else nil
end

return function(p1)
	-- upvalues: ReactModule (copy), EraseKeysModule (copy), CryoModule (copy), GlobalNavOptionModule (copy), makeButtonTooltipMap (copy), makeToolTipProps (copy), GlobalNavOptionTooltipModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.createElement("Frame", CryoModule.Dictionary.join({ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, (EraseKeysModule({ "items", "spacing" }, p1))), ReactModule.createElement("Frame", {
		Name = "Options",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		[ReactModule.Event.SelectionChanged] = function(Frame, _, _, Frame1)
			-- upvalues: makeButtonTooltipMap (upval), p1 (copy), UseStateResult2 (copy), makeToolTipProps (upval)
			UseStateResult2((makeToolTipProps(Frame1, Frame, (makeButtonTooltipMap(Frame, p1.items)))))
		end
	}, ReactModule.createElement("UIListLayout", {
		key = "globalNavOptionGroupLayout",
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, p1.spacing or 0)
	}), table.unpack((CryoModule.List.map(p1.items, function(p2, Text)
		-- upvalues: ReactModule (upval), GlobalNavOptionModule (upval)
		return ReactModule.createElement(GlobalNavOptionModule, {
			key = p2.label .. "-" .. Text,
			icon = p2.icon,
			onActivated = p2.onActivated
		})
	end)))), if UseStateResult then ReactModule.createElement(GlobalNavOptionTooltipModule, UseStateResult) else nil)
end