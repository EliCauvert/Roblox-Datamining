local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatPresetChatAutocompleteExperimentLayer = game:DefineFastString("ExpChatPresetChatAutocompleteExperimentLayer", "UniverseChat.PresetChatAutocomplete")
local ExpChatPresetChatAutocompleteVariable = game:DefineFastString("ExpChatPresetChatAutocompleteVariable", "AutocompleteEnabled")
local ExpChatPresetChatAutocompleteSearchModeVariable = game:DefineFastString("ExpChatPresetChatAutocompleteSearchModeVariable", "AutocompleteSearchMode")
local ExpChatPresetChatAutocompleteMinQueryLengthVariable = game:DefineFastString("ExpChatPresetChatAutocompleteMinQueryLengthVariable", "AutocompleteMinQueryLength")
local ExpChatPresetAutocompleteRegularIxpOverride = game:DefineFastInt("ExpChatPresetAutocompleteRegularIxpOverride", 0)
local ExpChatPresetAutocompleteSearchModeOverride = game:DefineFastInt("ExpChatPresetAutocompleteSearchModeOverride", -1)
local ExpChatPresetAutocompleteMinQueryLengthOverride = game:DefineFastInt("ExpChatPresetAutocompleteMinQueryLengthOverride", 0)
local Flag = false

local function _() --[[ Line: 38 | Named "getAutocompleteAssignment" ]]
	-- upvalues: ExperimentCacheManager (copy), ExpChatPresetChatAutocompleteExperimentLayer (copy), ExpChatPresetChatAutocompleteVariable (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatAutocompleteExperimentLayer)
	
	return if LayerVariables and LayerVariables[ExpChatPresetChatAutocompleteVariable] ~= nil then LayerVariables[ExpChatPresetChatAutocompleteVariable] else nil
end

return {
	isEnabled = function(): boolean --[[ Line: 49 ]]
		-- upvalues: ExpChatPresetAutocompleteRegularIxpOverride (copy), ExperimentCacheManager (copy), ExpChatPresetChatAutocompleteExperimentLayer (copy), ExpChatPresetChatAutocompleteVariable (copy)
		if ExpChatPresetAutocompleteRegularIxpOverride == 1 then
			return true
		elseif ExpChatPresetAutocompleteRegularIxpOverride == 2 then
			return false
		else
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatAutocompleteExperimentLayer)
			local LayerVariable = if LayerVariables and LayerVariables[ExpChatPresetChatAutocompleteVariable] ~= nil then LayerVariables[ExpChatPresetChatAutocompleteVariable] else nil
			
			return LayerVariable == true or LayerVariable == 1
		end
	end,
	getSearchVariant = function() --[[ Line: 66 ]]
		-- upvalues: ExperimentCacheManager (copy), ExpChatPresetChatAutocompleteExperimentLayer (copy), ExpChatPresetAutocompleteSearchModeOverride (copy), ExpChatPresetChatAutocompleteSearchModeVariable (copy), ExpChatPresetAutocompleteMinQueryLengthOverride (copy), ExpChatPresetChatAutocompleteMinQueryLengthVariable (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatAutocompleteExperimentLayer) or {}
		local ExpChatPresetAutocompleteSearchModeOverride1 = if ExpChatPresetAutocompleteSearchModeOverride >= 0 then ExpChatPresetAutocompleteSearchModeOverride else tonumber(LayerVariables[ExpChatPresetChatAutocompleteSearchModeVariable])
		local ExpChatPresetAutocompleteMinQueryLengthOverride1 = if ExpChatPresetAutocompleteMinQueryLengthOverride > 0 then ExpChatPresetAutocompleteMinQueryLengthOverride else tonumber(LayerVariables[ExpChatPresetChatAutocompleteMinQueryLengthVariable])
		
		if ExpChatPresetAutocompleteMinQueryLengthOverride1 ~= nil and ExpChatPresetAutocompleteMinQueryLengthOverride1 < 1 then
			ExpChatPresetAutocompleteMinQueryLengthOverride1 = nil
		end
		return {
			mode = ExpChatPresetAutocompleteSearchModeOverride1,
			minQueryLength = ExpChatPresetAutocompleteMinQueryLengthOverride1
		}
	end,
	logExposure = function() --[[ Line: 95 ]]
		-- upvalues: Flag (ref), ExperimentCacheManager (copy), ExpChatPresetChatAutocompleteExperimentLayer (copy), ExpChatPresetChatAutocompleteVariable (copy)
		if not Flag then
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatPresetChatAutocompleteExperimentLayer)
			
			if (if LayerVariables and LayerVariables[ExpChatPresetChatAutocompleteVariable] ~= nil then LayerVariables[ExpChatPresetChatAutocompleteVariable] else nil) ~= nil then
				Flag = true
				pcall(function() --[[ Line: 103 ]]
					-- upvalues: ExperimentCacheManager (upval), ExpChatPresetChatAutocompleteExperimentLayer (upval)
					ExperimentCacheManager.default:logLayerExposure(ExpChatPresetChatAutocompleteExperimentLayer)
				end)
				
				return
			end
		end
	end
}