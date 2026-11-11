local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local DisplayTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.DisplayType)
local GetFFlagDebugShowAccountSecurityPromptBannerModule = require(Modules.LuaApp.Flags.GetFFlagDebugShowAccountSecurityPromptBanner)
local GetFFlagLuaAppAccountSecurityPromptEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled)
local GetFFlagLuaAppAccountSecurityPromptRolloutModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptRollout)
local GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabledFunction = require(CorePackages.Workspace.Packages.PromptAssignments).Flags.GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled
local GetFFlagLuaAppAuthenticatorUpsellPopUpEnabledFunction = require(CorePackages.Workspace.Packages.PromptAssignments).Flags.GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled
local GetFFlagLuaAppEmail2SVUpsellPopUpEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppEmail2SVUpsellPopUpEnabled)
local GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabledFunction = require(CorePackages.Workspace.Packages.PromptAssignments).Flags.GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled
local GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSeconds)
local GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPollingIntervalSeconds)
local GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsVisibleModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsVisible)
local GetFIntLuaAppAccountSecurityPromptPopUpSpawnDelayModule = require(Modules.LuaApp.Flags.GetFIntLuaAppAccountSecurityPromptPopUpSpawnDelay)
local GetDaysRemainingToForceResetStringModule = require(Modules.LuaApp.Components.AccountSecurity.Helpers.GetDaysRemainingToForceResetString)
local PromptBannerWaitInSmallIntervals = game:DefineFastFlag("PromptBannerWaitInSmallIntervals", false)
local FFlagPasskeyUpsellFilteringEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPasskeyUpsellFilteringEnabled
local FilterOutPasskeyUpsellModule = require(Modules.LuaApp.Components.AccountSecurity.Helpers.FilterOutPasskeyUpsell)
local CurrentTabContextModule = require(Modules.LuaApp.Navigation.CurrentTabContext)
local GetPromptAssignmentsModule = require(Modules.LuaApp.Thunks.AccountSecurity.GetPromptAssignments)
local ModalStateModule = require(Modules.LuaApp.Enum.AccountSecurity.ModalState)
local NavigateDownToSecuritySettingsModule = require(Modules.LuaApp.Thunks.NavigateDownToSecuritySettings)
local OpenWebviewModule = require(Modules.LuaApp.Thunks.OpenWebview)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local PromptAssignmentActionModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptAssignmentAction)
local PromptConstantsModule = require(Modules.LuaApp.Components.AccountSecurity.Common.PromptConstants)
local PromptTypeModule = require(Modules.LuaApp.Enum.AccountSecurity.PromptType)
local RoactModule = require(Modules.Common.Roact)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local TouchFriendlyIconButtonModule = require(Modules.LuaApp.Components.Generic.TouchFriendlyIconButton)
local UpdatePromptAssignmentModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment)
local UpdatePromptTypeWithEventModule = require(Modules.LuaApp.Thunks.AccountSecurity.UpdatePromptTypeWithEvent)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local v1 = nil
local IconsStatusAlert = Images["icons/status/alert"]
local IconsNavigationClose = Images["icons/navigation/close"]
local Red = UIBloxModule.App.Style.Colors.Red
local config = {
	[PromptTypeModule.ChangePasswordSuspectedCompromise] = {
		bannerHeader = "Feature.AccountSecurityPrompt.Header.UnusualActivityDetected",
		descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordClickHereStyled",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity"
	},
	[PromptTypeModule.ChangePasswordBreachedCredential] = {
		bannerHeader = "Feature.AccountSecurityPrompt.Header.YourPasswordMightBeStolen",
		descriptionEnd = "Feature.AccountSecurityPrompt.Description.NoChangeForceReset",
		descriptionEndSingular = "Feature.AccountSecurityPrompt.Description.NoChangeForceResetSingular",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordClickHereStyled"
	},
	[PromptTypeModule.AccountRestoresPolicyUpdate] = {
		bannerHeader = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpdate",
		descriptionEnd = "Feature.AccountSecurityPrompt.Description.AuthenticatorSetupPromptClickHere",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyWithDate",
		settingsTitle = "CommonUI.Features.Label.Settings"
	},
	[PromptTypeModule.AccountRestoresPolicyUpdateV2] = {
		bannerHeader = "Feature.AccountSecurityPrompt.Header.KeepYourAccountSafeShort",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.AuthenticatorSetupPromptNewShort",
		settingsTitle = "CommonUI.Features.Label.Help"
	},
	[PromptTypeModule.AccountRestoresPolicyUpdateV3] = {
		bannerHeader = "Feature.AccountSecurityPrompt.Header.AccountRestoresPolicyUpdateV3",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.AccountRestoresPolicyUpdateV3Short",
		settingsTitle = "CommonUI.Features.Label.Settings"
	},
	[PromptTypeModule.Email2SVUpsell] = {
		bannerHeader = "Feature.AccountSecurityPrompt.Header.Email2SVUpsell",
		descriptionStart = "Feature.AccountSecurityPrompt.Description.Email2SVUpsellMessageBody",
		settingsTitle = "CommonUI.Features.Label.Settings"
	}
}
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
ExtendResult.defaultProps = { isInteractive = true }

