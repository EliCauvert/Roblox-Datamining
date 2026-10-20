local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local ConstantsModule = require(RobloxGui.Modules.VoiceChat.Constants)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Button = UIBloxModule.App.Button.Button
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local PhoneLegalDisclaimer = require(CorePackages.Workspace.Packages.PhoneUpsell).PhoneLegalDisclaimer
local InExperienceProviderContainer = require(CorePackages.Workspace.Packages.InExperienceContainer).InExperienceProviderContainer
local PostPhoneUpsellDisplayedFunction = require(CorePackages.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed
local PhoneUpsellController = require(CorePackages.Workspace.Packages.PhoneUpsell).PhoneUpsellController
local Constants = require(CorePackages.Workspace.Packages.PhoneUpsell).Constants
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseInputTypeFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useInputType
local InputTypeConstants = require(CorePackages.Workspace.Packages.InputType).InputTypeConstants
local UseEventConnectionFunction = require(CorePackages.Packages.ReactUtils).useEventConnection
local GetPlatformTargetFunction = require(CorePackages.Workspace.Packages.Analytics).getPlatformTarget
local EventStreamConstants = require(CorePackages.Workspace.Packages.AuthAnalytics).EventStreamConstants
local LeaveGameModule = require(RobloxGui.Modules.Settings.leaveGame)
local GetFFlagDisablePVUpsellDataConsentFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFFlagAddMorePhoneUpsellEventsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAddMorePhoneUpsellEvents
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local ConstantsModule1 = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v1 = (function()
	-- upvalues: RobloxGui (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), ConstantsModule1 (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), UseAppPolicyFunction (copy), ReactModule (copy), StyledTextLabel (copy), Button (copy), ButtonType (copy), GetFFlagAddMorePhoneUpsellEventsFunction (copy), GetPlatformTargetFunction (copy), EventStreamConstants (copy), PhoneUpsellController (copy), Default (copy), GetFFlagDisablePVUpsellDataConsentFunction (copy), PhoneLegalDisclaimer (copy), Constants (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseInputTypeFunction (copy), InputTypeConstants (copy), GuiService (copy), ContextActionService (copy), PostPhoneUpsellDisplayedFunction (copy), UseEventConnectionFunction (copy), ButtonStack (copy), LeaveGameModule (copy), InExperienceProviderContainer (copy), RoactModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	NewPage.playsessionid = ""
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		NewPage.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	function NewPage.DontLeaveFunc(IsUserInputTypeMatch)
		-- upvalues: NewPage (copy), RbxAnalyticsService (upval), ConstantsModule1 (upval)
		if NewPage.HubRef then
			NewPage.HubRef:PopMenu(IsUserInputTypeMatch, true)
		end
		RbxAnalyticsService:SetRBXEventStream(ConstantsModule1.AnalyticsTargetName, ConstantsModule1.AnalyticsInGameMenuName, ConstantsModule1.AnalyticsLeaveGameName, {
			confirmed = ConstantsModule1.AnalyticsCancelledName,
			universeid = tostring(game.GameId),
			source = ConstantsModule1.AnalyticsLeaveGameSource,
			playsessionid = NewPage.playsessionid
		})
	end
	
	function NewPage:DontLeaveFromHotkey(UserInputState, Input)
		-- upvalues: NewPage (copy)
		if UserInputState == Enum.UserInputState.Begin then
			NewPage.DontLeaveFunc(Input.UserInputType == Enum.UserInputType.Gamepad1 or (Input.UserInputType == Enum.UserInputType.Gamepad2 or (Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4)))
		end
	end
	
	function NewPage.DontLeaveFromButton(p1)
		-- upvalues: NewPage (copy)
		NewPage.DontLeaveFunc(p1)
	end
	
	NewPage.TabHeader = nil
	NewPage.Page.Name = "LeaveGameUpsellPage"
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	NewPage.DisableTopPadding = true
	
	function NewPage.UpsellComponent(Frame)
		-- upvalues: NewPage (copy), UseStyleFunction (upval), UseLocalizationFunction (upval), ConstantsModule (upval), UseAppPolicyFunction (upval), ReactModule (upval), StyledTextLabel (upval), Button (upval), ButtonType (upval), GetFFlagAddMorePhoneUpsellEventsFunction (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), EventStreamConstants (upval), PhoneUpsellController (upval), Default (upval), GetFFlagDisablePVUpsellDataConsentFunction (upval), PhoneLegalDisclaimer (upval), Constants (upval)
		local UpsellType = NewPage.upsellType
		local UseStyleResult = UseStyleFunction()
		local UseLocalizationResult = UseLocalizationFunction({
			voiceConsent = "Feature.VerificationUpsell.Description.VoiceLegalConsent2",
			voiceDisclaimer = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2",
			button = "Feature.VerificationUpsell.Action.AddPhoneNumber",
			termsOfUse = "Feature.VerificationUpsell.Action.SMSTerms",
			privacyPolicy = "Feature.VerificationUpsell.Action.Privacy",
			headerKey = if UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "Feature.VerificationUpsell.Heading.UnlockVoiceChat" else "Feature.VerificationUpsell.Heading.DontLoseAccess",
			bodyKey = if UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "Feature.VerificationUpsell.Description.UnlockVoiceChatBody" else "Feature.VerificationUpsell.Description.RecoverAccountEasily"
		})
		UseLocalizationResult.voiceDisclaimer = UseLocalizationResult.voiceDisclaimer:gsub("{buttonText}", UseLocalizationResult.button)
		local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
			-- upvalues: UpsellType (copy), ConstantsModule (upval)
			return UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat and p1.RequireExplicitVoiceConsent()
		end)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = Frame.LayoutOrder
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			Header = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 1,
				text = UseLocalizationResult.headerKey,
				fontStyle = UseStyleResult.Font.Header2,
				colorStyle = UseStyleResult.Theme.TextEmphasis
			}),
			Body = ReactModule.createElement(StyledTextLabel, {
				textWrapped = true,
				lineHeight = 1.1,
				layoutOrder = 2,
				text = UseLocalizationResult.bodyKey,
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.Y,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextDefault
			}),
			Button = ReactModule.createElement(Button, {
				layoutOrder = 3,
				buttonType = ButtonType.Secondary,
				size = UDim2.new(1, 0, 0, UseStyleResult.Tokens.Size.Size_1200),
				text = UseLocalizationResult.button,
				onActivated = function()
					-- upvalues: NewPage (upval), GetFFlagAddMorePhoneUpsellEventsFunction (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), Frame (copy), EventStreamConstants (upval), PhoneUpsellController (upval), Default (upval), UpsellType (copy), ConstantsModule (upval)
					NewPage.HubRef:SetVisibility(false, true)
					
					if GetFFlagAddMorePhoneUpsellEventsFunction() then
						RbxAnalyticsService:SendEventDeferred(GetPlatformTargetFunction(), "verificationUpsell", "modalAction", {
							origin = Frame.origin,
							btn = EventStreamConstants.Button.Continue,
							section = Frame.section
						})
					end
					PhoneUpsellController.openPhoneUpsell({
						eventContext = "verificationUpsell",
						origin = Frame.origin,
						onSuccessBeforeToast = function()
							-- upvalues: Default (upval), Frame (upval), NewPage (upval)
							Default:DisablePhoneVerificationUpsell()
							Frame.onUpsellComplete()
							NewPage.HubRef:SetVisibility(true, false)
							NewPage.HubRef:SwitchToPage(NewPage.HubRef.LeaveGameUpsellPage, true)
						end,
						onSuccess = function()
							-- upvalues: UpsellType (upval), ConstantsModule (upval), Default (upval), Frame (upval)
							if UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
								Default:EnableVoice()
								Frame.setVoiceEnabled(true)
							end
						end
					})
				end,
				isDisabled = UseAppPolicyResult and not UseStateResult
			}),
			PhoneLegalDisclaimer = if GetFFlagDisablePVUpsellDataConsentFunction() then nil else ReactModule.createElement(PhoneLegalDisclaimer, {
				showLegalButtons = true,
				LayoutOrder = 4,
				legalText = if UseAppPolicyResult then UseLocalizationResult.voiceConsent else UseLocalizationResult.voiceDisclaimer,
				termsOfUse = UseLocalizationResult.termsOfUse,
				privacyPolicy = UseLocalizationResult.privacyPolicy,
				showLegalText = UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat,
				showLegalTextCheckbox = UseAppPolicyResult,
				legalTextChecked = UseStateResult,
				setLegalTextChecked = function()
					-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
					UseStateResult2(not UseStateResult)
				end,
				onTermsOfUseClick = function()
					-- upvalues: GetFFlagAddMorePhoneUpsellEventsFunction (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), Frame (copy), Constants (upval)
					if GetFFlagAddMorePhoneUpsellEventsFunction() then
						RbxAnalyticsService:SendEventDeferred(GetPlatformTargetFunction(), "verificationUpsell", "modalAction", {
							field = "termsOfService",
							origin = Frame.origin,
							section = Frame.section
						})
					end
					Frame.showWebpage(Constants.TERMS_OF_SERVICE_URL)
				end,
				onPrivacyPolicyClick = function()
					-- upvalues: GetFFlagAddMorePhoneUpsellEventsFunction (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), Frame (copy), Constants (upval)
					if GetFFlagAddMorePhoneUpsellEventsFunction() then
						RbxAnalyticsService:SendEventDeferred(GetPlatformTargetFunction(), "verificationUpsell", "modalAction", {
							field = "privacyPolicy",
							origin = Frame.origin,
							section = Frame.section
						})
					end
					Frame.showWebpage(Constants.PRIVACY_POLICY_URL)
				end
			})
		})
	end
	
	function NewPage.LeaveGameComponent(p1)
		-- upvalues: UseStyleFunction (upval), UseLocalizationFunction (upval), ReactModule (upval), NewPage (copy), ConstantsModule (upval), GetFFlagAddMorePhoneUpsellEventsFunction (upval), UseRoactServiceFunction (upval), RoactNetworking (upval), UseInputTypeFunction (upval), InputTypeConstants (upval), GuiService (upval), ContextActionService (upval), PostPhoneUpsellDisplayedFunction (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), EventStreamConstants (upval), UseEventConnectionFunction (upval), RobloxGui (upval), ButtonStack (upval), ButtonType (upval), Default (upval), LeaveGameModule (upval)
		local UseStyleResult = UseStyleFunction()
		local UseLocalizationResult = UseLocalizationFunction({
			confirmLeave = "Feature.VerificationUpsell.Action.ConfirmLeave",
			dontLeave = "Feature.VerificationUpsell.Action.DontLeave",
			returnWithVoice = "Feature.VerificationUpsell.Action.ReturnWithVoice"
		})
		local Incomplete, Incomplete2 = ReactModule.useState("Incomplete")
		local IsIncomplete = Incomplete == "Incomplete"
		local UpsellType = NewPage.upsellType
		local ExitConfirmationScreenVoice: string = if UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "exitConfirmationScreenVoice" else "exitConfirmationScreenSecurity"
		local Entry = if GetFFlagAddMorePhoneUpsellEventsFunction() then if Incomplete == "Incomplete" then "entry" else "verifyPhoneSuccess" else nil
		local UseRefResult = ReactModule.useRef(nil)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
		local UseInputTypeResult = UseInputTypeFunction()
		
		local function v45()
			-- upvalues: ContextActionService (upval), Incomplete (copy), Incomplete2 (copy)
			ContextActionService:UnbindCoreAction("LeaveGameCancelAction")
			
			if Incomplete == "Completed" then
				Incomplete2("CompletedAndClosed")
			end
		end
		
		UseEventConnectionFunction(NewPage.Displayed.Event, function()
			-- upvalues: UseInputTypeResult (copy), InputTypeConstants (upval), GuiService (upval), UseRefResult (copy), ContextActionService (upval), NewPage (upval), PostPhoneUpsellDisplayedFunction (upval), UseRoactServiceResult (copy), ConstantsModule (upval), GetFFlagAddMorePhoneUpsellEventsFunction (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), p1 (copy), EventStreamConstants (upval)
			if UseInputTypeResult ~= InputTypeConstants.Touch then
				GuiService.SelectedCoreObject = UseRefResult.current
			end
			ContextActionService:BindCoreAction("LeaveGameCancelAction", NewPage.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
			
			if not NewPage.postSent then
				PostPhoneUpsellDisplayedFunction(UseRoactServiceResult, ConstantsModule.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, os.time(), true, true):catch(function(_) end)
				
				if GetFFlagAddMorePhoneUpsellEventsFunction() then
					RbxAnalyticsService:SendEventDeferred(GetPlatformTargetFunction(), "verificationUpsell", "modalAction", {
						origin = p1.origin,
						aType = EventStreamConstants.ActionType.Shown,
						section = p1.section
					})
				end
				NewPage.postSent = true
			end
		end)
		UseEventConnectionFunction(NewPage.Hidden.Event, v45)
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, if RobloxGui.AbsoluteSize.Y < 500 or RobloxGui.AbsoluteSize.X < 500 then 0 else 200),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			LeaveGame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, UseStyleResult.Tokens.Size.Size_600),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				LeaveGameButtons = ReactModule.createElement(ButtonStack, {
					disableGamepadRefs = true,
					isRoactGamepadEnabled = false,
					buttons = {
						{
							isDefaultChild = true,
							buttonType = ButtonType.PrimarySystem,
							props = {
								layoutOrder = 1,
								text = UseLocalizationResult.confirmLeave,
								onActivated = function()
									-- upvalues: UseStateResult (copy), Incomplete (copy), UpsellType (copy), ConstantsModule (upval), Default (upval), UseStateResult2 (copy), GetFFlagAddMorePhoneUpsellEventsFunction (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), ExitConfirmationScreenVoice (copy), Entry (copy), LeaveGameModule (upval)
									if not UseStateResult and (Incomplete == "Completed" or Incomplete == "CompletedAndClosed") and UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
										Default:EnableVoice()
										UseStateResult2(true)
									end
									if GetFFlagAddMorePhoneUpsellEventsFunction() then
										RbxAnalyticsService:SendEventDeferred(GetPlatformTargetFunction(), "verificationUpsell", "formInteraction", {
											btn = "confirmLeave",
											origin = ExitConfirmationScreenVoice,
											section = Entry
										})
									end
									LeaveGameModule(false)
								end,
								buttonRef = UseRefResult
							}
						},
						{
							buttonType = ButtonType.Secondary,
							props = {
								layoutOrder = 2,
								text = if Incomplete == "Completed" and UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then UseLocalizationResult.returnWithVoice else UseLocalizationResult.dontLeave,
								onActivated = function()
									-- upvalues: GetFFlagAddMorePhoneUpsellEventsFunction (upval), Incomplete (copy), UpsellType (copy), ConstantsModule (upval), RbxAnalyticsService (upval), GetPlatformTargetFunction (upval), ExitConfirmationScreenVoice (copy), Entry (copy), EventStreamConstants (upval), NewPage (upval)
									if GetFFlagAddMorePhoneUpsellEventsFunction() then
										if Incomplete == "Completed" and UpsellType == ConstantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
											RbxAnalyticsService:SendEventDeferred(GetPlatformTargetFunction(), "verificationUpsell", "formInteraction", {
												btn = "returnWithVoice",
												origin = ExitConfirmationScreenVoice,
												section = Entry
											})
										elseif Incomplete == "Incomplete" then
											RbxAnalyticsService:SendEventDeferred(GetPlatformTargetFunction(), "verificationUpsell", "modalAction", {
												origin = ExitConfirmationScreenVoice,
												aType = EventStreamConstants.ActionType.Dismiss,
												section = Entry
											})
										end
									end
									NewPage.DontLeaveFromButton()
								end
							}
						}
					},
					buttonHeight = UseStyleResult.Tokens.Size.Size_1200
				})
			}),
			TopSpacer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseStyleResult.Tokens.Size.Size_600)
			}),
			UpsellComponents = if IsIncomplete then ReactModule.createElement(ReactModule.Fragment, {}, {
				Divider = ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BorderSizePixel = 0,
					BackgroundColor3 = UseStyleResult.Tokens.Color.Stroke.Emphasis.Color3,
					BackgroundTransparency = UseStyleResult.Tokens.Color.Stroke.Emphasis.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				}),
				BottomSpacer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, UseStyleResult.Tokens.Size.Size_600)
				}),
				Upsell = ReactModule.createElement(NewPage.UpsellComponent, {
					LayoutOrder = 5,
					origin = ExitConfirmationScreenVoice,
					section = Entry,
					showWebpage = p1.showWebpage,
					onUpsellComplete = function()
						-- upvalues: Incomplete2 (copy)
						Incomplete2("Completed")
					end,
					setVoiceEnabled = UseStateResult2
				})
			}) else nil
		})
	end
	
	NewPage.handle = RoactModule.mount(ReactModule.createElement(InExperienceProviderContainer, {}, ReactModule.createElement(NewPage.LeaveGameComponent, { showWebpage = function() end }, {})), NewPage.Page, "LeaveGameUpsell")
	NewPage.Page.Size = UDim2.new(1, 0, 0, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return NewPage
end)()

function v1.SetUpsellProp(p1, UpsellType)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), ReactModule (copy), InExperienceProviderContainer (copy)
	if UpsellType ~= ConstantsModule.PHONE_UPSELL_VALUE_PROP.None then
		p1.upsellType = UpsellType
		p1.handle = RoactModule.update(p1.handle, ReactModule.createElement(InExperienceProviderContainer, {}, ReactModule.createElement(p1.LeaveGameComponent, { showWebpage = function() end }, {})))
		
		return
	end
end

return v1