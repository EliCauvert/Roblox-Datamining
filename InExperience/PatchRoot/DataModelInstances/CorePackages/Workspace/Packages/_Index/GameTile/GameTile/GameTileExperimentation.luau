local Parent = script:FindFirstAncestor("GameTile").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local LuaAppGameTileMigrationExpLayer = game:DefineFastString("LuaAppGameTileMigrationExpLayer", "PlayerApp.HomePage.UX.TileLayer")
local FFlagLuaAppUnifyPlayButtonTileIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp

local function _(p1) --[[ Line: 9 | Named "getIsUserInTreatmentAndSendExposureLog" ]]
	-- upvalues: LuaAppGameTileMigrationExpLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppGameTileMigrationExpLayer, true)
	
	if LayerVariables and LayerVariables[p1] ~= nil then
		ExperimentCacheManager.default:sendCustomExposureLog(LuaAppGameTileMigrationExpLayer)
		
		return LayerVariables[p1]
	else
		return false
	end
end

local v1 = if FFlagLuaAppUnifyPlayButtonTileIxp then function() --[[ Line: 26 ]]
	-- upvalues: LuaAppGameTileMigrationExpLayer (copy), ExperimentCacheManager (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppGameTileMigrationExpLayer, true)
	
	if LayerVariables and LayerVariables.IsPlayButtonMigrationEnabled ~= nil then
		ExperimentCacheManager.default:sendCustomExposureLog(LuaAppGameTileMigrationExpLayer)
		
		return LayerVariables.IsPlayButtonMigrationEnabled
	else
		return false
	end
end else nil

return {
	getIsTileMigrationEnabled = function() --[[ Line: 21 ]]
		-- upvalues: LuaAppGameTileMigrationExpLayer (copy), ExperimentCacheManager (copy)
		local LayerVariables = ExperimentCacheManager.default:getLayerVariables(LuaAppGameTileMigrationExpLayer, true)
		
		if LayerVariables and LayerVariables.IsTileMigrationEnabled ~= nil then
			ExperimentCacheManager.default:sendCustomExposureLog(LuaAppGameTileMigrationExpLayer)
			
			return LayerVariables.IsTileMigrationEnabled
		else
			return false
		end
	end,
	getIsPlayButtonMigrationEnabled = if FFlagLuaAppUnifyPlayButtonTileIxp then v1 else nil
}