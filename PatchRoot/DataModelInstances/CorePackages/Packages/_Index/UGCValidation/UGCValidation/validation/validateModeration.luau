-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local getAssetCreationDetailsModule = require(parent.util.getAssetCreationDetails)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)

local function validateUser(p0, p1, p2) --[[ line: 11 ]]
	if not p0 or #p0 == 0 then
		return true
	end
	local t = {}
	
	for i, v in ipairs(p0) do
		t[tonumber(v.id)] = true
	end
	for i, v_1 in ipairs(p1) do
		if not t[tonumber(v_1.creatorTargetId)] then
			local assetId = p2[tostring(v_1.assetId)]
			assert(assetId)
			
			return false, {
				string.format("Failed to validate current user owns %s.%s ( %s ). Make sure you own the assets being validated and try again.", assetId.instance:GetFullName(), assetId.fieldName, tostring(v_1.assetId))
			}
		end
	end
	return true
end

return function(p3, p4, p5) --[[ line: 45 | named "validateModeration" ]]
	-- upvalues: parseContentIdsModule (ref), analyticsModule (ref), getAssetCreationDetailsModule (ref), validateUser (ref), constantsModule (ref)
	if p5.isServer or p5.allowUnreviewedAssets then
		return true
	end
	local t = {}
	local t_1 = {}
	local var8, var9 = parseContentIdsModule.parseWithErrorCheck(t_1, t, p3, nil, nil, p5)
	
	if not var8 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_FailedToParse, nil, p5)
		
		return false, var9
	end
	local t_2 = {}
	local var11, var12 = getAssetCreationDetailsModule(t_1)
	
	if not var11 or #var12 ~= #t_1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_CouldNotFetchModerationDetails, nil, p5)
		
		return false, {
			string.format("Failed to fetch moderation results for %s. Make sure all assets are owned by the current user.", p3:GetFullName())
		}
	end
	local var13, var14 = validateUser(p4, var12, t)
	
	if not var13 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_ValidateUser, nil, p5)
		
		return var13, var14
	end
	for i, v in pairs(var12) do
		if v.status == constantsModule.ASSET_STATUS.UNKNOWN or v.status == constantsModule.ASSET_STATUS.REVIEW_PENDING or v.status == constantsModule.ASSET_STATUS.MODERATED then
			table.insert(t_2, v.assetId)
		end
	end
	if #t_2 <= 0 then
		return true
	end
	local t_3 = {}
	
	for v, v_1 in pairs(t_2) do
		local var16 = t[v_1]
		
		if var16 then
			t_3[v] = string.format("%s.%s ( %s )", var16.instance:GetFullName(), var16.fieldName, v_1)
		else
			t_3[v] = v_1
		end
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_AssetsHaveNotPassedModeration, nil, p5)
	
	return false, { "Asset(s) failed to pass moderation:", unpack(t_3) }
end