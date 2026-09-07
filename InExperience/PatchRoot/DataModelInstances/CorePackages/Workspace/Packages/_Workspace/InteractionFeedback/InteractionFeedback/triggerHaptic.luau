local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local cryoModule = require(parent.Cryo)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(script.Parent.InteractionFeedbackContext)
local sendHapticAnalyticsModule = require(script.Parent.sendHapticAnalytics)
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local t = {}

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: t (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), cryoModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), sendHapticAnalyticsModule (ref)
	if not t[p1] then
		t[p1] = Instance.new("HapticEffect")
		t[p1].Parent = workspace
		t[p1].Type = p1
	end
	t[p1].Position = p2
	t[p1].Radius = p3
	t[p1]:Play()
	
	if fFlagLuaAppHapticTriggeredTelemetry and p6 then
		sendHapticAnalyticsModule(cryoModule.Dictionary.join({
			hapticType = p1.Name,
			contextKey = p4,
			interactionType = p5,
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p6
		}, p7 or {}), if fFlagLuaAppFixExplicitFeedbackTelemetry then p6 else nil)
	end
end