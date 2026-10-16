local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local _ = require(Parent.Style)
local _ = require(Parent.Foundation)
local _ = require(GameTile.GameTileTypes)
local FFlagLuaAppMigrateGameTileFooterValueFixes = require(Parent.SharedFlags).FFlagLuaAppMigrateGameTileFooterValueFixes
local FFlagLuaAppUnifyPlayButtonTile = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppUnifyPlayButtonTileIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp
local GameTileExperimentationModule = require(GameTile.GameTileExperimentation)
local MemoizeResult = require(Parent.AppCommonLib).memoize(function(p1, p2, p3, p4, p5, p6) --[[ Line: 75 ]]
	-- upvalues: FFlagLuaAppUnifyPlayButtonTileIxp (copy), GameTileExperimentationModule (copy), FFlagLuaAppUnifyPlayButtonTile (copy)
	local IsPlayButtonMigrationEnabled = if FFlagLuaAppUnifyPlayButtonTileIxp then GameTileExperimentationModule.getIsPlayButtonMigrationEnabled() else nil
	
	return if p4 and p5 then {
		paddingAboveMetadata = 0,
		footerTopPadding = p4.Gap.Medium,
		titleHeight = (p3 or 1) * (p4.Size.Size_500 + (p2 or 0)),
		metadataHeight = (p6 or 1) * (p4.Size.Size_500 + (p2 or 0)),
		footerBottomPadding = p4.Gap.Medium,
		playButtonHeight = if FFlagLuaAppUnifyPlayButtonTile and (not FFlagLuaAppUnifyPlayButtonTileIxp or IsPlayButtonMigrationEnabled) then p4.Size.Size_1000 else p4.Size.Size_900
	} else {
		paddingAboveMetadata = 0,
		footerTopPadding = p1.Size.Size_300,
		titleHeight = (p3 or 1) * (p1.Size.Size_500 + (p2 or 0)),
		metadataHeight = (p6 or 1) * (p1.Size.Size_500 + (p2 or 0)),
		footerBottomPadding = p1.Size.Size_300,
		playButtonHeight = if FFlagLuaAppUnifyPlayButtonTile and (not FFlagLuaAppUnifyPlayButtonTileIxp or IsPlayButtonMigrationEnabled) then p1.Size.Size_1000 else p1.Size.Size_900
	}
end)

return {
	getTileHeight = function(p1, p2, p3, p4, p5, p6, p7, Amount, p8, p9, p10, p11) --[[ Line: 151 ]]
		-- upvalues: MemoizeResult (copy)
		local v1 = p2 * (if p3 == "Wide" or p3 == "Event" then 0.5625 else 1)
		local MemoizeResultResult = MemoizeResult(p1, p7, p8, p10, p11, p9)
		local FooterTopPadding = MemoizeResultResult.footerTopPadding
		
		if not p6 then
			FooterTopPadding += MemoizeResultResult.titleHeight
		end
		if not p5 then
			FooterTopPadding += MemoizeResultResult.paddingAboveMetadata + MemoizeResultResult.metadataHeight
		end
		if p4 then
			FooterTopPadding += MemoizeResultResult.footerBottomPadding
		end
		if Amount then
			FooterTopPadding += Amount
		end
		return v1 + FooterTopPadding
	end,
	getFooterHeight = function(p1, p2, p3, p4, p5, Amount, p6, p7, p8, p9) --[[ Line: 114 ]]
		-- upvalues: MemoizeResult (copy)
		local MemoizeResultResult = MemoizeResult(p1, p5, p6, p7, p8, p9)
		local FooterTopPadding = MemoizeResultResult.footerTopPadding
		
		if not p4 then
			FooterTopPadding += MemoizeResultResult.titleHeight
		end
		if not p3 then
			FooterTopPadding += MemoizeResultResult.paddingAboveMetadata + MemoizeResultResult.metadataHeight
		end
		if p2 then
			FooterTopPadding += MemoizeResultResult.footerBottomPadding
		end
		if Amount then
			FooterTopPadding += Amount
		end
		return FooterTopPadding
	end,
	getImageAspectRatio = function(p1): number --[[ Line: 25 ]]
		return if p1 == "Wide" or p1 == "Event" then 1.7777777777777777 else 1
	end,
	getInverseImageAspectRatio = function(p1): number --[[ Line: 33 ]]
		return if p1 == "Wide" or p1 == "Event" then 0.5625 else 1
	end,
	getElementSizes = MemoizeResult,
	getContainmentSidePadding = function(p1, p2, p3) --[[ Line: 41 ]]
		-- upvalues: FFlagLuaAppMigrateGameTileFooterValueFixes (copy)
		return if p3 then if p2 == "Wide" or p2 == "Event" then if FFlagLuaAppMigrateGameTileFooterValueFixes then p3.Padding.Medium else p3.Padding.Large elseif FFlagLuaAppMigrateGameTileFooterValueFixes then p3.Size.Size_150 else p3.Padding.Small elseif p2 == "Wide" or p2 == "Event" then p1.Size.Size_300 else p1.Size.Size_150
	end
}