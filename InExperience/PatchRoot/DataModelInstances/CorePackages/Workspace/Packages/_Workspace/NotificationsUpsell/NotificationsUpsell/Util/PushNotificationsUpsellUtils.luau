local NotificationsUpsellConstantsModule = require(script.Parent.Parent.NotificationsUpsellConstants)

return {
	getPushUpsellPromptedCount = function(p1, p2): number
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1:GetItem(p2)
		end)
		
		if Success then
			local Number: number? = tonumber(Result)
			
			return if Number == nil then 0 else Number
		else
			return -1
		end
	end,
	getPushSysUpsellPromptTimestamp = function(p1): number
		-- upvalues: NotificationsUpsellConstantsModule (copy)
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), NotificationsUpsellConstantsModule (upval)
			return p1:GetItem(NotificationsUpsellConstantsModule.LocalStorageKeys.SysPromptShownTimestamp)
		end)
		
		if Success then
			local Number: number? = tonumber(Result)
			
			return if Number == nil then 0 else Number
		else
			return -1
		end
	end,
	getPushEduUpsellResponseTimestamp = function(p1): number
		-- upvalues: NotificationsUpsellConstantsModule (copy)
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), NotificationsUpsellConstantsModule (upval)
			return p1:GetItem(NotificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponseTimestamp)
		end)
		
		if Success then
			local Number: number? = tonumber(Result)
			
			return if Number == nil then 0 else Number
		else
			return -1
		end
	end,
	incrementPushUpsellPromptedCount = function(p1, p2)
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1:GetItem(p2)
		end)
		
		if Success then
			local Number: number = tonumber(Result) or 0
			pcall(function()
				-- upvalues: p1 (copy), p2 (copy), Number (copy)
				p1:SetItem(p2, (tostring(Number + 1)))
				p1:Flush()
			end)
		end
	end,
	setPushSysUpsellPromptTimestamp = function(p1, p2)
		-- upvalues: NotificationsUpsellConstantsModule (copy)
		pcall(function()
			-- upvalues: p1 (copy), NotificationsUpsellConstantsModule (upval), p2 (copy)
			p1:SetItem(NotificationsUpsellConstantsModule.LocalStorageKeys.SysPromptShownTimestamp, (tostring(p2)))
			p1:Flush()
		end)
	end,
	setPushEduUpsellResponseTimestamp = function(p1, p2)
		-- upvalues: NotificationsUpsellConstantsModule (copy)
		pcall(function()
			-- upvalues: p1 (copy), NotificationsUpsellConstantsModule (upval), p2 (copy)
			p1:SetItem(NotificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponseTimestamp, (tostring(p2)))
			p1:Flush()
		end)
	end,
	setPushEduUpsellResponse = function(p1, p2)
		-- upvalues: NotificationsUpsellConstantsModule (copy)
		pcall(function()
			-- upvalues: p1 (copy), NotificationsUpsellConstantsModule (upval), p2 (copy)
			p1:SetItem(NotificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponse, p2)
			p1:Flush()
		end)
	end
}