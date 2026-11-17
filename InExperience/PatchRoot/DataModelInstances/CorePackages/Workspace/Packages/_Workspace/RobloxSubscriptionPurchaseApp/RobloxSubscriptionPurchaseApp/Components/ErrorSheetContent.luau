local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FillBehavior = FoundationModule.Enums.FillBehavior
local ButtonVariant = FoundationModule.Enums.ButtonVariant

local function mapErrorReasonToCopy(UseSignalStateResult, p1)
	-- upvalues: ErrorReasonModule (copy)
	local Entry = ({
		[ErrorReasonModule.GenericError] = { p1.GenericErrorTitle, p1.GenericErrorBody },
		[ErrorReasonModule.AlreadySubscribed] = { p1.AlreadySubscribedTitle, p1.AlreadySubscribedBody },
		[ErrorReasonModule.UnsupportedPlatform] = { p1.UnsupportedPlatformTitle, p1.UnsupportedPlatformBody },
		[ErrorReasonModule.ReferralIneligible] = { p1.GenericErrorTitle, p1.ReferralIneligibleBody },
		[ErrorReasonModule.ReferralSelfReferral] = { p1.GenericErrorTitle, p1.ReferralSelfReferralBody }
	})[UseSignalStateResult]
	
	return if Entry then { title = Entry[1], body = Entry[2] } else { title = p1.GenericErrorTitle, body = p1.GenericErrorBody }
end

return function()
	-- upvalues: RobloxSubscriptionStoreModule (copy), SignalsReactModule (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), mapErrorReasonToCopy (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), Sheet (copy), View (copy), Text (copy), Icon (copy), IconName (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionStoreModule.get().getErrorReason)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		okButton = "Features.Transfers.Action.Ok",
		GenericErrorTitle = "Feature.RobloxSubscription.Title.GenericError",
		GenericErrorBody = "Feature.RobloxSubscription.Body.GenericError",
		AlreadySubscribedTitle = "Feature.RobloxSubscription.Title.AlreadySubscribed",
		AlreadySubscribedBody = "Feature.RobloxSubscription.Body.AlreadySubscribed",
		UnsupportedPlatformTitle = "Feature.RobloxSubscription.Title.UnsupportedPlatform",
		UnsupportedPlatformBody = "Feature.RobloxSubscription.Body.UnsupportedPlatform",
		ReferralIneligibleBody = "Feature.RobloxSubscription.Description.NoLongerValidReferralGenericError",
		ReferralSelfReferralBody = "Feature.RobloxSubscription.Message.AlreadySubscribed"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: mapErrorReasonToCopy (upval), UseSignalStateResult (copy), UseLocalizationResult (copy)
		return (mapErrorReasonToCopy(UseSignalStateResult, UseLocalizationResult))
	end, { UseSignalStateResult, UseLocalizationResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CompleteRobloxSubscriptionUpsellFlowModule (upval)
		CompleteRobloxSubscriptionUpsellFlowModule()
	end, {})
	
	return ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Sheet (upval), View (upval), Text (upval), UseMemoResult (copy), Icon (upval), IconName (upval), UseTokensResult (copy), Button (upval), UseLocalizationResult (copy), UseResult (copy), FillBehavior (upval), ButtonVariant (upval)
		return {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
				TitleRow = ReactModule.createElement(View, { LayoutOrder = 1, tag = "auto-xy gap-small row" }, {
					Title = ReactModule.createElement(Text, {
						tag = "auto-xy text-heading-small content-emphasis text-align-x-center",
						Text = UseMemoResult.title
					})
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
				Body = ReactModule.createElement(View, {
					tag = "col size-full-0 auto-y align-x-center gap-medium padding-x-large"
				}, {
					CenterIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = IconName.TriangleExclamation,
						size = UseTokensResult.Size.Size_1200
					}),
					BodyText = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-medium content-default text-align-x-center text-wrap",
						Text = UseMemoResult.body
					})
				})
			}),
			Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
				ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
				}, {
					ReactModule.createElement(Button, {
						LayoutOrder = 1,
						text = UseLocalizationResult.okButton,
						onActivated = UseResult,
						fillBehavior = FillBehavior.Fill,
						variant = ButtonVariant.Emphasis
					})
				})
			})
		}
	end, { UseMemoResult, UseLocalizationResult.okButton, UseResult })
end