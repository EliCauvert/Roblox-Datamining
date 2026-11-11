local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
game:DefineFastFlag("EnablePerfRegressionTest", false)

return function()
	-- upvalues: ExperimentCacheManager (copy), AppUserLayers (copy)
	local EnablePerfRegressionTestFastFlag = game:GetFastFlag("EnablePerfRegressionTest")
	
	if EnablePerfRegressionTestFastFlag then
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(AppUserLayers.PerfRegressionTestLayer)
		
		if LayerVariables and LayerVariables.homePageSleepTimeSeconds and typeof(LayerVariables.homePageSleepTimeSeconds) == "number" then
			return EnablePerfRegressionTestFastFlag, LayerVariables.homePageSleepTimeSeconds
		end
	end
	return EnablePerfRegressionTestFastFlag, 0
end