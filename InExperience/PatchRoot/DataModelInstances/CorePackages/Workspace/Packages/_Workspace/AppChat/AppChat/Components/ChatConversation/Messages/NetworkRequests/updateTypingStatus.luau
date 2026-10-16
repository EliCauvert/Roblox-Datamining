local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local LoggerModule = require(AppChat.Logger)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: AppChatNetworkingModule (copy), LoggerModule (copy)
	return function(p2) --[[ Line: 7 ]]
		-- upvalues: AppChatNetworkingModule (upval), p1 (copy), LoggerModule (upval)
		p2:dispatch(AppChatNetworkingModule.rodux.UpdateTypingStatus.API(p1)):catch(function(Err) --[[ Line: 8 ]]
			-- upvalues: LoggerModule (upval)
			LoggerModule:error(`AppChatNetworking failure in updateTypingStatus, Status: {tostring(Err)}`)
		end)
	end
end