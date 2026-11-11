local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local _ = require(Parent.Chrome)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Flags = FoundationModule.Utility.Flags
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local StatusIndicator = FoundationModule.StatusIndicator
local View = FoundationModule.View
local UseNotificationCountModule = require(InExperienceSideSheet.Hooks.useNotificationCount)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseNotificationCountModule (copy), ReactModule (copy), View (copy), StatusIndicator (copy), Flags (copy), StatusIndicatorVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNotificationCountModuleResult, UseNotificationCountModuleResult2 = UseNotificationCountModule(p1.notification)
	
	return ReactModule.createElement(View, {
		tag = {
			["size-1000"] = true,
			["position-center-center anchor-center-center"] = p1.centerPosition
		}
	}, {
		IconContainer = ReactModule.createElement(View, {
			tag = "size-full align-x-center align-y-center",
			ZIndex = 1
		}, { Icon = ReactModule.createElement(p1.icon) }),
		NotificationBadge = if UseNotificationCountModuleResult then ReactModule.createElement(StatusIndicator, {
			ZIndex = 2,
			value = UseNotificationCountModuleResult2,
			variant = if Flags.FoundationStatusIndicatorVariantExperiment then StatusIndicatorVariant.Contrast_Experiment else StatusIndicatorVariant.Emphasis,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.new(0, UseTokensResult.Gap.XXLarge, 0, UseTokensResult.Gap.Small)
		}) else nil
	})
end