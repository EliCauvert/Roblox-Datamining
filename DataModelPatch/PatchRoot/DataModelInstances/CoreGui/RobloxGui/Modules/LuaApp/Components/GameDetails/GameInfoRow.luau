local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyle = UIBloxModule.Core.Style.useStyle
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local GuildedLogoWhiteAsset = require(CorePackages.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset
local ProfileTypes = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums).ProfileTypes
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local UseNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local NavigateToBadgesSeeAllFunction = require(CorePackages.Workspace.Packages.Badges).navigateToBadgesSeeAll
local NavigateToDevStoreSeeAllFunction = require(CorePackages.Workspace.Packages.DevStore).navigateToDevStoreSeeAll
local GameDetailsSubpageFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.GameDetailsSubpage
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local LocalizedTextLabelModule = require(Modules.LuaApp.Components.LocalizedTextLabel)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local OpenCentralOverlayForExperienceGuidelinesModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines)
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local OpenCloseOnlyInteractiveAlertFunction = require(CorePackages.Workspace.Packages.DiscoveryRouting).OpenCloseOnlyInteractiveAlert
local GetFFlagUseVoiceExitBetaLanguageFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseVoiceExitBetaLanguage
local FStringLuaAppGenreTooltipStageModule = require(Modules.Personalization.Flags.FStringLuaAppGenreTooltipStage)
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local LuaAppRemoveDeadGameInfoRowTooltipBranch = game:DefineFastFlag("LuaAppRemoveDeadGameInfoRowTooltipBranch", false)
local FFlagLuaAppBadgesSeeAllEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled
local FStringLuaAppBadgesSeeAllIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer
local FFlagLuaAppBadgesSeeAllLogExposure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure
local FFlagLuaAppDevStoreSeeAllSduiEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDevStoreSeeAllSduiEnabled
local FFlagLuaAppDevStoreSeeAllSduiLogExposure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDevStoreSeeAllSduiLogExposure
local FStringLuaAppDevStoreSeeAllSduiIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppDevStoreSeeAllSduiIxpLayer
local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local IconsActionsCycleRight = UIBloxModule.App.ImageSet.Images["icons/actions/cycleRight"]
local GameInfoRow = RoactModule.PureComponent:extend("GameInfoRow")
GameInfoRow.defaultProps = { leftPadding = 0, rightPadding = 0 }

