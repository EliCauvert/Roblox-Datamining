local parent = script:FindFirstAncestor("ExpChat").Parent
local signalsModule = require(parent.Signals)
local expChatSharedModule = require(parent.ExpChatShared)
local createChatTooltipStoreModule = require(script.createChatTooltipStore)
local promptsApiModule = require(script.promptsApi)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore

return signalsModule.createComputed(function()
	-- upvalues: createChatTooltipStoreModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), promptsApiModule (ref), fFlagExpChatPresetChatEnabled (ref)
	local var4 = createChatTooltipStoreModule()
	
	if fFlagExpChatUseUnifiedTooltipStore then
		promptsApiModule.fetchAllTooltipEligibility(function(p0)
			-- upvalues: var4 (ref), fFlagExpChatPresetChatEnabled (copy)
			local customPrompts = p0.customPrompts
			var4.setIsEligible("GlobalChatTooltip", customPrompts.GlobalChatTooltip ~= nil)
			
			if fFlagExpChatPresetChatEnabled then
				var4.setIsEligible("PresetChatTooltip", customPrompts.PresetChatTooltip ~= nil)
			end
		end)
	end
	return var4
end)