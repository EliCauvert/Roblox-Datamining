local experimentCacheManager = require(script:FindFirstAncestor("DiscoveryUtils").Parent.ExperimentCacheManager).ExperimentCacheManager
local luaAppVerticalEfficiencyExpLayer = game:DefineFastString("LuaAppVerticalEfficiencyExpLayer", "PlayerApp.HomePage.UX")

local function _(p1)
	-- upvalues: luaAppVerticalEfficiencyExpLayer (ref), experimentCacheManager (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(luaAppVerticalEfficiencyExpLayer, true)
	
	if var1 and var1[p1] ~= nil then
		experimentCacheManager.default:sendCustomExposureLog(luaAppVerticalEfficiencyExpLayer)
		
		return var1[p1]
	end
	return false
end

return {
	getIsProfileMovedToTopBar = function()
		-- upvalues: luaAppVerticalEfficiencyExpLayer (ref), experimentCacheManager (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(luaAppVerticalEfficiencyExpLayer, true)
		
		if var1 and var1.IsProfileMovedToTopBar ~= nil then
			experimentCacheManager.default:sendCustomExposureLog(luaAppVerticalEfficiencyExpLayer)
			
			return var1.IsProfileMovedToTopBar
		end
		return false
	end,
	getIsRobloxLogoHeaderEnabled = function()
		-- upvalues: luaAppVerticalEfficiencyExpLayer (ref), experimentCacheManager (ref)
		local var1 = experimentCacheManager.default:getLayerVariables(luaAppVerticalEfficiencyExpLayer, true)
		
		if var1 and var1.IsRobloxLogoHeaderEnabled ~= nil then
			experimentCacheManager.default:sendCustomExposureLog(luaAppVerticalEfficiencyExpLayer)
			
			return var1.IsRobloxLogoHeaderEnabled
		end
		return false
	end
}