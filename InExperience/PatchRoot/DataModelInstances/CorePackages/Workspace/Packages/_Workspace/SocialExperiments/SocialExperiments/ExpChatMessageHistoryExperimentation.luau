local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatMessageHistoryLayer = game:DefineFastString("ExpChatMessageHistoryLayer", "ExperienceChat.MessageHistory")
local ExpChatHistoryMessageCountVariable = game:DefineFastString("ExpChatHistoryMessageCountVariable", "historyMessageCount")
local ExpChatHistoryMaxAgeSecondsVariable = game:DefineFastString("ExpChatHistoryMaxAgeSecondsVariable", "historyMaxAgeSeconds")
local ForceEnableExpChatMessageHistory = game:DefineFastFlag("ForceEnableExpChatMessageHistory", false)
local DebugExpChatHistoryMessageCount = game:DefineFastInt("DebugExpChatHistoryMessageCount", 10)
local DebugExpChatHistoryMaxAgeSeconds = game:DefineFastInt("DebugExpChatHistoryMaxAgeSeconds", 0)
local Config = nil
local Flag = false

return {
	getHistoryArm = function(p1) --[[ Line: 25 ]]
		-- upvalues: Config (ref), ExperimentCacheManager (copy), ExpChatMessageHistoryLayer (copy), ExpChatHistoryMessageCountVariable (copy), ForceEnableExpChatMessageHistory (copy), DebugExpChatHistoryMessageCount (copy), DebugExpChatHistoryMaxAgeSeconds (copy), ExpChatHistoryMaxAgeSecondsVariable (copy)
		if not p1 then
			return nil
		elseif Config then
			return Config
		else
			local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatMessageHistoryLayer)
			
			if LayerVariables == nil or LayerVariables[ExpChatHistoryMessageCountVariable] == nil then
				return if ForceEnableExpChatMessageHistory then {
					maxCount = DebugExpChatHistoryMessageCount,
					maxAgeSeconds = DebugExpChatHistoryMaxAgeSeconds
				} else nil
			else
				Config = {
					maxCount = LayerVariables[ExpChatHistoryMessageCountVariable] or 0,
					maxAgeSeconds = LayerVariables[ExpChatHistoryMaxAgeSecondsVariable] or 0
				}
				
				return Config
			end
		end
	end,
	logExposure = function(p1) --[[ Line: 52 ]]
		-- upvalues: Flag (ref), ExperimentCacheManager (copy), ExpChatMessageHistoryLayer (copy), ExpChatHistoryMessageCountVariable (copy)
		if Flag or not p1 then return end
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(ExpChatMessageHistoryLayer)
		
		if LayerVariables ~= nil and LayerVariables[ExpChatHistoryMessageCountVariable] ~= nil then
			Flag = true
			pcall(function() --[[ Line: 63 ]]
				-- upvalues: ExperimentCacheManager (upval), ExpChatMessageHistoryLayer (upval)
				ExperimentCacheManager.default:logLayerExposure(ExpChatMessageHistoryLayer)
			end)
			
			return
		end
	end
}