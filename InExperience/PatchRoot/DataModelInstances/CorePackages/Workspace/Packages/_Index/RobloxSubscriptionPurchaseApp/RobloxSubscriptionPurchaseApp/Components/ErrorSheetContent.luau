local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local errorReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local sheet = foundationModule.Sheet
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local button = foundationModule.Button
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens
local fillBehavior = foundationModule.Enums.FillBehavior
local buttonVariant = foundationModule.Enums.ButtonVariant

local function mapErrorReasonToCopy(p0, p1)
	-- upvalues: errorReasonModule (ref)
	local var8 = ({
		[errorReasonModule.GenericError] = { p1.GenericErrorTitle, p1.GenericErrorBody },
		[errorReasonModule.AlreadySubscribed] = { p1.AlreadySubscribedTitle, p1.AlreadySubscribedBody },
		[errorReasonModule.UnsupportedPlatform] = { p1.UnsupportedPlatformTitle, p1.UnsupportedPlatformBody }
	})[p0]
	
	return if var8 then { title = var8[1], body = var8[2] } else { title = p1.GenericErrorTitle, body = p1.GenericErrorBody }
end

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), useTokens (ref), useLocalization (ref), reactModule (ref), mapErrorReasonToCopy (ref), completeRobloxSubscriptionUpsellFlowModule (ref), sheet (ref), view (ref), text (ref), icon (ref), iconName (ref), button (ref), fillBehavior (ref), buttonVariant (ref)
	local var9 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getErrorReason)
	local var10 = useTokens()
	local var11 = useLocalization({
		okButton = "Features.Transfers.Action.Ok",
		GenericErrorTitle = "Feature.RobloxSubscription.Title.GenericError",
		GenericErrorBody = "Feature.RobloxSubscription.Body.GenericError",
		AlreadySubscribedTitle = "Feature.RobloxSubscription.Title.AlreadySubscribed",
		AlreadySubscribedBody = "Feature.RobloxSubscription.Body.AlreadySubscribed",
		UnsupportedPlatformTitle = "Feature.RobloxSubscription.Title.UnsupportedPlatform",
		UnsupportedPlatformBody = "Feature.RobloxSubscription.Body.UnsupportedPlatform"
	})
	local var12 = reactModule.useMemo(function()
		-- upvalues: mapErrorReasonToCopy (copy), var9 (ref), var11 (ref)
		return mapErrorReasonToCopy(var9, var11)
	end, { var9, var11 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: completeRobloxSubscriptionUpsellFlowModule (copy)
		completeRobloxSubscriptionUpsellFlowModule()
	end, {})
	
	return reactModule.useMemo(function()
		-- upvalues: reactModule (copy), sheet (copy), view (copy), text (copy), var12 (ref), icon (copy), iconName (copy), var10 (ref), button (copy), var11 (ref), var13 (ref), fillBehavior (copy), buttonVariant (copy)
		return {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				TitleRow = reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy gap-small row" }, {
					Title = reactModule.createElement(text, {
						tag = "auto-xy text-heading-small content-emphasis text-align-x-center",
						Text = var12.title
					})
				})
			}),
			Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
				Body = reactModule.createElement(view, {
					tag = "col size-full-0 auto-y align-x-center gap-medium padding-x-large"
				}, {
					CenterIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.TriangleExclamation,
						size = var10.Size.Size_1200
					}),
					BodyText = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-medium content-default text-align-x-center text-wrap",
						Text = var12.body
					})
				})
			}),
			Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
				reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
				}, {
					reactModule.createElement(button, {
						LayoutOrder = 1,
						text = var11.okButton,
						onActivated = var13,
						fillBehavior = fillBehavior.Fill,
						variant = buttonVariant.Emphasis
					})
				})
			})
		}
	end, { var12, var11.okButton, var13 })
end