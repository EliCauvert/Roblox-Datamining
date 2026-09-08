local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatPresetChatAutocompleteExperimentLayer = game:DefineFastString("ExpChatPresetChatAutocompleteExperimentLayer", "UniverseChat.PresetChatAutocomplete")
local expChatPresetChatAutocompleteVariable = game:DefineFastString("ExpChatPresetChatAutocompleteVariable", "AutocompleteEnabled")
local expChatPresetAutocompleteRegularIxpOverride = game:DefineFastInt("ExpChatPresetAutocompleteRegularIxpOverride", 0)
local var1 = false

local function _()
	-- upvalues: experimentCacheManager (ref), expChatPresetChatAutocompleteExperimentLayer (ref), expChatPresetChatAutocompleteVariable (ref)
	local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatAutocompleteExperimentLayer)
	
	return if var2 and var2[expChatPresetChatAutocompleteVariable] ~= nil then var2[expChatPresetChatAutocompleteVariable] else nil
end

return {
	isEnabled = function()
		-- upvalues: expChatPresetAutocompleteRegularIxpOverride (ref), experimentCacheManager (ref), expChatPresetChatAutocompleteExperimentLayer (ref), expChatPresetChatAutocompleteVariable (ref)
		if expChatPresetAutocompleteRegularIxpOverride == 1 then
			return true
		elseif expChatPresetAutocompleteRegularIxpOverride == 2 then
			return false
		end
		local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatAutocompleteExperimentLayer)
		local var3 = if var2 and var2[expChatPresetChatAutocompleteVariable] ~= nil then var2[expChatPresetChatAutocompleteVariable] else nil
		var2 = if var3 ~= true then var3 == 1 else true
		
		return var2
	end,
	logExposure = function()
		-- upvalues: var1 (write), experimentCacheManager (ref), expChatPresetChatAutocompleteExperimentLayer (ref), expChatPresetChatAutocompleteVariable (ref)
		if not var1 then
			local var2 = experimentCacheManager.default:getLayerVariables(expChatPresetChatAutocompleteExperimentLayer)
			
			if (if var2 and var2[expChatPresetChatAutocompleteVariable] ~= nil then var2[expChatPresetChatAutocompleteVariable] else nil) == nil then
				return
			else
				var1 = true
				pcall(function()
					-- upvalues: experimentCacheManager (copy), expChatPresetChatAutocompleteExperimentLayer (copy)
					experimentCacheManager.default:logLayerExposure(expChatPresetChatAutocompleteExperimentLayer)
				end)
			end
		end
	end
}