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
	local var1 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule()
	
	if #var1 == 0 then
		return t
	end
	for i in string.gmatch(var1, "([^,%s]+)") do
		t[i] = true
	end
	return t
end

local function _(p1, p2, p3, p4, p5)
	-- upvalues: promiseModule (ref), httpService (ref), constantsModule (ref)
	return if #p2 == 0 then promiseModule.resolve() else promiseModule.new(function(p6, p7)
		-- upvalues: httpService (copy), p2 (ref), p3 (ref), p5 (ref), p1 (ref), constantsModule (copy), p4 (ref)
		httpService:RequestInternal({
			Method = "POST",
			Url = p1,
			Body = httpService:JSONEncode({ assetIds = p2, restrictedEntities = p3, universeId = p5 }),
			Headers = {
				[constantsModule.ExperienceAuthHeaderKey] = p4,
				[constantsModule.ContentType] = constantsModule.ApplicationJson
			}
		}):Start(function(p8, p9)
			-- upvalues: httpService (copy), p6 (ref), p7 (ref)
			if p8 and p9.StatusCode == 200 then
				p6(httpService:JSONDecode(p9.Body))
				
				return
			end
			p7()
		end)
	end)
end

return function(value, p1)
	-- upvalues: formattedText (ref), failureReasonsAccumulatorModule (ref), UGCValidationMaxAssetSizeAllowedFastInt (ref), analyticsModule (ref), UGCValidationCanPublishRequestPageSizeFastInt (ref), promiseModule (ref), httpService (ref), constantsModule (ref), getFStringUGCValidationReferenceMeshIdWhitelistForIECModule (ref), getWhitelistIds (ref)
	local isServer = p1.isServer
	local var2 = if p1.restrictedUserIds then p1.restrictedUserIds else {}
	local token = p1.token
	local universeId = p1.universeId
	local text = formattedText .. (if isServer then "packages-api/v1/rcc/canPublish" else "packages-api/v1/canPublish")
	local t = { User = {}, Group = {} }
	local var3 = failureReasonsAccumulatorModule.new()
	local t_1 = {}
	local t_2 = {}
	local var4 = 0
	
	for i, v in ipairs(var2) do
		t[v.creatorType][tonumber(v.id)] = true
	end
	for i_1, v_1 in value do
		if not t_1[i_1] then
			var4 += 1
			t_1[i_1] = true
		end
	end
	if UGCValidationMaxAssetSizeAllowedFastInt < var4 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetCreator_TooManyDependencies, nil, p1)
		
		return false, {
			"Upload of model has too many children assets (Meshes, Textures, etc.) and cannot be processed as is. You need to rearrange the model."
		}
	end
	local t_3 = {}
	
	for i_2, v_2 in t_1 do
		table.insert(t_3, i_2)
		
		if UGCValidationCanPublishRequestPageSizeFastInt <= #t_3 then
			table.insert(t_2, if #t_3 == 0 then promiseModule.resolve() else promiseModule.new(function(p2, p3)
				-- upvalues: httpService (copy), t_3 (ref), var2 (ref), universeId (ref), text (ref), constantsModule (copy), token (ref)
				httpService:RequestInternal({
					Method = "POST",
					Url = text,
					Body = httpService:JSONEncode({
						assetIds = t_3,
						restrictedEntities = var2,
						universeId = universeId
					}),
					Headers = {
						[constantsModule.ExperienceAuthHeaderKey] = token,
						[constantsModule.ContentType] = constantsModule.ApplicationJson
					}
				}):Start(function(p4, p5)
					-- upvalues: httpService (copy), p2 (ref), p3 (ref)
					if p4 and p5.StatusCode == 200 then
						p2(httpService:JSONDecode(p5.Body))
						
						return
					end
					p3()
				end)
			end))
			t_3 = {}
		end
	end
	if #t_3 > 0 then
		table.insert(t_2, if #t_3 == 0 then promiseModule.resolve() else promiseModule.new(function(p2, p3)
			-- upvalues: httpService (copy), t_3 (ref), var2 (ref), universeId (ref), text (ref), constantsModule (copy), token (ref)
			httpService:RequestInternal({
				Method = "POST",
				Url = text,
				Body = httpService:JSONEncode({
					assetIds = t_3,
					restrictedEntities = var2,
					universeId = universeId
				}),
				Headers = {
					[constantsModule.ExperienceAuthHeaderKey] = token,
					[constantsModule.ContentType] = constantsModule.ApplicationJson
				}
			}):Start(function(p4, p5)
				-- upvalues: httpService (copy), p2 (ref), p3 (ref)
				if p4 and p5.StatusCode == 200 then
					p2(httpService:JSONDecode(p5.Body))
					
					return
				end
				p3()
			end)
		end))
	end
	local var5, var6 = promiseModule.all(t_2):await()
	
	if not var5 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetCreator_FailedToLoad, nil, p1)
		
		return false, {
			"Failed to load detailed information for model assets. Make sure all model assets exist and try again."
		}
	end
	local var7 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule() ~= ""
	local var8 = if var7 then getWhitelistIds() else {}
	
	for i_3, v_3 in var6 do
		for i_4, v_4 in pairs(v_3.result) do
			local var9 = v_4
			
			if var7 then
				var9 = v_4 or var8[i_4]
			end
			if not var9 then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateAssetCreator_DependencyNotOwnedByCreator, nil, p1)
			end
			local var10 = value[i_4]
			var3:updateReasons(var9, {
				string.format("%s.%s ( %s ) being used is not owned by the experience creator or player. You can only publish assets that you own.", var10.instance:GetFullName(), var10.fieldName, i_4)
			})
		end
	end
	return var3:getFinalResults()
end