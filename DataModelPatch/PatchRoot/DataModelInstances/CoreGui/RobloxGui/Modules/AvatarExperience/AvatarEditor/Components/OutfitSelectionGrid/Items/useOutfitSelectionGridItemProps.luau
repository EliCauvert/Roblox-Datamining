local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local _ = require(Modules.AvatarExperience.Common.Types)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local _ = require(script.Parent.OutfitSelectionGridItem)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum

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
	-- upvalues: ReactModule (copy), CryoModule (copy), FocusNavigationEventNameEnum (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), UseAppPolicyModule (copy)
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: CryoModule (upval), p1 (copy)
		return CryoModule.List.find(p1.selectedOutfits, p1.itemId) ~= nil
	end, { p1.selectedOutfits, p1.itemId })
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonA] = if UseMemoResult then FocusNavigationEventNameEnum.UnselectOutfit else FocusNavigationEventNameEnum.SelectOutfit
		}
	end, { UseMemoResult }), nil, ReactModule.useCallback(function()
		-- upvalues: p1 (copy), CryoModule (upval)
		if not p1.itemId then return end
		if p1.multiSelect then
			p1.setSelectedOutfits((CryoModule.List.join(p1.selectedOutfits, { p1.itemId })))
			
			return
		end
		p1.setSelectedOutfits({ p1.itemId })
		
		if p1.onToggleOutfitCard then
			p1.onToggleOutfitCard(true, p1.itemId)
		end
	end, {
		p1.multiSelect,
		p1.selectedOutfits,
		p1.itemId,
		p1.setSelectedOutfits,
		p1.onToggleOutfitCard
	}), (ReactModule.useCallback(function()
		-- upvalues: p1 (copy), CryoModule (upval)
		if not p1.itemId then return end
		if p1.multiSelect then
			p1.setSelectedOutfits((CryoModule.List.removeValue(p1.selectedOutfits, p1.itemId)))
			
			return
		end
		p1.setSelectedOutfits({})
		
		if p1.onToggleOutfitCard then
			p1.onToggleOutfitCard(false)
		end
	end, {
		p1.multiSelect,
		p1.selectedOutfits,
		p1.itemId,
		p1.setSelectedOutfits,
		p1.onToggleOutfitCard
	})))))
	local Name = nil
	local RbxthumbWithTypeSizeAndOptions = if p1.itemId then GetRbxthumbWithTypeSizeAndOptionsFunction(p1.itemId, Constants.RbxthumbTypes.Outfit, 150) else nil
	
	if p1.outfitInfo then
		Name = p1.outfitInfo.name
		
		if RbxthumbWithTypeSizeAndOptions then
			RbxthumbWithTypeSizeAndOptions ..= "&filters=" .. p1.outfitInfo.updateCounter
		end
	end
	return {
		isSelected = UseMemoResult,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseMemoResult (copy), CryoModule (upval)
			if not p1.itemId then return end
			if p1.multiSelect then
				p1.setSelectedOutfits(if UseMemoResult then CryoModule.List.removeValue(p1.selectedOutfits, p1.itemId) else CryoModule.List.join(p1.selectedOutfits, { p1.itemId }))
				
				return
			end
			if UseMemoResult then
				p1.setSelectedOutfits({})
				
				if p1.onToggleOutfitCard then
					p1.onToggleOutfitCard(false)
					
					return
				end
			else
				p1.setSelectedOutfits({ p1.itemId })
				
				if p1.onToggleOutfitCard then
					p1.onToggleOutfitCard(true, p1.itemId)
				end
			end
		end, {
			p1.multiSelect, p1.selectedOutfits, p1.itemId, p1.setSelectedOutfits,
			p1.onToggleOutfitCard, UseMemoResult
		}),
		title = if UseAppPolicyModule(function(p2)
			return p2.getCustomOutfitNames()
		end) then Name else nil,
		focusNavigationRef = UseTableWrappedCallbackRefResult,
		thumbnail = RbxthumbWithTypeSizeAndOptions
	}
end