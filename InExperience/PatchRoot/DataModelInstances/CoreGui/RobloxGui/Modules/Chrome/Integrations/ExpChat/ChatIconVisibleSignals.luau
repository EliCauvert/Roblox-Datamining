local corePackagesService = game:GetService("CorePackages")
local signalsModule = require(corePackagesService.Packages.Signals)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagExpChatGuacChatDisabledReason = sharedFlagsModule.GetFFlagExpChatGuacChatDisabledReason
local fFlagExpChatWindowSyncUnibar = sharedFlagsModule.FFlagExpChatWindowSyncUnibar
local fFlagEnableAEGIS2CommsFAEUpsell = sharedFlagsModule.FFlagEnableAEGIS2CommsFAEUpsell
local expChatOnShowIconChatAvailabilityStatus = game:DefineFastFlag("ExpChatOnShowIconChatAvailabilityStatus", false)
local var1 = if expChatOnShowIconChatAvailabilityStatus then require(corePackagesService.Workspace.Packages.ExpChat).Stores.GetChatStatusStore else nil
local var2 = if getFFlagExpChatGuacChatDisabledReason() then require(corePackagesService.Workspace.Packages.UniversalAppPolicy) else nil

local function new(p1)
	-- upvalues: signalsModule (ref), fFlagExpChatWindowSyncUnibar (ref), getFFlagExpChatGuacChatDisabledReason (ref), var2 (write), fFlagEnableAEGIS2CommsFAEUpsell (ref), expChatOnShowIconChatAvailabilityStatus (ref)
	local var3, var4 = signalsModule.createSignal(true)
	local var5, var6 = signalsModule.createSignal(false)
	local var7, var8 = signalsModule.createSignal(false)
	local var9, var10 = signalsModule.createSignal(false)
	local var11 = nil
	local var12 = nil
	
	if fFlagExpChatWindowSyncUnibar then
		local var13, var14 = signalsModule.createSignal(false)
		var11 = var13
		var12 = var14
	end
	local var15 = if getFFlagExpChatGuacChatDisabledReason() and var2 then var2.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked" else false
	local expChatOnShowIconChatAvailabilityStatus_1 = fFlagEnableAEGIS2CommsFAEUpsell and expChatOnShowIconChatAvailabilityStatus
	local var16 = signalsModule.createComputed(function(p2)
		-- upvalues: var3 (ref), expChatOnShowIconChatAvailabilityStatus_1 (ref), var5 (ref), fFlagExpChatWindowSyncUnibar (copy), var9 (ref), var7 (ref), var11 (write), p1 (ref), getFFlagExpChatGuacChatDisabledReason (copy), var15 (write)
		return if var3(p2) then if not (not expChatOnShowIconChatAvailabilityStatus_1 and var5(p2)) then if not (not fFlagExpChatWindowSyncUnibar and var9(p2)) then if not (not fFlagExpChatWindowSyncUnibar and var7(p2)) then if fFlagExpChatWindowSyncUnibar and var11(p2) then true elseif expChatOnShowIconChatAvailabilityStatus_1 and p1.getChatStatus(p2) ~= "NoOne" then true else getFFlagExpChatGuacChatDisabledReason() and var15 else true else true else true else false
	end)
	
	return {
		getIsChatIconVisible = var16,
		getIsChatWindowVisible = if fFlagExpChatWindowSyncUnibar then signalsModule.createComputed(function(p2)
			-- upvalues: var16 (ref), var11 (write)
			return var16(p2) and var11(p2)
		end) else nil,
		setCoreGuiEnabled = var4,
		setLocalUserChat = var6,
		setChatActiveCalledByDeveloper = var8,
		setVisibleViaChatSelector = var10,
		setGameSettingsChatVisible = var12
	}
end

return {
	new = new,
	default = new(if expChatOnShowIconChatAvailabilityStatus then var1(false) else nil)
}