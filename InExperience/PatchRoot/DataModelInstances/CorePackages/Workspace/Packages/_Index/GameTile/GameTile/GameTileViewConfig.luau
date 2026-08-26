local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local _ = require(parent.Style)
local _ = require(parent.Foundation)
local memoize = require(parent.AppCommonLib).memoize
local _ = require(gameTile.GameTileTypes)
local fFlagLuaAppMigrateGameTileFooterValueFixes = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFooterValueFixes
local fFlagLuaAppUnifyPlayButtonTile = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local fFlagLuaAppUnifyPlayButtonTileIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp
local gameTileExperimentationModule = require(gameTile.GameTileExperimentation)
local var1 = memoize(function(p1, p2, p3, p4, p5, p6)
	-- upvalues: fFlagLuaAppUnifyPlayButtonTileIxp (ref), gameTileExperimentationModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref)
	local var2 = if fFlagLuaAppUnifyPlayButtonTileIxp then gameTileExperimentationModule.getIsPlayButtonMigrationEnabled() else nil
	
	return if p4 and p5 then {
		paddingAboveMetadata = 0,
		footerTopPadding = p4.Gap.Medium,
		titleHeight = (p3 or 1) * (p4.Size.Size_500 + (p2 or 0)),
		metadataHeight = (p6 or 1) * (p4.Size.Size_500 + (p2 or 0)),
		footerBottomPadding = p4.Gap.Medium,
		playButtonHeight = if fFlagLuaAppUnifyPlayButtonTile and (not fFlagLuaAppUnifyPlayButtonTileIxp or var2) then p4.Size.Size_1000 else p4.Size.Size_900
	} else {
		paddingAboveMetadata = 0,
		footerTopPadding = p1.Size.Size_300,
		titleHeight = (p3 or 1) * (p1.Size.Size_500 + (p2 or 0)),
		metadataHeight = (p6 or 1) * (p1.Size.Size_500 + (p2 or 0)),
		footerBottomPadding = p1.Size.Size_300,
		playButtonHeight = if fFlagLuaAppUnifyPlayButtonTile and (not fFlagLuaAppUnifyPlayButtonTileIxp or var2) then p1.Size.Size_1000 else p1.Size.Size_900
	}
end)

return {
	getTileHeight = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
		-- upvalues: var1 (ref)
		local var2 = p2 * (if p3 == "Wide" or p3 == "Event" then 0.5625 else 1)
		local var3 = var1(p1, p7, p9, p11, p12, p10)
		local footerTopPadding = var3.footerTopPadding
		
		if not p6 then
			footerTopPadding += var3.titleHeight
		end
		if not p5 then
			footerTopPadding += var3.paddingAboveMetadata + var3.metadataHeight
		end
		if p4 then
			footerTopPadding += var3.footerBottomPadding
		end
		if p8 then
			footerTopPadding += p8
		end
		return var2 + footerTopPadding
	end,
	getFooterHeight = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
		-- upvalues: var1 (ref)
		local var2 = var1(p1, p5, p7, p8, p9, p10)
		local footerTopPadding = var2.footerTopPadding
		
		if not p4 then
			footerTopPadding += var2.titleHeight
		end
		if not p3 then
			footerTopPadding += var2.paddingAboveMetadata + var2.metadataHeight
		end
		if p2 then
			footerTopPadding += var2.footerBottomPadding
		end
		if p6 then
			footerTopPadding += p6
		end
		return footerTopPadding
	end,
	getImageAspectRatio = function(p1)
		return if p1 == "Wide" or p1 == "Event" then 1.777777777778 else 1
	end,
	getInverseImageAspectRatio = function(p1)
		return if p1 == "Wide" or p1 == "Event" then 0.5625 else 1
	end,
	getElementSizes = var1,
	getContainmentSidePadding = function(p1, p2, p3)
		-- upvalues: fFlagLuaAppMigrateGameTileFooterValueFixes (ref)
		return if p3 then if p2 == "Wide" or p2 == "Event" then if fFlagLuaAppMigrateGameTileFooterValueFixes then p3.Padding.Medium else p3.Padding.Large elseif fFlagLuaAppMigrateGameTileFooterValueFixes then p3.Size.Size_150 else p3.Padding.Small elseif p2 == "Wide" or p2 == "Event" then p1.Size.Size_300 else p1.Size.Size_150
	end
}