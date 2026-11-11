local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local SlotItemCard = AvatarExperienceSlotBasedEditorModule.Components.SlotItemCard
local ScrollingArrowsAndGradientModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.SlotBasedEditor.Components.ScrollingArrowsAndGradient)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local ItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCard
local SlotItemCardFooter = AvatarExperienceSlotBasedEditorModule.Components.SlotItemCardFooter
local SlotType = AvatarExperienceSlotBasedEditorModule.Enums.SlotType
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXSlotBasedEditorCategoryTooltip = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotBasedEditorCategoryTooltip
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local Callback = if FFlagAXCustomizeMakeupSupport then function(p1, LayoutOrder, p2)
	-- upvalues: ReactModule (copy), ItemCard (copy), FoundationModule (copy), SlotItemCardFooter (copy)
	return ReactModule.createElement(ItemCard, {
		Size = UDim2.fromOffset(1, if p1.Size then p1.Size.Y.Offset else p2.Size.Size_2500),
		LayoutOrder = LayoutOrder,
		headerSlot = ReactModule.createElement(FoundationModule.Divider, {
			orientation = FoundationModule.Enums.Orientation.Vertical
		}),
		footerSlot = ReactModule.createElement(SlotItemCardFooter, { title = nil, TextXAlignment = Enum.TextXAlignment.Center })
	})
end else nil

local function _(Text, Text1): string
	return Text .. "_" .. Text1
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), FFlagAXRootSlotBasedEditorFlag (copy), UseSelectorFunction (copy), ReactModule (copy), Signal (copy), FFlagAXCustomizeMakeupSupport (copy), SlotType (copy), Callback (copy), SlotItemCard (copy), FFlagAXSlotBasedEditorCategoryTooltip (copy), FoundationModule (copy), ScrollingArrowsAndGradientModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = nil
	
	if FFlagAXRootSlotBasedEditorFlag then
		local UseSelectorResult = UseSelectorFunction(function(p1)
			return p1.AvatarExperience.AvatarEditor.Character.EquippedAssets or {}
		end)
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: Signal (upval)
			return Signal.new()
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (ref)
			if UseMemoResult then
				UseMemoResult:fire()
			end
		end, { UseSelectorResult, UseMemoResult })
	end
	return ReactModule.createElement(ScrollingArrowsAndGradientModule, {
		LayoutOrder = Frame.LayoutOrder,
		ZIndex = Frame.ZIndex,
		buttonPadding = Frame.buttonPadding,
		enableIntroScroll = Frame.enableIntroScroll,
		selectedItemKey = Frame.slotIndex .. "_" .. Frame.slotCategory,
		enableSnapToSelectedItem = Frame.enableSnapToSelectedItem,
		index = Frame.index,
		resetPositionSignal = UseMemoResult,
		navHeight = Frame.slotSubNavigationFrameHeight,
		renderScrollingListContent = ReactModule.useCallback(function(p1)
			-- upvalues: FFlagAXCustomizeMakeupSupport (upval), Frame (copy), SlotType (upval), Callback (upval), UseTokensResult (copy), ReactModule (upval), SlotItemCard (upval), FFlagAXSlotBasedEditorCategoryTooltip (upval), FoundationModule (upval)
			local List = {}
			local GetScrollingFrameItemRefFunction = p1.getScrollingFrameItemRef
			local Flag = not FFlagAXCustomizeMakeupSupport and nil
			local Count = if FFlagAXCustomizeMakeupSupport then 0 else nil
			for i, slot in Frame.slots do
				if not FFlagAXCustomizeMakeupSupport or not slot.hide then
					if FFlagAXCustomizeMakeupSupport then
						Count += 1
						
						if slot.slotType == SlotType.LayeredSlot and Flag and Frame.slots[i - 1].slotType ~= SlotType.LayeredSlot then
							table.insert(List, Callback(slot, Count, UseTokensResult))
							Count += 1
						end
						Flag = true
					end
					table.insert(List, (ReactModule.createElement(SlotItemCard, {
						Size = slot.Size,
						renderHeaderSlot = slot.renderHeaderSlot,
						BackgroundTransparency = slot.BackgroundTransparency,
						onActivated = slot.onActivated,
						title = slot.title,
						LayoutOrder = if FFlagAXCustomizeMakeupSupport then Count else i,
						ref = GetScrollingFrameItemRefFunction(i .. "_" .. Frame.slotCategory),
						isActive = slot.isActive,
						showSecondCategoryTooltip = if FFlagAXSlotBasedEditorCategoryTooltip then if Frame.canShowTooltip then i == 2 else false else nil
					})))
					
					if FFlagAXCustomizeMakeupSupport and slot.slotType == SlotType.LayeredSlot and i < #Frame.slots and Frame.slots[i + 1].slotType ~= SlotType.LayeredSlot then
						Count += 1
						table.insert(List, Callback(slot, Count, UseTokensResult))
					end
				end
			end
			if Frame.clearAllButton then
				table.insert(List, (ReactModule.createElement(SlotItemCard, {
					BackgroundTransparency = 1,
					renderHeaderSlot = Frame.clearAllButton.renderHeaderSlot,
					onActivated = Frame.clearAllButton.onActivated,
					LayoutOrder = if FFlagAXCustomizeMakeupSupport then Count + 1 else #Frame.slots + 1,
					ref = GetScrollingFrameItemRefFunction(#Frame.slots + 1),
					Size = Frame.clearAllButton.Size,
					title = Frame.clearAllButton.text
				})))
			end
			table.insert(List, {
				ReactModule.createElement("UIPadding", {
					PaddingRight = UDim.new(0, UseTokensResult.Padding.Large),
					PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
					PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium),
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.Large)
				})
			})
			
			return ReactModule.createElement(FoundationModule.View, {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, UseTokensResult.Gap.Small)
				},
				onAbsoluteSizeChanged = function(p2)
					-- upvalues: p1 (copy)
					p1.onNavFrameSizeChanged(p2)
				end
			}, List)
		end, {
			Frame.slots,
			Frame.clearAllButton,
			Frame.contentPadding,
			Frame.margin
		})
	})
end