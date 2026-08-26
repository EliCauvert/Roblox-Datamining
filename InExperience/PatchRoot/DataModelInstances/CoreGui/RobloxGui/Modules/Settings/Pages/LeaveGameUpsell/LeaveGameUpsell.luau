local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local constantsModule = require(robloxGui.Modules.VoiceChat.Constants)
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local button = UIBloxModule.App.Button.Button
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useStyle = UIBloxModule.Core.Style.useStyle
local phoneLegalDisclaimer = require(corePackagesService.Workspace.Packages.PhoneUpsell).PhoneLegalDisclaimer
local inExperienceProviderContainer = require(corePackagesService.Workspace.Packages.InExperienceContainer).InExperienceProviderContainer
local postPhoneUpsellDisplayed = require(corePackagesService.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed
local phoneUpsellController = require(corePackagesService.Workspace.Packages.PhoneUpsell).PhoneUpsellController
local constants = require(corePackagesService.Workspace.Packages.PhoneUpsell).Constants
local roactNetworking = require(corePackagesService.Workspace.Packages.RoactServiceTags).RoactNetworking
local useAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local useRoactService = require(corePackagesService.Workspace.Packages.RobloxAppHooks).useRoactService
local useInputType = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.useInputType
local inputTypeConstants = require(corePackagesService.Workspace.Packages.InputType).InputTypeConstants
local useEventConnection = require(corePackagesService.Packages.ReactUtils).useEventConnection
local getPlatformTarget = require(corePackagesService.Workspace.Packages.Analytics).getPlatformTarget
local eventStreamConstants = require(corePackagesService.Workspace.Packages.AuthAnalytics).EventStreamConstants
local leaveGameModule = require(robloxGui.Modules.Settings.leaveGame)
local getFFlagDisablePVUpsellDataConsent = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFFlagAddMorePhoneUpsellEvents = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagAddMorePhoneUpsellEvents
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local constantsModule_1 = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local _ = {
	Incomplete = "Incomplete",
	Completed = "Completed",
	CompletedAndClosed = "CompletedAndClosed"
}
local _ = nil
local var1 = (function()
	-- upvalues: robloxGui (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), constantsModule_1 (ref), useStyle (ref), useLocalization (ref), constantsModule (ref), useAppPolicy (ref), reactModule (ref), styledTextLabel (ref), button (ref), buttonType (ref), getFFlagAddMorePhoneUpsellEvents (ref), getPlatformTarget (ref), eventStreamConstants (ref), phoneUpsellController (ref), default (ref), getFFlagDisablePVUpsellDataConsent (ref), phoneLegalDisclaimer (ref), constants (ref), useRoactService (ref), roactNetworking (ref), useInputType (ref), inputTypeConstants (ref), guiService (ref), contextActionService (ref), postPhoneUpsellDisplayed (ref), useEventConnection (ref), buttonStack (ref), leaveGameModule (ref), inExperienceProviderContainer (ref), roactModule (ref)
	local leaveGameUpsellPage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	leaveGameUpsellPage.playsessionid = ""
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		leaveGameUpsellPage.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	function leaveGameUpsellPage.DontLeaveFunc(p1)
		-- upvalues: leaveGameUpsellPage (ref), rbxAnalyticsService (copy), constantsModule_1 (copy)
		if leaveGameUpsellPage.HubRef then
			leaveGameUpsellPage.HubRef:PopMenu(p1, true)
		end
		rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsInGameMenuName, constantsModule_1.AnalyticsLeaveGameName, {
			confirmed = constantsModule_1.AnalyticsCancelledName,
			universeid = tostring(game.GameId),
			source = constantsModule_1.AnalyticsLeaveGameSource,
			playsessionid = leaveGameUpsellPage.playsessionid
		})
	end
	
	function leaveGameUpsellPage.DontLeaveFromHotkey(_, p1, p2)
		-- upvalues: leaveGameUpsellPage (ref)
		if p1 == Enum.UserInputState.Begin then
			leaveGameUpsellPage.DontLeaveFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function leaveGameUpsellPage.DontLeaveFromButton(p1)
		-- upvalues: leaveGameUpsellPage (ref)
		leaveGameUpsellPage.DontLeaveFunc(p1)
	end
	
	leaveGameUpsellPage.TabHeader = nil
	leaveGameUpsellPage.Page.Name = "LeaveGameUpsellPage"
	leaveGameUpsellPage.ShouldShowBottomBar = false
	leaveGameUpsellPage.ShouldShowHubBar = false
	leaveGameUpsellPage.DisableTopPadding = true
	
	function leaveGameUpsellPage.UpsellComponent(p1)
		-- upvalues: leaveGameUpsellPage (ref), useStyle (copy), useLocalization (copy), constantsModule (copy), useAppPolicy (copy), reactModule (copy), styledTextLabel (copy), button (copy), buttonType (copy), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), eventStreamConstants (copy), phoneUpsellController (copy), default (copy), getFFlagDisablePVUpsellDataConsent (copy), phoneLegalDisclaimer (copy), constants (copy)
		local upsellType = leaveGameUpsellPage.upsellType
		local var2 = useStyle()
		local var3 = useLocalization({
			voiceConsent = "Feature.VerificationUpsell.Description.VoiceLegalConsent2",
			voiceDisclaimer = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2",
			button = "Feature.VerificationUpsell.Action.AddPhoneNumber",
			termsOfUse = "Feature.VerificationUpsell.Action.SMSTerms",
			privacyPolicy = "Feature.VerificationUpsell.Action.Privacy",
			headerKey = if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "Feature.VerificationUpsell.Heading.UnlockVoiceChat" else "Feature.VerificationUpsell.Heading.DontLoseAccess",
			bodyKey = if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "Feature.VerificationUpsell.Description.UnlockVoiceChatBody" else "Feature.VerificationUpsell.Description.RecoverAccountEasily"
		})
		var3.voiceDisclaimer = var3.voiceDisclaimer:gsub("{buttonText}", var3.button)
		local var4 = useAppPolicy(function(p2)
			-- upvalues: upsellType (ref), constantsModule (copy)
			return upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat and p2.RequireExplicitVoiceConsent()
		end)
		local var5, var6 = reactModule.useState(false)
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.LayoutOrder
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			Header = reactModule.createElement(styledTextLabel, {
				layoutOrder = 1,
				text = var3.headerKey,
				fontStyle = var2.Font.Header2,
				colorStyle = var2.Theme.TextEmphasis
			}),
			Body = reactModule.createElement(styledTextLabel, {
				textWrapped = true,
				lineHeight = 1.1,
				layoutOrder = 2,
				text = var3.bodyKey,
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.Y,
				fontStyle = var2.Font.Body,
				colorStyle = var2.Theme.TextDefault
			}),
			Button = reactModule.createElement(button, {
				layoutOrder = 3,
				buttonType = buttonType.Secondary,
				size = UDim2.new(1, 0, 0, var2.Tokens.Size.Size_1200),
				text = var3.button,
				onActivated = function()
					-- upvalues: leaveGameUpsellPage (copy), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p1 (ref), eventStreamConstants (copy), phoneUpsellController (copy), default (copy), upsellType (ref), constantsModule (copy)
					leaveGameUpsellPage.HubRef:SetVisibility(false, true)
					
					if getFFlagAddMorePhoneUpsellEvents() then
						rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
							origin = p1.origin,
							btn = eventStreamConstants.Button.Continue,
							section = p1.section
						})
					end
					phoneUpsellController.openPhoneUpsell({
						eventContext = "verificationUpsell",
						origin = p1.origin,
						onSuccessBeforeToast = function()
							-- upvalues: default (copy), p1 (copy), leaveGameUpsellPage (copy)
							default:DisablePhoneVerificationUpsell()
							p1.onUpsellComplete()
							leaveGameUpsellPage.HubRef:SetVisibility(true, false)
							leaveGameUpsellPage.HubRef:SwitchToPage(leaveGameUpsellPage.HubRef.LeaveGameUpsellPage, true)
						end,
						onSuccess = function()
							-- upvalues: upsellType (copy), constantsModule (copy), default (copy), p1 (copy)
							if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
								default:EnableVoice()
								p1.setVoiceEnabled(true)
							end
						end
					})
				end,
				isDisabled = var4 and not var5
			}),
			PhoneLegalDisclaimer = if not getFFlagDisablePVUpsellDataConsent() then reactModule.createElement(phoneLegalDisclaimer, {
				showLegalButtons = true,
				LayoutOrder = 4,
				legalText = if var4 then var3.voiceConsent else var3.voiceDisclaimer,
				termsOfUse = var3.termsOfUse,
				privacyPolicy = var3.privacyPolicy,
				showLegalText = upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat,
				showLegalTextCheckbox = var4,
				legalTextChecked = var5,
				setLegalTextChecked = function()
					-- upvalues: var6 (ref), var5 (ref)
					var6(not var5)
				end,
				onTermsOfUseClick = function()
					-- upvalues: getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p1 (ref), constants (copy)
					if getFFlagAddMorePhoneUpsellEvents() then
						rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
							field = "termsOfService",
							origin = p1.origin,
							section = p1.section
						})
					end
					p1.showWebpage(constants.TERMS_OF_SERVICE_URL)
				end,
				onPrivacyPolicyClick = function()
					-- upvalues: getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p1 (ref), constants (copy)
					if getFFlagAddMorePhoneUpsellEvents() then
						rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
							field = "privacyPolicy",
							origin = p1.origin,
							section = p1.section
						})
					end
					p1.showWebpage(constants.PRIVACY_POLICY_URL)
				end
			}) else nil
		})
	end
	
	function leaveGameUpsellPage.LeaveGameComponent(p1)
		-- upvalues: useStyle (copy), useLocalization (copy), reactModule (copy), leaveGameUpsellPage (ref), constantsModule (copy), getFFlagAddMorePhoneUpsellEvents (copy), useRoactService (copy), roactNetworking (copy), useInputType (copy), inputTypeConstants (copy), guiService (copy), contextActionService (copy), postPhoneUpsellDisplayed (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), eventStreamConstants (copy), useEventConnection (copy), robloxGui (copy), buttonStack (copy), buttonType (copy), default (copy), leaveGameModule (copy)
		local var2 = useStyle()
		local var3 = useLocalization({
			confirmLeave = "Feature.VerificationUpsell.Action.ConfirmLeave",
			dontLeave = "Feature.VerificationUpsell.Action.DontLeave",
			returnWithVoice = "Feature.VerificationUpsell.Action.ReturnWithVoice"
		})
		local incomplete, incomplete_1 = reactModule.useState("Incomplete")
		local isIncomplete = incomplete == "Incomplete"
		local upsellType = leaveGameUpsellPage.upsellType
		local var4 = if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "exitConfirmationScreenVoice" else "exitConfirmationScreenSecurity"
		local var5 = if getFFlagAddMorePhoneUpsellEvents() then if incomplete == "Incomplete" then "entry" else "verifyPhoneSuccess" else nil
		local var6 = reactModule.useRef(nil)
		local var7, var8 = reactModule.useState(false)
		local var9 = useRoactService(roactNetworking)
		local var10 = useInputType()
		
		local var11 = function()
			-- upvalues: contextActionService (copy), incomplete (ref), incomplete_1 (ref)
			contextActionService:UnbindCoreAction("LeaveGameCancelAction")
			
			if incomplete == "Completed" then
				incomplete_1("CompletedAndClosed")
			end
		end
		
		useEventConnection(leaveGameUpsellPage.Displayed.Event, function()
			-- upvalues: var10 (ref), inputTypeConstants (copy), guiService (copy), var6 (ref), contextActionService (copy), leaveGameUpsellPage (copy), postPhoneUpsellDisplayed (copy), var9 (ref), constantsModule (copy), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p1 (ref), eventStreamConstants (copy)
			if var10 ~= inputTypeConstants.Touch then
				guiService.SelectedCoreObject = var6.current
			end
			contextActionService:BindCoreAction("LeaveGameCancelAction", leaveGameUpsellPage.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
			
			if not leaveGameUpsellPage.postSent then
				postPhoneUpsellDisplayed(var9, constantsModule.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, os.time(), true, true):catch(function(_) end)
				
				if getFFlagAddMorePhoneUpsellEvents() then
					rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
						origin = p1.origin,
						aType = eventStreamConstants.ActionType.Shown,
						section = p1.section
					})
				end
				leaveGameUpsellPage.postSent = true
			end
		end)
		useEventConnection(leaveGameUpsellPage.Hidden.Event, var11)
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, if robloxGui.AbsoluteSize.Y < 500 or robloxGui.AbsoluteSize.X < 500 then 0 else 200),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			LeaveGame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, var2.Tokens.Size.Size_600),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				LeaveGameButtons = reactModule.createElement(buttonStack, {
					disableGamepadRefs = true,
					isRoactGamepadEnabled = false,
					buttons = {
						{
							isDefaultChild = true,
							buttonType = buttonType.PrimarySystem,
							props = {
								layoutOrder = 1,
								text = var3.confirmLeave,
								onActivated = function()
									-- upvalues: var7 (ref), incomplete (ref), upsellType (ref), constantsModule (copy), default (copy), var8 (ref), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), var4 (ref), var5 (ref), leaveGameModule (copy)
									if not var7 and (incomplete == "Completed" or incomplete == "CompletedAndClosed") and upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
										default:EnableVoice()
										var8(true)
									end
									if getFFlagAddMorePhoneUpsellEvents() then
										rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "formInteraction", { btn = "confirmLeave", origin = var4, section = var5 })
									end
									leaveGameModule(false)
								end,
								buttonRef = var6
							}
						},
						{
							buttonType = buttonType.Secondary,
							props = {
								layoutOrder = 2,
								text = if incomplete == "Completed" and upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then var3.returnWithVoice else var3.dontLeave,
								onActivated = function()
									-- upvalues: getFFlagAddMorePhoneUpsellEvents (copy), incomplete (ref), upsellType (ref), constantsModule (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), var4 (ref), var5 (ref), eventStreamConstants (copy), leaveGameUpsellPage (copy)
									if getFFlagAddMorePhoneUpsellEvents() then
										if incomplete == "Completed" and upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
											rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "formInteraction", { btn = "returnWithVoice", origin = var4, section = var5 })
										elseif incomplete == "Incomplete" then
											rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
												origin = var4,
												aType = eventStreamConstants.ActionType.Dismiss,
												section = var5
											})
										end
									end
									leaveGameUpsellPage.DontLeaveFromButton()
								end
							}
						}
					},
					buttonHeight = var2.Tokens.Size.Size_1200
				})
			}),
			TopSpacer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var2.Tokens.Size.Size_600)
			}),
			UpsellComponents = if isIncomplete then reactModule.createElement(reactModule.Fragment, {}, {
				Divider = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BorderSizePixel = 0,
					BackgroundColor3 = var2.Tokens.Color.Stroke.Emphasis.Color3,
					BackgroundTransparency = var2.Tokens.Color.Stroke.Emphasis.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				}),
				BottomSpacer = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var2.Tokens.Size.Size_600)
				}),
				Upsell = reactModule.createElement(leaveGameUpsellPage.UpsellComponent, {
					LayoutOrder = 5,
					origin = var4,
					section = var5,
					showWebpage = p1.showWebpage,
					onUpsellComplete = function()
						-- upvalues: incomplete_1 (ref)
						incomplete_1("Completed")
					end,
					setVoiceEnabled = var8
				})
			}) else nil
		})
	end
	
	leaveGameUpsellPage.handle = roactModule.mount(reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(leaveGameUpsellPage.LeaveGameComponent, { showWebpage = function() end }, {})), leaveGameUpsellPage.Page, "LeaveGameUpsell")
	leaveGameUpsellPage.Page.Size = UDim2.new(1, 0, 0, 0)
	leaveGameUpsellPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return leaveGameUpsellPage
end)()

function var13.SetUpsellProp(value, p1)
	-- upvalues: constantsModule (ref), roactModule (ref), reactModule (ref), inExperienceProviderContainer (ref)
	if p1 == constantsModule.PHONE_UPSELL_VALUE_PROP.None then
		return
	end
	value.upsellType = p1
	value.handle = roactModule.update(value.handle, reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(value.LeaveGameComponent, { showWebpage = function() end }, {})))
end

return var1