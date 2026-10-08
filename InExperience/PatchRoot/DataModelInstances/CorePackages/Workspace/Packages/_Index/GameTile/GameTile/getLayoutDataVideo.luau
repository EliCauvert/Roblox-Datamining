local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local _ = require(gameTile.GameTileTypes)
local fFlagLuaAppHomeMomentVideoPrecedence = require(parent.SharedFlags).FFlagLuaAppHomeMomentVideoPrecedence
local fFlagLuaAppDiscoveryMomentVideoTelemetry = require(parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry

local function _(p1)
	return type(p1) == "string" and p1 ~= ""
end

local _ = function(p1)
	-- upvalues: fFlagLuaAppDiscoveryMomentVideoTelemetry (ref)
	local momentVideoAssetId = p1.momentVideoAssetId
	
	if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then
		momentVideoAssetId = p1.momentVideoAssetAccessContext
		
		return if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then {
			assetId = p1.momentVideoAssetId,
			accessContext = p1.momentVideoAssetAccessContext,
			isMoment = if fFlagLuaAppDiscoveryMomentVideoTelemetry then true else nil
		} else nil
	end
end

return function(p1, p2)
	-- upvalues: fFlagLuaAppHomeMomentVideoPrecedence (ref), fFlagLuaAppDiscoveryMomentVideoTelemetry (ref)
	local momentVideoAssetId
	local primaryMediaAsset = p1 and p1.primaryMediaAsset
	
	if fFlagLuaAppHomeMomentVideoPrecedence then
		local var1
		if primaryMediaAsset then
			momentVideoAssetId = primaryMediaAsset.momentVideoAssetId
			
			if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then
				momentVideoAssetId = primaryMediaAsset.momentVideoAssetAccessContext
				var1 = if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then {
					assetId = primaryMediaAsset.momentVideoAssetId,
					accessContext = primaryMediaAsset.momentVideoAssetAccessContext,
					isMoment = if fFlagLuaAppDiscoveryMomentVideoTelemetry then true else nil
				} else nil
			end
		else
			var1 = nil
		end
		if var1 then
			return var1
		elseif p2 then
			return { assetId = p2 }
		elseif not primaryMediaAsset then
			return nil
		elseif primaryMediaAsset.wideVideoAssetId then
			return { assetId = primaryMediaAsset.wideVideoAssetId }
		elseif fFlagLuaAppHomeMomentVideoPrecedence then
			return nil
		end
		momentVideoAssetId = primaryMediaAsset.momentVideoAssetId
		
		if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then
			momentVideoAssetId = primaryMediaAsset.momentVideoAssetAccessContext
			
			return if type(momentVideoAssetId) == "string" and momentVideoAssetId ~= "" then {
				assetId = primaryMediaAsset.momentVideoAssetId,
				accessContext = primaryMediaAsset.momentVideoAssetAccessContext,
				isMoment = if fFlagLuaAppDiscoveryMomentVideoTelemetry then true else nil
			} else nil
		end
	end
end