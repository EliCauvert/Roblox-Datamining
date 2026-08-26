local serverTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local parent = serverTriggeredModals.Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local centralOverlayModule = require(parent.CentralOverlay)
local useSignalState = require(parent.SignalsReact).useSignalState
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local appPage = robloxAppEnumsModule.AppPage
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local useModalSignalStoreModule = require(serverTriggeredModals.SignalStores.useModalSignalStore)
local entryPointModule = require(serverTriggeredModals.EntryPoint)
local fetchPromptsModule = require(serverTriggeredModals.SduiV2.fetchPrompts)
local promptsEntryPointModule = require(serverTriggeredModals.SduiV2.PromptsEntryPoint)
local promptStyleModule = require(serverTriggeredModals.SduiV2.PromptStyle)
local usePromptEntriesModule = require(serverTriggeredModals.SduiV2.usePromptEntries)
local fFlagSduiAllowNoConfigsBuilt = sharedFlagsModule.FFlagSduiAllowNoConfigsBuilt
local fFlagEnableHomepagePromptsForModalsAndBanners = sharedFlagsModule.FFlagEnableHomepagePromptsForModalsAndBanners
local fFlagPromptsImpressionUsesTitle = sharedFlagsModule.FFlagPromptsImpressionUsesTitle

local function _(p1)
	return p1 ~= nil and (p1.config ~= nil and (p1.identifier ~= nil and (p1.robloxComponentType ~= nil and p1.title ~= nil)))
end

return reactModule.memo(roactNavigationModule.withNavigationFocus(function(p1)
	-- upvalues: useDispatch (ref), useModalSignalStoreModule (ref), useSignalState (ref), entryPointModule (ref), reactModule (ref), promptsEntryPointModule (ref), fFlagSduiAllowNoConfigsBuilt (ref), sduiLoadTimer (ref), fetchPromptsModule (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), usePromptEntriesModule (ref), promptStyleModule (ref), getSduiApiStore (ref), setCentralOverlay (ref), centralOverlayType (ref), appPage (ref), fFlagPromptsImpressionUsesTitle (ref)
	local var1 = useDispatch()
	local var2 = useModalSignalStoreModule()
	local var3 = useSignalState(var2.getMetadataGetter(entryPointModule.HomepageLaunch))
	local var4 = useSignalState(var2.getHasShownGetter(entryPointModule.HomepageLaunch))
	local isFocused = p1.isFocused
	local var5 = reactModule.useMemo(function()
		-- upvalues: promptsEntryPointModule (copy), fFlagSduiAllowNoConfigsBuilt (copy), sduiLoadTimer (copy)
		return {
			surfaceKey = "HomepagePrompts",
			configKey = "HomepagePrompts",
			clearOnEmptyResponse = true,
			clientAttributes = nil,
			entryPoint = promptsEntryPointModule.HomepageLaunch,
			allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then true else nil,
			loadTimer = sduiLoadTimer.createLoadTimer("HomepagePrompts")
		}
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fetchPromptsModule (copy), var5 (ref)
		fetchPromptsModule(var5)
	end, { var5 })
	local var6 = if fFlagEnableHomepagePromptsForModalsAndBanners then usePromptEntriesModule("HomepagePrompts", promptStyleModule.Modal)[1] else useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: getSduiApiStore (copy)
		local var7 = getSduiApiStore().getData("HomepagePrompts").data(p2)
		
		return var7 and var7.HomepagePrompts
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref), isFocused (ref), var6 (write), var2 (ref), entryPointModule (copy), var1 (ref), setCentralOverlay (copy), centralOverlayType (copy), appPage (copy), fFlagPromptsImpressionUsesTitle (copy)
		if var4 then return end
		if var3 then return end
		if not isFocused then return end
		if var6 ~= nil and (var6.config ~= nil and (var6.identifier ~= nil and (var6.robloxComponentType ~= nil and var6.title ~= nil))) then
			var2.setHasShown(entryPointModule.HomepageLaunch, true)
			var1(setCentralOverlay(centralOverlayType.SduiPromptModal, {
				configKey = "HomepagePrompts",
				appPage = appPage.Home,
				modalId = var6.identifier,
				modalType = if fFlagPromptsImpressionUsesTitle then var6.title else var6.robloxComponentType
			}))
			
			return
		end
	end, {
		var4, var3, isFocused, var1, var2, var6
	})
	
	return nil
end))