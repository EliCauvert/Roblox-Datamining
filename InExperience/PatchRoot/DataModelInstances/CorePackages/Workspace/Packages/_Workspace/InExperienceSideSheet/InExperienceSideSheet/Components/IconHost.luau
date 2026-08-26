local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local _ = require(parent.Chrome)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local flags = foundationModule.Utility.Flags
local useTokens = foundationModule.Hooks.useTokens
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local statusIndicator = foundationModule.StatusIndicator
local view = foundationModule.View
local useNotificationCountModule = require(inExperienceSideSheet.Hooks.useNotificationCount)

return function(p1)
	-- upvalues: useTokens (ref), useNotificationCountModule (ref), reactModule (ref), view (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref)
	local var1 = useTokens()
	local var2, var3 = useNotificationCountModule(p1.notification)
	
	return reactModule.createElement(view, {
		tag = {
			["size-1000"] = true,
			["position-center-center anchor-center-center"] = p1.centerPosition
		}
	}, {
		IconContainer = reactModule.createElement(view, {
			tag = "size-full align-x-center align-y-center",
			ZIndex = 1
		}, { Icon = reactModule.createElement(p1.icon) }),
		NotificationBadge = if var2 then reactModule.createElement(statusIndicator, {
			ZIndex = 2,
			value = var3,
			variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, var1.Gap.XXLarge, 0, var1.Gap.Small)
		}) else nil
	})
end