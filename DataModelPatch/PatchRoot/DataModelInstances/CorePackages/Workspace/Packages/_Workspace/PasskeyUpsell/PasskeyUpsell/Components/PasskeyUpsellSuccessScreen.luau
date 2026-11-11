local TweenService = game:GetService("TweenService")
local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local ReactModule = require(Parent.React)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local PasskeyUpsellHeaderContainerModule = require(script.Parent.PasskeyUpsellHeaderContainer)
local PasskeyUpsellButtonContainerModule = require(script.Parent.PasskeyUpsellButtonContainer)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants

return function(p1)
	-- upvalues: ReactModule (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), PasskeyUpsellHeaderContainerModule (copy), Text (copy), View (copy), TweenService (copy), WithLocalizationFunction (copy), PasskeyUpsellButtonContainerModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	AuthPageloadFunction(EventStreamConstants.Context.PasskeyUpsellSuccessScreen)
	
	local function createContent(p2)
		-- upvalues: ReactModule (upval), PasskeyUpsellHeaderContainerModule (upval), p1 (copy), EventStreamConstants (upval), UseRefResult (copy), Text (upval), View (upval)
		local Element = ReactModule.createElement(PasskeyUpsellHeaderContainerModule, {
			localizedTitleText = p2.titleText,
			onCancelButtonPressed = function()
				-- upvalues: p1 (upval), EventStreamConstants (upval)
				p1.onCancelButtonPressed(EventStreamConstants.Context.PasskeyUpsellSuccessScreen, EventStreamConstants.Button.DismissCornerX)
			end,
			shouldRenderGraphic = p1.shouldRenderGraphic
		})
		local config = {
			tag = "text-body-large text-align-x-left auto-xy text-wrap",
			LayoutOrder = 2,
			ref = UseRefResult,
			Text = p2.successDescription
		}
		
		if not p1.shouldRenderGraphic then
			config.Position = UDim2.new(0.75, 0, 0, 0)
			config.Size = UDim2.new(1, 0, 1, 0)
		end
		local Element1 = ReactModule.createElement(Text, config)
		
		return if p1.shouldRenderGraphic then ReactModule.createElement(View, { tag = "auto-xy col" }, {
			PasskeyUpsellHeaderContainer = Element,
			BodyText = Element1
		}) else ReactModule.createElement(ReactModule.Fragment, {}, {
			PasskeyUpsellHeaderContainer = Element,
			BodyText = Element1
		})
	end
	
	local function animateSlideIn(Target)
		-- upvalues: TweenService (upval)
		if Target then
			TweenService:Create(Target, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0) }):Play()
			
			return
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), animateSlideIn (copy)
		if UseRefResult.current then
			animateSlideIn(UseRefResult.current)
		end
	end, {})
	
	return WithLocalizationFunction({
		titleText = "Authentication.Passkey.Label.UpsellToastPageTitle",
		successDescription = "Authentication.Passkey.Description.UpsellRegistrationSuccess",
		continueText = "Authentication.Passkey.Action.Continue"
	})(function(p2)
		-- upvalues: ReactModule (upval), createContent (copy), PasskeyUpsellButtonContainerModule (upval), p1 (copy), EventStreamConstants (upval)
		return ReactModule.createElement(ReactModule.Fragment, {}, {
			ContentContainer = createContent(p2),
			PasskeyUpsellButtonContainer = ReactModule.createElement(PasskeyUpsellButtonContainerModule, {
				layoutOrder = 3,
				localizedContinueText = p2.continueText,
				onContinueButtonPressed = function()
					-- upvalues: p1 (upval), EventStreamConstants (upval)
					p1.onCancelButtonPressed(EventStreamConstants.Context.PasskeyUpsellSuccessScreen, EventStreamConstants.Button.Continue)
				end
			})
		})
	end)
end