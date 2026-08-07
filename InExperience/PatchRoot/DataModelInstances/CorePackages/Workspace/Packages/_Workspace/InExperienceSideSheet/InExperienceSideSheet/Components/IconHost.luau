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

return function(p0) --[[ line: 25 | named "IconHost" ]]
	-- upvalues: useTokens (ref), useNotificationCountModule (ref), reactModule (ref), view (ref), statusIndicator (ref), flags (ref), statusIndicatorVariant (ref)
	local var4 = useTokens()
	local var5, var6 = useNotificationCountModule(p0.notification)
	
	return reactModule.createElement(view, {
		tag = {
			["size-1000"] = true,
			["position-center-center anchor-center-center"] = p0.centerPosition
		}
	}, {
		IconContainer = reactModule.createElement(view, {
			tag = "size-full align-x-center align-y-center",
			ZIndex = 1
		}, { Icon = reactModule.createElement(p0.icon) }),
		NotificationBadge = if var5 then reactModule.createElement(statusIndicator, {
			ZIndex = 2,
			value = var6,
			variant = if flags.FoundationStatusIndicatorVariantExperiment then statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, var4.Gap.XXLarge, 0, var4.Gap.Small)
		}) else nil
	})
end