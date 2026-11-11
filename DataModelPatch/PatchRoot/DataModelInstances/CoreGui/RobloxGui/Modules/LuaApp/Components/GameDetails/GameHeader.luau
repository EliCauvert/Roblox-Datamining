local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local GameIconReducer = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithTextSizeOffsetFunction = UIBloxModule.Core.Style.withTextSizeOffset
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local UseTokens = require(CorePackages.Packages.Foundation).Hooks.useTokens
local Text = require(CorePackages.Packages.Foundation).Text
local FollowFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.Follow
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SendGameFollowModule = require(Modules.LuaApp.Thunks.SendGameFollow)
local GameDetailNotificationsButtonModule = require(Modules.LuaApp.Components.GameDetails.GameDetailNotificationsButton)
local UseExperienceDetailsNavigationModule = require(script.Parent.Parent.ExperienceDetails.useExperienceDetailsNavigation)
local UseEdpServerIxpVariablesModule = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables)
local ExperienceDetailsExperimentationModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation)
local GetNotificationsExperienceDetailsVariant = require(CorePackages.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant
local GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability
local FFlagEnableCreatorSubtitleNavigationModule = require(Modules.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation)
local FFlagCreatorSubtitleNavigationIXPEnabledModule = require(Modules.LuaApp.Flags.FFlagCreatorSubtitleNavigationIXPEnabled)
local FStringCreatorSubtitleNavigationExperimentLayerModule = require(Modules.LuaApp.Flags.FStringCreatorSubtitleNavigationExperimentLayer)
local GameHeader = RoactModule.PureComponent:extend("GameHeader")

function GameHeader.init(p1)
	-- upvalues: GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction (copy), FollowFunction (copy), FFlagCreatorSubtitleNavigationIXPEnabledModule (copy), IXPServiceWrapper (copy), FStringCreatorSubtitleNavigationExperimentLayerModule (copy), RoactModule (copy), FFlagEnableCreatorSubtitleNavigationModule (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), VerifiedBadgesModule (copy)
	function p1.toggleFollowExperience()
		-- upvalues: p1 (copy), GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction (upval), FollowFunction (upval)
		local GameFollowings = p1.props.gameFollowings
		local UniverseId = p1.props.universeId
		local RootPlaceId = p1.props.rootPlaceId
		
		if GameFollowings ~= nil and RootPlaceId ~= nil and UniverseId ~= nil then
			local IsFollowed = GameFollowings.isFollowed
			local EventIngest = p1.props.eventIngest
			p1.props.sendGameFollow(p1.props.networking, UniverseId, not IsFollowed, if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then true else p1.props.enableNotificationsDiscoverability, p1.props.notificationsEnabled.count or 0, p1.props.notificationsEnabled.limit or 0)
			FollowFunction(EventIngest, "GameDetailsGameHeader", RootPlaceId, not IsFollowed)
			
			return
		end
	end
	
	function p1.renderSubtitle(Creator, LayoutOrder, p2, p3)
		-- upvalues: FFlagCreatorSubtitleNavigationIXPEnabledModule (upval), IXPServiceWrapper (upval), FStringCreatorSubtitleNavigationExperimentLayerModule (upval), RoactModule (upval), FFlagEnableCreatorSubtitleNavigationModule (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), p1 (copy), FFlagRenameDeprecatedUIBloxTokens (upval), VerifiedBadgesModule (upval)
		return RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
			emoji = if Creator.hasVerifiedBadge then VerifiedBadgesModule.emoji.verified else "",
			layoutOrder = LayoutOrder,
			maximumEmojiSize = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.FontSize.FontSize_350 else p2.Tokens.Global.FontSize_75) + p3
		}, {
			subtitleText = (function(Text)
				-- upvalues: FFlagCreatorSubtitleNavigationIXPEnabledModule (upval), IXPServiceWrapper (upval), FStringCreatorSubtitleNavigationExperimentLayerModule (upval), RoactModule (upval), FFlagEnableCreatorSubtitleNavigationModule (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), p1 (upval), FFlagRenameDeprecatedUIBloxTokens (upval), p2 (copy), LayoutOrder (copy), Creator (copy)
				if FFlagCreatorSubtitleNavigationIXPEnabledModule then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringCreatorSubtitleNavigationExperimentLayerModule)
				end
				return RoactModule.createElement(if FFlagEnableCreatorSubtitleNavigationModule then "TextButton" else "TextLabel", {
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = Text,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Font = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and p1.props.showAgeMaturityInHeader then p1.props.foundationTokens.Typography.BodyMedium.Font elseif FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Typography.BodyLarge.Font else p2.Tokens.Semantic.Typography.Body.Font,
					TextSize = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and p1.props.showAgeMaturityInHeader then p1.props.foundationTokens.Typography.BodyMedium.FontSize elseif FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.FontSize.FontSize_350 else p2.Tokens.Global.FontSize_75,
					TextColor3 = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and p1.props.showAgeMaturityInHeader then p1.props.foundationTokens.Color.Content.Default.Color3 else (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Muted else p2.Tokens.Semantic.Color.Text.Muted).Color3,
					TextTransparency = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and p1.props.showAgeMaturityInHeader then p1.props.foundationTokens.Color.Content.Default.Transparency else (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Muted else p2.Tokens.Semantic.Color.Text.Muted).Transparency,
					LayoutOrder = LayoutOrder,
					RichText = false,
					LineHeight = 1,
					[RoactModule.Event.Activated] = if FFlagEnableCreatorSubtitleNavigationModule then function()
						-- upvalues: Creator (upval), p1 (upval)
						if Creator.type == "User" then
							p1.props.openUserProfilePage(Creator.id, "GameDetailsGameHeader")
							
							return
						end
						if Creator.type == "Group" then
							p1.props.openCommunityProfilePage(Creator.id, "GameDetailsGameHeader")
						end
					end else nil
				})
			end)(Creator.name)
		})
	end
