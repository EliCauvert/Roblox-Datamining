local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ProfileCtaService").Parent
local NewResult = require(Parent.RealtimeDelivery).RobloxEventReceiver.new((game:GetService("NotificationService")))
local GetLocalPlayerUserIdFunction = require(Parent.DataHydration).DataHydrationUtils.getLocalPlayerUserId
local ConstantsModule = require(script.Parent.Constants)

return function(Callback)
	-- upvalues: GetLocalPlayerUserIdFunction (copy), Players (copy), NewResult (copy), ConstantsModule (copy)
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	local Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref)
		local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
		
		if LocalPlayerUserId1 ~= LocalPlayerUserId then
			LocalPlayerUserId = LocalPlayerUserId1
		end
	end)
	local ObserveEventResult = NewResult:observeEvent(ConstantsModule.FRIENDSHIP_NOTIFICATIONS, function(p1)
		-- upvalues: LocalPlayerUserId (ref), Callback (copy)
		if p1.EventArgs and p1.EventArgs.UserId1 and p1.EventArgs.UserId2 then
			Callback(if tostring(LocalPlayerUserId) == tostring(p1.EventArgs.UserId1) then tostring(p1.EventArgs.UserId2) else tostring(p1.EventArgs.UserId1))
			
			return
		end
	end)
	local ObserveEventResult1 = NewResult:observeEvent(ConstantsModule.PRESENCE_BULK_NOTIFICATIONS, function(List)
		-- upvalues: Callback (copy)
		if not List or type(List) ~= "table" then return end
		for _, Player in ipairs(List) do
			if Player and Player.UserId then
				Callback((tostring(Player.UserId)))
			end
		end
	end)
	
	return function()
		-- upvalues: Connection (ref), ObserveEventResult (ref), ObserveEventResult1 (ref)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		if ObserveEventResult then
			ObserveEventResult:disconnect()
			ObserveEventResult = nil
		end
		if ObserveEventResult1 then
			ObserveEventResult1:disconnect()
			ObserveEventResult1 = nil
		end
	end
end