function GameInfoRow.init(p1)
	-- upvalues: RoactModule (copy), GameDetailsSubpageFunction (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), AppPage (copy), FFlagLuaAppDevStoreSeeAllSduiLogExposure (copy), IXPService (copy), FStringLuaAppDevStoreSeeAllSduiIxpLayer (copy), FFlagLuaAppDevStoreSeeAllSduiEnabled (copy), NavigateToDevStoreSeeAllFunction (copy), GetFFlagEnableEdpStoreGridPositionLoggingModule (copy), FFlagLuaAppBadgesSeeAllLogExposure (copy), FStringLuaAppBadgesSeeAllIxpLayer (copy), FFlagLuaAppBadgesSeeAllEnabled (copy), NavigateToBadgesSeeAllFunction (copy), LuaAppRemoveDeadGameInfoRowTooltipBranch (copy), FStringLuaAppGenreTooltipStageModule (copy), EnableCommunityProfilePageIXPModule (copy), TransitionAnimationModule (copy), FFlagEnableBlackbirdPageCloseCallback (copy)
	p1.infoNameTextLabelRef = RoactModule.createRef()
	p1.maxRightContentWidth, p1.setMaxRightContentWidth = RoactModule.createBinding(0)
	p1.state = { buttonPressed = false }
	
	function p1.onAbsoluteSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1.setMaxRightContentWidth((math.floor(Frame.AbsoluteSize.X - (p1.props.leftPadding + p1.props.rightPadding))))
	end
	
	function p1:onInputBegan(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputState == Enum.UserInputState.Begin and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and not p1.state.buttonPressed then
			p1:setState({ buttonPressed = true })
		end
	end
	
	function p1.onInputEnded()
		-- upvalues: p1 (copy)
		if p1.state.buttonPressed then
			p1:setState({ buttonPressed = false })
		end
	end
	
	function p1.onActivated()
		-- upvalues: p1 (copy), GameDetailsSubpageFunction (upval), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval), AppPage (upval), FFlagLuaAppDevStoreSeeAllSduiLogExposure (upval), IXPService (upval), FStringLuaAppDevStoreSeeAllSduiIxpLayer (upval), FFlagLuaAppDevStoreSeeAllSduiEnabled (upval), NavigateToDevStoreSeeAllFunction (upval), GetFFlagEnableEdpStoreGridPositionLoggingModule (upval), FFlagLuaAppBadgesSeeAllLogExposure (upval), FStringLuaAppBadgesSeeAllIxpLayer (upval), FFlagLuaAppBadgesSeeAllEnabled (upval), NavigateToBadgesSeeAllFunction (upval), LuaAppRemoveDeadGameInfoRowTooltipBranch (upval), FStringLuaAppGenreTooltipStageModule (upval), EnableCommunityProfilePageIXPModule (upval), TransitionAnimationModule (upval), FFlagEnableBlackbirdPageCloseCallback (upval)
		local LinkPage = p1.props.linkPage
		local LinkView = p1.props.linkView
		local LinkUrl = p1.props.linkUrl
		
		if not LinkPage and not LinkView and not LinkUrl then return end
		local EventIngest = p1.props.eventIngest
		local UniverseId = p1.props.universeId
		
		if LinkUrl then
			p1.props.openLeaveRobloxAlert(function()
				-- upvalues: p1 (upval), LinkUrl (copy)
				p1.props.linking:openURL(LinkUrl)
				p1.props.closeAlert()
				local LinkClickCallbackFunction: () -> () = p1.props.linkClickCallback
				
				if LinkClickCallbackFunction then
					LinkClickCallbackFunction()
				end
			end)
			
			return
		end
		local AnalyticsSubPage = p1.props.analyticsSubPage
		GameDetailsSubpageFunction(EventIngest, "GameInfoRow", p1.props.placeId, AnalyticsSubPage, if FFlagLuaAppAddUniverseIdToGameDetailsEvents then UniverseId else nil)
		local Text = p1.infoNameTextLabelRef.current.Text
		
		if LinkView == AppPage.ExperienceGuidelinesExplained then
			p1.props.openExperienceGuidelinesExplained(UniverseId)
			
			return
		end
		if LinkView == AppPage.PassesPage then
			if FFlagLuaAppDevStoreSeeAllSduiLogExposure then
				IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppDevStoreSeeAllSduiIxpLayer)
			end
			if FFlagLuaAppDevStoreSeeAllSduiEnabled then
				NavigateToDevStoreSeeAllFunction(p1.props.navigation, UniverseId)
				
				return
			else
				p1.props.navigateDown({
					name = AppPage.PassesPage,
					detail = UniverseId,
					extraProps = if GetFFlagEnableEdpStoreGridPositionLoggingModule() then { viewWidth = p1.props.viewWidth } else nil
				})
				
				return
			end
		else
			if FFlagLuaAppBadgesSeeAllLogExposure and AnalyticsSubPage == "Badges" then
				IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppBadgesSeeAllIxpLayer)
			end
			if FFlagLuaAppBadgesSeeAllEnabled and LinkView == AppPage.BadgesSeeAll then
				NavigateToBadgesSeeAllFunction(p1.props.navigation, UniverseId)
				
				return
			end
			if not LuaAppRemoveDeadGameInfoRowTooltipBranch then
				if LinkView == "UpdatedGenre" then
					p1.props.openCloseOnlyInteractiveAlert(p1.props.infoData, p1.props.localization:Format("Feature.GameDetails.Label.GenreInProgress"), p1.props.closeAlert)
					
					return
				end
				if LinkView == "GenreUnderConstruction" then
					local Localization = p1.props.localization
					local FeatureGameDetailsLabelGenreInProgress = nil
					
					if FStringLuaAppGenreTooltipStageModule == "UnderConstruction" then
						FeatureGameDetailsLabelGenreInProgress = Localization:Format("Feature.GameDetails.Label.GenreUnderConstruction")
					elseif FStringLuaAppGenreTooltipStageModule == "InProgress" then
						FeatureGameDetailsLabelGenreInProgress = Localization:Format("Feature.GameDetails.Label.GenreInProgress")
					end
					if FeatureGameDetailsLabelGenreInProgress then
						p1.props.openCloseOnlyInteractiveAlert(Localization:Format("Feature.GameDetails.Label.Unavailable"), FeatureGameDetailsLabelGenreInProgress, p1.props.closeAlert)
					end
					return
				end
			end
			if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and (AnalyticsSubPage == "Developer" or AnalyticsSubPage == "Group") then
				EnableCommunityProfilePageIXPModule.logExposure()
			end
			if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and LinkView == "CommunityProfilePlatform" and p1.props.linkViewData ~= nil then
				p1.props.openCommunityProfilePage(p1.props.linkViewData, `ExperienceDetailsPage:{AnalyticsSubPage}`)
				
				return
			end
			if LinkView == "UserProfilePlatform" and p1.props.linkViewData ~= nil then
				p1.props.openUserProfilePage(p1.props.linkViewData, `ExperienceDetailsPage:{AnalyticsSubPage}`)
				
				return
			else
				p1.props.navigateDown({
					name = AppPage.GenericWebPage,
					detail = LinkPage,
					extraProps = {
						title = Text,
						transitionAnimation = TransitionAnimationModule.SlideInFromRight,
						onClose = if FFlagEnableBlackbirdPageCloseCallback then p1.props.onClose else nil
					}
				})
			end
		end
	end
