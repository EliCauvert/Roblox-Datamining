local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local FitTextLabel = RoactFitComponents.FitTextLabel
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local PerformXboxUpsellModule = require(Modules.AvatarExperience.Catalog.Thunks.PerformXboxUpsell)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local RobuxAmountDisplayModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local PurchasePromptLiteModule = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local OpenPurchaseRobuxPageModule = require(Modules.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage)
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FIntTTIUnifiedPurchaseSamplingRate = require(CorePackages.Workspace.Packages.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local InsufficientRobuxPrompt = RoactModule.PureComponent:extend("InsufficientRobuxPrompt")

function InsufficientRobuxPrompt.init(p1)
	-- upvalues: NavigationUtilsModule (copy), IsTenFootInterface (copy)
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
	
	function p1.buyRobux()
		-- upvalues: p1 (copy), IsTenFootInterface (upval)
		p1.closePrompt()
		
		if IsTenFootInterface then
			p1.props.openXboxUpsell(p1.props.networking)
			
			return
		else
			p1.props.openPurchaseRobuxPage(nil, p1.props.networking)
		end
	end
end

function InsufficientRobuxPrompt:didMount()
	-- upvalues: FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), GetTTIEventNameFunction (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), FIntTTIUnifiedPurchaseSamplingRate (copy)
	if FFlagAddPerformanceMetricsToUnifiedPurchaseModal then
		TimeToInteractiveTracker.trackEnd(GetTTIEventNameFunction(ProductPurchaseSurface.Catalog), {
			samplingRateOverride = FIntTTIUnifiedPurchaseSamplingRate
		})
	end
end

function InsufficientRobuxPrompt.renderMiddle(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FitFrameVertical (copy), RoactFitComponents (copy), FitTextLabel (copy), RobuxAmountDisplayModule (copy)
	local UserRobux = p1.props.userRobux
	
	return WithStyleFunction(function(p3)
		-- upvalues: RoactModule (upval), FitFrameVertical (upval), RoactFitComponents (upval), FitTextLabel (upval), p2 (copy), RobuxAmountDisplayModule (upval), UserRobux (copy)
		local _Font = p3.Font
		local Theme = p3.Theme
		local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
		
		return RoactModule.createElement(FitFrameVertical, {
			BackgroundTransparency = 1,
			margin = RoactFitComponents.Rect.quad(10, 0, 10, 0),
			contentPadding = UDim.new(0, 30),
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}, {
			CurrentBalanceLabel = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				width = FitTextLabel.Width.FitToText,
				Font = _Font.Body.Font,
				Text = p2.currentBalanceLabel,
				TextColor3 = Theme.TextDefault.Color,
				TextTransparency = Theme.TextDefault.Transparency,
				TextSize = ScaledBaseSize
			}),
			RobuxContainer = RoactModule.createElement(RobuxAmountDisplayModule, {
				padding = 10,
				robuxAmountText = tostring(UserRobux),
				iconSize = ScaledBaseSize,
				textSize = ScaledBaseSize
			})
		})
	end)
end

function InsufficientRobuxPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.titleText,
		bodyText = p2.messageText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = p1.buyRobux, text = p2.confirmButtonText }
				}
			}
		},
		middleContent = function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1:renderMiddle(p2)
		end,
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function InsufficientRobuxPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		titleText = "Feature.Catalog.Heading.InsufficientFunds",
		currentBalanceLabel = "Feature.Catalog.Label.CurrentBalance",
		messageText = "Feature.Catalog.Label.InsufficientFunds",
		confirmButtonText = "Feature.GameDetails.Action.BuyRobux",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

return (WithOverlayFocusHandlingModule((RoactServices.connect({ networking = RoactNetworkingModule })((RoactRoduxModule.connect(function(p1, _)
	return {
		userRobux = p1.UserRobux[p1.LocalUserId],
		screenSize = p1.ScreenSize
	}
end, function(Callback, p1)
	-- upvalues: OpenPurchaseRobuxPageModule (copy), PerformXboxUpsellModule (copy)
	return {
		openPurchaseRobuxPage = function()
			-- upvalues: Callback (copy), OpenPurchaseRobuxPageModule (upval), p1 (copy)
			return Callback(OpenPurchaseRobuxPageModule(nil, p1))
		end,
		openXboxUpsell = function(p2)
			-- upvalues: Callback (copy), PerformXboxUpsellModule (upval)
			Callback(PerformXboxUpsellModule(p2))
		end
	}
end)(InsufficientRobuxPrompt))))))