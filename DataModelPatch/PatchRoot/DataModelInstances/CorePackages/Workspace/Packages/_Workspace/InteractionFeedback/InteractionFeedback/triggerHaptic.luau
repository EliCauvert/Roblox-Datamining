local Parent = script:FindFirstAncestor("InteractionFeedback").Parent
local CryoModule = require(Parent.Cryo)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(script.Parent.InteractionFeedbackContext)
local SendHapticAnalyticsModule = require(script.Parent.sendHapticAnalytics)
local FFlagLuaAppHapticTriggeredTelemetry = SharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local FFlagLuaAppFixExplicitFeedbackTelemetry = SharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local HapticEffects = {}

return function(Type, Position, Radius, ContextKey, InteractionType, p1, p2)
	-- upvalues: HapticEffects (copy), FFlagLuaAppHapticTriggeredTelemetry (copy), CryoModule (copy), FFlagLuaAppFixExplicitFeedbackTelemetry (copy), SendHapticAnalyticsModule (copy)
	if not HapticEffects[Type] then
		HapticEffects[Type] = Instance.new("HapticEffect")
		HapticEffects[Type].Parent = workspace
		HapticEffects[Type].Type = Type
	end
	HapticEffects[Type].Position = Position
	HapticEffects[Type].Radius = Radius
	HapticEffects[Type]:Play()
	
	if FFlagLuaAppHapticTriggeredTelemetry and p1 then
		SendHapticAnalyticsModule(CryoModule.Dictionary.join({
			hapticType = Type.Name,
			contextKey = ContextKey,
			interactionType = InteractionType,
			ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1
		}, p2 or {}), if FFlagLuaAppFixExplicitFeedbackTelemetry then p1 else nil)
	end
end