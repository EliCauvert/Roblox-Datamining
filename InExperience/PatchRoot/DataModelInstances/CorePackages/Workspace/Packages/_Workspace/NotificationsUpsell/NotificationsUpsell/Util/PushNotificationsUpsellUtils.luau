local notificationsUpsellConstantsModule = require(script.Parent.Parent.NotificationsUpsellConstants)

return {
	getPushUpsellPromptedCount = function(p1, p2)
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), p2 (ref)
			return p1:GetItem(p2)
		end)
		
		if not ok then
			return -1
		end
		local var1 = tonumber(status)
		
		return if var1 == nil then 0 else var1
	end,
	getPushSysUpsellPromptTimestamp = function(p1)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), notificationsUpsellConstantsModule (copy)
			return p1:GetItem(notificationsUpsellConstantsModule.LocalStorageKeys.SysPromptShownTimestamp)
		end)
		
		if not ok then
			return -1
		end
		local var1 = tonumber(status)
		
		return if var1 == nil then 0 else var1
	end,
	getPushEduUpsellResponseTimestamp = function(value)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		local ok, status = pcall(function()
			-- upvalues: value (ref), notificationsUpsellConstantsModule (copy)
			return value:GetItem(notificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponseTimestamp)
		end)
		
		if not ok then
			return -1
		end
		local var1 = tonumber(status)
		
		return if var1 == nil then 0 else var1
	end,
	incrementPushUpsellPromptedCount = function(p1, p2)
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), p2 (ref)
			return p1:GetItem(p2)
		end)
		
		if ok then
			local var1 = tonumber(status) or 0
			pcall(function()
				-- upvalues: p1 (ref), p2 (ref), var1 (ref)
				p1:SetItem(p2, tostring(var1 + 1))
				p1:Flush()
			end)
		end
	end,
	setPushSysUpsellPromptTimestamp = function(value, p1)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		pcall(function()
			-- upvalues: value (ref), notificationsUpsellConstantsModule (copy), p1 (ref)
			value:SetItem(notificationsUpsellConstantsModule.LocalStorageKeys.SysPromptShownTimestamp, tostring(p1))
			value:Flush()
		end)
	end,
	setPushEduUpsellResponseTimestamp = function(value, p1)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		pcall(function()
			-- upvalues: value (ref), notificationsUpsellConstantsModule (copy), p1 (ref)
			value:SetItem(notificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponseTimestamp, tostring(p1))
			value:Flush()
		end)
	end,
	setPushEduUpsellResponse = function(value, p1)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		pcall(function()
			-- upvalues: value (ref), notificationsUpsellConstantsModule (copy), p1 (ref)
			value:SetItem(notificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponse, p1)
			value:Flush()
		end)
	end
}