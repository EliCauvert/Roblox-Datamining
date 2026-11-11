local ExperimentCacheManager = require(script:FindFirstAncestor("DiscoveryUtils").Parent.ExperimentCacheManager).ExperimentCacheManager
local LuaAppVerticalEfficiencyExpLayer = game:DefineFastString("LuaAppVerticalEfficiencyExpLayer", "PlayerApp.HomePage.UX")

local function _(p1)
	-- upvalues: LuaAppVerticalEfficiencyExpLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppVerticalEfficiencyExpLayer, true)
	
	if LayerVariables and LayerVariables[p1] ~= nil then
		ExperimentCacheManager.default:sendCustomExposureLog(LuaAppVerticalEfficiencyExpLayer)
		
		return LayerVariables[p1]
	else
		return false
	end
end

return {
	getIsProfileMovedToTopBar = function()
		-- upvalues: LuaAppVerticalEfficiencyExpLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppVerticalEfficiencyExpLayer, true)
		
		if LayerVariables and LayerVariables.IsProfileMovedToTopBar ~= nil then
			ExperimentCacheManager.default:sendCustomExposureLog(LuaAppVerticalEfficiencyExpLayer)
			
			return LayerVariables.IsProfileMovedToTopBar
		else
			return false
		end
	end,
	getIsRobloxLogoHeaderEnabled = function()
		-- upvalues: LuaAppVerticalEfficiencyExpLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppVerticalEfficiencyExpLayer, true)
		
		if LayerVariables and LayerVariables.IsRobloxLogoHeaderEnabled ~= nil then
			ExperimentCacheManager.default:sendCustomExposureLog(LuaAppVerticalEfficiencyExpLayer)
			
			return LayerVariables.IsRobloxLogoHeaderEnabled
		else
			return false
		end
	end
}