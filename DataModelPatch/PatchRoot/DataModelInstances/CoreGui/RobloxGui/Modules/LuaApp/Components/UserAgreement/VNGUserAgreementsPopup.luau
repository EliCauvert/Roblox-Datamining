local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local LoggingProtocolModule = require(CorePackages.Workspace.Packages.LoggingProtocol)
local ToCPopupOccuranceModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.ToCPopupOccurance)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Checkbox = require(CorePackages.Packages.Foundation).Checkbox
local TModule = require(CorePackages.Packages.t)
local CloseVNGUserAgreementsPopupModule = require(Modules.LuaApp.Thunks.CloseVNGUserAgreementsPopup)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local AgreeUpdatedUserAgreementsModule = require(Modules.LuaApp.Http.Requests.AgreeUpdatedUserAgreements)
local UserAgreementErrorCodes = require(CorePackages.Workspace.Packages.UserAgreements).UserAgreementErrorCodes
local LogoutFromAllSessionsAndReauthenticateFunction = require(CorePackages.Workspace.Packages.AuthCommon).Thunks.LogoutFromAllSessionsAndReauthenticate
local FitFrameModule = require(CorePackages.Packages.FitFrame)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local VNGBalanceTransferPromptModule = require(Modules.LuaApp.Components.UserAgreement.VNGBalanceTransferPrompt)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local UserAgreementsList = require(CorePackages.Workspace.Packages.UserAgreements).UserAgreementsList
local FFlagVngLogoutGlobalAppSessionsOnConversion = require(CorePackages.Workspace.Packages.SharedFlags).FFlagVngLogoutGlobalAppSessionsOnConversion
local GetFFlagVngTOSRevisedEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagVngTOSRevisedEnabled
local FFlagAddReasonToEveryLogout = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddReasonToEveryLogout
local _Rect = Rect.new(8, 8, 9, 9)
local v1: number = if GetFFlagVngTOSRevisedEnabledFunction() then 16 else 48
local v2: number = if GetFFlagVngTOSRevisedEnabledFunction() then 24 else 48
local VNGUserAgreementsPopup = RoactModule.PureComponent:extend("VNGUserAgreementsPopup")
VNGUserAgreementsPopup.validateProps = TModule.strictInterface({
	agreements = TModule.array(TModule.strictInterface({
		id = TModule.string,
		agreementType = TModule.string,
		clientType = TModule.string,
		displayUrl = TModule.string,
		regulationType = TModule.string,
		action = TModule.optional(TModule.string)
	})),
	isSignup = TModule.boolean,
	formFactor = TModule.string,
	screenSize = TModule.Vector2,
	networking = TModule.callback,
	guiService = TModule.union(TModule.Instance, TModule.table),
	closePopup = TModule.callback,
	logout = TModule.callback,
	defaultChildRef = TModule.optional(TModule.any),
	focusController = TModule.optional(TModule.any),
	containerWidth = TModule.optional(TModule.integer),
	closeCentralOverlayThunk = TModule.optional(TModule.callback),
	agreementAccepted = TModule.optional(TModule.callback),
	agreementDeclined = TModule.optional(TModule.callback)
})

