local OpenNativeClosePromptModule = require(script.Parent.Parent.Actions.OpenNativeClosePrompt)

return function(GuiService, p1, p2) --[[ Line: 6 ]]
	-- upvalues: OpenNativeClosePromptModule (copy)
	local function _(): number --[[ Line: 7 | Named "getDisplayCount" ]]
		-- upvalues: p1 (copy)
		return tonumber(p1:GetItem("NativeCloseLuaPromptDisplayCount")) or 0
	end
	
	local _ = function(p3) --[[ Line: 11 | Named "setDisplayCount" ]]
		-- upvalues: p1 (copy)
		p1:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(p3)))
		p1:flush()
	end
	
	local NotificationTypeList = GuiService:GetNotificationTypeList()
	
	return function(p3) --[[ Line: 18 ]]
		-- upvalues: p1 (copy), p2 (copy), GuiService (copy), NotificationTypeList (copy), OpenNativeClosePromptModule (upval)
		local Number: number = tonumber(p1:GetItem("NativeCloseLuaPromptDisplayCount")) or 0
		
		if p3:getState().nativeClosePrompt.closingApp or p2 <= Number then
			GuiService:BroadcastNotification("", NotificationTypeList.NATIVE_EXIT)
			
			return
		else
			p3:dispatch(OpenNativeClosePromptModule())
			p1:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(Number + 1)))
			p1:flush()
		end
	end
end