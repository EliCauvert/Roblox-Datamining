local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppPermissions = require(CorePackages.Workspace.Packages.RoactServiceTags).AppPermissions
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local UrlModule = require(Modules.LuaApp.Http.Url)
local IdentityVerificationModalContentModule = require(Modules.LuaApp.Components.Verification.IdentityVerification.IdentityVerificationModalContent)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local Images = UIBloxModule.App.ImageSet.Images
local AppPageModule = require(Modules.LuaApp.AppPage)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local PostUserOptInFunction = require(CorePackages.Workspace.Packages.VoiceChat).PostUserOptIn
local VoiceUpsellAnalyticsModule = require(Modules.LuaApp.Analytics.Events.VoiceUpsellAnalytics)
local FStringVoiceUpsellLayer = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringVoiceUpsellLayer()
local EnableVoiceModal = RoactModule.PureComponent:extend("EnableVoiceModal")
local PostAgeVerificationOptOutCheckboxModule = require(Modules.LuaApp.Http.Requests.PostAgeVerificationOptOutCheckbox)
local GetFFlagVoiceUpsellConsentCheckboxModule = require(Modules.LuaApp.Flags.GetFFlagVoiceUpsellConsentCheckbox)

function EnableVoiceModal.init(p1)
	-- upvalues: GetFFlagVoiceUpsellConsentCheckboxModule (copy), PostUserOptInFunction (copy), Logging (copy), PostAgeVerificationOptOutCheckboxModule (copy)
	p1.isMounted = false
	p1.state = { dontShowModalAgain = false }
	
	if GetFFlagVoiceUpsellConsentCheckboxModule() then
		p1.state.consentGiven = not p1.props.RequireExplicitVoiceConsent
	end
	function p1.enableVoice()
		-- upvalues: p1 (copy), PostUserOptInFunction (upval), Logging (upval)
		p1.props.voiceUpsellAnalytics.enableVoiceChatUpsell()
		PostUserOptInFunction(p1.props.networking, true, true):andThen(function(Result)
			-- upvalues: p1 (upval), Logging (upval)
			if Result then
				p1.props.launchGame()
				p1.props.closeOverlay()
				p1.props.setShowVoiceOptIn({ voiceEnabled = true, showVoiceOptInOverlay = false })
				
				return
			else
				p1.props.setNetworkingErrorToast()
				Logging.warn("Error getting UserOptIn. " .. tostring(Result))
			end
		end):catch(function()
			-- upvalues: p1 (upval), Logging (upval)
			p1.props.setNetworkingErrorToast()
			Logging.warn("Exception posting PostUserOptIn")
		end)
	end
	
	function p1.joinAnyways()
		-- upvalues: p1 (copy), GetFFlagVoiceUpsellConsentCheckboxModule (upval)
		p1.props.voiceUpsellAnalytics.joinWithoutVoiceChat(p1.state.dontShowModalAgain == true)
		
		if p1.state.dontShowModalAgain or GetFFlagVoiceUpsellConsentCheckboxModule() then
			p1.props.setShowVoiceOptIn({ voiceEnabled = false, showVoiceOptInOverlay = false })
		end
		p1.props.launchGame()
		p1.props.closeOverlay()
	end
	
	function p1.onOverlayOptOutCheckBoxActivated(DontShowModalAgain)
		-- upvalues: p1 (copy), PostAgeVerificationOptOutCheckboxModule (upval), Logging (upval)
		if p1.isMounted then
			PostAgeVerificationOptOutCheckboxModule(p1.props.networking, not DontShowModalAgain):catch(function(Err)
				-- upvalues: Logging (upval)
				Logging.warn("Error posting ShowOverlay for AgeVerificationOptOutCheckbox. " .. tostring(Err))
			end)
			p1:setState({ dontShowModalAgain = DontShowModalAgain })
		end
	end
	
	function p1.consentActivated()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ consentGiven = not p1.state.consentGiven })
		end
	end
	
	function p1.closeEnableVoiceModal()
		-- upvalues: GetFFlagVoiceUpsellConsentCheckboxModule (upval), p1 (copy)
		if GetFFlagVoiceUpsellConsentCheckboxModule() then
			p1.props.setShowVoiceOptIn({ showVoiceOptInOverlay = false })
		end
		p1.props.voiceUpsellAnalytics.closeEnableVoiceChatModal()
		p1.props.closeOverlay()
	end
