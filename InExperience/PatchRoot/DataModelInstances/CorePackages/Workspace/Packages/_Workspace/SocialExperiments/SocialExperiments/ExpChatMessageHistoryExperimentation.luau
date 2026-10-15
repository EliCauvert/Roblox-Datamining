local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local expChatMessageHistoryLayer = game:DefineFastString("ExpChatMessageHistoryLayer", "ExperienceChat.MessageHistory")
local expChatHistoryMessageCountVariable = game:DefineFastString("ExpChatHistoryMessageCountVariable", "historyMessageCount")
local expChatHistoryMaxAgeSecondsVariable = game:DefineFastString("ExpChatHistoryMaxAgeSecondsVariable", "historyMaxAgeSeconds")
local forceEnableExpChatMessageHistory = game:DefineFastFlag("ForceEnableExpChatMessageHistory", false)
local debugExpChatHistoryMessageCount = game:DefineFastInt("DebugExpChatHistoryMessageCount", 10)
local debugExpChatHistoryMaxAgeSeconds = game:DefineFastInt("DebugExpChatHistoryMaxAgeSeconds", 0)
local var1 = nil
local var2 = false

return {
	getHistoryArm = function(p1)
		-- upvalues: var1 (write), experimentCacheManager (ref), expChatMessageHistoryLayer (ref), expChatHistoryMessageCountVariable (ref), forceEnableExpChatMessageHistory (ref), debugExpChatHistoryMessageCount (ref), debugExpChatHistoryMaxAgeSeconds (ref), expChatHistoryMaxAgeSecondsVariable (ref)
		if not p1 then
			return nil
		elseif var1 then
			return var1
		end
		local var3 = experimentCacheManager.default:getLayerVariables(expChatMessageHistoryLayer)
		
		if var3 ~= nil and var3[expChatHistoryMessageCountVariable] ~= nil then
			var1 = {
				maxCount = var3[expChatHistoryMessageCountVariable] or 0,
				maxAgeSeconds = var3[expChatHistoryMaxAgeSecondsVariable] or 0
			}
			
			return var1
		end
		return if forceEnableExpChatMessageHistory then {
			maxCount = debugExpChatHistoryMessageCount,
			maxAgeSeconds = debugExpChatHistoryMaxAgeSeconds
		} else nil
	end,
	logExposure = function(p1)
		-- upvalues: var2 (write), experimentCacheManager (ref), expChatMessageHistoryLayer (ref), expChatHistoryMessageCountVariable (ref)
		if var2 or not p1 then return end
		local var3 = experimentCacheManager.default:getLayerVariables(expChatMessageHistoryLayer)
		
		if var3 == nil or var3[expChatHistoryMessageCountVariable] == nil then
			return
		end
		var2 = true
		pcall(function()
			-- upvalues: experimentCacheManager (copy), expChatMessageHistoryLayer (copy)
			experimentCacheManager.default:logLayerExposure(expChatMessageHistoryLayer)
		end)
	end
}