local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local reactModule = require(parent.React)
local mutedError = require(parent.Loggers).mutedError
local videoActions = require(parent.VideoUtils).AnalyticsEnums.VideoActions
local videoLogger = require(parent.VideoUtils).VideoLogger
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local _ = require(gameTile.GameTileTypes)
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local getLayoutDataVideoModule = require(gameTile.getLayoutDataVideo)
local discoveryAnalyticsModule = require(gameTile.Parent.DiscoveryAnalytics)
local discoveryVideoEndEvent = discoveryAnalyticsModule.Events.discoveryVideoEndEvent
local discoveryVideoLoadEvent = discoveryAnalyticsModule.Events.discoveryVideoLoadEvent
local discoveryVideoLoopEvent = discoveryAnalyticsModule.Events.discoveryVideoLoopEvent
local discoveryVideoPlayEvent = discoveryAnalyticsModule.Events.discoveryVideoPlayEvent
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppBroadenVideoAnalytics = require(parent.SharedFlags).FFlagLuaAppBroadenVideoAnalytics
local fFlagLuaAppHomeMomentVideoFallback = require(parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local fFlagLuaAppDiscoveryMomentVideoTelemetry = require(parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry
local omniRecommendationsContentType = discoveryTypesModule.OmniRecommendationsContentType

local function _(p1, p2)
	return if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
end

local _ = function(value, p1)
	-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (ref), getGameTileLayoutDataModule (ref), fFlagLuaAppHomeMomentVideoFallback (ref), getLayoutDataVideoModule (ref)
	if value and value.primaryWideVideoAssetId then
		return value.primaryWideVideoAssetId
	elseif fFlagLuaAppEnableHomepageOneByTwoTile and value and value.primaryVideoAssetId then
		return value.primaryVideoAssetId
	end
	local var1 = getGameTileLayoutDataModule(value, p1)
	
	if fFlagLuaAppHomeMomentVideoFallback then
		local var2 = getLayoutDataVideoModule(var1)
		
		return var2 and var2.assetId
	end
	return var1 and (var1.primaryMediaAsset and var1.primaryMediaAsset.wideVideoAssetId)
end

local _ = function(value, p1)
	-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (ref), getGameTileLayoutDataModule (ref), getLayoutDataVideoModule (ref)
	if fFlagLuaAppEnableHomepageOneByTwoTile and value and value.primaryVideoAssetId then
		return value.primaryVideoAssetId, false
	end
	local var1 = getLayoutDataVideoModule(getGameTileLayoutDataModule(value, p1), value and value.primaryWideVideoAssetId)
	
	return var1 and var1.assetId, var1 ~= nil and var1.isMoment == true
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), mutedError (ref), fFlagLuaAppDiscoveryMomentVideoTelemetry (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), getGameTileLayoutDataModule (ref), getLayoutDataVideoModule (ref), fFlagLuaAppHomeMomentVideoFallback (ref), discoveryVideoPlayEvent (ref), fFlagLuaAppBroadenVideoAnalytics (ref), omniRecommendationsContentType (ref), discoveryEventErrorLogger (ref), discoveryVideoLoadEvent (ref), videoLogger (ref), videoActions (ref), discoveryVideoLoopEvent (ref), discoveryVideoEndEvent (ref), fFlagLuaAppHomeReduceRenders (ref)
	local var1 = if p1 ~= nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
	local var2 = reactModule.useCallback(function(_, _)
		-- upvalues: p5 (ref), mutedError (copy), fFlagLuaAppDiscoveryMomentVideoTelemetry (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), getLayoutDataVideoModule (copy), fFlagLuaAppHomeMomentVideoFallback (copy), discoveryVideoPlayEvent (copy), p3 (ref), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 29
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end, { p3, p5, var1, p4 })
	local var3 = reactModule.useCallback(function(_, _, _, _)
		-- upvalues: p5 (ref), mutedError (copy), fFlagLuaAppDiscoveryMomentVideoTelemetry (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), getLayoutDataVideoModule (copy), fFlagLuaAppHomeMomentVideoFallback (copy), omniRecommendationsContentType (copy), discoveryEventErrorLogger (copy), p3 (ref), discoveryVideoLoadEvent (copy), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy), videoLogger (copy), videoActions (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 53
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end, { p3, p5, var1, p4 })
	local var4 = reactModule.useCallback(function(_, _)
		-- upvalues: p5 (ref), mutedError (copy), fFlagLuaAppDiscoveryMomentVideoTelemetry (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), getLayoutDataVideoModule (copy), fFlagLuaAppHomeMomentVideoFallback (copy), discoveryVideoLoopEvent (copy), p3 (ref), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 83
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end, { p3, p5, var1, p4 })
	local var5 = reactModule.useCallback(function(_, _, _, _, _)
		-- upvalues: p5 (ref), mutedError (copy), fFlagLuaAppDiscoveryMomentVideoTelemetry (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), getLayoutDataVideoModule (copy), fFlagLuaAppHomeMomentVideoFallback (copy), discoveryVideoEndEvent (copy), p3 (ref), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 107
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end, { p3, p5, var1, p4 })
	
	return if fFlagLuaAppHomeReduceRenders then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref), var4 (ref), var5 (ref)
		return {
			reportVideoPlay = var2,
			reportVideoLoad = var3,
			reportVideoLoop = var4,
			reportVideoEnd = var5
		}
	end, { var2, var3, var4, var5 }) else {
		reportVideoPlay = var2,
		reportVideoLoad = var3,
		reportVideoLoop = var4,
		reportVideoEnd = var5
	}
end