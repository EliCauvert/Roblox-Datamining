local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local RoactModule = require(CorePackages.Packages.Roact)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local UseEffectFunction = require(CorePackages.Packages.React).useEffect
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local NavigateBackFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local SetHomePageUpsellCardVariationFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.SetHomePageUpsellCardVariation
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GenericTextButtonModule = require(Modules.LuaApp.Components.GenericTextButton)
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local OpenEmailUpsellModalModule = require(Modules.LuaApp.Thunks.Verification.OpenEmailUpsellModal)
local OpenPhoneUpsellModalModule = require(Modules.LuaApp.Thunks.Verification.OpenPhoneUpsellModal)
local UseNavigateToDiscoverabilityModalModule = require(Modules.LuaApp.Components.DiscoverabilityModal.useNavigateToDiscoverabilityModal)
local EntryPoints = require(CorePackages.Workspace.Packages.DiscoverabilityModal).Analytics.EntryPoints
local OptionalContactMethodUpsellTypesModule = require(Modules.LuaApp.Enum.OptionalContactMethodUpsellTypes)
local GetFFlagEnableHomePageEmailUpsellCardModule = require(Modules.LuaApp.Flags.GetFFlagEnableHomePageEmailUpsellCard)
local GetFFlagEnableUpdateAddPhoneDescriptionTextExperimentModule = require(Modules.LuaApp.Flags.GetFFlagEnableUpdateAddPhoneDescriptionTextExperiment)
local GetFFlagRemovePhoneUpsellWebviewModule = require(Modules.LuaApp.Flags.GetFFlagRemovePhoneUpsellWebview)
local GetFFlagRemoveDiscoverabilityModalModule = require(Modules.LuaApp.Flags.GetFFlagRemoveDiscoverabilityModal)
local GetFFlagEnableVoiceTrialUpsellCardModule = require(Modules.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard)
local FixBannerButtonSize = game:DefineFastFlag("FixBannerButtonSize", false)
local FFlagHomePhoneVerificationUpsellNewCopy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagHomePhoneVerificationUpsellNewCopy
local IconsGraphicPasscodeLarge = Images["icons/graphic/passcode_large"]
local IconsControlsMicrophone = Images["icons/controls/microphone"]
local IconsControlsHeadphone = if GetFFlagEnableVoiceTrialUpsellCardModule() then Images["icons/controls/headphone"] else nil
local VoiceChatHelpUrl = if GetFFlagEnableVoiceTrialUpsellCardModule() then game:DefineFastString("VoiceChatHelpUrl", "https://en.help.roblox.com/hc/en-us/articles/4405807645972-Voice-Chat") else nil

local function noOpt() end

