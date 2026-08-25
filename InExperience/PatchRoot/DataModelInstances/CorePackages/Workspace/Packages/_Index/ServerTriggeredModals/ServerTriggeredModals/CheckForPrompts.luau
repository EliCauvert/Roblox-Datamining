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

local function _(p0)
	return p0 ~= nil and (p0.config ~= nil and (p0.identifier ~= nil and (p0.robloxComponentType ~= nil and p0.title ~= nil)))
end

return reactModule.memo(roactNavigationModule.withNavigationFocus(function(p1)
	-- upvalues: useDispatch (ref), useModalSignalStoreModule (ref), useSignalState (ref), entryPointModule (ref), reactModule (ref), promptsEntryPointModule (ref), fFlagSduiAllowNoConfigsBuilt (ref), sduiLoadTimer (ref), fetchPromptsModule (ref), fFlagEnableHomepagePromptsForModalsAndBanners (ref), usePromptEntriesModule (ref), promptStyleModule (ref), getSduiApiStore (ref), setCentralOverlay (ref), centralOverlayType (ref), appPage (ref), fFlagPromptsImpressionUsesTitle (ref)
	local var13 = useDispatch()
	local var14 = useModalSignalStoreModule()
	local var15 = useSignalState(var14.getMetadataGetter(entryPointModule.HomepageLaunch))
	local var16 = useSignalState(var14.getHasShownGetter(entryPointModule.HomepageLaunch))
	local isFocused = p1.isFocused
	local var17 = reactModule.useMemo(function()
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
		-- upvalues: fetchPromptsModule (copy), var17 (ref)
		fetchPromptsModule(var17)
	end, { var17 })
	local var18 = if fFlagEnableHomepagePromptsForModalsAndBanners then usePromptEntriesModule("HomepagePrompts", promptStyleModule.Modal)[1] else useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: getSduiApiStore (copy)
		local var19 = getSduiApiStore().getData("HomepagePrompts").data(p2)
		
		return var19 and var19.HomepagePrompts
	end, {}))
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var15 (ref), isFocused (ref), var18 (write), var14 (ref), entryPointModule (copy), var13 (ref), setCentralOverlay (copy), centralOverlayType (copy), appPage (copy), fFlagPromptsImpressionUsesTitle (copy)
		if var16 then return end
		if var15 then return end
		if not isFocused then return end
		if var18 ~= nil and (var18.config ~= nil and (var18.identifier ~= nil and (var18.robloxComponentType ~= nil and var18.title ~= nil))) then
			var14.setHasShown(entryPointModule.HomepageLaunch, true)
			var13(setCentralOverlay(centralOverlayType.SduiPromptModal, {
				configKey = "HomepagePrompts",
				appPage = appPage.Home,
				modalId = var18.identifier,
				modalType = if fFlagPromptsImpressionUsesTitle then var18.title else var18.robloxComponentType
			}))
			
			return
		end
	end, {
		var16, var15, isFocused, var13, var14, var18
	})
	
	return nil
end))