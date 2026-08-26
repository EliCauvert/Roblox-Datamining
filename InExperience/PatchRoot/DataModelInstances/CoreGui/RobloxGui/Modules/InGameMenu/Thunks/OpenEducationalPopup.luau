local openNativeClosePromptModule = require(script.Parent.Parent.Actions.OpenNativeClosePrompt)

return function(p1, p2, p3)
	-- upvalues: openNativeClosePromptModule (ref)
	local function _()
		-- upvalues: p2 (ref)
		return tonumber(p2:GetItem("NativeCloseLuaPromptDisplayCount")) or 0
	end
	
	local _ = function(value)
		-- upvalues: p2 (ref)
		p2:SetItem("NativeCloseLuaPromptDisplayCount", tostring(value))
		p2:flush()
	end
	
	local notificationTypeList = p1:GetNotificationTypeList()
	
	return function(p4)
		-- upvalues: p2 (ref), p3 (ref), p1 (ref), notificationTypeList (ref), openNativeClosePromptModule (copy)
		local nativeCloseLuaPromptDisplayCount = tonumber(p2:GetItem("NativeCloseLuaPromptDisplayCount")) or 0
		
		if p4:getState().nativeClosePrompt.closingApp or p3 <= nativeCloseLuaPromptDisplayCount then
			p1:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
			
			return
		end
		p4:dispatch(openNativeClosePromptModule())
		p2:SetItem("NativeCloseLuaPromptDisplayCount", tostring(nativeCloseLuaPromptDisplayCount + 1))
		p2:flush()
	end
end