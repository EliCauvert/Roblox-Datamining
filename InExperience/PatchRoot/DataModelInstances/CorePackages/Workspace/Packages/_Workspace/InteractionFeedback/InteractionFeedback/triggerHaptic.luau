local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local cryoModule = require(parent.Cryo)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(script.Parent.InteractionFeedbackContext)
local sendHapticAnalyticsModule = require(script.Parent.sendHapticAnalytics)
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local t = {}

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: t (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), cryoModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), sendHapticAnalyticsModule (ref)
	if not t[p0] then
		t[p0] = Instance.new("HapticEffect")
		t[p0].Parent = workspace
		t[p0].Type = p0
	end
	t[p0].Position = p1
	t[p0].Radius = p2
	t[p0]:Play()
	
	if fFlagLuaAppHapticTriggeredTelemetry and p5 then
		sendHapticAnalyticsModule(cryoModule.Dictionary.join({
			hapticType = p0.Name,
			contextKey = p3,
			interactionType = p4,
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p5
		}, p6 or {}), if fFlagLuaAppFixExplicitFeedbackTelemetry then p5 else nil)
	end
end