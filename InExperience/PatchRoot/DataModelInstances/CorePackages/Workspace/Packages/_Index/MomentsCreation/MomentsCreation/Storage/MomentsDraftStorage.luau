local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local Players = game:GetService("Players")
local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local _ = require(Parent.MomentsTypes)
local MomentsDraftSerializerModule = require(MomentsCreation.Utils.MomentsDraftSerializer)
local GetLocalUserIdModule = require(MomentsCreation.Utils.getLocalUserId)
local FailureReasonModule = require(MomentsCreation.Enums.FailureReason)
local MomentsDraftStorage = require(Parent.Loggers).Logger:new("Moments.DraftStorage")
local ScaledMomentDraftTTLDays = game:DefineFastInt("MomentDraftTTLDays", 14) * 24 * 60 * 60 * 1000

return {
	save = function(p1)
		-- upvalues: GetLocalUserIdModule (copy), Players (copy), MomentsDraftStorage (copy), MomentsDraftSerializerModule (copy), AppStorageService (copy), HttpService (copy)
		local LocalUserIdModule = GetLocalUserIdModule(Players)
		
		if LocalUserIdModule == nil then
			MomentsDraftStorage:debug("event=save_skipped reason=no_local_player")
			
			return false
		end
		local config = {
			userId = LocalUserIdModule,
			captureRef = p1.captureRef,
			description = p1.description,
			commentsEnabled = p1.commentsEnabled,
			edits = p1.edits,
			lastSaveTime = DateTime.now().UnixTimestampMillis
		}
		local Success, Result = pcall(function()
			-- upvalues: MomentsDraftSerializerModule (upval), config (copy), AppStorageService (upval), HttpService (upval)
			AppStorageService:SetItem("MomentsDraftStorage", HttpService:JSONEncode((MomentsDraftSerializerModule.serialize(config))))
			AppStorageService:Flush()
		end)
		
		if not Success then
			MomentsDraftStorage:error("event=save_failed reason=app_storage_write_error error={}", (tostring(Result)))
		end
		return Success
	end,
	load = function()
		-- upvalues: GetLocalUserIdModule (copy), Players (copy), MomentsDraftStorage (copy), AppStorageService (copy), HttpService (copy), FailureReasonModule (copy), MomentsDraftSerializerModule (copy), ScaledMomentDraftTTLDays (copy)
		local LocalUserIdModule = GetLocalUserIdModule(Players)
		
		if LocalUserIdModule == nil then
			MomentsDraftStorage:debug("event=load_failed reason=no_local_player")
			
			return nil, nil
		end
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("MomentsDraftStorage")
		end)
		
		if not Success then
			MomentsDraftStorage:debug("event=load_failed reason=app_storage_read_error")
			
			return nil, nil
		elseif Result == nil or Result == "" then
			return nil, nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			if not Success1 or type(Result1) ~= "table" then
				pcall(function()
					-- upvalues: AppStorageService (upval)
					AppStorageService:SetItem("MomentsDraftStorage", "")
					AppStorageService:Flush()
				end)
				
				return nil, FailureReasonModule.CorruptShape
			end
			local DeserializeResult = MomentsDraftSerializerModule.deserialize(Result1)
			
			if DeserializeResult == nil then
				pcall(function()
					-- upvalues: AppStorageService (upval)
					AppStorageService:SetItem("MomentsDraftStorage", "")
					AppStorageService:Flush()
				end)
				
				return nil, FailureReasonModule.CorruptShape
			elseif DeserializeResult.userId ~= LocalUserIdModule then
				pcall(function()
					-- upvalues: AppStorageService (upval)
					AppStorageService:SetItem("MomentsDraftStorage", "")
					AppStorageService:Flush()
				end)
				
				return nil, FailureReasonModule.WrongUser
			elseif ScaledMomentDraftTTLDays < DateTime.now().UnixTimestampMillis - DeserializeResult.lastSaveTime then
				pcall(function()
					-- upvalues: AppStorageService (upval)
					AppStorageService:SetItem("MomentsDraftStorage", "")
					AppStorageService:Flush()
				end)
				
				return nil, FailureReasonModule.ExpiredDraft
			else
				return DeserializeResult, nil
			end
		end
	end,
	clear = function()
		-- upvalues: AppStorageService (copy)
		pcall(function()
			-- upvalues: AppStorageService (upval)
			AppStorageService:SetItem("MomentsDraftStorage", "")
			AppStorageService:Flush()
		end)
	end
}