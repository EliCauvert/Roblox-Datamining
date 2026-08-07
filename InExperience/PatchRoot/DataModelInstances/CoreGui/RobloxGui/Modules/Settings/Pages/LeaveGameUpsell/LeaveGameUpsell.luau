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
local var13 = (function() --[[ line: 65 | named "Initialize" ]]
	-- upvalues: robloxGui (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), constantsModule_1 (ref), useStyle (ref), useLocalization (ref), constantsModule (ref), useAppPolicy (ref), reactModule (ref), styledTextLabel (ref), button (ref), buttonType (ref), getFFlagAddMorePhoneUpsellEvents (ref), getPlatformTarget (ref), eventStreamConstants (ref), phoneUpsellController (ref), default (ref), getFFlagDisablePVUpsellDataConsent (ref), phoneLegalDisclaimer (ref), constants (ref), useRoactService (ref), roactNetworking (ref), useInputType (ref), inputTypeConstants (ref), guiService (ref), contextActionService (ref), postPhoneUpsellDisplayed (ref), useEventConnection (ref), buttonStack (ref), leaveGameModule (ref), inExperienceProviderContainer (ref), roactModule (ref)
	local leaveGameUpsellPage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	leaveGameUpsellPage.playsessionid = ""
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		leaveGameUpsellPage.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	function leaveGameUpsellPage.DontLeaveFunc(p0) --[[ line: 74 ]]
		-- upvalues: leaveGameUpsellPage (ref), rbxAnalyticsService (copy), constantsModule_1 (copy)
		if leaveGameUpsellPage.HubRef then
			leaveGameUpsellPage.HubRef:PopMenu(p0, true)
		end
		rbxAnalyticsService:SetRBXEventStream(constantsModule_1.AnalyticsTargetName, constantsModule_1.AnalyticsInGameMenuName, constantsModule_1.AnalyticsLeaveGameName, {
			confirmed = constantsModule_1.AnalyticsCancelledName,
			universeid = tostring(game.GameId),
			source = constantsModule_1.AnalyticsLeaveGameSource,
			playsessionid = leaveGameUpsellPage.playsessionid
		})
	end
	
	function leaveGameUpsellPage.DontLeaveFromHotkey(_, p1, p2) --[[ line: 91 ]]
		-- upvalues: leaveGameUpsellPage (ref)
		if p1 == Enum.UserInputState.Begin then
			leaveGameUpsellPage.DontLeaveFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function leaveGameUpsellPage.DontLeaveFromButton(p3) --[[ line: 101 ]]
		-- upvalues: leaveGameUpsellPage (ref)
		leaveGameUpsellPage.DontLeaveFunc(p3)
	end
	
	leaveGameUpsellPage.TabHeader = nil
	leaveGameUpsellPage.Page.Name = "LeaveGameUpsellPage"
	leaveGameUpsellPage.ShouldShowBottomBar = false
	leaveGameUpsellPage.ShouldShowHubBar = false
	leaveGameUpsellPage.DisableTopPadding = true
	
	function leaveGameUpsellPage.UpsellComponent(p4) --[[ line: 114 ]]
		-- upvalues: leaveGameUpsellPage (ref), useStyle (copy), useLocalization (copy), constantsModule (copy), useAppPolicy (copy), reactModule (copy), styledTextLabel (copy), button (copy), buttonType (copy), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), eventStreamConstants (copy), phoneUpsellController (copy), default (copy), getFFlagDisablePVUpsellDataConsent (copy), phoneLegalDisclaimer (copy), constants (copy)
		local upsellType = leaveGameUpsellPage.upsellType
		local var15 = useStyle()
		local var16 = useLocalization({
			voiceConsent = "Feature.VerificationUpsell.Description.VoiceLegalConsent2",
			voiceDisclaimer = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2",
			button = "Feature.VerificationUpsell.Action.AddPhoneNumber",
			termsOfUse = "Feature.VerificationUpsell.Action.SMSTerms",
			privacyPolicy = "Feature.VerificationUpsell.Action.Privacy",
			headerKey = if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "Feature.VerificationUpsell.Heading.UnlockVoiceChat" else "Feature.VerificationUpsell.Heading.DontLoseAccess",
			bodyKey = if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "Feature.VerificationUpsell.Description.UnlockVoiceChatBody" else "Feature.VerificationUpsell.Description.RecoverAccountEasily"
		})
		var16.voiceDisclaimer = var16.voiceDisclaimer:gsub("{buttonText}", var16.button)
		local var17 = useAppPolicy(function(p5) --[[ line: 131 ]]
			-- upvalues: upsellType (ref), constantsModule (copy)
			return upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat and p5.RequireExplicitVoiceConsent()
		end)
		local var18, var19 = reactModule.useState(false)
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p4.LayoutOrder
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			Header = reactModule.createElement(styledTextLabel, {
				layoutOrder = 1,
				text = var16.headerKey,
				fontStyle = var15.Font.Header2,
				colorStyle = var15.Theme.TextEmphasis
			}),
			Body = reactModule.createElement(styledTextLabel, {
				textWrapped = true,
				lineHeight = 1.1,
				layoutOrder = 2,
				text = var16.bodyKey,
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.Y,
				fontStyle = var15.Font.Body,
				colorStyle = var15.Theme.TextDefault
			}),
			Button = reactModule.createElement(button, {
				layoutOrder = 3,
				buttonType = buttonType.Secondary,
				size = UDim2.new(1, 0, 0, var15.Tokens.Size.Size_1200),
				text = var16.button,
				onActivated = function() --[[ line: 169 ]]
					-- upvalues: leaveGameUpsellPage (copy), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p4 (ref), eventStreamConstants (copy), phoneUpsellController (copy), default (copy), upsellType (ref), constantsModule (copy)
					leaveGameUpsellPage.HubRef:SetVisibility(false, true)
					
					if getFFlagAddMorePhoneUpsellEvents() then
						rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
							origin = p4.origin,
							btn = eventStreamConstants.Button.Continue,
							section = p4.section
						})
					end
					phoneUpsellController.openPhoneUpsell({
						eventContext = "verificationUpsell",
						origin = p4.origin,
						onSuccessBeforeToast = function() --[[ line: 181 ]]
							-- upvalues: default (copy), p4 (copy), leaveGameUpsellPage (copy)
							default:DisablePhoneVerificationUpsell()
							p4.onUpsellComplete()
							leaveGameUpsellPage.HubRef:SetVisibility(true, false)
							leaveGameUpsellPage.HubRef:SwitchToPage(leaveGameUpsellPage.HubRef.LeaveGameUpsellPage, true)
						end,
						onSuccess = function() --[[ line: 187 ]]
							-- upvalues: upsellType (copy), constantsModule (copy), default (copy), p4 (copy)
							if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
								default:EnableVoice()
								p4.setVoiceEnabled(true)
							end
						end
					})
				end,
				isDisabled = var17 and not var18
			}),
			PhoneLegalDisclaimer = if not getFFlagDisablePVUpsellDataConsent() then reactModule.createElement(phoneLegalDisclaimer, {
				showLegalButtons = true,
				LayoutOrder = 4,
				legalText = if var17 then var16.voiceConsent else var16.voiceDisclaimer,
				termsOfUse = var16.termsOfUse,
				privacyPolicy = var16.privacyPolicy,
				showLegalText = upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat,
				showLegalTextCheckbox = var17,
				legalTextChecked = var18,
				setLegalTextChecked = function() --[[ line: 208 ]]
					-- upvalues: var19 (ref), var18 (ref)
					var19(not var18)
				end,
				onTermsOfUseClick = function() --[[ line: 211 ]]
					-- upvalues: getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p4 (ref), constants (copy)
					if getFFlagAddMorePhoneUpsellEvents() then
						rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
							field = "termsOfService",
							origin = p4.origin,
							section = p4.section
						})
					end
					p4.showWebpage(constants.TERMS_OF_SERVICE_URL)
				end,
				onPrivacyPolicyClick = function() --[[ line: 222 ]]
					-- upvalues: getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p4 (ref), constants (copy)
					if getFFlagAddMorePhoneUpsellEvents() then
						rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
							field = "privacyPolicy",
							origin = p4.origin,
							section = p4.section
						})
					end
					p4.showWebpage(constants.PRIVACY_POLICY_URL)
				end
			}) else nil
		})
	end
	
	function leaveGameUpsellPage.LeaveGameComponent(p6) --[[ line: 239 ]]
		-- upvalues: useStyle (copy), useLocalization (copy), reactModule (copy), leaveGameUpsellPage (ref), constantsModule (copy), getFFlagAddMorePhoneUpsellEvents (copy), useRoactService (copy), roactNetworking (copy), useInputType (copy), inputTypeConstants (copy), guiService (copy), contextActionService (copy), postPhoneUpsellDisplayed (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), eventStreamConstants (copy), useEventConnection (copy), robloxGui (copy), buttonStack (copy), buttonType (copy), default (copy), leaveGameModule (copy)
		local var20 = useStyle()
		local var21 = useLocalization({
			confirmLeave = "Feature.VerificationUpsell.Action.ConfirmLeave",
			dontLeave = "Feature.VerificationUpsell.Action.DontLeave",
			returnWithVoice = "Feature.VerificationUpsell.Action.ReturnWithVoice"
		})
		local incomplete, incomplete_1 = reactModule.useState("Incomplete")
		local isIncomplete = incomplete == "Incomplete"
		local upsellType = leaveGameUpsellPage.upsellType
		local var25 = if upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then "exitConfirmationScreenVoice" else "exitConfirmationScreenSecurity"
		local var26 = if getFFlagAddMorePhoneUpsellEvents() then if incomplete == "Incomplete" then "entry" else "verifyPhoneSuccess" else nil
		local var27 = reactModule.useRef(nil)
		local var28, var29 = reactModule.useState(false)
		local var30 = useRoactService(roactNetworking)
		local var31 = useInputType()
		
		local var32 = function() --[[ line: 296 ]]
			-- upvalues: contextActionService (copy), incomplete (ref), incomplete_1 (ref)
			contextActionService:UnbindCoreAction("LeaveGameCancelAction")
			
			if incomplete == "Completed" then
				incomplete_1("CompletedAndClosed")
			end
		end
		
		useEventConnection(leaveGameUpsellPage.Displayed.Event, function() --[[ line: 262 ]]
			-- upvalues: var31 (ref), inputTypeConstants (copy), guiService (copy), var27 (ref), contextActionService (copy), leaveGameUpsellPage (copy), postPhoneUpsellDisplayed (copy), var30 (ref), constantsModule (copy), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), p6 (ref), eventStreamConstants (copy)
			if var31 ~= inputTypeConstants.Touch then
				guiService.SelectedCoreObject = var27.current
			end
			contextActionService:BindCoreAction("LeaveGameCancelAction", leaveGameUpsellPage.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
			
			if not leaveGameUpsellPage.postSent then
				postPhoneUpsellDisplayed(var30, constantsModule.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, os.time(), true, true):catch(function(_) --[[ line: 281 ]] end)
				
				if getFFlagAddMorePhoneUpsellEvents() then
					rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
						origin = p6.origin,
						aType = eventStreamConstants.ActionType.Shown,
						section = p6.section
					})
				end
				leaveGameUpsellPage.postSent = true
			end
		end)
		useEventConnection(leaveGameUpsellPage.Hidden.Event, var32)
		
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
					Padding = UDim.new(0, var20.Tokens.Size.Size_600),
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
								text = var21.confirmLeave,
								onActivated = function() --[[ line: 340 ]]
									-- upvalues: var28 (ref), incomplete (ref), upsellType (ref), constantsModule (copy), default (copy), var29 (ref), getFFlagAddMorePhoneUpsellEvents (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), var25 (ref), var26 (ref), leaveGameModule (copy)
									if not var28 and (incomplete == "Completed" or incomplete == "CompletedAndClosed") and upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
										default:EnableVoice()
										var29(true)
									end
									if getFFlagAddMorePhoneUpsellEvents() then
										rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "formInteraction", { btn = "confirmLeave", origin = var25, section = var26 })
									end
									leaveGameModule(false)
								end,
								buttonRef = var27
							}
						},
						{
							buttonType = buttonType.Secondary,
							props = {
								layoutOrder = 2,
								text = if incomplete == "Completed" and upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then var21.returnWithVoice else var21.dontLeave,
								onActivated = function() --[[ line: 371 ]]
									-- upvalues: getFFlagAddMorePhoneUpsellEvents (copy), incomplete (ref), upsellType (ref), constantsModule (copy), rbxAnalyticsService (copy), getPlatformTarget (copy), var25 (ref), var26 (ref), eventStreamConstants (copy), leaveGameUpsellPage (copy)
									if getFFlagAddMorePhoneUpsellEvents() then
										if incomplete == "Completed" and upsellType == constantsModule.PHONE_UPSELL_VALUE_PROP.VoiceChat then
											rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "formInteraction", { btn = "returnWithVoice", origin = var25, section = var26 })
										elseif incomplete == "Incomplete" then
											rbxAnalyticsService:SendEventDeferred(getPlatformTarget(), "verificationUpsell", "modalAction", {
												origin = var25,
												aType = eventStreamConstants.ActionType.Dismiss,
												section = var26
											})
										end
									end
									leaveGameUpsellPage.DontLeaveFromButton()
								end
							}
						}
					},
					buttonHeight = var20.Tokens.Size.Size_1200
				})
			}),
			TopSpacer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var20.Tokens.Size.Size_600)
			}),
			UpsellComponents = if isIncomplete then reactModule.createElement(reactModule.Fragment, {}, {
				Divider = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BorderSizePixel = 0,
					BackgroundColor3 = var20.Tokens.Color.Stroke.Emphasis.Color3,
					BackgroundTransparency = var20.Tokens.Color.Stroke.Emphasis.Transparency,
					Size = UDim2.new(1, 0, 0, 1)
				}),
				BottomSpacer = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 4,
					Size = UDim2.new(1, 0, 0, var20.Tokens.Size.Size_600)
				}),
				Upsell = reactModule.createElement(leaveGameUpsellPage.UpsellComponent, {
					LayoutOrder = 5,
					origin = var25,
					section = var26,
					showWebpage = p6.showWebpage,
					onUpsellComplete = function() --[[ line: 430 ]]
						-- upvalues: incomplete_1 (ref)
						incomplete_1("Completed")
					end,
					setVoiceEnabled = var29
				})
			}) else nil
		})
	end
	
	leaveGameUpsellPage.handle = roactModule.mount(reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(leaveGameUpsellPage.LeaveGameComponent, { showWebpage = function() --[[ line: 443 ]] end }, {})), leaveGameUpsellPage.Page, "LeaveGameUpsell")
	leaveGameUpsellPage.Page.Size = UDim2.new(1, 0, 0, 0)
	leaveGameUpsellPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	
	return leaveGameUpsellPage
end)()

function var13.SetUpsellProp(value, p7) --[[ line: 457 ]]
	-- upvalues: constantsModule (ref), roactModule (ref), reactModule (ref), inExperienceProviderContainer (ref)
	if p7 == constantsModule.PHONE_UPSELL_VALUE_PROP.None then
		return
	end
	value.upsellType = p7
	value.handle = roactModule.update(value.handle, reactModule.createElement(inExperienceProviderContainer, {}, reactModule.createElement(value.LeaveGameComponent, { showWebpage = function() --[[ line: 470 ]] end }, {})))
end

return var13