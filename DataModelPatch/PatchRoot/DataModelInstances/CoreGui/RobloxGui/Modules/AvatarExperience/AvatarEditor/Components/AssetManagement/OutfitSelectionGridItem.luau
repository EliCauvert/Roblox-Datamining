local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local ItemTile = require(CorePackages.Packages.UIBlox).Tile.ItemTile
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXManageOutfitsCatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXManageOutfitsCatalogItemCard
local FoundationModule = require(CorePackages.Packages.Foundation)
local CatalogItemCard = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard

local function useFocusNavigationBindings(UseMemoResult, p1, Callback, Callback1)
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), Callback1 (copy)
		return {
			[FocusNavigationEventNameEnum.SelectOutfit] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback (upval)
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.UnselectOutfit] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback1 (upval)
					Callback1()
				end)
			}
		}
	end, { Callback, Callback1 }), (ReactFocusNavigationModule.useEventMap(UseMemoResult, p1)))
end

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), CryoModule (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), FFlagAXManageOutfitsCatalogItemCard (copy), CatalogItemCard (copy), FoundationModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ItemTile (copy), Focusable (copy)
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(ReactModule.useMemo(function()
		-- upvalues: p1 (copy), FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonA] = if p1.isSelected then FocusNavigationEventNameEnum.UnselectOutfit else FocusNavigationEventNameEnum.SelectOutfit
		}
	end, { p1.isSelected }), nil, ReactModule.useCallback(function()
		-- upvalues: p1 (copy), CryoModule (upval)
		if p1.multiSelect then
			p1.selectionUpdated((CryoModule.List.join(p1.selectedOutfits, { p1.itemId })))
			
			return
		end
		p1.selectionUpdated({ p1.itemId })
		
		if p1.onToggleOutfitCard then
			p1.onToggleOutfitCard(true, p1.itemId)
		end
	end, {
		p1.multiSelect,
		p1.selectedOutfits,
		p1.itemId,
		p1.selectionUpdated,
		p1.onToggleOutfitCard
	}), (ReactModule.useCallback(function()
		-- upvalues: p1 (copy), CryoModule (upval)
		if p1.multiSelect then
			p1.selectionUpdated((CryoModule.List.removeValue(p1.selectedOutfits, p1.itemId)))
			
			return
		end
		p1.selectionUpdated({})
		
		if p1.onToggleOutfitCard then
			p1.onToggleOutfitCard(false)
		end
	end, {
		p1.multiSelect,
		p1.selectedOutfits,
		p1.itemId,
		p1.selectionUpdated,
		p1.onToggleOutfitCard
	})))))
	
	return if FFlagAXManageOutfitsCatalogItemCard and p1.useCatalogItemCard then ReactModule.createElement(CatalogItemCard, {
		headerAspectRatio = 1,
		title = p1.name,
		presentationSlot = p1.thumbnail and ReactModule.createElement(FoundationModule.Image, {
			tag = "size-full radius-medium clip",
			BackgroundTransparency = 1,
			Image = p1.thumbnail,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop
		}) or nil,
		isSelected = p1.isSelected,
		onActivated = p1.toggleSelectOutfit,
		itemStatus = p1.itemStatus,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = UseTableWrappedCallbackRefResult
	}) else ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then ItemTile else Focusable[ItemTile], {
		Selectable = if FFlagAXMigrateAXToGlobalAutofocus then true else nil,
		isSelected = p1.isSelected,
		multiSelect = p1.multiSelect,
		itemIconType = p1.itemIconType,
		onActivated = p1.toggleSelectOutfit,
		name = p1.name,
		titleTextLineCount = p1.titleTextLineCount,
		thumbnail = p1.thumbnail,
		ref = UseTableWrappedCallbackRefResult
	})
end