end

function GameHeader.render(p1)
	-- upvalues: GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy), WithLocalizationFunction (copy), WithTextSizeOffsetFunction (copy), WithStyleFunction (copy), RoactModule (copy), LoadableImage (copy), Text (copy), FFlagRenameDeprecatedUIBloxTokens (copy), GameDetailNotificationsButtonModule (copy)
	local EnableNotificationsDiscoverability = if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then true else p1.props.enableNotificationsDiscoverability
	local GameDetail = p1.props.gameDetail
	local GameInfo = p1.props.gameInfo
	local Creator = GameDetail and GameDetail.creator
	local RootPlaceId = nil
	RootPlaceId = if EnableNotificationsDiscoverability then p1.props.rootPlaceId else nil
	local LayoutOrder = p1.props.LayoutOrder
	local ShowSubtitle = p1.props.showSubtitle
	local Name = GameDetail and GameDetail.name or (GameInfo and GameInfo.name or nil)
	local XOffset: number = if p1.props.showNotificationButton then -116 else -68
	local DisplayNameWithHeaderShort = nil
	
	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.showAgeMaturityInHeader and p1.props.ageRecommendations) then
		local Summary = p1.props.ageRecommendations.summary
		local AgeRecommendation = Summary and Summary.ageRecommendation or nil
		
		if AgeRecommendation then
			DisplayNameWithHeaderShort = AgeRecommendation.displayNameWithHeaderShort or AgeRecommendation.displayName
		end
	end
	return WithLocalizationFunction({
		containsStrongLanguageText = "Feature.GameDetails.Label.ContainsStrongLanguagePillWarning"
	})(function(_)
		-- upvalues: WithTextSizeOffsetFunction (upval), WithStyleFunction (upval), RoactModule (upval), LayoutOrder (copy), LoadableImage (upval), p1 (copy), XOffset (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), Text (upval), Name (copy), FFlagRenameDeprecatedUIBloxTokens (upval), ShowSubtitle (copy), Creator (copy), DisplayNameWithHeaderShort (ref), EnableNotificationsDiscoverability (copy), GameDetailNotificationsButtonModule (upval), RootPlaceId (ref)
		return WithTextSizeOffsetFunction(function(p2)
			-- upvalues: WithStyleFunction (upval), RoactModule (upval), LayoutOrder (upval), LoadableImage (upval), p1 (upval), XOffset (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), Text (upval), Name (upval), FFlagRenameDeprecatedUIBloxTokens (upval), ShowSubtitle (upval), Creator (upval), DisplayNameWithHeaderShort (upval), EnableNotificationsDiscoverability (upval), GameDetailNotificationsButtonModule (upval), RootPlaceId (upval)
			return WithStyleFunction(function(p3)
				-- upvalues: RoactModule (upval), LayoutOrder (upval), LoadableImage (upval), p1 (upval), XOffset (upval), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (upval), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (upval), ExperienceDetailsExperimentationModule (upval), Text (upval), Name (upval), FFlagRenameDeprecatedUIBloxTokens (upval), ShowSubtitle (upval), Creator (upval), p2 (copy), DisplayNameWithHeaderShort (upval), EnableNotificationsDiscoverability (upval), GameDetailNotificationsButtonModule (upval), RootPlaceId (upval)
				return RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					LayoutOrder = LayoutOrder,
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12),
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					GameIcon = RoactModule.createElement(LoadableImage, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(56, 56),
						Image = p1.props.gameIcon and p1.props.gameIcon.url,
						cornerRadius = UDim.new(0, 8)
					}),
					HeaderText = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, XOffset, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						TextListLayout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 4)
						}),
						Title = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and p1.props.showAgeMaturityInHeader then RoactModule.createElement(Text, {
							TextWrapped = true,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Position = UDim2.new(0, 0, 0, 0),
							Text = Name,
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = p1.props.foundationTokens.Typography.HeadingSmall,
							textStyle = p1.props.foundationTokens.Color.Content.Emphasis
						}) else RoactModule.createElement("TextLabel", {
							TextWrapped = true,
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Position = UDim2.new(0, 0, 0, 0),
							Text = Name,
							TextXAlignment = Enum.TextXAlignment.Left,
							Font = if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.HeadingSmall.Font else p3.Tokens.Semantic.Typography.Header.Font,
							TextSize = if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Typography.HeadingSmall.FontSize else p3.Tokens.Semantic.Typography.Header.FontSize,
							TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Color.Content.Emphasis else p3.Tokens.Semantic.Color.Text.Emphasis).Color3,
							TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p3.Tokens.Color.Content.Emphasis else p3.Tokens.Semantic.Color.Text.Emphasis).Transparency
						}),
						Subtitle = ShowSubtitle and (Creator and p1.renderSubtitle(Creator, 2, p3, p2, if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui() then p1.props.foundationTokens else nil)),
						AgeMaturity = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (p1.props.showAgeMaturityInHeader and DisplayNameWithHeaderShort) then RoactModule.createElement(Text, {
							TextWrapped = true,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.XY,
							TextXAlignment = Enum.TextXAlignment.Left,
							textStyle = p1.props.foundationTokens.Color.Content.Default,
							fontStyle = p1.props.foundationTokens.Typography.BodyMedium,
							Text = DisplayNameWithHeaderShort
						}) else nil
					}),
					NotificationsFrame = if p1.props.showNotificationButton and EnableNotificationsDiscoverability then RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 3,
						Size = UDim2.fromScale(0, 1),
						Position = UDim2.new(1, -36, 0, 0)
					}, {
						GameDetailNotificationsButton = RoactModule.createElement(GameDetailNotificationsButtonModule, {
							universeId = p1.props.universeId,
							gameFollowings = p1.props.gameFollowings,
							rootPlaceId = RootPlaceId,
							toggleFollowExperience = p1.toggleFollowExperience
						})
					}) else nil
				})
			end)
		end)
	end)
