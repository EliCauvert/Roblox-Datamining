local guiService = game:GetService("GuiService")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local fFlagAXFixIaBTimedOptionsPopoverFocus = require(parent.AvatarExperienceFlags).FFlagAXFixIaBTimedOptionsPopoverFocus
local _ = require(avatarExperienceInspectAndBuy.Types)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigableSurfaceRegistry = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry
local useRegisterFocusNavigableSurface = focusNavigableSurfaceRegistry.useRegisterFocusNavigableSurface
local useDeRegisterFocusNavigableSurface = focusNavigableSurfaceRegistry.useDeRegisterFocusNavigableSurface
local useRegistryEntry = focusNavigableSurfaceRegistry.useRegistryEntry
local useAutoFocus = focusNavigationUtilsModule.useAutoFocus
local useDescendantHasFocus = focusNavigationUtilsModule.useDescendantHasFocus
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode

local function selectItemBeingPurchased(p0)
	return p0.itemBeingPurchased
end

return function()
	-- upvalues: reactModule (ref), useSelector (ref), selectItemBeingPurchased (ref), useRegisterFocusNavigableSurface (ref), useDeRegisterFocusNavigableSurface (ref), useAutoFocus (ref), useDescendantHasFocus (ref), useLastInputMode (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnum (ref), marketplaceService (ref), playersService (ref), guiService (ref)
	local var7, var8 = reactModule.useState(nil)
	local var9, var10 = reactModule.useState(false)
	local var11 = useSelector(selectItemBeingPurchased)
	local var12 = var11 and var11.itemId ~= nil
	local var13 = useRegisterFocusNavigableSurface()
	local var14 = useDeRegisterFocusNavigableSurface()
	local var15 = useAutoFocus({ var7 }, 0.1)
	local var16 = useDescendantHasFocus(var7)
	local isFocus = useLastInputMode() == "Focus"
	local var12_1 = var12 or var9
	local var19 = nil
	
	if fFlagAXFixIaBTimedOptionsPopoverFocus then
		local var20 = useRegistryEntry(focusNavigableSurfaceIdentifierEnum.PopUp) ~= nil
		local var21 = useRegistryEntry(focusNavigableSurfaceIdentifierEnum.ContextualMenu) ~= nil
		var19 = var20 or (var21 or useRegistryEntry(focusNavigableSurfaceIdentifierEnum.ModerationOverlay) ~= nil)
	end
	reactModule.useEffect(function()
		-- upvalues: marketplaceService (copy), playersService (copy), var10 (ref)
		local promptBulkPurchaseRequestedConnection = marketplaceService.PromptBulkPurchaseRequested:Connect(function(p1)
			-- upvalues: playersService (copy), var10 (copy)
			if p1 == playersService.LocalPlayer then
				var10(true)
			end
		end)
		local promptBulkPurchaseFinishedConnection = marketplaceService.PromptBulkPurchaseFinished:Connect(function(p2)
			-- upvalues: playersService (copy), var10 (copy)
			if p2 == playersService.LocalPlayer then
				var10(false)
			end
		end)
		
		return function()
			-- upvalues: promptBulkPurchaseRequestedConnection (ref), promptBulkPurchaseFinishedConnection (ref)
			promptBulkPurchaseRequestedConnection:Disconnect()
			promptBulkPurchaseFinishedConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var12_1 (ref), var14 (ref), focusNavigableSurfaceIdentifierEnum (copy), var7 (ref), guiService (copy), var13 (ref)
		if var12_1 then
			var14(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var7)
			guiService:RemoveSelectionGroup("InspectAndBuyApp")
			
			return function() end
		elseif var7 then
			var13(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var7)
			guiService:AddSelectionParent("InspectAndBuyApp", var7)
		else
			var14(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var7)
			guiService:RemoveSelectionGroup("InspectAndBuyApp")
			guiService.SelectedCoreObject = nil
		end
		return function()
			-- upvalues: var14 (copy), focusNavigableSurfaceIdentifierEnum (copy), var7 (copy), guiService (copy)
			var14(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var7)
			guiService:RemoveSelectionGroup("InspectAndBuyApp")
			guiService.SelectedCoreObject = nil
		end
	end, { var7, var12_1, var14, var13 })
	local var22 = isFocus and (var7 and (not var16 and (not var12_1 and not var19)))
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var15 (ref)
		local var25 = if var22 then var15() else nil
		
		return function()
			-- upvalues: var25 (write)
			if var25 then
				var25.cancel()
			end
		end
	end, { var22, var15 })
	
	return {
		setFocusRef = var8,
		focusNavigationProps = {
			SelectionGroup = true,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}
end