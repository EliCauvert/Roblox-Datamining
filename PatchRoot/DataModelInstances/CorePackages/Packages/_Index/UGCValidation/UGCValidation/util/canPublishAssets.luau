-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
game:DefineFastInt("UGCValidationCanPublishRequestPageSize", 50)
game:DefineFastInt("UGCValidationMaxAssetSizeAllowed", 500)
local APIUtilModule = require(parent.util.APIUtil)
local constantsModule = require(parent.Constants)
local getFStringUGCValidationReferenceMeshIdWhitelistForIECModule = require(parent.flags.getFStringUGCValidationReferenceMeshIdWhitelistForIEC)
local _ = require(parent.util.Types)
local httpService = game:GetService("HttpService")
local formattedText = string.format("https://apis.%s", APIUtilModule.getBaseDomain())

local function getWhitelistIds() --[[ line: 35 ]]
	-- upvalues: getFStringUGCValidationReferenceMeshIdWhitelistForIECModule (ref)
	local t = {}
	local var9 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule()
	
	if #var9 == 0 then
		return t
	end
	for i in string.gmatch(var9, "([^,%s]+)") do
		t[i] = true
	end
	return t
end

local function createCanPublishPromise(p0, p1, p2, p3, p4) --[[ line: 49 ]]
	-- upvalues: promiseModule (ref), httpService (ref), constantsModule (ref)
	return if #p1 == 0 then promiseModule.resolve() else promiseModule.new(function(p5, p6) --[[ line: 59 ]]
		-- upvalues: httpService (copy), p1 (ref), p2 (ref), p4 (ref), p0 (ref), constantsModule (copy), p3 (ref)
		httpService:RequestInternal({
			Method = "POST",
			Url = p0,
			Body = httpService:JSONEncode({ assetIds = p1, restrictedEntities = p2, universeId = p4 }),
			Headers = {
				[constantsModule.ExperienceAuthHeaderKey] = p3,
				[constantsModule.ContentType] = constantsModule.ApplicationJson
			}
		}):Start(function(p7, p8) --[[ line: 76 ]]
			-- upvalues: p5 (ref), httpService (copy), p6 (ref)
			if p7 and p8.StatusCode == 200 then
				p5(httpService:JSONDecode(p8.Body))
				
				return
			end
			p6()
		end)
	end)
end

return function(value, p9, p10, p11, p12) --[[ line: 86 | named "canPublishAssets" ]]
	-- upvalues: formattedText (ref), createCanPublishPromise (ref), promiseModule (ref), getFStringUGCValidationReferenceMeshIdWhitelistForIECModule (ref), getWhitelistIds (ref)
	local UGCValidationCanPublishRequestPageSizeFastInt = game:GetFastInt("UGCValidationCanPublishRequestPageSize")
	local UGCValidationMaxAssetSizeAllowedFastInt = game:GetFastInt("UGCValidationMaxAssetSizeAllowed")
	local text = formattedText .. (if p12 then "packages-api/v1/rcc/canPublish" else "packages-api/v1/canPublish")
	local t = {}
	local t_1 = {}
	
	for i, v in value do
		if not t[i] then
			t[i] = true
			table.insert(t_1, i)
		end
	end
	if UGCValidationMaxAssetSizeAllowedFastInt < #t_1 then
		return { status = "tooManyAssets" }
	end
	local t_2 = {}
	local t_3 = {}
	
	for i_1, v_1 in t_1 do
		table.insert(t_3, v_1)
		
		if UGCValidationCanPublishRequestPageSizeFastInt <= #t_3 then
			table.insert(t_2, createCanPublishPromise(text, t_3, p9, p10, p11))
			t_3 = {}
		end
	end
	if #t_3 > 0 then
		table.insert(t_2, createCanPublishPromise(text, t_3, p9, p10, p11))
	end
	local var17, var18 = promiseModule.all(t_2):await()
	
	if not var17 then
		return { status = "loadFailed" }
	end
	local var19 = getFStringUGCValidationReferenceMeshIdWhitelistForIECModule() ~= ""
	local var20 = if var19 then getWhitelistIds() else {}
	local t_4 = {}
	
	for i_2, v_2 in var18 do
		for i_3, v_3 in v_2.result do
			local var22 = value[i_3]
			
			if var22 then
				table.insert(t_4, {
					assetId = i_3,
					allowed = if var19 and not v_3 and var20[i_3] then true else v_3,
					entry = var22[1]
				})
			end
		end
	end
	return { status = "ok", verdicts = t_4 }
end