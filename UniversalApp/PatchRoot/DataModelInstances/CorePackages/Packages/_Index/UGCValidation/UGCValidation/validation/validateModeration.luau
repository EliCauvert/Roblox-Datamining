local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local getAssetCreationDetailsModule = require(parent.util.getAssetCreationDetails)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)

local function validateUser(p1, p2, p3)
	if not p1 or #p1 == 0 then
		return true
	end
	local t = {}
	
	for i, v in ipairs(p1) do
		t[tonumber(v.id)] = true
	end
	for i, v_1 in ipairs(p2) do
		if not t[tonumber(v_1.creatorTargetId)] then
			local assetId = p3[tostring(v_1.assetId)]
			assert(assetId)
			
			return false, {
				string.format("Failed to validate current user owns %s.%s ( %s ). Make sure you own the assets being validated and try again.", assetId.instance:GetFullName(), assetId.fieldName, tostring(v_1.assetId))
			}
		end
	end
	return true
end

return function(p4, p5, p6)
	-- upvalues: parseContentIdsModule (ref), analyticsModule (ref), getAssetCreationDetailsModule (ref), validateUser (ref), constantsModule (ref)
	if p6.isServer or p6.allowUnreviewedAssets then
		return true
	end
	local t = {}
	local t_1 = {}
	local var1, var2 = parseContentIdsModule.parseWithErrorCheck(t_1, t, p4, nil, nil, p6)
	
	if not var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_FailedToParse, nil, p6)
		
		return false, var2
	end
	local t_2 = {}
	local var3, var4 = getAssetCreationDetailsModule(t_1)
	
	if not var3 or #var4 ~= #t_1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_CouldNotFetchModerationDetails, nil, p6)
		
		return false, {
			string.format("Failed to fetch moderation results for %s. Make sure all assets are owned by the current user.", p4:GetFullName())
		}
	end
	local var5, var6 = validateUser(p5, var4, t)
	
	if not var5 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_ValidateUser, nil, p6)
		
		return var5, var6
	end
	for i, v in pairs(var4) do
		if v.status == constantsModule.ASSET_STATUS.UNKNOWN or v.status == constantsModule.ASSET_STATUS.REVIEW_PENDING or v.status == constantsModule.ASSET_STATUS.MODERATED then
			table.insert(t_2, v.assetId)
		end
	end
	if #t_2 <= 0 then
		return true
	end
	local t_3 = {}
	
	for v, v_1 in pairs(t_2) do
		local var7 = t[v_1]
		
		if var7 then
			t_3[v] = string.format("%s.%s ( %s )", var7.instance:GetFullName(), var7.fieldName, v_1)
		else
			t_3[v] = v_1
		end
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateModeration_AssetsHaveNotPassedModeration, nil, p6)
	
	return false, { "Asset(s) failed to pass moderation:", unpack(t_3) }
end