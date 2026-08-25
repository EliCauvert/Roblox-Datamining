local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50)
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500)
local analyticsModule = require(parent.Analytics)
local APIUtilModule = require(parent.util.APIUtil)
local _ = require(parent.util.Types)
local httpService = game:GetService("HttpService")
local formattedText = string.format("https://apis.%s", APIUtilModule.getBaseDomain())
local UGCValidationCanPublishRequestPageSizeFastInt = game:GetFastInt("UGCValidationCanPublishRequestPageSize")
local UGCValidationMaxAssetSizeAllowedFastInt = game:GetFastInt("UGCValidationMaxAssetSizeAllowed")
local constantsModule = require(parent.Constants)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getFStringUGCValidationReferenceMeshIdWhitelistForIECModule = require(parent.flags.getFStringUGCValidationReferenceMeshIdWhitelistForIEC)

local function getWhitelistIds()
	-- upvalues: getFStringUGCValidationReferenceMeshIdWhitelistForIECModule (ref)
	local t = {}
	local var12 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule()
	
	if #var12 == 0 then
		return t
	end
	for i in string.gmatch(var12, "([^,%s]+)") do
		t[i] = true
	end
	return t
end

local function _(p0, p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), httpService (ref), constantsModule (ref)
	return if #p1 == 0 then promiseModule.resolve() else promiseModule.new(function(p5, p6)
		-- upvalues: httpService (copy), p1 (ref), p2 (ref), p4 (ref), p0 (ref), constantsModule (copy), p3 (ref)
		httpService:RequestInternal({
			Method = "POST",
			Url = p0,
			Body = httpService:JSONEncode({ assetIds = p1, restrictedEntities = p2, universeId = p4 }),
			Headers = {
				[constantsModule.ExperienceAuthHeaderKey] = p3,
				[constantsModule.ContentType] = constantsModule.ApplicationJson
			}
		}):Start(function(p7, p8)
			-- upvalues: httpService (copy), p5 (ref), p6 (ref)
			if p7 and p8.StatusCode == 200 then
				p5(httpService:JSONDecode(p8.Body))
				
				return
			end
			p6()
		end)
	end)
end

return function(value, p9)
	-- upvalues: formattedText (ref), failureReasonsAccumulatorModule (ref), UGCValidationMaxAssetSizeAllowedFastInt (ref), analyticsModule (ref), UGCValidationCanPublishRequestPageSizeFastInt (ref), promiseModule (ref), httpService (ref), constantsModule (ref), getFStringUGCValidationReferenceMeshIdWhitelistForIECModule (ref), getWhitelistIds (ref)
	local isServer = p9.isServer
	local var13 = if p9.restrictedUserIds then p9.restrictedUserIds else {}
	local token = p9.token
	local universeId = p9.universeId
	local text = formattedText .. (if isServer then "packages-api/v1/rcc/canPublish" else "packages-api/v1/canPublish")
	local t = { User = {}, Group = {} }
	local var16 = failureReasonsAccumulatorModule.new()
	local t_1 = {}
	local t_2 = {}
	local var19 = 0
	
	for i, v in ipairs(var13) do
		t[v.creatorType][tonumber(v.id)] = true
	end
	for i_1, v_1 in value do
		if not t_1[i_1] then
			var19 += 1
			t_1[i_1] = true
		end
	end
	if UGCValidationMaxAssetSizeAllowedFastInt < var19 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetCreator_TooManyDependencies, nil, p9)
		
		return false, {
			"Upload of model has too many children assets (Meshes, Textures, etc.) and cannot be processed as is. You need to rearrange the model."
		}
	end
	local t_3 = {}
	
	for i_2, v_2 in t_1 do
		table.insert(t_3, i_2)
		
		if UGCValidationCanPublishRequestPageSizeFastInt <= #t_3 then
			table.insert(t_2, if #t_3 == 0 then promiseModule.resolve() else promiseModule.new(function(p10, p11)
				-- upvalues: httpService (copy), t_3 (ref), var13 (ref), universeId (ref), text (ref), constantsModule (copy), token (ref)
				httpService:RequestInternal({
					Method = "POST",
					Url = text,
					Body = httpService:JSONEncode({
						assetIds = t_3,
						restrictedEntities = var13,
						universeId = universeId
					}),
					Headers = {
						[constantsModule.ExperienceAuthHeaderKey] = token,
						[constantsModule.ContentType] = constantsModule.ApplicationJson
					}
				}):Start(function(p12, p13)
					-- upvalues: httpService (copy), p10 (ref), p11 (ref)
					if p12 and p13.StatusCode == 200 then
						p10(httpService:JSONDecode(p13.Body))
						
						return
					end
					p11()
				end)
			end))
			t_3 = {}
		end
	end
	if #t_3 > 0 then
		table.insert(t_2, if #t_3 == 0 then promiseModule.resolve() else promiseModule.new(function(p14, p15)
			-- upvalues: httpService (copy), t_3 (ref), var13 (ref), universeId (ref), text (ref), constantsModule (copy), token (ref)
			httpService:RequestInternal({
				Method = "POST",
				Url = text,
				Body = httpService:JSONEncode({
					assetIds = t_3,
					restrictedEntities = var13,
					universeId = universeId
				}),
				Headers = {
					[constantsModule.ExperienceAuthHeaderKey] = token,
					[constantsModule.ContentType] = constantsModule.ApplicationJson
				}
			}):Start(function(p16, p17)
				-- upvalues: httpService (copy), p14 (ref), p15 (ref)
				if p16 and p17.StatusCode == 200 then
					p14(httpService:JSONDecode(p17.Body))
					
					return
				end
				p15()
			end)
		end))
	end
	local var21, var22 = promiseModule.all(t_2):await()
	
	if not var21 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetCreator_FailedToLoad, nil, p9)
		
		return false, {
			"Failed to load detailed information for model assets. Make sure all model assets exist and try again."
		}
	end
	local var23 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule() ~= ""
	local var24 = if var23 then getWhitelistIds() else {}
	
	for i_3, v_3 in var22 do
		for i_4, v_4 in pairs(v_3.result) do
			local var25 = v_4
			
			if var23 then
				var25 = v_4 or var24[i_4]
			end
			if not var25 then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator, nil, p9)
			end
			local var26 = value[i_4]
			var16:updateReasons(var25, {
				string.format("%s.%s ( %s ) being used is not owned by the experience creator or player. You can only publish assets that you own.", var26.instance:GetFullName(), var26.fieldName, i_4)
			})
		end
	end
	return var16:getFinalResults()
end