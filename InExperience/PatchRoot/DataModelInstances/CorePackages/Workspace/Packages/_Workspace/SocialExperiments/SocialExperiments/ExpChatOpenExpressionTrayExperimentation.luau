local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatOpenExpressionTrayExperimentLayer = game:DefineFastString("ExpChatOpenExpressionTrayExperimentLayer", "UniverseChat.OpenExpressionTray")
local Flag = false

return {
	logExposure = function()
		-- upvalues: Flag (ref), ExperimentCacheManager (copy), ExpChatOpenExpressionTrayExperimentLayer (copy)
		if not Flag then
			Flag = true
			pcall(function()
				-- upvalues: ExperimentCacheManager (upval), ExpChatOpenExpressionTrayExperimentLayer (upval)
				ExperimentCacheManager.default:logLayerExposure(ExpChatOpenExpressionTrayExperimentLayer)
			end)
			
			return
		end
	end
}