end

local v1: (any) -> any = RoactAppPolicy.connect(function(p1, _)
	return { showSubtitle = p1.getGameDetailsSubtitle() }
end)((RoactServices.connect({
	networking = RoactNetworking,
	eventIngest = AppEventIngestService
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: GameInfosReducer (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameIconReducer (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentationModule (copy)
	local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][p2.universeId]
	local Config = nil
	local GameDetailsVEntry = nil
	
	if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2.shouldHydrateLegacyIxp then
		GameDetailsVEntry = p1.GameDetailsV2[p2.universeId]
		Config = if p1[GameIconReducer.key][p2.universeId] == nil then {
			url = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", p2.universeId)
		} else p1[GameIconReducer.key][p2.universeId]
	else
		Config = p1[GameIconReducer.key][p2.universeId]
		GameDetailsVEntry = p1.GameDetails[p2.universeId]
	end
	return {
		gameDetail = GameDetailsVEntry,
		gameInfo = PersonalizationEntry,
		gameIcon = Config,
		gameFollowings = p1.GameFollowings[p2.universeId],
		rootPlaceId = GameDetailsVEntry and GameDetailsVEntry.rootPlaceId or PersonalizationEntry and PersonalizationEntry.placeId,
		notificationsEnabled = p1.ExperienceNotificationsEnabled or {},
		ageRecommendations = if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and p2.showAgeMaturityInHeader then p1.AgeRecommendations[p2.universeId] else nil
	}
end, function(Callback)
	-- upvalues: SendGameFollowModule (copy)
	return {
		sendGameFollow = function(p1, p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), SendGameFollowModule (upval)
			return Callback(SendGameFollowModule(p1, p2, p3, p4, p5, p6))
		end
	}
end)(GameHeader)))))

if not GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then
	v1 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.ExperienceDetailsPageLayer }, function(p1, _)
		-- upvalues: AppUserLayers (copy), GetNotificationsExperienceDetailsVariant (copy)
		return {
			enableNotificationsDiscoverability = ((p1[AppUserLayers.ExperienceDetailsPageLayer] or {})[GetNotificationsExperienceDetailsVariant.getNotificationsVariantFieldName] or -1) == 2
		}
	end)(v1)
end
if FFlagEnableCreatorSubtitleNavigationModule or FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
	v1 = function(p1)
		-- upvalues: FFlagEnableCreatorSubtitleNavigationModule (copy), UseExperienceDetailsNavigationModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), UseEdpServerIxpVariablesModule (copy), UseTokens (copy), ExperienceDetailsExperimentationModule (copy), DashModule (copy), RoactModule (copy), v1 (copy)
		local v2 = if FFlagEnableCreatorSubtitleNavigationModule then UseExperienceDetailsNavigationModule(if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.shouldHydrateLegacyIxp else nil) else nil
		local v3 = nil
		local v4 = nil
		
		if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
			v3 = UseEdpServerIxpVariablesModule()
			v4 = UseTokens()
		end
		return RoactModule.createElement(v1, (DashModule.join(p1, {
			openCommunityProfilePage = if FFlagEnableCreatorSubtitleNavigationModule then v2.openCommunityProfilePage else nil,
			openUserProfilePage = if FFlagEnableCreatorSubtitleNavigationModule then v2.openUserProfilePage else nil,
			edpServerIxpVariables = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then v3 else nil,
			foundationTokens = if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then v4 else nil,
			showAgeMaturityInHeader = (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentationModule.getShouldInterleaveSdui()) and (v3 and v3.showAgeMaturityInHeader == true) or nil
		})))
	end
end
return v1