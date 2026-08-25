local notificationsUpsellConstantsModule = require(script.Parent.Parent.NotificationsUpsellConstants)

return {
	getPushUpsellPromptedCount = function(p0, p1)
		local ok, status = pcall(function()
			-- upvalues: p0 (ref), p1 (ref)
			return p0:GetItem(p1)
		end)
		
		if not ok then
			return -1
		end
		local var1 = tonumber(status)
		
		return if var1 == nil then 0 else var1
	end,
	getPushSysUpsellPromptTimestamp = function(p2)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		local ok, status = pcall(function()
			-- upvalues: p2 (ref), notificationsUpsellConstantsModule (copy)
			return p2:GetItem(notificationsUpsellConstantsModule.LocalStorageKeys.SysPromptShownTimestamp)
		end)
		
		if not ok then
			return -1
		end
		local var2 = tonumber(status)
		
		return if var2 == nil then 0 else var2
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
		local var3 = tonumber(status)
		
		return if var3 == nil then 0 else var3
	end,
	incrementPushUpsellPromptedCount = function(p3, p4)
		local ok, status = pcall(function()
			-- upvalues: p3 (ref), p4 (ref)
			return p3:GetItem(p4)
		end)
		
		if ok then
			local var4 = tonumber(status) or 0
			pcall(function()
				-- upvalues: p3 (ref), p4 (ref), var4 (ref)
				p3:SetItem(p4, tostring(var4 + 1))
				p3:Flush()
			end)
		end
	end,
	setPushSysUpsellPromptTimestamp = function(value, p5)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		pcall(function()
			-- upvalues: value (ref), notificationsUpsellConstantsModule (copy), p5 (ref)
			value:SetItem(notificationsUpsellConstantsModule.LocalStorageKeys.SysPromptShownTimestamp, tostring(p5))
			value:Flush()
		end)
	end,
	setPushEduUpsellResponseTimestamp = function(value, p6)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		pcall(function()
			-- upvalues: value (ref), notificationsUpsellConstantsModule (copy), p6 (ref)
			value:SetItem(notificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponseTimestamp, tostring(p6))
			value:Flush()
		end)
	end,
	setPushEduUpsellResponse = function(value, p7)
		-- upvalues: notificationsUpsellConstantsModule (ref)
		pcall(function()
			-- upvalues: value (ref), notificationsUpsellConstantsModule (copy), p7 (ref)
			value:SetItem(notificationsUpsellConstantsModule.LocalStorageKeys.EduPromptResponse, p7)
			value:Flush()
		end)
	end
}