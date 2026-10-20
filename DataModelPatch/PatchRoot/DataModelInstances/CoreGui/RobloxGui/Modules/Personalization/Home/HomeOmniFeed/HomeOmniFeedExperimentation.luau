local ExperimentCacheManager = require(game:GetService("CorePackages").Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager
local LuaAppRelativeGuiIxpLayer = game:DefineFastString("LuaAppRelativeGuiIxpLayer", "PlayerApp.HomePage.UX")

return {
	getRelativeGuiOnHomeEnabled = function()
		-- upvalues: LuaAppRelativeGuiIxpLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppRelativeGuiIxpLayer, true)
		
		if LayerVariables and LayerVariables.EnableRelativeGui ~= nil then
			ExperimentCacheManager.default:sendCustomExposureLog(LuaAppRelativeGuiIxpLayer)
			
			return LayerVariables.EnableRelativeGui
		else
			return false
		end
	end
}