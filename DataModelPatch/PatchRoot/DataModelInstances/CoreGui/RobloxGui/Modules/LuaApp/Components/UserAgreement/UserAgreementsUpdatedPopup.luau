local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local ToCPopupOccuranceModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.ToCPopupOccurance)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Checkbox = require(CorePackages.Packages.Foundation).Checkbox
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local CloseUserAgreementsUpdatedPopupModule = require(Modules.LuaApp.Thunks.CloseUserAgreementsUpdatedPopup)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AgreeUpdatedUserAgreementsModule = require(Modules.LuaApp.Http.Requests.AgreeUpdatedUserAgreements)
local PromotionalEmailsPreferenceModule = require(Modules.LuaApp.Http.Requests.PromotionalEmailsPreference)
local FitFrameModule = require(CorePackages.Packages.FitFrame)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UserAgreementsList = require(CorePackages.Workspace.Packages.UserAgreements).UserAgreementsList
local UserAgreementsDefaultSelection = game:DefineFastFlag("UserAgreementsDefaultSelection", false)
local GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppPromotionalEmailsCheckboxEnabled)
local _Rect = Rect.new(8, 8, 9, 9)
local UserAgreementsUpdatedPopup = RoactModule.PureComponent:extend("UserAgreementsUpdatedPopup")
UserAgreementsUpdatedPopup.validateProps = TModule.strictInterface({
	agreements = TModule.array(TModule.strictInterface({
		id = TModule.string,
		agreementType = TModule.string,
		clientType = TModule.string,
		displayUrl = TModule.string,
		regulationType = TModule.string
	})),
	formFactor = TModule.string,
	screenSize = TModule.Vector2,
	networking = TModule.callback,
	closePopup = TModule.callback,
	defaultChildRef = TModule.optional(TModule.any),
	focusController = TModule.optional(TModule.any),
	containerWidth = TModule.optional(TModule.integer),
	closeCentralOverlayThunk = TModule.optional(TModule.callback),
	checkboxEnabled = TModule.optional(TModule.boolean),
	optInByDefault = TModule.optional(TModule.boolean),
	defaultFocusRef = if UserAgreementsDefaultSelection then TModule.callback else nil,
	containerRef = if UserAgreementsDefaultSelection then TModule.callback else nil
})

function UserAgreementsUpdatedPopup.init(p1)
	-- upvalues: GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule (copy), AgreeUpdatedUserAgreementsModule (copy), PromotionalEmailsPreferenceModule (copy)
	if GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule() then
		p1.state = {
			promoEmailsDisplayed = p1.props.checkboxEnabled,
			promoEmailsChecked = p1.props.optInByDefault
		}
		
		function p1.SetPromoEmailsCheckbox(PromoEmailsChecked)
			-- upvalues: p1 (copy)
			p1:setState({ promoEmailsChecked = PromoEmailsChecked })
		end
		
		function p1.SetPromoEmailsCheckboxByTextButton()
			-- upvalues: p1 (copy)
			p1:setState({ promoEmailsChecked = not p1.state.promoEmailsChecked })
		end
	end
	function p1.agreeAndClosePopup()
		-- upvalues: p1 (copy), AgreeUpdatedUserAgreementsModule (upval), GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule (upval), PromotionalEmailsPreferenceModule (upval)
		local Networking = p1.props.networking
		local ClosePopupFunction: () -> () = p1.props.closePopup
		AgreeUpdatedUserAgreementsModule(Networking, p1.props.agreements, function(_) end)
		
		if GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule() then
			PromotionalEmailsPreferenceModule(Networking, p1.state.promoEmailsChecked)
		end
		ClosePopupFunction()
	end
end

function UserAgreementsUpdatedPopup:getLayoutInfo(IsFormFactorMatch, Theme)
	-- upvalues: DEPRECATEDImageSetLabelModule (copy), _Rect (copy)
	if IsFormFactorMatch then
		return DEPRECATEDImageSetLabelModule, {
			BackgroundTransparency = 1,
			Image = "LuaApp/buttons/buttonFill",
			BorderSizePixel = 0,
			Size = UDim2.new(0, 540, 0, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageColor3 = Theme.BackgroundUIDefault.Color,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = _Rect,
			AutomaticSize = Enum.AutomaticSize.Y
		}
	else
		return "Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color
		}
	end
end