function ExtendResult.init(p1)
	-- upvalues: FFlagPasskeyUpsellFilteringEnabled (copy), FilterOutPasskeyUpsellModule (copy), PromptTypeModule (copy), DisplayTypeModule (copy), v1 (ref), GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule (copy), PromptAssignmentActionModule (copy), PromptConstantsModule (copy), ModalStateModule (copy)
	p1:setState({
		requestInFlightForDismissButton = false,
		forceRenderValue = 0
	})
	
	function p1.refreshPromptState()
		-- upvalues: p1 (copy), FFlagPasskeyUpsellFilteringEnabled (upval), FilterOutPasskeyUpsellModule (upval), PromptTypeModule (upval), DisplayTypeModule (upval), v1 (upval), GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule (upval)
		p1.props.getPromptAssignments(p1.props.networking):andThen(function(Entry)
			-- upvalues: FFlagPasskeyUpsellFilteringEnabled (upval), FilterOutPasskeyUpsellModule (upval), PromptTypeModule (upval), DisplayTypeModule (upval), p1 (upval), v1 (upval), GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule (upval)
			local IsGeneric = nil
			local PromptType = nil
			local Metadata = nil
			
			if FFlagPasskeyUpsellFilteringEnabled then
				Entry = FilterOutPasskeyUpsellModule(Entry)
			end
			if #Entry > 0 then
				IsGeneric = Entry[1].isGeneric
				PromptType = PromptTypeModule.fromRawValue(Entry[1].promptType)
				
				if PromptType == nil then
					if PromptType == nil and typeof(Entry[1].metadata) == "table" and DisplayTypeModule.fromRawValue(Entry[1].metadata.displayType) ~= nil then
						PromptType = Entry[1].promptType
						Metadata = Entry[1].metadata
					else
						IsGeneric = nil
					end
				else
					Metadata = Entry[1].metadata
				end
			end
			if PromptType ~= p1.props.promptType then
				v1 = nil
			end
			local FIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule: number = GetFIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule()
			
			if FIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule >= 0 and v1 ~= nil and FIntLuaAppAccountSecurityPromptForcePopUpRenderAfterSecondsModule <= DateTime.now().UnixTimestamp - v1.UnixTimestamp then
				v1 = nil
				
				if p1.isMounted then
					p1:setState({ forceRenderValue = p1.state.forceRenderValue + 1 })
				end
			end
			p1.props.updatePromptType(p1.props.analytics, IsGeneric, PromptType, Metadata)
		end):catch(function(_) end):await()
	end
	
	function p1.disablePromptAssignment(p2)
		-- upvalues: p1 (copy), PromptAssignmentActionModule (upval)
		p1:setState({ requestInFlightForDismissButton = true })
		p1.props.updatePromptAssignment(p1.props.networking, p1.props.promptType, p2 and PromptAssignmentActionModule.DismissPrompt or PromptAssignmentActionModule.DisablePrompt):andThen(function()
			-- upvalues: p1 (upval)
			p1.props.updatePromptType(p1.props.analytics, nil, nil, nil)
			p1.refreshPromptState()
			spawn(function()
				-- upvalues: p1 (upval)
				if p1.isMounted then
					p1:setState({ requestInFlightForDismissButton = false })
					
					return
				end
			end)
		end):catch(function(_)
			-- upvalues: p1 (upval)
			if p1.isMounted then
				p1:setState({ requestInFlightForDismissButton = false })
				
				return
			end
		end)
	end
	
	function p1.handlePrimary(SettingsTitle)
		-- upvalues: p1 (copy), PromptTypeModule (upval), PromptConstantsModule (upval), ModalStateModule (upval)
		return function()
			-- upvalues: p1 (upval), PromptTypeModule (upval), PromptConstantsModule (upval), SettingsTitle (copy), ModalStateModule (upval)
			if p1.props.promptType == PromptTypeModule.AccountRestoresPolicyUpdate then
				task.spawn(p1.disablePromptAssignment)
				p1.props.openWebView(PromptConstantsModule.getWebViewUrlAccountSettings(), SettingsTitle)
				
				return
			end
			if p1.props.promptType == PromptTypeModule.AccountRestoresPolicyUpdateV2 then
				task.spawn(p1.disablePromptAssignment)
				p1.props.openWebView(PromptConstantsModule.getWebViewUrlHelpPage(), SettingsTitle)
				
				return
			end
			if p1.props.promptType == PromptTypeModule.AccountRestoresPolicyUpdateV3 then
				p1.props.navigateToSecuritySettings()
				
				return
			end
			if p1.props.promptType == PromptTypeModule.Email2SVUpsell then
				p1.props.openWebView(PromptConstantsModule.getWebViewUrlEmailHighlight(), SettingsTitle)
				
				return
			end
			if not p1.props.isGeneric then
				p1.props.openOverlayWithModalState(ModalStateModule.ChangePasswordIntro)
				
				return
			end
		end
	end
	
	function p1.handleDismissOrDisable()
		-- upvalues: p1 (copy), PromptTypeModule (upval), ModalStateModule (upval)
		if p1.props.promptType == PromptTypeModule.AccountRestoresPolicyUpdate or p1.props.promptType == PromptTypeModule.AccountRestoresPolicyUpdateV2 or p1.props.promptType == PromptTypeModule.AccountRestoresPolicyUpdateV3 or p1.props.isGeneric then
			p1.disablePromptAssignment()
			
			return
		end
		if p1.props.promptType == PromptTypeModule.Email2SVUpsell then
			p1.disablePromptAssignment(true)
			
			return
		else
			p1.props.openOverlayWithModalState(ModalStateModule.ChangePasswordDismissConfirmation)
		end
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: GetFFlagLuaAppAccountSecurityPromptEnabledModule (copy), GetFFlagLuaAppAccountSecurityPromptRolloutModule (copy), GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule (copy), GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsVisibleModule (copy), PromptBannerWaitInSmallIntervals (copy)
	p1.isMounted = true
	spawn(function()
		-- upvalues: p1 (copy), GetFFlagLuaAppAccountSecurityPromptEnabledModule (upval), GetFFlagLuaAppAccountSecurityPromptRolloutModule (upval), GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule (upval), GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsVisibleModule (upval), PromptBannerWaitInSmallIntervals (upval)
		while p1.isMounted and GetFFlagLuaAppAccountSecurityPromptEnabledModule() and GetFFlagLuaAppAccountSecurityPromptRolloutModule(p1.props.userId) do
			local LastUpdatedPromptTypeAt = p1.props.lastUpdatedPromptTypeAt
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			local FIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule = if p1.props.promptType == nil then GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule() else GetFIntLuaAppAccountSecurityPromptPollingIntervalSecondsVisibleModule()
			
			if LastUpdatedPromptTypeAt == nil or FIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule * 1000 < UnixTimestampMillis - LastUpdatedPromptTypeAt.UnixTimestampMillis then
				p1.refreshPromptState()
			end
			if PromptBannerWaitInSmallIntervals then
				local NewClockTime = os.clock() + FIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule
				while os.clock() < NewClockTime and p1.isMounted do
					wait(1)
				end
			else
				wait(FIntLuaAppAccountSecurityPromptPollingIntervalSecondsModule)
			end
		end
		if p1.isMounted then
			p1.props.updatePromptType(p1.props.analytics, nil, nil, nil)
		end
	end)