function VNGUserAgreementsPopup.init(p1)
	-- upvalues: RoactModule (copy), FFlagVngLogoutGlobalAppSessionsOnConversion (copy), LogoutFromAllSessionsAndReauthenticateFunction (copy), AgreeUpdatedUserAgreementsModule (copy), UserAgreementErrorCodes (copy)
	p1.buttonPressed, p1.updateButtonPressed = RoactModule.createBinding(false)
	p1.state = {
		agreementsChecked = false,
		acceptingAgreements = false,
		showBalanceTransferAlert = false,
		showError = false
	}
	
	function p1.SetAgreementsCheckBox(AgreementsChecked)
		-- upvalues: p1 (copy)
		p1:setState({ agreementsChecked = AgreementsChecked })
	end
	
	function p1.SetAgreementsCheckBoxByTextButton()
		-- upvalues: p1 (copy)
		p1:setState({ agreementsChecked = not p1.state.agreementsChecked })
	end
	
	function p1.xClose()
		-- upvalues: p1 (copy)
		if p1.props.isSignup then
			p1.props.closePopup()
			
			if p1.props.agreementDeclined then
				p1.props.agreementDeclined()
				
				return
			end
		else
			p1.props.logout(p1.props.networking, p1.props.guiService)
			p1.props.closePopup()
		end
	end
	
	function p1.tryAgree()
		-- upvalues: p1 (copy), FFlagVngLogoutGlobalAppSessionsOnConversion (upval), LogoutFromAllSessionsAndReauthenticateFunction (upval), AgreeUpdatedUserAgreementsModule (upval), UserAgreementErrorCodes (upval)
		if not p1.state.agreementsChecked then return end
		p1:setState({ showError = false, acceptingAgreements = true })
		local ClosePopupFunction: () -> () = p1.props.closePopup
		local Agreements = p1.props.agreements
		
		if p1.props.isSignup then
			ClosePopupFunction()
			
			if p1.props.agreementAccepted then
				p1.props.agreementAccepted(Agreements)
				
				return
			end
		else
			local Networking = p1.props.networking
			
			if FFlagVngLogoutGlobalAppSessionsOnConversion then
				local v3, _ = LogoutFromAllSessionsAndReauthenticateFunction(Networking):await()
				
				if not v3 then
					p1:setState({ acceptingAgreements = false, showError = true })
					
					return
				end
			end
			AgreeUpdatedUserAgreementsModule(Networking, Agreements, function(InvalidState)
				-- upvalues: UserAgreementErrorCodes (upval), p1 (upval), ClosePopupFunction (copy), Agreements (copy)
				if InvalidState == UserAgreementErrorCodes.InvalidState then
					p1:setState({ showBalanceTransferAlert = true })
				elseif InvalidState == UserAgreementErrorCodes.NoError then
					ClosePopupFunction()
					
					if p1.props.agreementAccepted then
						p1.props.agreementAccepted(Agreements)
					end
				else
					p1:setState({ showError = true })
				end
				p1:setState({ acceptingAgreements = false })
			end)
		end
	end
end

function VNGUserAgreementsPopup:getLayoutInfo(IsFormFactorMatch, Theme)
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

function VNGUserAgreementsPopup.renderBalanceTransferPrompt(p1, _)
	-- upvalues: RoactModule (copy), VNGBalanceTransferPromptModule (copy)
	return RoactModule.createElement(VNGBalanceTransferPromptModule, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = p1.props.screenSize,
		doneActivated = function()
			-- upvalues: p1 (copy)
			p1:setState({ showBalanceTransferAlert = false })
		end
	})
end

