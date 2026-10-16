local CorePackages = game:GetService("CorePackages")
local SignalsModule = require(CorePackages.Packages.Signals)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagExpChatGuacChatDisabledReasonFunction = SharedFlagsModule.GetFFlagExpChatGuacChatDisabledReason
local FFlagExpChatWindowSyncUnibar = SharedFlagsModule.FFlagExpChatWindowSyncUnibar
local FFlagEnableAEGIS2CommsFAEUpsell = SharedFlagsModule.FFlagEnableAEGIS2CommsFAEUpsell
local ExpChatOnShowIconChatAvailabilityStatus = game:DefineFastFlag("ExpChatOnShowIconChatAvailabilityStatus", false)
local GetChatStatusStore = if ExpChatOnShowIconChatAvailabilityStatus then require(CorePackages.Workspace.Packages.ExpChat).Stores.GetChatStatusStore else nil
local UniversalAppPolicyModule = if GetFFlagExpChatGuacChatDisabledReasonFunction() then require(CorePackages.Workspace.Packages.UniversalAppPolicy) else nil

local function new(p1) --[[ Line: 23 ]]
	-- upvalues: SignalsModule (copy), FFlagExpChatWindowSyncUnibar (copy), GetFFlagExpChatGuacChatDisabledReasonFunction (copy), UniversalAppPolicyModule (ref), FFlagEnableAEGIS2CommsFAEUpsell (copy), ExpChatOnShowIconChatAvailabilityStatus (copy)
	local Signal, Signal2 = SignalsModule.createSignal(true)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	local Callback = nil
	local SetGameSettingsChatVisible = nil
	
	if FFlagExpChatWindowSyncUnibar then
		Callback, SetGameSettingsChatVisible = SignalsModule.createSignal(false)
	end
	local IsRegionLocked: boolean = if GetFFlagExpChatGuacChatDisabledReasonFunction() and UniversalAppPolicyModule then UniversalAppPolicyModule.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked" else false
	local ExpChatOnShowIconChatAvailabilityStatus1 = FFlagEnableAEGIS2CommsFAEUpsell and ExpChatOnShowIconChatAvailabilityStatus
	local Computed = SignalsModule.createComputed(function(p2) --[[ Line: 41 ]]
		-- upvalues: Signal (copy), ExpChatOnShowIconChatAvailabilityStatus1 (copy), Signal1 (copy), FFlagExpChatWindowSyncUnibar (upval), Signal4 (copy), Signal3 (copy), Callback (ref), p1 (copy), GetFFlagExpChatGuacChatDisabledReasonFunction (upval), IsRegionLocked (ref)
		return if Signal(p2) then not ExpChatOnShowIconChatAvailabilityStatus1 and Signal1(p2) or (not FFlagExpChatWindowSyncUnibar and Signal4(p2) or not FFlagExpChatWindowSyncUnibar and Signal3(p2)) or (if FFlagExpChatWindowSyncUnibar and Callback(p2) then true else ExpChatOnShowIconChatAvailabilityStatus1 and p1.getChatStatus(p2) ~= "NoOne" or (if GetFFlagExpChatGuacChatDisabledReasonFunction() and IsRegionLocked then true else false)) else false
	end)
	
	return {
		getIsChatIconVisible = Computed,
		getIsChatWindowVisible = if FFlagExpChatWindowSyncUnibar then SignalsModule.createComputed(function(p2): boolean --[[ Line: 73 ]]
			-- upvalues: Computed (copy), Callback (ref)
			return if Computed(p2) and Callback(p2) then true else false
		end) else nil,
		setCoreGuiEnabled = Signal2,
		setLocalUserChat = Signal2_1,
		setChatActiveCalledByDeveloper = Signal2_2,
		setVisibleViaChatSelector = Signal2_3,
		setGameSettingsChatVisible = SetGameSettingsChatVisible
	}
end

return {
	new = new,
	default = new(if ExpChatOnShowIconChatAvailabilityStatus then GetChatStatusStore(false) else nil)
}