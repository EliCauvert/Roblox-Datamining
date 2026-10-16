local MusicPicker = script:FindFirstAncestor("MusicPicker")
local Parent = MusicPicker.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(MusicPicker.Types.MusicPickerTypes)

local function TabPill(p1) --[[ Line: 31 ]]
	-- upvalues: ReactModule (copy), View (copy), FoundationModule (copy), Text (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		tag = {
			["row align-x-center align-y-center auto-xy padding-x-medium padding-y-small radius-circle"] = true,
			["bg-contrast"] = p1.isActive,
			["bg-surface-300"] = not p1.isActive
		}
	}, {
		Label = ReactModule.createElement(Text, {
			Text = p1.label,
			tag = {
				["auto-xy text-title-medium"] = true,
				["content-inverse-emphasis"] = p1.isActive,
				["content-default"] = not p1.isActive
			}
		})
	})
end

return function(Frame) --[[ Line: 58 | Named "MusicPickerTabStrip" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), TabPill (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseTokensResult = UseTokensFunction()
	local Elements = {}
	
	for LayoutOrder, tab in Frame.tabs do
		local Id = tab.id
		Elements[Id] = ReactModule.createElement(TabPill, {
			label = tab.label,
			isActive = Frame.activeTabId == Id,
			layoutOrder = LayoutOrder,
			onActivated = function() --[[ Line: 67 ]]
				-- upvalues: Frame (copy), Id (copy)
				Frame.onTabSelected(Id)
			end
		})
	end
	return ReactModule.createElement(ScrollView, {
		tag = "size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = Frame.LayoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Small),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		scroll = {
			AutomaticSize = Enum.AutomaticSize.Y,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = ScrollBarVisibility.None
		}
	}, Elements)
end