function VNGUserAgreementsPopup.renderWithProviders(p1, p2, p3)
	-- upvalues: FormFactor (copy), LoggingProtocolModule (copy), ToCPopupOccuranceModule (copy), RoactModule (copy), FitFrameModule (copy), IconButton (copy), Images (copy), StyledTextLabel (copy), v1 (copy), v2 (copy), Checkbox (copy), UserAgreementsList (copy), GetFFlagVngTOSRevisedEnabledFunction (copy), Button (copy), ButtonType (copy)
	local _Font = p3.Font
	local Theme = p3.Theme
	local ScreenSize = p1.props.screenSize
	local IsFormFactorMatch = p1.props.formFactor == FormFactor.WIDE
	local LayoutInfo, LayoutInfo2 = p1:getLayoutInfo(IsFormFactorMatch, Theme)
	local Title = p2.title
	local Message = p2.message
	local AgreeButton = p2.agreeButton
	local Checkbox1 = p2.checkbox
	local ErrorMessage = p2.errorMessage
	LoggingProtocolModule.default:logRobloxTelemetryEvent(ToCPopupOccuranceModule)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, ScreenSize.Y)
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
					RoactModule.createElement(IconButton, {
						anchorPoint = Vector2.new(0, 0.5),
						size = UDim2.new(0, 36, 0, 36),
						position = UDim2.new(0, 8, 0.5, 0),
						icon = Images["icons/navigation/close"],
						onActivated = p1.xClose
					}),
					TitleText = RoactModule.createElement(StyledTextLabel, {
						size = UDim2.new(1, 0, 0, 36),
						text = Title,
						fontStyle = _Font.Header1,
						colorStyle = Theme.TextEmphasis,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Bottom,
						textTruncate = Enum.TextTruncate.AtEnd
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
						PaddingTop = UDim.new(0, if IsFormFactorMatch then 24 else v1),
						PaddingRight = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, if IsFormFactorMatch then 12 else v2),
						PaddingLeft = UDim.new(0, 24)
					}),
					MessageText = RoactModule.createElement(StyledTextLabel, {
						size = UDim2.new(1, 0, 0, 0),
						text = Message,
						fontStyle = _Font.Body,
						colorStyle = Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Left,
						textYAlignment = Enum.TextYAlignment.Top,
						textTruncate = Enum.TextTruncate.None,
						automaticSize = Enum.AutomaticSize.Y
					})
				}),
				AgreementsContainer = RoactModule.createElement("Frame", {
					LayoutOrder = 3,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 0),
						PaddingRight = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 24)
					}),
					CheckBox = RoactModule.createElement(Checkbox, {
						label = "",
						isChecked = p1.state.agreementsChecked,
						onActivated = p1.SetAgreementsCheckBox
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
						[RoactModule.Event.Activated] = p1.SetAgreementsCheckBoxByTextButton
					})
				}),
				SecondDivider = RoactModule.createElement("Frame", {
					LayoutOrder = 4,
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
					LayoutOrder = 5,
					agreements = p1.props.agreements,
					margin = FitFrameModule.Rect.quad(0, 24, 24, 24),
					verticalSpaceOffset = if GetFFlagVngTOSRevisedEnabledFunction() and not IsFormFactorMatch then 80 else nil,
					useScrollableFrame = GetFFlagVngTOSRevisedEnabledFunction() and not IsFormFactorMatch or nil
				})
			}),
			AgreeZone = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				ZIndex = 99,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 1, -10),
				AnchorPoint = Vector2.new(0.5, 1)
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 0),
					PaddingRight = UDim.new(0, 24),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 24)
				}),
				RoactModule.createElement(FitFrameModule.FitFrameVertical, { BackgroundTransparency = 1, width = UDim.new(1, 0) }, {
					ErrorLabel = p1.state.showError and RoactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = ErrorMessage,
						Font = _Font.Body.Font,
						TextSize = _Font.BaseSize * _Font.Body.RelativeSize * 0.8,
						TextColor3 = Theme.Alert.Color,
						TextTransparency = Theme.TextEmphasis.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left
					}) or nil,
					AgreeButton = RoactModule.createElement(Button, {
						layoutOrder = 2,
						buttonType = ButtonType.PrimarySystem,
						size = UDim2.new(1, 0, 0, 48),
						anchorPoint = Vector2.new(0, 0),
						isDisabled = p1.state.acceptingAgreements or not p1.state.agreementsChecked,
						text = AgreeButton,
						fontStyle = _Font.SubHeader1,
						onActivated = p1.tryAgree
					})
				})
			})
		})
	})
end

function VNGUserAgreementsPopup.render(p1)
	-- upvalues: WithLocalizationModule (copy), GetFFlagVngTOSRevisedEnabledFunction (copy), WithStyleFunction (copy)
	return WithLocalizationModule({
		title = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService",
		agreeButton = "CommonUI.UserAgreements.Popup.Agree2",
		errorMessage = "CommonUI.UserAgreements.Popup.FailAndRetryMessage",
		message = if p1.props.isSignup then if GetFFlagVngTOSRevisedEnabledFunction() then "CommonUI.UserAgreements.Popup.VNSignupMessage" else "CommonUI.UserAgreements.Popup.SignupMessage" else "CommonUI.UserAgreements.Popup.ConvertToVNMessage",
		checkbox = if GetFFlagVngTOSRevisedEnabledFunction() then if p1.props.isSignup then "CommonUI.UserAgreements.Popup.VNSignupCheckboxMessage" else "CommonUI.UserAgreements.Popup.ConvertToVNCheckboxMessage" else "CommonUI.UserAgreements.Popup.CheckboxMessage"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return if p1.state.showBalanceTransferAlert then p1:renderBalanceTransferPrompt(p2) else p1:renderWithProviders(p2, p3)
		end)
	end)
end

return (RoactServices.connect({
	networking = RoactNetworkingModule,
	guiService = AppGuiService
})((RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.ScreenSize, formFactor = p1.FormFactor }
end, function(Callback)
	-- upvalues: CloseVNGUserAgreementsPopupModule (copy), FFlagAddReasonToEveryLogout (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy)
	return {
		closePopup = function()
			-- upvalues: Callback (copy), CloseVNGUserAgreementsPopupModule (upval)
			Callback(CloseVNGUserAgreementsPopupModule())
		end,
		logout = function(p1, p2)
			-- upvalues: FFlagAddReasonToEveryLogout (upval), Callback (copy), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			if FFlagAddReasonToEveryLogout then
				Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.VngUserAgreement))
				
				return
			else
				Callback(LogoutModule(p1, p2))
			end
		end
	}
end)(VNGUserAgreementsPopup))))