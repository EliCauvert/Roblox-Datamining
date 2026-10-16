local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local RunService = game:GetService("RunService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local UseRobloxLocaleModule = require(ChatUIPrimitives.Hooks.useRobloxLocale)

local function formatRemaining(UntilTimestamp, p1) --[[ Line: 19 ]]
	local Largest = math.max(math.floor(UntilTimestamp - DateTime.now().UnixTimestamp), 0)
	
	return DateTime.fromUnixTimestamp(Largest):FormatUniversalTime(if Largest >= 3600 then "HH:mm:ss" else "m:ss", p1)
end

return function(Frame) --[[ Line: 25 | Named "Countdown" ]]
	-- upvalues: UseRobloxLocaleModule (copy), RunService (copy), ReactModule (copy), formatRemaining (copy), UseEventConnectionFunction (copy), FoundationModule (copy)
	local UseRobloxLocaleModuleResult = UseRobloxLocaleModule()
	local UntilTimestamp = Frame.untilTimestamp
	local TestHeartbeat = Frame.testHeartbeat or RunService.Heartbeat
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(formatRemaining(UntilTimestamp, UseRobloxLocaleModuleResult))
	UseEventConnectionFunction(TestHeartbeat, (ReactModule.useCallback(function() --[[ Line: 31 ]]
		-- upvalues: UntilTimestamp (copy), UseRobloxLocaleModuleResult (copy), UseBindingResult (copy), UseBindingResult2 (copy)
		local Largest = math.max(math.floor(UntilTimestamp - DateTime.now().UnixTimestamp), 0)
		local FormatUniversalTimeResult = DateTime.fromUnixTimestamp(Largest):FormatUniversalTime(if Largest >= 3600 then "HH:mm:ss" else "m:ss", UseRobloxLocaleModuleResult)
		
		if FormatUniversalTimeResult ~= UseBindingResult:getValue() then
			UseBindingResult2(FormatUniversalTimeResult)
		end
	end, {
		UntilTimestamp,
		UseRobloxLocaleModuleResult,
		UseBindingResult,
		UseBindingResult2
	})))
	
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-title-medium text-no-wrap content-default",
		testId = "countdown",
		Text = UseBindingResult,
		LayoutOrder = Frame.LayoutOrder
	})
end