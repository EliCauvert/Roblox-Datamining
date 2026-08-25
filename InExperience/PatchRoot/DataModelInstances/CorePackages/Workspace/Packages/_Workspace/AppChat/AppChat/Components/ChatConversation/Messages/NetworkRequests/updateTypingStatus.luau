local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local loggerModule = require(appChat.Logger)

return function(p0)
	-- upvalues: appChatNetworkingModule (ref), loggerModule (ref)
	return function(p1)
		-- upvalues: appChatNetworkingModule (copy), p0 (ref), loggerModule (copy)
		p1:dispatch(appChatNetworkingModule.rodux.UpdateTypingStatus.API(p0)):catch(function(p2)
			-- upvalues: loggerModule (copy)
			loggerModule:error(`AppChatNetworking failure in updateTypingStatus, Status: {tostring(p2)}`)
		end)
	end
end