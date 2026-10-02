local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local button = foundationModule.Button
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useScaledValue = foundationModule.Hooks.useScaledValue
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local useInitialButtonDisableDelayModule = require(parent.Generic.Hooks.useInitialButtonDisableDelay)
local VIP_SERVER_PURCHASE_MODAL_MIN_HEIGHT_PIXELS = require(parent.Generic.Constants).VIP_SERVER_PURCHASE_MODAL_MIN_HEIGHT_PIXELS

return function(p1)
	-- upvalues: useLocalization (ref), useFocusNavigationRefsModule (ref), useInitialButtonDisableDelayModule (ref), useScaledValue (ref), VIP_SERVER_PURCHASE_MODAL_MIN_HEIGHT_PIXELS (ref), reactModule (ref), sheet (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = useLocalization({
		UnsupportedInStudio = "Feature.PrivateServers.Description.PrivateServerPurchaseUnavailableInStudio"
	})
	local var2, var3 = useFocusNavigationRefsModule(p1.onClose, nil)
	local var4 = useInitialButtonDisableDelayModule()
	local var5 = useScaledValue(VIP_SERVER_PURCHASE_MODAL_MIN_HEIGHT_PIXELS)
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p1.onClose,
		snapPoints = reactModule.useMemo(function()
			-- upvalues: var5 (ref)
			return { var5, 0.8 }
		end, { var5 }),
		ref = if var4 then nil else var2
	}, {
		Header = reactModule.createElement(sheet.Header, nil, {
			Title = reactModule.createElement(text, {
				Text = "Purchase VIP Server",
				tag = "auto-xy text-heading-small text-align-x-left content-default"
			})
		}),
		Content = if p1.isUnsupportedInStudio then reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			Message = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = var1.UnsupportedInStudio
			})
		}) else nil,
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			PrimaryButton = reactModule.createElement(button, {
				testId = "vip-server-purchase-primary-button",
				text = if p1.isUnsupportedInStudio then "OK" else "Purchase",
				onActivated = if p1.isUnsupportedInStudio then p1.onClose else function() end,
				isDisabled = var4 or not p1.isUnsupportedInStudio,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				ref = var3
			})
		})
	})
end