local parent = script:FindFirstAncestor("GameTile").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local luaAppGameTileMigrationExpLayer = game:DefineFastString("LuaAppGameTileMigrationExpLayer", "PlayerApp.HomePage.UX.TileLayer")
local fFlagLuaAppUnifyPlayButtonTileIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp

local function _(p0)
	-- upvalues: luaAppGameTileMigrationExpLayer (ref), experimentCacheManager (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(luaAppGameTileMigrationExpLayer, true)
	
	if var1 and var1[p0] ~= nil then
		experimentCacheManager.default:sendCustomExposureLog(luaAppGameTileMigrationExpLayer)
		
		return var1[p0]
	end
	return false
end

return {
	getIsTileMigrationEnabled = function()
		-- upvalues: luaAppGameTileMigrationExpLayer (ref), experimentCacheManager (ref)
		local var2 = experimentCacheManager.default:getLayerVariables(luaAppGameTileMigrationExpLayer, true)
		
		if var2 and var2.IsTileMigrationEnabled ~= nil then
			experimentCacheManager.default:sendCustomExposureLog(luaAppGameTileMigrationExpLayer)
			
			return var2.IsTileMigrationEnabled
		end
		return false
	end,
	getIsPlayButtonMigrationEnabled = if fFlagLuaAppUnifyPlayButtonTileIxp then if fFlagLuaAppUnifyPlayButtonTileIxp then function()
		-- upvalues: luaAppGameTileMigrationExpLayer (ref), experimentCacheManager (ref)
		local var3 = experimentCacheManager.default:getLayerVariables(luaAppGameTileMigrationExpLayer, true)
		
		if var3 and var3.IsPlayButtonMigrationEnabled ~= nil then
			experimentCacheManager.default:sendCustomExposureLog(luaAppGameTileMigrationExpLayer)
			
			return var3.IsPlayButtonMigrationEnabled
		end
		return false
	end else nil else nil
}