return function(p1)
	-- upvalues: OptionalContactMethodUpsellTypesModule (copy), GetFFlagEnableVoiceTrialUpsellCardModule (copy), UseRoactServiceFunction (copy), RoactAnalyticsAuthEventsModule (copy), UseEffectFunction (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), UseStyleFunction (copy), GetFFlagRemoveDiscoverabilityModalModule (copy), UseNavigateToDiscoverabilityModalModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), UseDispatchFunction (copy), SetHomePageUpsellCardVariationFunction (copy), OpenEmailUpsellModalModule (copy), OpenPhoneUpsellModalModule (copy), noOpt (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), NavigateBackFunction (copy), EventStreamConstantsModule (copy), IXPService (copy), FFlagHomePhoneVerificationUpsellNewCopy (copy), GetFFlagEnableUpdateAddPhoneDescriptionTextExperimentModule (copy), GetFFlagRemovePhoneUpsellWebviewModule (copy), EntryPoints (copy), AppPage (copy), IconsGraphicPasscodeLarge (copy), GetFFlagEnableHomePageEmailUpsellCardModule (copy), IconsControlsMicrophone (copy), IconsControlsHeadphone (copy), VoiceChatHelpUrl (copy), FormFactor (copy), Text (copy), RoactModule (copy), ImageSetLabel (copy), GenericTextButtonModule (copy), Button (copy), ButtonType (copy), FixBannerButtonSize (copy)
	local v1 = "phone"
	local ContactMethodPhoneNumberEmailHorizontalLayout = ""
	local TitleTextOverride = nil
	local BodyTextOverride = nil
	
	if p1.upsellCardVariation then
		ContactMethodPhoneNumberEmailHorizontalLayout = p1.upsellCardVariation.upsellCardType
		
		if p1.upsellCardVariation.titleTextOverride ~= "" and p1.upsellCardVariation.bodyTextOverride ~= "" then
			TitleTextOverride = p1.upsellCardVariation.titleTextOverride
			BodyTextOverride = p1.upsellCardVariation.bodyTextOverride
		end
	end
	if ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailHorizontalLayout or ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailVerticalLayout then
		v1 = "emailOrPhone"
	elseif GetFFlagEnableVoiceTrialUpsellCardModule() and ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.VoiceWithoutPvTrial then
		v1 = "voiceTrial"
	end
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalyticsAuthEventsModule)
	UseEffectFunction(function()
		-- upvalues: UseRoactServiceResult (copy), v1 (ref)
		UseRoactServiceResult.reportModalShownWithSection("verificationUpsell", "homepage", v1)
	end, {})
	local UseUserExperimentResult, UseUserExperimentResult2 = UseUserExperimentFunction({ AppUserLayers.PhoneVerificationEntryLayer }, function(p2)
		-- upvalues: AppUserLayers (upval)
		local v2 = p2[AppUserLayers.PhoneVerificationEntryLayer] or {}
		
		return v2.ShouldUseLuaPhoneVerificationFlow, v2.ShouldUseUpdatedPhoneVerificationText
	end)
	local UseStyleResult = UseStyleFunction()
	local UseNavigateToDiscoverabilityModalModuleResult = if GetFFlagRemoveDiscoverabilityModalModule() then nil else UseNavigateToDiscoverabilityModalModule()
	local UseLocalizationResult = UseLocalizationFunction({
		addButtonText = "Feature.ContactMethodUpsell.Action.AddPhoneNumber",
		bodyText = "Feature.ContactMethodUpsell.Label.RecoverYourAccount",
		titleText = "Feature.ContactMethodUpsell.Title.HomePageUpsellCardLockOutTitle",
		addEmailInstead = "Feature.ContactUpsell.Action.AddEmailInstead",
		addPhone = "Feature.ContactMethodUpsell.Label.AddPhone",
		addEmail = "Feature.ContactMethodUpsell.Label.AddEmail",
		continueButton = if GetFFlagEnableVoiceTrialUpsellCardModule() then "Feature.ContactMethodUpsell.Action.Continue" else nil,
		learnMore = if GetFFlagEnableVoiceTrialUpsellCardModule() then "Feature.ContactMethodUpsell.Action.LearnMore" else nil
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.FormFactor
	end)
	local UseDispatchResult = UseDispatchFunction()
	
	local function OnSuccessCallback()
		-- upvalues: UseDispatchResult (copy), SetHomePageUpsellCardVariationFunction (upval)
		return UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
	end
	
	local function _(SuccessCallback)
		-- upvalues: UseDispatchResult (copy), OpenEmailUpsellModalModule (upval)
		return UseDispatchResult(OpenEmailUpsellModalModule({
			addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail",
			addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail",
			isEmailModalCalledFromHomePage = true,
			eventContext = "verificationUpsell",
			origin = "homepage",
			section = "addEmail",
			successCallback = SuccessCallback
		}))
	end
	
	local _ = function(OnSuccess, AddPhoneDescriptionKey, p2)
		-- upvalues: UseDispatchResult (copy), OpenPhoneUpsellModalModule (upval), noOpt (upval)
		return UseDispatchResult(OpenPhoneUpsellModalModule({
			eventContext = "verificationUpsell",
			origin = "homepage",
			shouldAutofillAndroidPhoneNumberAtLaunch = true,
			onSuccess = OnSuccess,
			onCancelled = noOpt,
			onAbandoned = noOpt,
			addPhoneDescriptionKey = AddPhoneDescriptionKey
		}, p2))
	end
	
	local _ = function(p2)
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(p2))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(p2))
		end
	end
	
	local OnClose = if GetFFlagEnableVoiceTrialUpsellCardModule() then function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back()
			
			return
		else
			UseDispatchResult(NavigateBackFunction())
		end
	end else nil
	local Theme = UseStyleResult.Theme
	local Color = Theme.TextEmphasis.Color
	local UseStyleResultFont = UseStyleResult.Font
	local HeaderFont = UseStyleResultFont.Header2.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize
	local Color1 = Theme.TextDefault.Color
	local CaptionBodyFont = UseStyleResultFont.CaptionBody.Font
	local ScaledBaseSize1 = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local Top = Enum.VerticalAlignment.Top
	local Horizontal = Enum.FillDirection.Horizontal
	local Offset2 = 10
	local LayoutOrder = 1
	local LayoutOrder1 = 2
	
	local function OnActivated()
		-- upvalues: UseRoactServiceResult (copy), EventStreamConstantsModule (upval), v1 (ref), OnSuccessCallback (copy), UseDispatchResult (copy), OpenEmailUpsellModalModule (upval)
		UseRoactServiceResult.reportButtonClickedWithSectionAndOrigin(EventStreamConstantsModule.Context.HomepageUpsellCard, EventStreamConstantsModule.Button.Email, v1, "homepage")
		local _ = UseDispatchResult(OpenEmailUpsellModalModule({
			addEmailOver13TextKey = "Feature.ContactMethodUpsell.Label.PleaseAddEmail",
			addEmailTitleKey = "Feature.AccountSecurityPrompt.Action.AbortDismissForeverAddEmail",
			isEmailModalCalledFromHomePage = true,
			eventContext = "verificationUpsell",
			origin = "homepage",
			section = "addEmail",
			successCallback = OnSuccessCallback
		}))
	end
	
	local AddPhoneDescriptionKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply"
	
	local function OnActivated1()
		-- upvalues: UseRoactServiceResult (copy), EventStreamConstantsModule (upval), v1 (ref), IXPService (upval), AppUserLayers (upval), FFlagHomePhoneVerificationUpsellNewCopy (upval), AddPhoneDescriptionKey (ref), GetFFlagEnableUpdateAddPhoneDescriptionTextExperimentModule (upval), UseUserExperimentResult2 (copy), ContactMethodPhoneNumberEmailHorizontalLayout (ref), OptionalContactMethodUpsellTypesModule (upval), GetFFlagRemovePhoneUpsellWebviewModule (upval), GetFFlagRemoveDiscoverabilityModalModule (upval), UseDispatchResult (copy), SetHomePageUpsellCardVariationFunction (upval), UseNavigateToDiscoverabilityModalModuleResult (copy), noOpt (upval), EntryPoints (upval), OpenPhoneUpsellModalModule (upval), UseUserExperimentResult (copy), AppPage (upval), OnSuccessCallback (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		UseRoactServiceResult.reportButtonClickedWithSectionAndOrigin(EventStreamConstantsModule.Context.HomepageUpsellCard, EventStreamConstantsModule.Button.Phone, v1, "homepage")
		IXPService:LogUserLayerExposure(AppUserLayers.PhoneVerificationEntryLayer)
		
		if FFlagHomePhoneVerificationUpsellNewCopy then
			AddPhoneDescriptionKey = "Feature.AccountSettings.Description.AddPhoneNumber"
		elseif GetFFlagEnableUpdateAddPhoneDescriptionTextExperimentModule() and UseUserExperimentResult2 then
			AddPhoneDescriptionKey = "Feature.VerificationUpsell.Description.AddPhoneBody"
		end
		local IsContactMethodPhoneNumberEmailHorizontalLayoutMatch = ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberVoiceOptIn or nil
		
		if GetFFlagRemovePhoneUpsellWebviewModule() then
			local _ = UseDispatchResult(OpenPhoneUpsellModalModule({
				eventContext = "verificationUpsell",
				origin = "homepage",
				shouldAutofillAndroidPhoneNumberAtLaunch = true,
				onSuccess = function()
					-- upvalues: GetFFlagRemoveDiscoverabilityModalModule (upval), UseDispatchResult (upval), SetHomePageUpsellCardVariationFunction (upval), UseNavigateToDiscoverabilityModalModuleResult (upval), noOpt (upval), EntryPoints (upval)
					if GetFFlagRemoveDiscoverabilityModalModule() then
						local _ = UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
						
						return
					else
						local _ = UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
						UseNavigateToDiscoverabilityModalModuleResult({
							isStandaloneDiscoverabilityModal = true,
							navigateOnActivated = noOpt,
							entryPoint = EntryPoints.HomePage
						})
					end
				end,
				onCancelled = noOpt,
				onAbandoned = noOpt,
				addPhoneDescriptionKey = AddPhoneDescriptionKey
			}, IsContactMethodPhoneNumberEmailHorizontalLayoutMatch))
			
			return
		end
		if UseUserExperimentResult then
			local _ = UseDispatchResult(OpenPhoneUpsellModalModule({
				eventContext = "verificationUpsell",
				origin = "homepage",
				shouldAutofillAndroidPhoneNumberAtLaunch = true,
				onSuccess = function()
					-- upvalues: GetFFlagRemoveDiscoverabilityModalModule (upval), UseDispatchResult (upval), SetHomePageUpsellCardVariationFunction (upval), UseNavigateToDiscoverabilityModalModuleResult (upval), noOpt (upval), EntryPoints (upval)
					if GetFFlagRemoveDiscoverabilityModalModule() then
						local _ = UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
						
						return
					else
						local _ = UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
						UseNavigateToDiscoverabilityModalModuleResult({
							isStandaloneDiscoverabilityModal = true,
							navigateOnActivated = noOpt,
							entryPoint = EntryPoints.HomePage
						})
					end
				end,
				onCancelled = noOpt,
				onAbandoned = noOpt,
				addPhoneDescriptionKey = AddPhoneDescriptionKey
			}, IsContactMethodPhoneNumberEmailHorizontalLayoutMatch))
			
			return
		end
		local config = {
			name = AppPage.PhoneVerification,
			extraProps = { onSuccessCallback = OnSuccessCallback }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end
	
	local IconsGraphicPasscodeLarge1 = if GetFFlagEnableVoiceTrialUpsellCardModule() then IconsGraphicPasscodeLarge else nil
	local AddButtonText = nil
	local NoOpt: () -> () = if GetFFlagEnableVoiceTrialUpsellCardModule then noOpt else nil
	local AddEmail = nil
	local NoOpt1: () -> () = if GetFFlagEnableVoiceTrialUpsellCardModule then noOpt else nil
	
	if GetFFlagEnableVoiceTrialUpsellCardModule() then
		if GetFFlagEnableHomePageEmailUpsellCardModule() and ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodEmail then
			IconsGraphicPasscodeLarge1 = IconsGraphicPasscodeLarge
			AddButtonText = UseLocalizationResult.addEmail
			NoOpt = OnActivated
		elseif ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumber then
			IconsGraphicPasscodeLarge1 = IconsGraphicPasscodeLarge
			AddButtonText = UseLocalizationResult.addButtonText
			NoOpt = OnActivated1
		elseif ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailHorizontalLayout then
			IconsGraphicPasscodeLarge1 = IconsGraphicPasscodeLarge
			AddButtonText = UseLocalizationResult.addPhone
			NoOpt = OnActivated1
			AddEmail = UseLocalizationResult.addEmail
			NoOpt1 = OnActivated
		elseif ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailVerticalLayout then
			IconsGraphicPasscodeLarge1 = IconsGraphicPasscodeLarge
			AddButtonText = UseLocalizationResult.addButtonText
			NoOpt = OnActivated1
			AddEmail = UseLocalizationResult.addEmailInstead
			NoOpt1 = OnActivated
		elseif ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberVoiceOptIn then
			IconsGraphicPasscodeLarge1 = IconsControlsMicrophone
			AddButtonText = UseLocalizationResult.addButtonText
			NoOpt = OnActivated1
		elseif ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.VoiceWithoutPvTrial then
			IconsGraphicPasscodeLarge1 = IconsControlsHeadphone
			AddButtonText = UseLocalizationResult.continueButton
			
			NoOpt = function()
				-- upvalues: AppPage (upval), ContactMethodPhoneNumberEmailHorizontalLayout (ref), OnClose (copy), UseDispatchResult (copy), SetHomePageUpsellCardVariationFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
				local config = {
					name = AppPage.VoiceTrialUpsell,
					extraProps = {
						upsellCardType = ContactMethodPhoneNumberEmailHorizontalLayout,
						onClose = OnClose,
						onCompletion = function()
							-- upvalues: UseDispatchResult (upval), SetHomePageUpsellCardVariationFunction (upval)
							local _ = UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
						end
					}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownFunction(config))
				end
			end
			
			AddEmail = UseLocalizationResult.learnMore
			
			NoOpt1 = function()
				-- upvalues: AppPage (upval), VoiceChatHelpUrl (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
				local config = {
					name = AppPage.GenericWebPage,
					detail = VoiceChatHelpUrl,
					extraProps = {}
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownFunction(config))
				end
			end
		end
	end
	local _UDim2 = UDim2.new(1, 0, 0, 0)
	local _UDim2_1 = UDim2.new(1, 0, 0, 28)
	local _UDim2_2 = UDim2.new(0.5, 0, 0, 28)
	local Offset = 12
	local Offset1 = 12
	local Vertical = Enum.FillDirection.Vertical
	local _UDim2_3 = UDim2.new(1, -25, 0, 0)
	local AddEmail1 = if GetFFlagEnableHomePageEmailUpsellCardModule() then UseLocalizationResult.addEmail else nil
	
	if UseSelectorResult == FormFactor.WIDE then
		Offset = 12
		Vertical = Enum.FillDirection.Horizontal
		_UDim2_2 = UDim2.new(1, 0, 0, 28)
		Offset1 = 20
		Top = Enum.VerticalAlignment.Center
		Horizontal = Enum.FillDirection.Vertical
		Offset2 = 0
		LayoutOrder = 2
		LayoutOrder1 = 1
		UseLocalizationResult.addEmail = UseLocalizationResult.addEmailInstead
		UseLocalizationResult.addPhone = UseLocalizationResult.addButtonText
		_UDim2 = UDim2.new(1, -Text.GetTextWidth(UseLocalizationResult.addButtonText, UseStyleResult.Font.CaptionHeader.Font, UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize) - 30, 0, 0)
		_UDim2_1 = UDim2.new(0, Text.GetTextWidth(UseLocalizationResult.addButtonText, UseStyleResult.Font.CaptionHeader.Font, UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize) + 15, 0, 28)
	end
	return if GetFFlagEnableVoiceTrialUpsellCardModule() and (ContactMethodPhoneNumberEmailHorizontalLayout == nil or ContactMethodPhoneNumberEmailHorizontalLayout == "") then nil else RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 0,
		Position = if p1.isCentered then UDim2.new(0.5, 0, 0, 0) else nil,
		AnchorPoint = if p1.isCentered then Vector2.new(0.5, 0) else nil,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Theme.BackgroundUIDefault.Color,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(800, 1e999) }),
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
			PaddingRight = UDim.new(0, Offset1),
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12)
		}),
		IconAndTextFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = _UDim2,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			HorizontalLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Top
			}),
			ImageIcon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Size = UDim2.new(0, 40, 0, 40),
				Position = UDim2.new(1, 0, 0.5, 0),
				Image = if GetFFlagEnableVoiceTrialUpsellCardModule() then IconsGraphicPasscodeLarge1 elseif ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberVoiceOptIn then IconsControlsMicrophone else IconsGraphicPasscodeLarge,
				ImageColor3 = UseStyleResult.Theme.SystemPrimaryDefault.Color,
				ImageTransparency = UseStyleResult.Theme.SystemPrimaryDefault.Transparency
			}),
			TextFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = _UDim2_3,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				VerticalLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 4)
				}),
				UIPadding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) }),
				TitleTextLabel = RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BorderSizePixel = 0,
					TextWrapped = true,
					BackgroundTransparency = 0,
					Size = _UDim2_3,
					Font = HeaderFont,
					Text = TitleTextOverride or UseLocalizationResult.titleText,
					TextColor3 = Color,
					TextSize = ScaledBaseSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Theme.BackgroundUIDefault.Color,
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				BodyTextLabel = RoactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					BorderSizePixel = 0,
					TextWrapped = true,
					BackgroundTransparency = 0,
					Size = _UDim2_3,
					Font = CaptionBodyFont,
					Text = BodyTextOverride or UseLocalizationResult.bodyText,
					TextColor3 = Color1,
					TextSize = ScaledBaseSize1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Theme.BackgroundUIDefault.Color,
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		}),
		FirstVariantFrame = not GetFFlagEnableVoiceTrialUpsellCardModule() and (ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailHorizontalLayout and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = _UDim2_1
		}, {
			OrientationLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			}),
			UIPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, Offset2) }),
			HorizontalCallToActionButton = RoactModule.createElement(GenericTextButtonModule, {
				BackgroundTransparency = 0,
				Size = _UDim2_2,
				Text = UseLocalizationResult.addEmail,
				LayoutOrder = LayoutOrder,
				Font = UseStyleResult.Font.CaptionHeader.Font,
				TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize,
				onActivated = OnActivated,
				BackgroundColor3 = Theme.BackgroundUIDefault.Color,
				themeSettings = {
					OnPressTransparency = 0.5,
					DisabledTransparency = 0.5,
					Color = Theme.SystemPrimaryContent.Color,
					Transparency = Theme.SystemPrimaryContent.Transparency,
					Text = {
						Color = Theme.SystemPrimaryDefault.Color,
						Transparency = Theme.SystemPrimaryDefault.Transparency
					},
					Border = {
						Hidden = false,
						Transparency = 0,
						Color = Theme.SystemPrimaryDefault.Color
					}
				}
			}),
			SecondHorizontalCallToActionButton = RoactModule.createElement(Button, {
				fontStyle = "CaptionHeader",
				buttonType = ButtonType.PrimarySystem,
				size = _UDim2_2,
				text = UseLocalizationResult.addPhone,
				layoutOrder = LayoutOrder1,
				onActivated = OnActivated1
			})
		})),
		SecondVariantFrame = not GetFFlagEnableVoiceTrialUpsellCardModule() and ((if GetFFlagEnableHomePageEmailUpsellCardModule() then ContactMethodPhoneNumberEmailHorizontalLayout ~= OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailHorizontalLayout and ContactMethodPhoneNumberEmailHorizontalLayout ~= OptionalContactMethodUpsellTypesModule.ContactMethodEmail else ContactMethodPhoneNumberEmailHorizontalLayout ~= OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailHorizontalLayout) and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = _UDim2_1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			VerticalLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			}),
			CallToActionButton = RoactModule.createElement(Button, {
				layoutOrder = 1,
				fontStyle = "CaptionHeader",
				buttonType = ButtonType.PrimarySystem,
				size = _UDim2_1,
				text = UseLocalizationResult.addButtonText,
				onActivated = OnActivated1
			}),
			SecondVerticalCallToActionButton = ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodPhoneNumberEmailVerticalLayout and RoactModule.createElement(GenericTextButtonModule, {
				BackgroundTransparency = 0,
				LayoutOrder = 2,
				Size = _UDim2_1,
				Text = UseLocalizationResult.addEmailInstead,
				Font = UseStyleResult.Font.CaptionHeader.Font,
				TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize,
				onActivated = OnActivated,
				BackgroundColor3 = Theme.BackgroundOnHover.Color,
				themeSettings = {
					OnPressTransparency = 0.5,
					DisabledTransparency = 0.5,
					Color = Theme.SystemPrimaryContent.Color,
					Transparency = Theme.SystemPrimaryContent.Transparency,
					Text = {
						Color = Theme.SystemPrimaryDefault.Color,
						Transparency = Theme.SystemPrimaryDefault.Transparency
					},
					Border = { Hidden = false, Transparency = 1 }
				}
			})
		})),
		EmailVariantFrame = not GetFFlagEnableVoiceTrialUpsellCardModule() and (GetFFlagEnableHomePageEmailUpsellCardModule() and (ContactMethodPhoneNumberEmailHorizontalLayout == OptionalContactMethodUpsellTypesModule.ContactMethodEmail and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = _UDim2_1
		}, {
			OrientationLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			}),
			UIPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, Offset2) }),
			HorizontalCallToActionButton = RoactModule.createElement(Button, {
				layoutOrder = 1,
				fontStyle = "CaptionHeader",
				buttonType = ButtonType.PrimarySystem,
				size = _UDim2_1,
				text = AddEmail1,
				onActivated = OnActivated
			})
		}))),
		ButtonsFrame = if GetFFlagEnableVoiceTrialUpsellCardModule() then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = _UDim2_1,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, Offset2) }),
			VerticalLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			}),
			CallToActionButton = if AddButtonText == nil or AddButtonText == "" then nil else RoactModule.createElement(Button, {
				fontStyle = "CaptionHeader",
				buttonType = ButtonType.PrimarySystem,
				size = if FixBannerButtonSize and (AddEmail == nil or AddEmail == "") then _UDim2_1 else _UDim2_2,
				text = AddButtonText,
				layoutOrder = LayoutOrder1,
				onActivated = NoOpt
			}),
			SecondaryButton = if AddEmail == nil or AddEmail == "" then nil else RoactModule.createElement(Button, {
				fontStyle = "CaptionHeader",
				buttonType = ButtonType.Secondary,
				size = _UDim2_2,
				text = AddEmail,
				layoutOrder = LayoutOrder,
				onActivated = NoOpt1
			})
		}) else nil
	})
end