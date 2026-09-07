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

local function selectItemBeingPurchased(p1)
	return p1.itemBeingPurchased
end

return function()
	-- upvalues: reactModule (ref), useSelector (ref), selectItemBeingPurchased (ref), useRegisterFocusNavigableSurface (ref), useDeRegisterFocusNavigableSurface (ref), useAutoFocus (ref), useDescendantHasFocus (ref), useLastInputMode (ref), fFlagAXFixIaBTimedOptionsPopoverFocus (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnum (ref), marketplaceService (ref), playersService (ref), guiService (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(false)
	local var5 = useSelector(selectItemBeingPurchased)
	local var6 = var5 and var5.itemId ~= nil
	local var7 = useRegisterFocusNavigableSurface()
	local var8 = useDeRegisterFocusNavigableSurface()
	local var9 = useAutoFocus({ var1 }, 0.1)
	local var10 = useDescendantHasFocus(var1)
	local isFocus = useLastInputMode() == "Focus"
	local var11 = var6 or var3
	local var12 = nil
	
	if fFlagAXFixIaBTimedOptionsPopoverFocus then
		local var13 = useRegistryEntry(focusNavigableSurfaceIdentifierEnum.PopUp) ~= nil
		local var14 = useRegistryEntry(focusNavigableSurfaceIdentifierEnum.ContextualMenu) ~= nil
		var12 = var13 or (var14 or useRegistryEntry(focusNavigableSurfaceIdentifierEnum.ModerationOverlay) ~= nil)
	end
	reactModule.useEffect(function()
		-- upvalues: marketplaceService (copy), playersService (copy), var4 (ref)
		local promptBulkPurchaseRequestedConnection = marketplaceService.PromptBulkPurchaseRequested:Connect(function(p1)
			-- upvalues: playersService (copy), var4 (copy)
			if p1 == playersService.LocalPlayer then
				var4(true)
			end
		end)
		local promptBulkPurchaseFinishedConnection = marketplaceService.PromptBulkPurchaseFinished:Connect(function(p1)
			-- upvalues: playersService (copy), var4 (copy)
			if p1 == playersService.LocalPlayer then
				var4(false)
			end
		end)
		
		return function()
			-- upvalues: promptBulkPurchaseRequestedConnection (ref), promptBulkPurchaseFinishedConnection (ref)
			promptBulkPurchaseRequestedConnection:Disconnect()
			promptBulkPurchaseFinishedConnection:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var8 (ref), focusNavigableSurfaceIdentifierEnum (copy), var1 (ref), guiService (copy), var7 (ref)
		if var11 then
			var8(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var1)
			guiService:RemoveSelectionGroup("InspectAndBuyApp")
			
			return function() end
		elseif var1 then
			var7(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var1)
			guiService:AddSelectionParent("InspectAndBuyApp", var1)
		else
			var8(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var1)
			guiService:RemoveSelectionGroup("InspectAndBuyApp")
			guiService.SelectedCoreObject = nil
		end
		return function()
			-- upvalues: var8 (copy), focusNavigableSurfaceIdentifierEnum (copy), var1 (copy), guiService (copy)
			var8(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var1)
			guiService:RemoveSelectionGroup("InspectAndBuyApp")
			guiService.SelectedCoreObject = nil
		end
	end, { var1, var11, var8, var7 })
	local var15 = isFocus and (var1 and (not var10 and (not var11 and not var12)))
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var9 (ref)
		local var16 = if var15 then var9() else nil
		
		return function()
			-- upvalues: var16 (write)
			if var16 then
				var16.cancel()
			end
		end
	end, { var15, var9 })
	
	return {
		setFocusRef = var2,
		focusNavigationProps = {
			SelectionGroup = true,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}
end