local experimentCacheManager = require(script:FindFirstAncestor("DiscoveryUtils").Parent.ExperimentCacheManager).ExperimentCacheManager
local luaAppVerticalEfficiencyExpLayer = game:DefineFastString("LuaAppVerticalEfficiencyExpLayer", "PlayerApp.HomePage.UX")

local function _(p0)
	-- upvalues: luaAppVerticalEfficiencyExpLayer (ref), experimentCacheManager (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(luaAppVerticalEfficiencyExpLayer, true)
	
	if var1 and var1[p0] ~= nil then
		experimentCacheManager.default:sendCustomExposureLog(luaAppVerticalEfficiencyExpLayer)
		
		return var1[p0]
	end
	return false
end

return {
	getIsProfileMovedToTopBar = function()
		-- upvalues: luaAppVerticalEfficiencyExpLayer (ref), experimentCacheManager (ref)
		local var2 = experimentCacheManager.default:getLayerVariables(luaAppVerticalEfficiencyExpLayer, true)
		
		if var2 and var2.IsProfileMovedToTopBar ~= nil then
			experimentCacheManager.default:sendCustomExposureLog(luaAppVerticalEfficiencyExpLayer)
			
			return var2.IsProfileMovedToTopBar
		end
		return false
	end,
	getIsRobloxLogoHeaderEnabled = function()
		-- upvalues: luaAppVerticalEfficiencyExpLayer (ref), experimentCacheManager (ref)
		local var3 = experimentCacheManager.default:getLayerVariables(luaAppVerticalEfficiencyExpLayer, true)
		
		if var3 and var3.IsRobloxLogoHeaderEnabled ~= nil then
			experimentCacheManager.default:sendCustomExposureLog(luaAppVerticalEfficiencyExpLayer)
			
			return var3.IsRobloxLogoHeaderEnabled
		end
		return false
	end
}