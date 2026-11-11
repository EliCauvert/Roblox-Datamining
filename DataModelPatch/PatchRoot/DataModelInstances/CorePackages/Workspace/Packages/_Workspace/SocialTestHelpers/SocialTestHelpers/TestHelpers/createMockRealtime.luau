local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("SocialTestHelpers").Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local WaitForEventsFunction = require(Parent.TestUtils).DeferredLuaHelpers.waitForEvents
local MockNotificationService = require(Parent.MockEngineServices).MockNotificationService
local RobloxEventReceiver = require(Parent.RealtimeDelivery).RobloxEventReceiver

return function()
	-- upvalues: MockNotificationService (copy), RobloxEventReceiver (copy), HttpService (copy), ReactRobloxModule (copy), WaitForEventsFunction (copy)
	local NewMockNotificationService = MockNotificationService.new()
	
	return RobloxEventReceiver.new(NewMockNotificationService), {
		emitRealtimeEvent = function(Namespace, Input)
			-- upvalues: HttpService (upval), ReactRobloxModule (upval), NewMockNotificationService (copy), WaitForEventsFunction (upval)
			local Json = HttpService:JSONEncode(Input)
			ReactRobloxModule.act(function()
				-- upvalues: NewMockNotificationService (upval), Namespace (copy), Json (copy), WaitForEventsFunction (upval)
				NewMockNotificationService.RobloxEventReceived:Fire({ namespace = Namespace, detail = Json })
				WaitForEventsFunction()
			end)
		end,
		emitRealtimeConnectionState = function(p1, Input)
			-- upvalues: ReactRobloxModule (upval), NewMockNotificationService (copy), HttpService (upval), WaitForEventsFunction (upval)
			ReactRobloxModule.act(function()
				-- upvalues: NewMockNotificationService (upval), p1 (copy), HttpService (upval), Input (copy), WaitForEventsFunction (upval)
				NewMockNotificationService.RobloxConnectionChanged:Fire("signalR", p1, 0, HttpService:JSONEncode(Input))
				WaitForEventsFunction()
			end)
		end
	}
end