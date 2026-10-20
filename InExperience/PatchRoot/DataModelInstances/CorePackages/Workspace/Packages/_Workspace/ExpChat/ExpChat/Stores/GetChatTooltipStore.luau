local Parent = script:FindFirstAncestor("ExpChat").Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local CreateChatTooltipStoreModule = require(script.createChatTooltipStore)
local PromptsApiModule = require(script.promptsApi)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore

return require(Parent.Signals).createComputed(function()
	-- upvalues: CreateChatTooltipStoreModule (copy), FFlagExpChatUseUnifiedTooltipStore (copy), PromptsApiModule (copy), FFlagExpChatPresetChatEnabled (copy)
	local ChatTooltipStoreModule = CreateChatTooltipStoreModule()
	
	if FFlagExpChatUseUnifiedTooltipStore then
		PromptsApiModule.fetchAllTooltipEligibility(function(p1)
			-- upvalues: ChatTooltipStoreModule (copy), FFlagExpChatPresetChatEnabled (upval)
			local CustomPrompts = p1.customPrompts
			ChatTooltipStoreModule.setIsEligible("GlobalChatTooltip", CustomPrompts.GlobalChatTooltip ~= nil)
			
			if FFlagExpChatPresetChatEnabled then
				ChatTooltipStoreModule.setIsEligible("PresetChatTooltip", CustomPrompts.PresetChatTooltip ~= nil)
			end
		end)
	end
	return ChatTooltipStoreModule
end)