end

function GameInfoRow.render(p1)
	-- upvalues: GetFFlagUseVoiceExitBetaLanguageFunction (copy), GuildedLogoWhiteAsset (copy), RoactModule (copy), ReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ImageSetLabel (copy), VerifiedBadgesModule (copy), IconsActionsCycleRight (copy), LocalizedTextLabelModule (copy)
	local Cells = p1.props.appTheme.GameDetails.GameInfoList.Cells
	local Size = p1.props.Size
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local ButtonPressed = p1.state.buttonPressed
	local InfoName = p1.props.infoName
	local InfoData = p1.props.infoData or ""
	local InfoIcon = p1.props.infoIcon
	local HasInfoIcon: boolean = if GetFFlagUseVoiceExitBetaLanguageFunction() then p1.props.infoIcon ~= nil else InfoIcon == GuildedLogoWhiteAsset
	local HasLinkPage = p1.props.linkPage ~= nil or (p1.props.linkView or p1.props.linkUrl)
	local LeftPadding = p1.props.leftPadding
	local RightPadding = p1.props.rightPadding
	local TopPadding = p1.props.topPadding
	local BottomPadding = p1.props.bottomPadding
	
	if not HasLinkPage then
		ButtonPressed = false
	end
	local function getInfoDataTextLabel(_, Style)
		-- upvalues: RoactModule (upval), InfoData (copy), ReactModule (upval), p1 (copy)
		return RoactModule.createElement("TextLabel", {
			Size = UDim2.new(0, 0, 0, 0),
			TextTruncate = Enum.TextTruncate.SplitWord,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Font = Style.Font.Header2.Font,
			TextSize = Style.Font.BaseSize * Style.Font.Header2.RelativeSize,
			TextColor3 = Style.Theme.TextEmphasis.Color,
			TextTransparency = Style.Theme.TextEmphasis.Transparency,
			Text = InfoData,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = false,
			AutomaticSize = Enum.AutomaticSize.XY,
			LayoutOrder = 1,
			[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil
		})
	end
	
	local Style = p1.props.style
	
	return RoactModule.createElement("ImageButton", {
		Size = Size,
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = Position,
		AutoButtonColor = false,
		LayoutOrder = LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = ButtonPressed and Cells.Background.Transparency.Pressed or Cells.Background.Transparency.Default,
		BackgroundColor3 = Cells.Background.Color,
		[RoactModule.Event.InputBegan] = p1.onInputBegan,
		[RoactModule.Event.InputEnded] = p1.onInputEnded,
		[RoactModule.Event.Activated] = p1.onActivated,
		[RoactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Wraps = true,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then Style.Tokens.Size.Size_200 else Style.Tokens.Global.Size_100)
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, LeftPadding),
			PaddingRight = UDim.new(0, RightPadding),
			PaddingTop = UDim.new(0, TopPadding),
			PaddingBottom = UDim.new(0, BottomPadding)
		}),
		RightContent = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 11),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				HorizontalFlex = Enum.UIFlexAlignment.Fill
			}),
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MaxSize = p1.maxRightContentWidth:map(function(X): Vector2
					return Vector2.new(X, 1e999)
				end)
			}),
			InfoIcon = HasInfoIcon and RoactModule.createElement(ImageSetLabel, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, 20, 0, 20),
				Image = p1.props.infoIcon,
				ImageColor3 = Style.Theme.IconEmphasis.Color,
				ImageTransparency = Style.Theme.IconEmphasis.Transparency
			}),
			InfoDataTextLabelVerifiedBadge = p1.props.useVerifiedBadgeEmojiWrapper and RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
				layoutOrder = 1,
				emoji = if p1.props.useVerifiedBadgeEmojiWrapper then VerifiedBadgesModule.emoji.verified else "",
				size = UDim2.new(0, 0, 0, 0),
				anchorPoint = Vector2.new(1, 0),
				automaticSize = Enum.AutomaticSize.XY,
				horizontalAlignment = Enum.HorizontalAlignment.Left,
				verticalAlignment = Enum.VerticalAlignment.Center
			}, { InfoDataTextLabel = getInfoDataTextLabel(true, Style) }),
			InfoDataTextLabel = if p1.props.useVerifiedBadgeEmojiWrapper or InfoData == "" then nil else getInfoDataTextLabel(false, Style),
			LinkArrow = HasLinkPage and RoactModule.createElement(ImageSetLabel, {
				Size = UDim2.new(0, 14, 0, 14),
				Image = IconsActionsCycleRight,
				ImageColor3 = Style.Theme.IconEmphasis.Color,
				ImageTransparency = Style.Theme.IconEmphasis.Transparency,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil
			})
		}),
		InfoNameTextLabel = RoactModule.createElement(if p1.props.disableInfoNameLocalization then "TextLabel" else LocalizedTextLabelModule, {
			Size = UDim2.new(if InfoData == "" then 1 else 0, if InfoData == "" then -25 else 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Font = Style.Font.Body.Font,
			TextSize = Style.Font.BaseSize * Style.Font.Body.RelativeSize,
			TextColor3 = Style.Theme.TextDefault.Color,
			TextTransparency = Style.Theme.TextDefault.Transparency,
			Text = InfoName,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			[RoactModule.Ref] = p1.infoNameTextLabelRef,
			LayoutOrder = 1
		})
	})
