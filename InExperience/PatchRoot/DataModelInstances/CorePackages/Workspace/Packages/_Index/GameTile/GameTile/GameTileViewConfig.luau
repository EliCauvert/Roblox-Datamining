local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local _ = require(parent.Style)
local _ = require(parent.Foundation)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local memoize = require(parent.AppCommonLib).memoize
local _ = require(gameTile.GameTileTypes)
local fFlagLuaAppMigrateGameTileFooterValueFixes = require(parent.SharedFlags).FFlagLuaAppMigrateGameTileFooterValueFixes
local fFlagLuaAppUnifyPlayButtonTile = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local fFlagLuaAppUnifyPlayButtonTileIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp
local gameTileExperimentationModule = require(gameTile.GameTileExperimentation)
local var2 = memoize(function(p0, p1, p2, p3, p4, p5) --[[ line: 77 ]]
	-- upvalues: fFlagLuaAppUnifyPlayButtonTileIxp (ref), gameTileExperimentationModule (ref), fFlagLuaAppUnifyPlayButtonTile (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var3 = if fFlagLuaAppUnifyPlayButtonTileIxp then gameTileExperimentationModule.getIsPlayButtonMigrationEnabled() else nil
	
	return if p3 and p4 then {
		paddingAboveMetadata = 0,
		footerTopPadding = p3.Gap.Medium,
		titleHeight = (p2 or 1) * (p3.Size.Size_500 + (p1 or 0)),
		metadataHeight = (p5 or 1) * (p3.Size.Size_500 + (p1 or 0)),
		footerBottomPadding = p3.Gap.Medium,
		playButtonHeight = if fFlagLuaAppUnifyPlayButtonTile and (not fFlagLuaAppUnifyPlayButtonTileIxp or var3) then p3.Size.Size_1000 else p3.Size.Size_900
	} else {
		paddingAboveMetadata = 0,
		footerTopPadding = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_300 else p0.Global.Space_150,
		titleHeight = (p2 or 1) * ((if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_500 else p0.Global.Space_250) + (p1 or 0)),
		metadataHeight = (p5 or 1) * ((if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_500 else p0.Global.Space_250) + (p1 or 0)),
		footerBottomPadding = if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_300 else p0.Global.Space_150,
		playButtonHeight = if fFlagLuaAppUnifyPlayButtonTile and (not fFlagLuaAppUnifyPlayButtonTileIxp or var3) then if fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_1000 else p0.Global.Size_500 elseif fFlagRenameDeprecatedUIBloxTokens then p0.Size.Size_900 else p0.Global.Size_450
	}
end)

return {
	getTileHeight = function(p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17) --[[ line: 161 ]]
		-- upvalues: var2 (ref)
		local var4 = p7 * (if p8 == "Wide" or p8 == "Event" then 0.5625 else 1)
		local var5 = var2(p6, p12, p14, p16, p17, p15)
		local footerTopPadding = var5.footerTopPadding
		
		if not p11 then
			footerTopPadding += var5.titleHeight
		end
		if not p10 then
			footerTopPadding += var5.paddingAboveMetadata + var5.metadataHeight
		end
		if p9 then
			footerTopPadding += var5.footerBottomPadding
		end
		if p13 then
			footerTopPadding += p13
		end
		return var4 + footerTopPadding
	end,
	getFooterHeight = function(p18, p19, p20, p21, p22, p23, p24, p25, p26, p27) --[[ line: 124 ]]
		-- upvalues: var2 (ref)
		local var6 = var2(p18, p22, p24, p25, p26, p27)
		local footerTopPadding = var6.footerTopPadding
		
		if not p21 then
			footerTopPadding += var6.titleHeight
		end
		if not p20 then
			footerTopPadding += var6.paddingAboveMetadata + var6.metadataHeight
		end
		if p19 then
			footerTopPadding += var6.footerBottomPadding
		end
		if p23 then
			footerTopPadding += p23
		end
		return footerTopPadding
	end,
	getImageAspectRatio = function(p28) --[[ line: 27 ]]
		return if p28 == "Wide" or p28 == "Event" then 1.777777777778 else 1
	end,
	getInverseImageAspectRatio = function(p29) --[[ line: 35 ]]
		return if p29 == "Wide" or p29 == "Event" then 0.5625 else 1
	end,
	getElementSizes = var2,
	getContainmentSidePadding = function(p30, p31, p32) --[[ line: 43 ]]
		-- upvalues: fFlagLuaAppMigrateGameTileFooterValueFixes (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
		return if p32 then if p31 == "Wide" or p31 == "Event" then if fFlagLuaAppMigrateGameTileFooterValueFixes then p32.Padding.Medium else p32.Padding.Large elseif fFlagLuaAppMigrateGameTileFooterValueFixes then p32.Size.Size_150 else p32.Padding.Small elseif p31 == "Wide" or p31 == "Event" then if fFlagRenameDeprecatedUIBloxTokens then p30.Size.Size_300 else p30.Global.Space_150 elseif fFlagRenameDeprecatedUIBloxTokens then p30.Size.Size_150 else p30.Global.Space_75
	end
}