function UserAgreementsUpdatedPopup.renderWithProviders(p1, p2, p3)
	-- upvalues: FormFactor (copy), GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule (copy), LoggingProtocolModule (copy), ToCPopupOccuranceModule (copy), RoactModule (copy), UserAgreementsDefaultSelection (copy), FitFrameModule (copy), UserAgreementsList (copy), Checkbox (copy), Button (copy), ButtonType (copy)
	local _Font = p3.Font
	local Theme = p3.Theme
	local ScreenSize = p1.props.screenSize
	local Agreements = p1.props.agreements
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	local LayoutInfo, LayoutInfo2 = p1:getLayoutInfo(IsFormFactorMatch, Theme)
	local Title = p2.title
	local Message = p2.message
	local AgreeButton = p2.agreeButton
	local Checkbox1 = if GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule() then p2.checkbox else nil
	LoggingProtocolModule.default:logRobloxTelemetryEvent(ToCPopupOccuranceModule)
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, ScreenSize.Y),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[RoactModule.Ref] = if UserAgreementsDefaultSelection then p1.props.containerRef else nil
	}, {
		Layout = RoactModule.createElement(LayoutInfo, LayoutInfo2, {
			ListLayout = IsFormFactorMatch and RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if IsFormFactorMatch then 0 else 60),
				PaddingBottom = UDim.new(0, if IsFormFactorMatch then 24 else 48)
			}),
			Content = RoactModule.createElement(FitFrameModule.FitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = UDim.new(1, 0)
			}, {
				Title = RoactModule.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 48)
				}, {
					TitleText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 28),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Text = Title,
						Font = _Font.Header1.Font,
						TextSize = _Font.BaseSize * _Font.Header1.RelativeSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextXAlignment = Enum.TextXAlignment.Center
					}),
					Divider = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 1),
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = Theme.Divider.Color,
						BackgroundTransparency = Theme.Divider.Transparency
					})
				}),
				Message = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, if IsFormFactorMatch then 24 else 48),
						PaddingRight = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, if IsFormFactorMatch then 12 else 48),
						PaddingLeft = UDim.new(0, 24)
					}),
					MessageText = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = Message,
						Font = _Font.Body.Font,
						TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Center
					})
				}),
				SecondDivider = RoactModule.createElement("Frame", {
					LayoutOrder = 3,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 0),
						PaddingRight = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 0),
						PaddingLeft = UDim.new(0, 24)
					}),
					Divider = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 1),
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = Theme.Divider.Color,
						BackgroundTransparency = Theme.Divider.Transparency
					})
				}),
				AgreementsList = RoactModule.createElement(UserAgreementsList, {
					LayoutOrder = 4,
					agreements = Agreements,
					margin = FitFrameModule.Rect.quad(0, 24, 24, 24)
				}),
				PromotionalEmailsContainer = if GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule() and p1.state.promoEmailsDisplayed then RoactModule.createElement("Frame", {
					LayoutOrder = 5,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 0),
						PaddingRight = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 48),
						PaddingLeft = UDim.new(0, 24)
					}),
					CheckBox = RoactModule.createElement(Checkbox, {
						label = "",
						isChecked = p1.state.promoEmailsChecked,
						onActivated = p1.SetPromoEmailsCheckbox
					}),
					MessageButton = RoactModule.createElement("TextButton", {
						Size = UDim2.new(1, -34, 1, 0),
						Position = UDim2.new(0, 34, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Text = Checkbox1,
						Font = _Font.Body.Font,
						TextSize = _Font.BaseSize * _Font.Body.RelativeSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextWrapped = true,
						[RoactModule.Event.Activated] = p1.SetPromoEmailsCheckboxByTextButton
					})
				}) else nil
			}),
			AgreeButton = RoactModule.createElement(Button, {
				buttonType = ButtonType.PrimarySystem,
				size = UDim2.new(1, -48, 0, 48),
				position = UDim2.new(0.5, 0, 1, -10),
				anchorPoint = Vector2.new(0.5, 1),
				layoutOrder = 2,
				text = AgreeButton,
				fontStyle = _Font.SubHeader1,
				onActivated = p1.agreeAndClosePopup,
				[RoactModule.Ref] = if UserAgreementsDefaultSelection then p1.props.defaultFocusRef else nil
			})
		})
	})
end

function UserAgreementsUpdatedPopup.render(p1)
	-- upvalues: WithLocalizationModule (copy), GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule (copy), WithStyleFunction (copy)
	return WithLocalizationModule({
		title = "CommonUI.UserAgreements.Popup.Title",
		message = "CommonUI.UserAgreements.Popup.Message",
		agreeButton = "CommonUI.UserAgreements.Popup.Agree",
		checkbox = if GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule() then "CommonUI.UserAgreements.Popup.PromotionalEmailsCheckbox" else nil
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

local v1 = RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.ScreenSize, formFactor = p1.FormFactor }
end, function(Callback)
	-- upvalues: CloseUserAgreementsUpdatedPopupModule (copy)
	return {
		closePopup = function()
			-- upvalues: Callback (copy), CloseUserAgreementsUpdatedPopupModule (upval)
			Callback(CloseUserAgreementsUpdatedPopupModule())
		end
	}
end)(UserAgreementsUpdatedPopup)

if GetFFlagLuaAppPromotionalEmailsCheckboxEnabledModule() then
	v1 = RoactAppPolicy.connect(function(p1, _)
		return {
			checkboxEnabled = p1.getPromotionalEmailsCheckboxEnabled(),
			optInByDefault = p1.getPromotionalEmailsOptInByDefault()
		}
	end)(v1)
end
local v2 = RoactServices.connect({ networking = RoactNetworkingModule })(v1)

return if UserAgreementsDefaultSelection then function(p1)
	-- upvalues: ReactFocusNavigationModule (copy), RoactModule (copy), v2 (ref), CryoModule (copy)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = ReactFocusNavigationModule.useDefaultFocusBehavior()
	
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p1, {
		defaultFocusRef = UseDefaultFocusBehaviorResult,
		containerRef = UseDefaultFocusBehaviorResult2
	}))
end else v2