end

function ExtendResult.willUnmount(p2)
	p2.isMounted = false
end

function ExtendResult.wrapInFrame(p2, RenderInternalResult)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		[RoactModule.Change.AbsoluteSize] = p2.props[RoactModule.Change.AbsoluteSize],
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = p2.props.Position,
		Size = p2.props.Size or UDim2.fromScale(1, 0)
	}, RenderInternalResult)
end

function ExtendResult.renderInternal(p2)
	-- upvalues: GetFFlagDebugShowAccountSecurityPromptBannerModule (copy), PromptTypeModule (copy), config (copy), GetFFlagLuaAppAuthenticatorUpsellPopUpEnabledFunction (copy), GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabledFunction (copy), GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabledFunction (copy), GetFFlagLuaAppEmail2SVUpsellPopUpEnabledModule (copy), RoactModule (copy), CurrentTabContextModule (copy), ModalStateModule (copy), v1 (ref), GetFIntLuaAppAccountSecurityPromptPopUpSpawnDelayModule (copy), WithStyleFunction (copy), WithLocalizationModule (copy), GetDaysRemainingToForceResetStringModule (copy), LocalizationService (copy), Red (copy), ImageSetLabel (copy), IconsStatusAlert (copy), StyledTextLabel (copy), Loading (copy), IconSize (copy), TouchFriendlyIconButtonModule (copy), IconsNavigationClose (copy)
	local IsGeneric = p2.props.isGeneric
	local PromptType = p2.props.promptType
	local Metadata = p2.props.metadata
	local NoShowBanner: boolean = Metadata ~= nil and (Metadata.showBanner == nil or Metadata.showBanner == false)
	local IsInteractive = p2.props.isInteractive
	local DesignTokens = p2.props.designTokens
	local StrokeColor = if DesignTokens then DesignTokens.strokeColor else nil
	local CornerRadius = if DesignTokens then DesignTokens.cornerRadius else nil
	local RequestInFlightForDismissButton = p2.state.requestInFlightForDismissButton
	
	if GetFFlagDebugShowAccountSecurityPromptBannerModule() and not PromptType then
		PromptType = PromptTypeModule.ChangePasswordSuspectedCompromise
	end
	local Entry = config[PromptType]
	local IsPromptTypeMatch: boolean = GetFFlagLuaAppAuthenticatorUpsellPopUpEnabledFunction() and PromptType == PromptTypeModule.AuthenticatorUpsell
	local IsPromptTypeMatch1: boolean = GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabledFunction() and PromptType == PromptTypeModule.BroaderAuthenticatorUpsell
	local IsPromptTypeMatch2: boolean = GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabledFunction() and PromptType == PromptTypeModule.AccountRestoresPolicyUpsell
	local IsPromptTypeMatch3: boolean = GetFFlagLuaAppEmail2SVUpsellPopUpEnabledModule() and PromptType == PromptTypeModule.Email2SVUpsell
	
	if IsGeneric then
		Entry = if Metadata == nil or Metadata.bodyResource == nil or Metadata.headerResource == nil then {} else {
			descriptionStart = "Feature.AccountSecurityPrompt." .. Metadata.bodyResource,
			bannerHeader = "Feature.AccountSecurityPrompt." .. Metadata.headerResource
		}
	elseif Entry == nil and not IsPromptTypeMatch and not IsPromptTypeMatch1 and not IsPromptTypeMatch2 and (not IsPromptTypeMatch3 or NoShowBanner) then
		return nil
	end
	local NoIsGeneric = not IsGeneric
	local IsNotPromptTypeMatch: boolean = if IsGeneric and typeof(Metadata) == "table" and Metadata.showXButtonForDisable == false then not IsInteractive and false elseif IsInteractive then PromptType ~= PromptTypeModule.ChangePasswordBreachedCredential else false
	local _UDim2 = UDim2.new(0, 65, 0, 0)
	local _UDim2_1 = UDim2.new(1, -65, 0, 0)
	local IsNotPromptTypeMatch1: boolean = (not IsGeneric or typeof(Metadata) ~= "table" or Metadata.showAlertIcon ~= false) and PromptType ~= PromptTypeModule.AccountRestoresPolicyUpdateV3
	
	if not IsNotPromptTypeMatch1 then
		_UDim2 = UDim2.new(0, 0, 0, 0)
		_UDim2_1 = UDim2.new(1, if IsNotPromptTypeMatch then -15 else 0, 0, 0)
	end
	return RoactModule.createElement(CurrentTabContextModule.Consumer, {
		render = function(p3)
			-- upvalues: Metadata (copy), IsPromptTypeMatch (copy), IsPromptTypeMatch1 (copy), ModalStateModule (upval), IsPromptTypeMatch2 (copy), IsPromptTypeMatch3 (copy), NoShowBanner (copy), v1 (upval), GetFIntLuaAppAccountSecurityPromptPopUpSpawnDelayModule (upval), p2 (copy), WithStyleFunction (upval), WithLocalizationModule (upval), Entry (ref), PromptType (ref), PromptTypeModule (upval), GetDaysRemainingToForceResetStringModule (upval), LocalizationService (upval), RoactModule (upval), NoIsGeneric (ref), IsInteractive (copy), IsNotPromptTypeMatch (ref), IsNotPromptTypeMatch1 (ref), Red (upval), ImageSetLabel (upval), IconsStatusAlert (upval), _UDim2 (ref), _UDim2_1 (ref), StyledTextLabel (upval), RequestInFlightForDismissButton (copy), Loading (upval), IconSize (upval), TouchFriendlyIconButtonModule (upval), IconsNavigationClose (upval), StrokeColor (copy), CornerRadius (copy)
			if Metadata ~= nil and (Metadata.pageRestriction == "PAGE_RESTRICTION_HOME_PAGE" and p3 ~= "Home") then
				return nil
			end
			local AccountRestoresPolicyUpsell = nil
			
			if IsPromptTypeMatch or IsPromptTypeMatch1 then
				AccountRestoresPolicyUpsell = ModalStateModule.AuthenticatorUpsellIntro
			elseif IsPromptTypeMatch2 then
				AccountRestoresPolicyUpsell = ModalStateModule.AccountRestoresPolicyUpsell
			elseif IsPromptTypeMatch3 and NoShowBanner then
				AccountRestoresPolicyUpsell = ModalStateModule.Email2SVUpsell
			end
			if AccountRestoresPolicyUpsell == nil then
				return WithStyleFunction(function(p4)
					-- upvalues: WithLocalizationModule (upval), Entry (upval), PromptType (upval), PromptTypeModule (upval), GetDaysRemainingToForceResetStringModule (upval), Metadata (upval), LocalizationService (upval), RoactModule (upval), NoIsGeneric (upval), p2 (upval), IsInteractive (upval), IsNotPromptTypeMatch (upval), IsNotPromptTypeMatch1 (upval), Red (upval), ImageSetLabel (upval), IconsStatusAlert (upval), _UDim2 (upval), _UDim2_1 (upval), StyledTextLabel (upval), RequestInFlightForDismissButton (upval), Loading (upval), IconSize (upval), TouchFriendlyIconButtonModule (upval), IconsNavigationClose (upval), StrokeColor (upval), CornerRadius (upval)
					local Color = p4.Theme.TextLink.Color
					local Formatted = string.format("rgb(%d, %d, %d)", math.round(Color.R * 255), math.round(Color.G * 255), (math.round(Color.B * 255)))
					
					return WithLocalizationModule(Entry)(function(p5)
						-- upvalues: Formatted (copy), PromptType (upval), PromptTypeModule (upval), GetDaysRemainingToForceResetStringModule (upval), Metadata (upval), LocalizationService (upval), RoactModule (upval), NoIsGeneric (upval), p2 (upval), IsInteractive (upval), p4 (copy), IsNotPromptTypeMatch (upval), IsNotPromptTypeMatch1 (upval), Red (upval), ImageSetLabel (upval), IconsStatusAlert (upval), _UDim2 (upval), _UDim2_1 (upval), StyledTextLabel (upval), RequestInFlightForDismissButton (upval), Loading (upval), IconSize (upval), TouchFriendlyIconButtonModule (upval), IconsNavigationClose (upval), StrokeColor (upval), CornerRadius (upval)
						if p5 == nil or p5.bannerHeader == nil or p5.bannerHeader == "" or p5.descriptionStart == nil or p5.descriptionStart == "" then
							return nil
						end
						local LinkEnd = p5.descriptionStart:gsub("{styleTagStart}", "<font color=\"" .. Formatted .. "\">"):gsub("{styleTagEnd}", "</font>"):gsub("{linkStart}", "<font color=\"" .. Formatted .. "\">"):gsub("{linkEnd}", "</font>")
						local StyleTagEnd = if p5.descriptionEnd == nil then nil else p5.descriptionEnd:gsub("{styleTagStart}", "<font color=\"" .. Formatted .. "\">"):gsub("{styleTagEnd}", "</font>") or nil
						local Flag = false
						
						if PromptType == PromptTypeModule.ChangePasswordBreachedCredential then
							StyleTagEnd = GetDaysRemainingToForceResetStringModule(p5.descriptionEndSingular, p5.descriptionEnd, Metadata.forceResetTimestamp)
						elseif PromptType == PromptTypeModule.AccountRestoresPolicyUpdate then
							Flag = true
							LinkEnd = LinkEnd:gsub("{date}", DateTime.fromIsoDate(Metadata.accountRestoresPolicyEffectiveTimestamp):FormatUniversalTime("D MMM YYYY", LocalizationService.RobloxLocaleId or "en-us"))
						end
						return PromptType and {
							BannerFrame = RoactModule.createElement("TextButton", {
								[RoactModule.Event.Activated] = if NoIsGeneric then p2.handlePrimary(p5.settingsTitle) else nil,
								AutoButtonColor = IsInteractive,
								AutomaticSize = Enum.AutomaticSize.Y,
								BackgroundColor3 = p4.Theme.SystemPrimaryContent.Color,
								BackgroundTransparency = p4.Theme.SystemPrimaryContent.Transparency,
								BorderSizePixel = 0,
								Size = UDim2.fromScale(1, 0),
								Text = "",
								SelectionImageObject = p2.props.selectionCursor
							}, {
								Padding = RoactModule.createElement("UIPadding", {
									PaddingLeft = UDim.new(0, 15),
									PaddingRight = UDim.new(0, 15),
									PaddingTop = UDim.new(0, 15),
									PaddingBottom = UDim.new(0, 15)
								}),
								BannerLeftFrame = RoactModule.createElement("Frame", {
									BackgroundTransparency = 1,
									BorderSizePixel = 0,
									AutomaticSize = Enum.AutomaticSize.Y,
									Size = UDim2.fromScale(if IsNotPromptTypeMatch then 0.9 else 1, 0)
								}, {
									IconFrame = IsNotPromptTypeMatch1 and RoactModule.createElement("Frame", {
										BackgroundTransparency = 0,
										BorderSizePixel = 0,
										BackgroundColor3 = Red,
										Size = UDim2.fromOffset(50, 50)
									}, {
										UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 10) }),
										Icon = RoactModule.createElement(ImageSetLabel, {
											BackgroundTransparency = 1,
											AnchorPoint = Vector2.new(0.5, 0.5),
											Image = IconsStatusAlert,
											Position = UDim2.fromScale(0.5, 0.5),
											Size = UDim2.fromOffset(36, 36)
										})
									}),
									HeaderContentFrame = RoactModule.createElement("Frame", {
										BackgroundTransparency = 1,
										BorderSizePixel = 0,
										AutomaticSize = Enum.AutomaticSize.Y,
										Position = _UDim2,
										Size = _UDim2_1
									}, {
										ListLayout = RoactModule.createElement("UIListLayout", {
											FillDirection = Enum.FillDirection.Vertical,
											SortOrder = Enum.SortOrder.LayoutOrder
										}),
										Header = RoactModule.createElement(StyledTextLabel, {
											layoutOrder = 1,
											lineHeight = 1,
											automaticSize = Enum.AutomaticSize.Y,
											colorStyle = p4.Theme.SystemPrimaryDefault,
											fontStyle = p4.Font.Header1,
											size = UDim2.new(1, 0, 0, 0),
											text = p5.bannerHeader,
											textXAlignment = Enum.TextXAlignment.Left,
											textYAlignment = Enum.TextYAlignment.Top
										}),
										Spacer = RoactModule.createElement("Frame", {
											LayoutOrder = 2,
											BackgroundTransparency = 1,
											BorderSizePixel = 0,
											Size = UDim2.fromOffset(0, 15)
										}),
										ContentDescriptionLabel = RoactModule.createElement(StyledTextLabel, {
											layoutOrder = 3,
											lineHeight = 1,
											automaticSize = Enum.AutomaticSize.Y,
											colorStyle = p4.Theme.TextDefault,
											fontStyle = p4.Font.Body,
											size = UDim2.new(1, 0, 0, 0),
											text = (Flag or StyleTagEnd == nil) and LinkEnd or LinkEnd .. " " .. StyleTagEnd,
											textXAlignment = Enum.TextXAlignment.Left,
											textYAlignment = Enum.TextYAlignment.Bottom
										}),
										Spacer2 = Flag and RoactModule.createElement("Frame", {
											LayoutOrder = 4,
											BackgroundTransparency = 1,
											BorderSizePixel = 0,
											Size = UDim2.fromOffset(0, 15)
										}) or nil,
										ContentDescriptionLabel2 = Flag and RoactModule.createElement(StyledTextLabel, {
											layoutOrder = 5,
											lineHeight = 1,
											automaticSize = Enum.AutomaticSize.Y,
											colorStyle = p4.Theme.TextDefault,
											fontStyle = p4.Font.Body,
											size = UDim2.new(1, 0, 0, 0),
											text = StyleTagEnd,
											textXAlignment = Enum.TextXAlignment.Left,
											textYAlignment = Enum.TextYAlignment.Bottom
										}) or nil
									})
								}),
								DismissButton = IsNotPromptTypeMatch and (RequestInFlightForDismissButton and RoactModule.createElement(Loading, {
									Position = UDim2.new(1, -15, 0, 15),
									size = IconSize.Medium,
									AnchorPoint = Vector2.new(0.5, 0.5)
								}) or RoactModule.createElement(TouchFriendlyIconButtonModule, {
									iconSize = 28,
									useUIBloxImageSet = true,
									icon = IconsNavigationClose,
									iconColor = p4.Theme.TextDefault.Color,
									iconPosition = UDim2.new(1, -15, 0, 15),
									iconTransparency = p4.Theme.TextDefault.Transparency,
									onActivated = p2.handleDismissOrDisable,
									Position = UDim2.fromScale(0.9, 0),
									Size = UDim2.new(0.1, 0, 0.5, 0)
								})) or nil,
								UIStroke = if StrokeColor then RoactModule.createElement("UIStroke", {
									Thickness = 1,
									ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
									Color = StrokeColor.Color3,
									Transparency = StrokeColor.Transparency
								}) else nil,
								UICorner = if CornerRadius then RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) else nil
							})
						} or nil
					end)
				end)
			end
			if v1 == nil then
				local FIntLuaAppAccountSecurityPromptPopUpSpawnDelayModule: number = GetFIntLuaAppAccountSecurityPromptPopUpSpawnDelayModule()
				
				if FIntLuaAppAccountSecurityPromptPopUpSpawnDelayModule >= 0 then
					task.delay(FIntLuaAppAccountSecurityPromptPopUpSpawnDelayModule, function()
						-- upvalues: p2 (upval), AccountRestoresPolicyUpsell (ref)
						p2.props.openOverlayWithModalState(AccountRestoresPolicyUpsell)
					end)
				else
					p2.props.openOverlayWithModalState(AccountRestoresPolicyUpsell)
				end
				v1 = DateTime.now()
			end
			return nil
		end
	})
