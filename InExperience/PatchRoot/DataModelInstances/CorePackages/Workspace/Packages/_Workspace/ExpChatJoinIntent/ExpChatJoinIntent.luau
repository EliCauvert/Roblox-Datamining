local JoinIntentStoreModule = require(script.JoinIntentStore)
local FStringOpenChatOnJoinNotificationTypesModule = require(script.Flags.FStringOpenChatOnJoinNotificationTypes)
local v1 = nil

local function _()
	-- upvalues: v1 (ref), JoinIntentStoreModule (copy), FStringOpenChatOnJoinNotificationTypesModule (copy)
	local v2 = v1
	
	if v2 then
		return v2
	else
		local NewJoinIntentStore = JoinIntentStoreModule.new({
			notificationTypes = FStringOpenChatOnJoinNotificationTypesModule
		})
		v1 = NewJoinIntentStore
		
		return NewJoinIntentStore
	end
end

return {
	["jest.config"] = script["jest.config"],
	FStringOpenChatOnJoinNotificationTypes = FStringOpenChatOnJoinNotificationTypesModule,
	JoinIntentStore = JoinIntentStoreModule,
	handleDeeplinkTap = function(p1)
		-- upvalues: v1 (ref), JoinIntentStoreModule (copy), FStringOpenChatOnJoinNotificationTypesModule (copy)
		local v2 = v1
		local v3 = nil
		
		if v2 then
			v3 = v2
		else
			local NewJoinIntentStore = JoinIntentStoreModule.new({
				notificationTypes = FStringOpenChatOnJoinNotificationTypesModule
			})
			v1 = NewJoinIntentStore
			v3 = NewJoinIntentStore
		end
		v3:handleDeeplinkTap(p1)
	end,
	read = function(p1)
		-- upvalues: v1 (ref), JoinIntentStoreModule (copy), FStringOpenChatOnJoinNotificationTypesModule (copy)
		local v2 = v1
		local v3 = nil
		
		if v2 then
			v3 = v2
		else
			local NewJoinIntentStore = JoinIntentStoreModule.new({
				notificationTypes = FStringOpenChatOnJoinNotificationTypesModule
			})
			v1 = NewJoinIntentStore
			v3 = NewJoinIntentStore
		end
		return v3:read(p1)
	end,
	getIntent = function()
		-- upvalues: v1 (ref), JoinIntentStoreModule (copy), FStringOpenChatOnJoinNotificationTypesModule (copy)
		local v2 = v1
		local v3 = nil
		
		if v2 then
			v3 = v2
		else
			local NewJoinIntentStore = JoinIntentStoreModule.new({
				notificationTypes = FStringOpenChatOnJoinNotificationTypesModule
			})
			v1 = NewJoinIntentStore
			v3 = NewJoinIntentStore
		end
		return v3:getIntent()
	end
}