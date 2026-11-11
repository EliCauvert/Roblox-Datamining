local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local HomePageUpsellCard = RoactModule.PureComponent:extend("HomePageUpsellCard")

function HomePageUpsellCard.didMount(p1)
	p1.props.authEventAnalytics.reportModalShown("homepageUpsellCard", "homepage")
end

function HomePageUpsellCard.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), FormFactor (copy), Text (copy), RoactModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), WithLocalizationModule (upval), FormFactor (upval), Text (upval), RoactModule (upval), Button (upval), ButtonVariant (upval), ButtonSize (upval)
		local Theme = p2.Theme
		local Color = Theme.TextEmphasis.Color
		local HeaderFont = p2.Font.Header2.Font
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize
		local FormFactor1 = p1.props.formFactor
		
		return WithLocalizationModule({
			addButtonText = "Feature.ContactMethodUpsell.Action.SecureYourAccount",
			addTitleText = "Feature.ContactMethodUpsell.Description.HomePageUpsellCardAddPhoneText"
		})(function(p3)
			-- upvalues: FormFactor1 (copy), FormFactor (upval), Text (upval), p2 (copy), RoactModule (upval), Theme (copy), HeaderFont (copy), Color (copy), ScaledBaseSize (copy), Button (upval), ButtonVariant (upval), ButtonSize (upval), p1 (upval)
			local _UDim2 = UDim2.new(1, 0, 0, 0)
			local Offset = 12
			local Vertical = Enum.FillDirection.Vertical
			
			if FormFactor1 == FormFactor.WIDE then
				Offset = 20
				Vertical = Enum.FillDirection.Horizontal
				_UDim2 = UDim2.new(1, -Text.GetTextWidth(p3.addButtonText, p2.Font.CaptionHeader.Font, p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize) - 30, 0, 0)
			end
			return RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 0,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundColor3 = Theme.BackgroundUIDefault.Color,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(650, 1e999) }),
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, Offset)
				}),
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) }),
				UIStroke = RoactModule.createElement("UIStroke", {
					Thickness = 1,
					Transparency = 0.7,
					Color = Theme.SystemPrimaryDefault.Color
				}),
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12),
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12)
				}),
				TitleTextLabel = RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					TextWrapped = true,
					BackgroundTransparency = 0,
					Size = _UDim2,
					Font = HeaderFont,
					Text = p3.addTitleText,
					TextColor3 = Color,
					TextSize = ScaledBaseSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Theme.BackgroundUIDefault.Color,
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				CallToActionButton = RoactModule.createElement(Button, {
					LayoutOrder = 2,
					variant = ButtonVariant.SubEmphasis,
					size = ButtonSize.Medium,
					text = p3.addButtonText,
					onActivated = p1.props.buttonClickCallback,
					width = UDim.new(1, 0)
				})
			})
		end)
	end)
end

return (RoactServices.connect({ authEventAnalytics = RoactAnalyticsAuthEventsModule })((RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor }
end)(HomePageUpsellCard))))