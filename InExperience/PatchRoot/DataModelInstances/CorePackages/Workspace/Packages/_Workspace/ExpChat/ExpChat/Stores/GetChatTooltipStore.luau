local parent = script:FindFirstAncestor("ExpChat").Parent
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local expChatSharedModule = require(parent.ExpChatShared)
local createChatTooltipStoreModule = require(script.createChatTooltipStore)
local promptsApiModule = require(script.promptsApi)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local fFlagExpChatShowGlobalChatTooltip = sharedFlagsModule.FFlagExpChatShowGlobalChatTooltip

return signalsModule.createComputed(function() --[[ line: 17 ]]
	-- upvalues: createChatTooltipStoreModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), promptsApiModule (ref), fFlagExpChatShowGlobalChatTooltip (ref), fFlagExpChatPresetChatEnabled (ref)
	local var5 = createChatTooltipStoreModule()
	
	if fFlagExpChatUseUnifiedTooltipStore then
		promptsApiModule.fetchAllTooltipEligibility(function(p0) --[[ line: 21 ]]
			-- upvalues: fFlagExpChatShowGlobalChatTooltip (copy), var5 (ref), fFlagExpChatPresetChatEnabled (copy)
			local customPrompts = p0.customPrompts
			
			if fFlagExpChatShowGlobalChatTooltip then
				var5.setIsEligible("GlobalChatTooltip", customPrompts.GlobalChatTooltip ~= nil)
			end
			if fFlagExpChatPresetChatEnabled then
				var5.setIsEligible("PresetChatTooltip", customPrompts.PresetChatTooltip ~= nil)
			end
		end)
	end
	return var5
end)