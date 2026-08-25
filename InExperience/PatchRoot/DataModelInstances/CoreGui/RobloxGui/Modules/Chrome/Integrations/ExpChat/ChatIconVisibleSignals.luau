local corePackagesService = game:GetService("CorePackages")
local signalsModule = require(corePackagesService.Packages.Signals)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagExpChatGuacChatDisabledReason = sharedFlagsModule.GetFFlagExpChatGuacChatDisabledReason
local fFlagExpChatWindowSyncUnibar = sharedFlagsModule.FFlagExpChatWindowSyncUnibar
local fFlagEnableAEGIS2CommsFAEUpsell = sharedFlagsModule.FFlagEnableAEGIS2CommsFAEUpsell
local expChatOnShowIconChatAvailabilityStatus = game:DefineFastFlag("ExpChatOnShowIconChatAvailabilityStatus", false)
local var4 = if expChatOnShowIconChatAvailabilityStatus then require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetChatStatusStore else nil
local var5 = if getFFlagExpChatGuacChatDisabledReason() then require(corePackagesService.Workspace.Packages.UniversalAppPolicy) else nil

local function new(p0)
	-- upvalues: signalsModule (ref), fFlagExpChatWindowSyncUnibar (ref), getFFlagExpChatGuacChatDisabledReason (ref), var5 (write), fFlagEnableAEGIS2CommsFAEUpsell (ref), expChatOnShowIconChatAvailabilityStatus (ref)
	local var7, var8 = signalsModule.createSignal(true)
	local var9, var10 = signalsModule.createSignal(false)
	local var11, var12 = signalsModule.createSignal(false)
	local var13, var14 = signalsModule.createSignal(false)
	local var15 = nil
	local var16 = nil
	
	if fFlagExpChatWindowSyncUnibar then
		local var17, var18 = signalsModule.createSignal(false)
		var15 = var17
		var16 = var18
	end
	local var19 = if getFFlagExpChatGuacChatDisabledReason() and var5 then var5.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked" else false
	local expChatOnShowIconChatAvailabilityStatus_1 = fFlagEnableAEGIS2CommsFAEUpsell and expChatOnShowIconChatAvailabilityStatus
	local var21 = signalsModule.createComputed(function(p1)
		-- upvalues: var7 (ref), expChatOnShowIconChatAvailabilityStatus_1 (ref), var9 (ref), fFlagExpChatWindowSyncUnibar (copy), var13 (ref), var11 (ref), var15 (write), p0 (ref), getFFlagExpChatGuacChatDisabledReason (copy), var19 (write)
		return if var7(p1) then if not (not expChatOnShowIconChatAvailabilityStatus_1 and var9(p1)) then if not (not fFlagExpChatWindowSyncUnibar and var13(p1)) then if not (not fFlagExpChatWindowSyncUnibar and var11(p1)) then if fFlagExpChatWindowSyncUnibar and var15(p1) then true elseif expChatOnShowIconChatAvailabilityStatus_1 and p0.getChatStatus(p1) ~= "NoOne" then true else getFFlagExpChatGuacChatDisabledReason() and var19 else true else true else true else false
	end)
	
	return {
		getIsChatIconVisible = var21,
		getIsChatWindowVisible = if fFlagExpChatWindowSyncUnibar then signalsModule.createComputed(function(p2)
			-- upvalues: var21 (ref), var15 (write)
			return var21(p2) and var15(p2)
		end) else nil,
		setCoreGuiEnabled = var8,
		setLocalUserChat = var10,
		setChatActiveCalledByDeveloper = var12,
		setVisibleViaChatSelector = var14,
		setGameSettingsChatVisible = var16
	}
end

return {
	new = new,
	default = new(if expChatOnShowIconChatAvailabilityStatus then var4(false) else nil)
}