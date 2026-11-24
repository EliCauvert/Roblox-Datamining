local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Visibility = FoundationModule.Enums.Visibility
local ItemSlotCardModule = require(AvatarWorkshop.Components.ItemSlots.ItemSlotCard)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ItemSlotCardModule (copy), FoundationModule (copy), Visibility (copy)
	local UseTokensResult = UseTokensFunction()
	local config = {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium),
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.XLarge),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.XLarge)
		})
	}
	
	for LayoutOrder, slot in p1.slots do
		config[tostring(slot.id)] = ReactModule.createElement(ItemSlotCardModule, {
			id = slot.id,
			text = slot.text,
			slotType = slot.slotType,
			slotContent = slot.content,
			onActivated = p1.onSlotActivated,
			selected = slot.id == p1.activeSlotId,
			LayoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement(FoundationModule.View, { tag = "col size-full" }, {
		SlotsContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y bg-shift-100",
			LayoutOrder = 1,
			testId = p1.testId
		}, {
			Slots = ReactModule.createElement(FoundationModule.ScrollView, {
				tag = "size-full-0 auto-y",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, UseTokensResult.Gap.Small),
					SortOrder = Enum.SortOrder.LayoutOrder
				},
				scroll = {
					AutomaticSize = Enum.AutomaticSize.Y,
					AutomaticCanvasSize = Enum.AutomaticSize.X,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.X,
					scrollBarVisibility = Visibility.None
				}
			}, config)
		}),
		ContentContainer = ReactModule.createElement(FoundationModule.View, { tag = "grow size-full-0", LayoutOrder = 2 }, { p1.children })
	})
end