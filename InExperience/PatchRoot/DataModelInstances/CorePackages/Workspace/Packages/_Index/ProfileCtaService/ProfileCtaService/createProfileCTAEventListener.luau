local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ProfileCtaService").Parent
local var2 = require(parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
local getLocalPlayerUserId = require(parent.DataHydration).DataHydrationUtils.getLocalPlayerUserId
local constantsModule = require(script.Parent.Constants)

return function(p0)
	-- upvalues: getLocalPlayerUserId (ref), playersService (ref), var2 (ref), constantsModule (ref)
	local var4 = getLocalPlayerUserId()
	local var5 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var4 (write)
		local var8 = getLocalPlayerUserId()
		
		if var8 ~= var4 then
			var4 = var8
		end
	end)
	local friendship_notifications = var2:observeEvent(constantsModule.FRIENDSHIP_NOTIFICATIONS, function(p1)
		-- upvalues: var4 (write), p0 (ref)
		if p1.EventArgs and p1.EventArgs.UserId1 and p1.EventArgs.UserId2 then
			p0(if tostring(var4) == tostring(p1.EventArgs.UserId1) then tostring(p1.EventArgs.UserId2) else tostring(p1.EventArgs.UserId1))
			
			return
		end
	end)
	local presence_bulk_notifications = var2:observeEvent(constantsModule.PRESENCE_BULK_NOTIFICATIONS, function(p2)
		-- upvalues: p0 (ref)
		if not p2 or type(p2) ~= "table" then return end
		for i, v in ipairs(p2) do
			if v and v.UserId then
				p0(tostring(v.UserId))
			end
		end
	end)
	
	return function()
		-- upvalues: var5 (write), friendship_notifications (write), presence_bulk_notifications (write)
		if var5 then
			var5:Disconnect()
			var5 = nil
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