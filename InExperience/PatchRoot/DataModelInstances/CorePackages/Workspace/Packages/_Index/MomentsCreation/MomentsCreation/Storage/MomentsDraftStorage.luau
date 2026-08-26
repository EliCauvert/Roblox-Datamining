local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local _ = require(parent.MomentsTypes)
local momentsDraftSerializerModule = require(momentsCreation.Utils.MomentsDraftSerializer)
local getLocalUserIdModule = require(momentsCreation.Utils.getLocalUserId)
local failureReasonModule = require(momentsCreation.Enums.FailureReason)
local var1 = require(parent.Loggers).Logger:new("Moments.DraftStorage")
local var2 = game:DefineFastInt("MomentDraftTTLDays", 14) * 24 * 60 * 60 * 1000

return {
	save = function(p1)
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), var1 (ref), momentsDraftSerializerModule (ref), appStorageService (ref), httpService (ref)
		local var3 = getLocalUserIdModule(playersService)
		
		if var3 == nil then
			var1:debug("event=save_skipped reason=no_local_player")
			
			return false
		end
		local t = {
			userId = var3,
			captureRef = p1.captureRef,
			description = p1.description,
			edits = p1.edits,
			lastSaveTime = DateTime.now().UnixTimestampMillis
		}
		local ok, status = pcall(function()
			-- upvalues: momentsDraftSerializerModule (copy), t (ref), appStorageService (copy), httpService (copy)
			appStorageService:SetItem("MomentsDraftStorage", httpService:JSONEncode(momentsDraftSerializerModule.serialize(t)))
			appStorageService:Flush()
		end)
		
		if not ok then
			var1:error("event=save_failed reason=app_storage_write_error error={}", tostring(status))
		end
		return ok
	end,
	load = function()
		-- upvalues: getLocalUserIdModule (ref), playersService (ref), var1 (ref), appStorageService (ref), httpService (ref), failureReasonModule (ref), momentsDraftSerializerModule (ref), var2 (ref)
		local var3 = getLocalUserIdModule(playersService)
		
		if var3 == nil then
			var1:debug("event=load_failed reason=no_local_player")
			
			return nil, nil
		end
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy)
			return appStorageService:GetItem("MomentsDraftStorage")
		end)
		
		if not ok then
			var1:debug("event=load_failed reason=app_storage_read_error")
			
			return nil, nil
		elseif status == nil or status == "" then
			return nil, nil
		end
		local ok_1, status_1 = pcall(function()
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		if not ok_1 or type(status_1) ~= "table" then
			pcall(function()
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.CorruptShape
		end
		local var4 = momentsDraftSerializerModule.deserialize(status_1)
		
		if var4 == nil then
			pcall(function()
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.CorruptShape
		elseif var4.userId ~= var3 then
			pcall(function()
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.WrongUser
		elseif var2 < DateTime.now().UnixTimestampMillis - var4.lastSaveTime then
			pcall(function()
				-- upvalues: appStorageService (copy)
				appStorageService:SetItem("MomentsDraftStorage", "")
				appStorageService:Flush()
			end)
			
			return nil, failureReasonModule.ExpiredDraft
		end
		return var4, nil
	end,
	clear = function()
		-- upvalues: appStorageService (ref)
		pcall(function()
			-- upvalues: appStorageService (copy)
			appStorageService:SetItem("MomentsDraftStorage", "")
			appStorageService:Flush()
		end)
	end
}