end

function EnableVoiceModal.didMount(p1)
	-- upvalues: GetFFlagVoiceUpsellConsentCheckboxModule (copy), Logging (copy), FStringVoiceUpsellLayer (copy), IXPService (copy)
	p1.isMounted = true
	
	if GetFFlagVoiceUpsellConsentCheckboxModule() and p1.props.postUserSeenModal then
		p1.props.postUserSeenModal():andThen(function()
			-- upvalues: Logging (upval)
			Logging.warn("UserSeenModal request succeeded")
		end):catch(function(_)
			-- upvalues: Logging (upval)
			Logging.warn("UserSeenModal request failed")
		end)
	end
	if FStringVoiceUpsellLayer ~= "" then
		IXPService:LogUserLayerExposure(FStringVoiceUpsellLayer)
	end
	p1.props.voiceUpsellAnalytics.showEnableVoiceChatModal()
end

function EnableVoiceModal.willUnmount(p1)
	p1.isMounted = false
end

function EnableVoiceModal.render(p1)
	-- upvalues: WithLocalizationModule (copy), CryoModule (copy), WithStyleFunction (copy), RoactModule (copy), IdentityVerificationModalContentModule (copy), GetFFlagVoiceUpsellConsentCheckboxModule (copy), Images (copy), ButtonType (copy), PartialPageModal (copy)
	local ShowNewContent = p1.props.showNewContent
	
	return WithLocalizationModule(CryoModule.Dictionary.join({
		EnableVoiceChat = "Verification.Identity.Label.EnableVoiceChat",
		LearnMoreAboutVoiceRecording = "Verification.Identity.Label.LearnMoreAboutVoiceRecording",
		SkipVoiceChat = "Verification.Identity.Action.SkipVoiceChat",
		UsesVoiceChat = "Verification.Identity.Label.UsesVoiceChat",
		DontShowAgain = "Verification.Identity.Label.DontShowAgain",
		ConsentText = "Verification.Identity.Label.VoiceCollectionConsent",
		EnableVoiceContent1 = "Verification.Identity.Label.EnableVoiceChat1",
		EnableVoiceContent2 = "Verification.Identity.Label.EnableVoiceChat2",
		ClickToConsent = "Verification.Identity.Label.VoiceCollectionConsent2",
		LetsChat = "Verification.Identity.Heading.LetsChat",
		VoiceFAQ = "InGame.CommonUI.Label.FAQWebviewTitle"
	}, if ShowNewContent then {
		EnableVoiceChat = "Verification.Identity.Label.EnableMicrophone",
		SkipVoiceChat = "Verification.Identity.Label.JoinWithoutMicrophone",
		EnableVoiceContent1 = "Verification.Identity.Label.EnableChatWithVoice",
		LetsChat = "Verification.Identity.Heading.YourNewWayToChat"
	} else {}, {
		LetsChat = "Verification.Identity.Heading.V2LetsChat",
		ClickToConsent = "Verification.Identity.Label.V2ClickToConsent",
		EnableVoiceChat = "Verification.Identity.Label.V2EnableVoiceChat",
		EnableVoiceContent1 = "Verification.Identity.Label.V2EnableVoiceChat1",
		SkipVoiceChat = "Verification.Identity.Label.V2JoinWithout"
	}))(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), RoactModule (upval), IdentityVerificationModalContentModule (upval), CryoModule (upval), GetFFlagVoiceUpsellConsentCheckboxModule (upval), Images (upval), ButtonType (upval), ShowNewContent (copy), PartialPageModal (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), RoactModule (upval), IdentityVerificationModalContentModule (upval), CryoModule (upval), p2 (copy), GetFFlagVoiceUpsellConsentCheckboxModule (upval), Images (upval), ButtonType (upval), ShowNewContent (upval), PartialPageModal (upval)
			local Theme = p3.Theme
			local CaptionHeader = p3.Font.CaptionHeader
			local ScaledRelativeSize = CaptionHeader.RelativeSize * p3.Font.BaseSize
			local NoRequireExplicitVoiceConsent = not p1.props.RequireExplicitVoiceConsent
			local Buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = { onActivated = p1.joinAnyways, text = p2.SkipVoiceChat }
				},
				{
					buttonType = if ShowNewContent then ButtonType.Secondary else ButtonType.PrimarySystem,
					props = {
						isDisabled = if GetFFlagVoiceUpsellConsentCheckboxModule() then not p1.state.consentGiven else nil,
						onActivated = p1.enableVoice,
						text = p2.EnableVoiceChat
					}
				}
			}
			
			return RoactModule.createElement(PartialPageModal, {
				title = if GetFFlagVoiceUpsellConsentCheckboxModule() then p2.LetsChat else p2.EnableVoiceChat,
				screenSize = p1.props.screenSize,
				onCloseClicked = p1.closeEnableVoiceModal,
				buttonStackProps = Buttons and { buttonHeight = 48, buttons = Buttons },
				footerContent = function()
					-- upvalues: RoactModule (upval), Theme (copy), p2 (upval), p3 (copy), CaptionHeader (copy), ScaledRelativeSize (copy), p1 (upval)
					return RoactModule.createFragment({
						Divider = RoactModule.createElement("Frame", {
							BorderSizePixel = 0,
							LayoutOrder = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0, 16),
							BackgroundColor3 = Theme.Divider.Color,
							BackgroundTransparency = Theme.Divider.Transparency,
							Size = UDim2.new(1, 0, 0, 1)
						}),
						FooterText = RoactModule.createElement("TextButton", {
							Text = p2.LearnMoreAboutVoiceRecording or "Learn More about Voice Recording",
							AutomaticSize = Enum.AutomaticSize.X,
							Position = UDim2.new(0.5, 0, 0.5, 24),
							TextColor3 = p3.Theme.TextEmphasis.Color,
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundTransparency = 1,
							Font = CaptionHeader.Font,
							TextSize = ScaledRelativeSize,
							BorderSizePixel = 0,
							RichText = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(0, 0, 0, 20),
							[RoactModule.Event.Activated] = function()
								-- upvalues: p1 (upval), p2 (upval)
								p1.props.openVoiceFAQ(p2.VoiceFAQ or "Voice FAQ")
								p1.props.voiceUpsellAnalytics.learnMoreAboutVoiceRecordingUpsell()
							end
						})
					})
				end
			}, {
				OuterFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, 24),
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					}),
					Padding = RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 24)
					}),
					ContentFrame = RoactModule.createElement("Frame", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						Content = RoactModule.createElement(IdentityVerificationModalContentModule, CryoModule.Dictionary.join({
							centerCheckbox = true,
							MainText = { p2.UsesVoiceChat },
							LocalizedOptOutText = p2.DontShowAgain,
							onActivated = p1.onOverlayOptOutCheckBoxActivated,
							checkboxSelected = p1.state.dontShowModalAgain
						}, if GetFFlagVoiceUpsellConsentCheckboxModule() then {
							LocalizedOptOutText = false,
							centerCheckbox = false,
							showConsentCheckbox = true,
							MainText = {
								{
									content = p2.EnableVoiceContent1,
									image = Images["icons/graphic/voicechat_large"]
								},
								"",
								{
									content = p2.EnableVoiceContent2,
									image = Images["icons/graphic/hearts_large"]
								}
							},
							consentText = if NoRequireExplicitVoiceConsent then p2.ClickToConsent else p2.ConsentText,
							consentActivated = p1.consentActivated,
							consentSelected = p1.state.consentGiven,
							hideConsent = NoRequireExplicitVoiceConsent
						} else {}))
					})
				})
			})
		end)
	end)
end

return RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor, screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy), SetNetworkingErrorToastModule (copy), AppPageModule (copy), UrlModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		closeOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end,
		setNetworkingErrorToast = function(_)
			-- upvalues: Callback (copy), SetNetworkingErrorToastModule (upval)
			Callback(SetNetworkingErrorToastModule({ HttpError = Enum.HttpError.OK }))
		end,
		openVoiceFAQ = function(Title)
			-- upvalues: AppPageModule (upval), UrlModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = string.format("%sinfo/voice-faq", UrlModule.BASE_URL),
				extraProps = { title = Title }
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else Callback(NavigateDownModule(config))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	permissions = AppPermissions,
	voiceUpsellAnalytics = VoiceUpsellAnalyticsModule
})((RoactAppPolicy.connect(function(p1, _)
	return { showNewContent = p1.getGameInfoShowChatFeatures() }
end)(EnableVoiceModal)))))