local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ProfileCtaService").Parent
local var1 = require(parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
local getLocalPlayerUserId = require(parent.DataHydration).DataHydrationUtils.getLocalPlayerUserId
local constantsModule = require(script.Parent.Constants)

return function(p1)
	-- upvalues: getLocalPlayerUserId (ref), playersService (ref), var1 (ref), constantsModule (ref)
	local var2 = getLocalPlayerUserId()
	local var3 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var2 (write)
		local var4 = getLocalPlayerUserId()
		
		if var4 ~= var2 then
			var2 = var4
		end
	end)
	local friendship_notifications = var1:observeEvent(constantsModule.FRIENDSHIP_NOTIFICATIONS, function(p2)
		-- upvalues: var2 (write), p1 (ref)
		if p2.EventArgs and p2.EventArgs.UserId1 and p2.EventArgs.UserId2 then
			p1(if tostring(var2) == tostring(p2.EventArgs.UserId1) then tostring(p2.EventArgs.UserId2) else tostring(p2.EventArgs.UserId1))
			
			return
		end
	end)
	local presence_bulk_notifications = var1:observeEvent(constantsModule.PRESENCE_BULK_NOTIFICATIONS, function(p2)
		-- upvalues: p1 (ref)
		if not p2 or type(p2) ~= "table" then return end
		for i, v in ipairs(p2) do
			if v and v.UserId then
				p1(tostring(v.UserId))
			end
		end
	end)
	
	return function()
		-- upvalues: var3 (write), friendship_notifications (write), presence_bulk_notifications (write)
		if var3 then
			var3:Disconnect()
			var3 = nil
		end
		if friendship_notifications then
			friendship_notifications:disconnect()
			friendship_notifications = nil
		end
		if presence_bulk_notifications then
			presence_bulk_notifications:disconnect()
			presence_bulk_notifications = nil
		end
	end
end