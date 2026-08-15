local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local _ = require(parent.MomentsTypes)
local momentsDraftSerializerModule = require(momentsCreation.Utils.MomentsDraftSerializer)
local getLocalUserIdModule = require(momentsCreation.Utils.getLocalUserId)
local failureReasonModule = require(momentsCreation.Enums.FailureReason)
local var7 = require(parent.Loggers).Logger:new("Moments.DraftStorage")
local var8 = game:DefineFastInt("MomentDraftTTLDays", 14) * 24 * 60 * 60 * 1000

return {
	save = function(p0) --[[ line: 46 ]]
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), var7 (ref), momentsDraftSerializerModule (ref), appStorageService (ref), httpService (ref)
		local var9 = getLocalUserIdModule(playersService)
		
		if var9 == nil then
			var7:debug("event=save_skipped reason=no_local_player")
			
			return false
		end
		local t = {
			userId = var9,
			captureRef = p0.captureRef,
			description = p0.description,
			edits = p0.edits,
			lastSaveTime = DateTime.now().UnixTimestampMillis
		}
		local ok, status = pcall(function() --[[ line: 62 ]]
			-- upvalues: momentsDraftSerializerModule (copy), t (ref), appStorageService (copy), httpService (copy)
			appStorageService:SetItem("MomentsDraftStorage", httpService:JSONEncode(momentsDraftSerializerModule.serialize(t)))
			appStorageService:Flush()
		end)
		
		if not ok then
			var7:error("event=save_failed reason=app_storage_write_error error={}", tostring(status))
		end
		return ok
	end,
	load = function() --[[ line: 82 ]]
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), var7 (ref), appStorageService (ref), httpService (ref), failureReasonModule (ref), momentsDraftSerializerModule (ref), var8 (ref)
		local var11 = getLocalUserIdModule(playersService)
		
		if var11 == nil then
			var7:debug("event=load_failed reason=no_local_player")
			
			return nil, nil
		end
		local ok, status = pcall(function() --[[ line: 89 ]]
			-- upvalues: appStorageService (copy)
			return appStorageService:GetItem("MomentsDraftStorage")
		end)
		
		if not ok then
			var7:debug("event=load_failed reason=app_storage_read_error")
			
			return nil, nil
		elseif status == nil or status == "" then
			return nil, nil
		end
		local ok_1, status_1 = pcall(function() --[[ line: 103 ]]
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		if not ok_1 or type(status_1) ~= "table" then
			pcall(function() --[[ line: 76 ]]
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.CorruptShape
		end
		local var12 = momentsDraftSerializerModule.deserialize(status_1)
		
		if var12 == nil then
			pcall(function() --[[ line: 76 ]]
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.CorruptShape
		elseif var12.userId ~= var11 then
			pcall(function() --[[ line: 76 ]]
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.WrongUser
		elseif var8 < DateTime.now().UnixTimestampMillis - var12.lastSaveTime then
			pcall(function() --[[ line: 76 ]]
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.ExpiredDraft
		end
		return var12, nil
	end,
	clear = function() --[[ line: 75 ]]
		-- upvalues: appStorageService (ref)
		pcall(function() --[[ line: 76 ]]
			-- upvalues: appStorageService (copy)
			appStorageService:SetItem("MomentsDraftStorage", "")
			appStorageService:Flush()
		end)
	end
}