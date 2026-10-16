local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local _ = require(GameTile.GameTileTypes)
local FFlagLuaAppHomeMomentVideoPrecedence = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoPrecedence
local FFlagLuaAppDiscoveryMomentVideoTelemetry = require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry

local function _(p1): boolean --[[ Line: 17 | Named "isNonEmptyString" ]]
	return type(p1) == "string" and p1 ~= ""
end

local _ = function(p1) --[[ Line: 21 | Named "getMomentVideo" ]]
	-- upvalues: FFlagLuaAppDiscoveryMomentVideoTelemetry (copy)
	local MomentVideoAssetId = p1.momentVideoAssetId
	
	if type(MomentVideoAssetId) == "string" and MomentVideoAssetId ~= "" then
		local MomentVideoAssetAccessContext = p1.momentVideoAssetAccessContext
		
		if type(MomentVideoAssetAccessContext) == "string" and MomentVideoAssetAccessContext ~= "" then
			return {
				assetId = p1.momentVideoAssetId,
				accessContext = p1.momentVideoAssetAccessContext,
				isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then true else nil
			}
		end
	end
	return nil
end

return function(p1, AssetId) --[[ Line: 38 | Named "getLayoutDataVideo" ]]
	-- upvalues: FFlagLuaAppHomeMomentVideoPrecedence (copy), FFlagLuaAppDiscoveryMomentVideoTelemetry (copy)
	local PrimaryMediaAsset = p1 and p1.primaryMediaAsset
	local v1 = nil
	
	if FFlagLuaAppHomeMomentVideoPrecedence then
		repeat
			if PrimaryMediaAsset then
				local MomentVideoAssetId = PrimaryMediaAsset.momentVideoAssetId
				
				if type(MomentVideoAssetId) == "string" and MomentVideoAssetId ~= "" then
					local MomentVideoAssetAccessContext = PrimaryMediaAsset.momentVideoAssetAccessContext
					
					if type(MomentVideoAssetAccessContext) == "string" and MomentVideoAssetAccessContext ~= "" then
						v1 = {
							assetId = PrimaryMediaAsset.momentVideoAssetId,
							accessContext = PrimaryMediaAsset.momentVideoAssetAccessContext,
							isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then true else nil
						}
						break
					end
				end
				v1 = nil
				break
			end
			v1 = nil
		until true
		if v1 then
			return v1
		end
	end
	if AssetId then
		return { assetId = AssetId }
	end
	if not PrimaryMediaAsset then
		return nil
	end
	if PrimaryMediaAsset.wideVideoAssetId then
		return { assetId = PrimaryMediaAsset.wideVideoAssetId }
	end
	if FFlagLuaAppHomeMomentVideoPrecedence then
		return nil
	end
	local MomentVideoAssetId = PrimaryMediaAsset.momentVideoAssetId
	
	if type(MomentVideoAssetId) == "string" and MomentVideoAssetId ~= "" then
		local MomentVideoAssetAccessContext = PrimaryMediaAsset.momentVideoAssetAccessContext
		
		if type(MomentVideoAssetAccessContext) == "string" and MomentVideoAssetAccessContext ~= "" then
			return {
				assetId = PrimaryMediaAsset.momentVideoAssetId,
				accessContext = PrimaryMediaAsset.momentVideoAssetAccessContext,
				isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then true else nil
			}
		end
	end
	return nil
end