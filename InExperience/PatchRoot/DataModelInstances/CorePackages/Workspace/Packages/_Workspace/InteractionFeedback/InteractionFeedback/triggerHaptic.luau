local CryoModule = require(script:FindFirstAncestor("InteractionFeedback").Parent.Cryo)
local _ = require(script.Parent.InteractionFeedbackContext)
local SendHapticAnalyticsModule = require(script.Parent.sendHapticAnalytics)
local HapticEffects = {}

return function(Type, Position, Radius, ContextKey, InteractionType, p1, p2) --[[ Line: 12 | Named "triggerHaptic" ]]
	-- upvalues: HapticEffects (copy), CryoModule (copy), SendHapticAnalyticsModule (copy)
	if not HapticEffects[Type] then
		HapticEffects[Type] = Instance.new("HapticEffect")
		HapticEffects[Type].Parent = workspace
		HapticEffects[Type].Type = Type
	end
	HapticEffects[Type].Position = Position
	HapticEffects[Type].Radius = Radius
	HapticEffects[Type]:Play()
	
	if p1 then
		SendHapticAnalyticsModule(CryoModule.Dictionary.join({
			hapticType = Type.Name,
			contextKey = ContextKey,
			interactionType = InteractionType
		}, p2 or {}), p1)
	end
end