end

local WithThemeDEPRECATEDModuleResult = WithThemeDEPRECATEDModule(GameInfoRow)

return RoactServices.connect({
	eventIngest = AppEventIngestService,
	linking = AppLinking,
	localization = RoactLocalizationModule
})((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), OpenCentralOverlayForExperienceGuidelinesModule (copy), OpenCentralOverlayForLeaveRobloxAlertModule (copy), LuaAppRemoveDeadGameInfoRowTooltipBranch (copy), OpenCloseOnlyInteractiveAlertFunction (copy), CloseCentralOverlayFunction (copy), EnableCommunityProfilePageIXPModule (copy), AppPage (copy), ProfileTypes (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(p1)) else Callback(NavigateDownFunction(p1))
		end,
		openExperienceGuidelinesExplained = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForExperienceGuidelinesModule (upval)
			Callback(OpenCentralOverlayForExperienceGuidelinesModule(p1, false))
		end,
		openLeaveRobloxAlert = function(p1)
			-- upvalues: Callback (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
			Callback(OpenCentralOverlayForLeaveRobloxAlertModule(p1))
		end,
		openCloseOnlyInteractiveAlert = if LuaAppRemoveDeadGameInfoRowTooltipBranch then nil else function(p1, p2, p3)
			-- upvalues: Callback (copy), OpenCloseOnlyInteractiveAlertFunction (upval)
			Callback(OpenCloseOnlyInteractiveAlertFunction(p1, p2, p3, nil, false))
		end,
		closeAlert = if LuaAppRemoveDeadGameInfoRowTooltipBranch then nil else function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			Callback(CloseCentralOverlayFunction())
		end,
		openCommunityProfilePage = if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled then function(Detail, Source)
			-- upvalues: AppPage (upval), ProfileTypes (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = {
				name = AppPage.ProfilePlatform,
				detail = Detail,
				extraProps = { profileType = ProfileTypes.Community, source = Source }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end else nil,
		openUserProfilePage = function(Detail, Source)
			-- upvalues: AppPage (upval), ProfileTypes (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownFunction (upval)
			local config = {
				name = AppPage.ProfilePlatform,
				detail = Detail,
				extraProps = { profileType = ProfileTypes.User, source = Source }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownFunction(config))
			end
		end
	}
end)(function(p1)
	-- upvalues: UseStyle (copy), FFlagLuaAppBadgesSeeAllEnabled (copy), FFlagLuaAppDevStoreSeeAllSduiEnabled (copy), UseNavigation (copy), CryoModule (copy), RoactModule (copy), WithThemeDEPRECATEDModuleResult (copy)
	return RoactModule.createElement(WithThemeDEPRECATEDModuleResult, (CryoModule.Dictionary.join(p1, {
		style = UseStyle(),
		navigation = if FFlagLuaAppBadgesSeeAllEnabled or FFlagLuaAppDevStoreSeeAllSduiEnabled then UseNavigation() else nil
	})))
end)))