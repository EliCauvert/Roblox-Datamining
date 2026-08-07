local openNativeClosePromptModule = require(script.Parent.Parent.Actions.OpenNativeClosePrompt)

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: openNativeClosePromptModule (ref)
	local function _() --[[ line: 7 | named "getDisplayCount" ]]
		-- upvalues: p1 (ref)
		return tonumber(p1:GetItem("NativeCloseLuaPromptDisplayCount")) or 0
	end
	
	local _ = function(value) --[[ line: 11 | named "setDisplayCount" ]]
		-- upvalues: p1 (ref)
		p1:SetItem("NativeCloseLuaPromptDisplayCount", tostring(value))
		p1:flush()
	end
	
	local notificationTypeList = p0:GetNotificationTypeList()
	
	return function(p3) --[[ line: 18 ]]
		-- upvalues: p1 (ref), p2 (ref), p0 (ref), notificationTypeList (ref), openNativeClosePromptModule (copy)
		local nativeCloseLuaPromptDisplayCount = tonumber(p1:GetItem("NativeCloseLuaPromptDisplayCount")) or 0
		
		if p3:getState().nativeClosePrompt.closingApp or p2 <= nativeCloseLuaPromptDisplayCount then
			p0:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
			
			return
		end
		p3:dispatch(openNativeClosePromptModule())
		p1:SetItem("NativeCloseLuaPromptDisplayCount", tostring(nativeCloseLuaPromptDisplayCount + 1))
		p1:flush()
	end
end