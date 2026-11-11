local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local FFlagEnableSchoolEntry = require(Parent.SharedFlags).FFlagEnableSchoolEntry
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local Enums = FoundationModule.Enums

local function ConnectionChannelsTile(p1, p2)
	-- upvalues: ReactModule (copy), Enums (copy), View (copy), FFlagEnableSchoolEntry (copy), Icon (copy), Text (copy)
	local LayoutOrder = p1.componentUIProps.layoutOrder
	local ItemSize = p1.componentUIProps.itemSize
	local Icon1 = p1.icon
	local Title = p1.title
	local OnMountedFunction = p1.onMounted
	local OnActivated = p1.onActivated
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(Hover)
		-- upvalues: UseStateResult2 (copy), Enums (upval)
		UseStateResult2(Hover == Enums.ControlState.Hover or Hover == Enums.ControlState.Pressed)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: OnMountedFunction (copy)
		if OnMountedFunction then
			OnMountedFunction()
		end
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "auto-none gui-object-defaults",
		Size = ItemSize,
		LayoutOrder = LayoutOrder,
		ref = if FFlagEnableSchoolEntry then p2 else nil,
		selection = { Selectable = true, SelectionOrder = LayoutOrder },
		onActivated = OnActivated,
		onStateChanged = UseResult,
		stateLayer = { affordance = Enums.StateLayerAffordance.None }
	}, {
		Content = ReactModule.createElement(View, { tag = "size-full col align-x-center gap-small" }, {
			View = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = {
					["size-full aspect-1-1 radius-circle align-x-center align-y-center row"] = true,
					["bg-shift-300"] = not UseStateResult,
					["bg-shift-400"] = UseStateResult
				}
			}, {
				Icon = if Icon1 then ReactModule.createElement(Icon, { name = Icon1, size = Enums.IconSize.Large }) else nil
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "text-body-small auto-xy text-align-x-left clip text-truncate-end",
				Text = Title
			})
		})
	})
end

return if FFlagEnableSchoolEntry then ReactModule.forwardRef(ConnectionChannelsTile) else ConnectionChannelsTile