end

function ExtendResult.render(p2)
	return p2:wrapInFrame(p2:renderInternal())
end

local v2 = RoactServices.connect({
	analytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p2, _)
	return {
		lastUpdatedPromptTypeAt = p2.AccountSecurityPrompt.lastUpdatedPromptTypeAt,
		isGeneric = p2.AccountSecurityPrompt.isGeneric,
		promptType = p2.AccountSecurityPrompt.promptType,
		metadata = p2.AccountSecurityPrompt.metadata,
		userId = p2.LocalUserId
	}
end, function(Callback)
	-- upvalues: GetPromptAssignmentsModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), OpenWebviewModule (copy), NavigateDownToSecuritySettingsModule (copy), UpdatePromptTypeWithEventModule (copy), UpdatePromptAssignmentModule (copy)
	return {
		getPromptAssignments = function(p2)
			-- upvalues: Callback (copy), GetPromptAssignmentsModule (upval)
			return Callback(GetPromptAssignmentsModule(p2))
		end,
		openOverlayWithModalState = function(ModalState)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
			return Callback(SetCentralOverlayModule(OverlayTypeModule.AccountSecurityPromptOverlay, { modalState = ModalState }))
		end,
		openWebView = function(p2, p3)
			-- upvalues: Callback (copy), OpenWebviewModule (upval)
			return Callback(OpenWebviewModule(p2, p3))
		end,
		navigateToSecuritySettings = function()
			-- upvalues: Callback (copy), NavigateDownToSecuritySettingsModule (upval)
			Callback(NavigateDownToSecuritySettingsModule())
		end,
		updatePromptType = function(p2, p3, p4, p5)
			-- upvalues: Callback (copy), UpdatePromptTypeWithEventModule (upval)
			return Callback(UpdatePromptTypeWithEventModule(p2, p3, p4, p5))
		end,
		updatePromptAssignment = function(p2, p3, p4)
			-- upvalues: Callback (copy), UpdatePromptAssignmentModule (upval)
			return Callback(UpdatePromptAssignmentModule(p2, p3, p4))
		end
	}
end)(ExtendResult)))

return function(p2)
	-- upvalues: UseSelectionCursorFunction (copy), CursorKind (copy), UseDesignTokensFunction (copy), RoactModule (copy), v2 (ref), CryoModule (copy)
	return RoactModule.createElement(v2, CryoModule.Dictionary.join(p2, {
		designTokens = UseDesignTokensFunction().LuaApps.Banner.securityBanner,
		selectionCursor = UseSelectionCursorFunction(CursorKind.RoundedRect)
	}))
end