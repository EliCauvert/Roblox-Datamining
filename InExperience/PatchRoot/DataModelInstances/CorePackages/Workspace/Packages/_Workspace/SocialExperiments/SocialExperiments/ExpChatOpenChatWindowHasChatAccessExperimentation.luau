local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local ExpChatOpenChatWindowHasChatAccessExperimentLayer = game:DefineFastString("ExpChatOpenChatWindowHasChatAccessExperimentLayer", "User.Communication.OpenChatWindow.HasChatAccess.UserId")
local Flag = false

return {
	logExposure = function()
		-- upvalues: Flag (ref), ExperimentCacheManager (copy), ExpChatOpenChatWindowHasChatAccessExperimentLayer (copy)
		if not Flag then
			Flag = true
			pcall(function()
				-- upvalues: ExperimentCacheManager (upval), ExpChatOpenChatWindowHasChatAccessExperimentLayer (upval)
				ExperimentCacheManager.default:logLayerExposure(ExpChatOpenChatWindowHasChatAccessExperimentLayer)
			end)
			
			return
		end
	end
}