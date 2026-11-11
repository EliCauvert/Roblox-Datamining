local GuiService = game:GetService("GuiService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FFlagAXFixIaBTimedOptionsPopoverFocus = require(Parent.AvatarExperienceFlags).FFlagAXFixIaBTimedOptionsPopoverFocus
local _ = require(AvatarExperienceInspectAndBuy.Types)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceRegistry = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry
local UseRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useRegisterFocusNavigableSurface
local UseDeRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useDeRegisterFocusNavigableSurface
local UseRegistryEntryFunction = FocusNavigableSurfaceRegistry.useRegistryEntry
local UseAutoFocusFunction = FocusNavigationUtilsModule.useAutoFocus
local UseDescendantHasFocusFunction = FocusNavigationUtilsModule.useDescendantHasFocus
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode

local function selectItemBeingPurchased(p1)
	return p1.itemBeingPurchased
end

return function()
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), selectItemBeingPurchased (copy), UseRegisterFocusNavigableSurfaceFunction (copy), UseDeRegisterFocusNavigableSurfaceFunction (copy), UseAutoFocusFunction (copy), UseDescendantHasFocusFunction (copy), UseLastInputModeFunction (copy), FFlagAXFixIaBTimedOptionsPopoverFocus (copy), UseRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), MarketplaceService (copy), Players (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(selectItemBeingPurchased)
	local HasItemId: boolean = UseSelectorResult and UseSelectorResult.itemId ~= nil
	local UseRegisterFocusNavigableSurfaceResult = UseRegisterFocusNavigableSurfaceFunction()
	local UseDeRegisterFocusNavigableSurfaceResult = UseDeRegisterFocusNavigableSurfaceFunction()
	local UseAutoFocusResult = UseAutoFocusFunction({ UseStateResult }, 0.1)
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction(UseStateResult)
	local IsFocus = UseLastInputModeFunction() == "Focus"
	local HasItemId1 = HasItemId or UseStateResult1
	local v1: boolean? = nil
	
	if FFlagAXFixIaBTimedOptionsPopoverFocus then
		local HasUseRegistryEntryResult = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.PopUp) ~= nil
		local HasUseRegistryEntryResult1 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.ContextualMenu) ~= nil
		local HasUseRegistryEntryResult2 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnum.ModerationOverlay) ~= nil
		v1 = HasUseRegistryEntryResult or (HasUseRegistryEntryResult1 or HasUseRegistryEntryResult2)
	end
	ReactModule.useEffect(function()
		-- upvalues: MarketplaceService (upval), Players (upval), UseStateResult2_1 (copy)
		local PromptBulkPurchaseRequestedConnection = MarketplaceService.PromptBulkPurchaseRequested:Connect(function(Player)
			-- upvalues: Players (upval), UseStateResult2_1 (upval)
			if Player == Players.LocalPlayer then
				UseStateResult2_1(true)
			end
		end)
		local PromptBulkPurchaseFinishedConnection = MarketplaceService.PromptBulkPurchaseFinished:Connect(function(Player)
			-- upvalues: Players (upval), UseStateResult2_1 (upval)
			if Player == Players.LocalPlayer then
				UseStateResult2_1(false)
			end
		end)
		
		return function()
			-- upvalues: PromptBulkPurchaseRequestedConnection (copy), PromptBulkPurchaseFinishedConnection (copy)
			PromptBulkPurchaseRequestedConnection:Disconnect()
			PromptBulkPurchaseFinishedConnection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: HasItemId1 (copy), UseDeRegisterFocusNavigableSurfaceResult (copy), FocusNavigableSurfaceIdentifierEnum (upval), UseStateResult (copy), GuiService (upval), UseRegisterFocusNavigableSurfaceResult (copy)
		if HasItemId1 then
			UseDeRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseStateResult)
			GuiService:RemoveSelectionGroup("InspectAndBuyApp")
			
			return function() end
		end
		if UseStateResult then
			UseRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseStateResult)
			GuiService:AddSelectionParent("InspectAndBuyApp", UseStateResult)
		else
			UseDeRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseStateResult)
			GuiService:RemoveSelectionGroup("InspectAndBuyApp")
			GuiService.SelectedCoreObject = nil
		end
		return function()
			-- upvalues: UseDeRegisterFocusNavigableSurfaceResult (upval), FocusNavigableSurfaceIdentifierEnum (upval), UseStateResult (upval), GuiService (upval)
			UseDeRegisterFocusNavigableSurfaceResult(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseStateResult)
			GuiService:RemoveSelectionGroup("InspectAndBuyApp")
			GuiService.SelectedCoreObject = nil
		end
	end, {
		UseStateResult,
		HasItemId1,
		UseDeRegisterFocusNavigableSurfaceResult,
		UseRegisterFocusNavigableSurfaceResult
	})
	local NoV24: boolean = IsFocus and (UseStateResult and (not UseDescendantHasFocusResult and (not HasItemId1 and not v1)))
	ReactModule.useEffect(function()
		-- upvalues: NoV24 (copy), UseAutoFocusResult (copy)
		local UseAutoFocusResultResult = if NoV24 then UseAutoFocusResult() else nil
		
		return function()
			-- upvalues: UseAutoFocusResultResult (ref)
			if UseAutoFocusResultResult then
				UseAutoFocusResultResult.cancel()
			end
		end
	end, { NoV24, UseAutoFocusResult })
	
	return {
		setFocusRef = UseStateResult2,
		focusNavigationProps = {
			SelectionGroup = true,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}
end