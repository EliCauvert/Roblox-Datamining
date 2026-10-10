local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local runService = game:GetService("RunService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local useRobloxLocaleModule = require(chatUIPrimitives.Hooks.useRobloxLocale)

local function formatRemaining(p1, p2)
	local maxValue = math.max(math.floor(p1 - DateTime.now().UnixTimestamp), 0)
	
	return DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime(if maxValue >= 3600 then "HH:mm:ss" else "m:ss", p2)
end

return function(p1)
	-- upvalues: useRobloxLocaleModule (ref), runService (ref), reactModule (ref), formatRemaining (ref), useEventConnection (ref), foundationModule (ref)
	local var1 = useRobloxLocaleModule()
	local untilTimestamp = p1.untilTimestamp
	local testHeartbeat = p1.testHeartbeat or runService.Heartbeat
	local var2, var3 = reactModule.useBinding(formatRemaining(untilTimestamp, var1))
	useEventConnection(testHeartbeat, reactModule.useCallback(function()
		-- upvalues: untilTimestamp (ref), var1 (ref), var2 (ref), var3 (ref)
		local maxValue = math.max(math.floor(untilTimestamp - DateTime.now().UnixTimestamp), 0)
		local var4 = DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime(if maxValue >= 3600 then "HH:mm:ss" else "m:ss", var1)
		
		if var4 ~= var2:getValue() then
			var3(var4)
		end
	end, { untilTimestamp, var1, var2, var3 }))
	
	return reactModule.createElement(foundationModule.Text, {
		tag = "auto-xy text-title-medium text-no-wrap content-default",
		testId = "countdown",
		Text = var2,
		LayoutOrder = p1.LayoutOrder
	})
end