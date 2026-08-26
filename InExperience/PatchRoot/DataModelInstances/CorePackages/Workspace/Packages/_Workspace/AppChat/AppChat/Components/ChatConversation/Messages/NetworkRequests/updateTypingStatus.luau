local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local loggerModule = require(appChat.Logger)

return function(p1)
	-- upvalues: appChatNetworkingModule (ref), loggerModule (ref)
	return function(p2)
		-- upvalues: appChatNetworkingModule (copy), p1 (ref), loggerModule (copy)
		p2:dispatch(appChatNetworkingModule.rodux.UpdateTypingStatus.API(p1)):catch(function(p3)
			-- upvalues: loggerModule (copy)
			loggerModule:error(`AppChatNetworking failure in updateTypingStatus, Status: {tostring(p3)}`)
		end)
	end
end