local musicPicker = script:FindFirstAncestor("MusicPicker")
local parent = musicPicker.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local useTokens = foundationModule.Hooks.useTokens
local _ = require(musicPicker.Types.MusicPickerTypes)

local function TabPill(p1)
	-- upvalues: reactModule (ref), view (ref), foundationModule (ref), text (ref)
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		tag = {
			["row align-x-center align-y-center auto-xy padding-x-medium padding-y-small radius-circle"] = true,
			["bg-contrast"] = p1.isActive,
			["bg-surface-300"] = not p1.isActive
		}
	}, {
		Label = reactModule.createElement(text, {
			Text = p1.label,
			tag = {
				["auto-xy text-title-medium"] = true,
				["content-inverse-emphasis"] = p1.isActive,
				["content-default"] = not p1.isActive
			}
		})
	})
end

return function(value)
	-- upvalues: useTokens (ref), reactModule (ref), TabPill (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1 = useTokens()
	local t = {}
	
	for i, v in value.tabs do
		local id = v.id
		t[id] = reactModule.createElement(TabPill, {
			label = v.label,
			isActive = value.activeTabId == id,
			layoutOrder = i,
			onActivated = function()
				-- upvalues: value (ref), id (ref)
				value.onTabSelected(id)
			end
		})
	end
	return reactModule.createElement(scrollView, {
		tag = "size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = value.LayoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var1.Gap.Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			AutomaticSize = Enum.AutomaticSize.Y,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = scrollBarVisibility.None
		}
	}, t)
end