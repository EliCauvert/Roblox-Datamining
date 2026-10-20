local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local AbbreviateCountFunction = require(CorePackages.Workspace.Packages.Localization).abbreviateCount
local PrimaryStatWidgetModule = require(Modules.LuaApp.Components.PrimaryStatWidget)
local GameRatingsModule = require(Modules.LuaApp.Components.GameDetails.GameRatings)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local GamePlayerFeedbackPrompt = require(CorePackages.Workspace.Packages.PlayerFeedback).GamePlayerFeedbackPrompt
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local GetGamePlayerFeedbackMetadata = require(CorePackages.Workspace.Packages.PlayerFeedback).Thunks.GetGamePlayerFeedbackMetadata
local VoteStatus = require(CorePackages.Workspace.Packages.GameVotesRodux).Enums.VoteStatus
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local GetFFlagEdpPlayerFeedbackLogIXPExposureFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackLogIXPExposure
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local IXPService = game:GetService("IXPService")
local GamePlaysAndRatings = RoactModule.PureComponent:extend("GamePlaysAndRatings")

if GetFFlagEdpPlayerFeedbackEnabledFunction() then
	function GamePlaysAndRatings.init(p1)
		-- upvalues: Logging (copy), GetFFlagEdpPlayerFeedbackLogIXPExposureFunction (copy), IXPService (copy), AppUserLayers (copy), VoteStatus (copy)
		p1.state = { isFeedbackPromptOpen = false }
		
		function p1.openInlineFeedbackPrompt()
			-- upvalues: p1 (copy)
			p1:setState({ isFeedbackPromptOpen = true })
		end
		
		function p1.closeInlineFeedbackPrompt()
			-- upvalues: p1 (copy)
			p1:setState({ isFeedbackPromptOpen = false })
		end
		
		function p1.onClickFeedbackPromptButton()
			-- upvalues: p1 (copy), Logging (upval)
			if p1.state.playerFeedbackMetadata then
				p1.props.openFeedbackForm(p1.props.universeId, p1.state.playerFeedbackMetadata, p1.closeInlineFeedbackPrompt)
				
				return
			else
				Logging.warn("Player feedback metadata is not available from feedback prompt")
			end
		end
		
		function p1.onVoteSuccess(NotVoted)
			-- upvalues: GetFFlagEdpPlayerFeedbackLogIXPExposureFunction (upval), IXPService (upval), AppUserLayers (upval), p1 (copy), VoteStatus (upval), Logging (upval)
			if GetFFlagEdpPlayerFeedbackLogIXPExposureFunction() then
				IXPService:LogUserLayerExposure(AppUserLayers.EDPPlayerFeedbackExposureLayer)
			end
			if not p1.props.enablePlayerFeedback then return end
			local UniverseId = p1.props.universeId
			local Networking = p1.props.networking
			local RootPlaceId = p1.props.rootPlaceId
			
			if NotVoted == VoteStatus.NotVoted then
				p1.closeInlineFeedbackPrompt()
				
				return
			else
				p1.props.getGamePlayerFeedbackMetadata(Networking, UniverseId, RootPlaceId, NotVoted):andThen(function(Result)
					-- upvalues: p1 (upval), UniverseId (copy)
					if Result and Result.canSubmitReview then
						if p1.props.showInlineFeedbackPrompt then
							p1:setState({ playerFeedbackMetadata = Result })
							p1.openInlineFeedbackPrompt()
							
							return
						else
							p1.props.openFeedbackForm(UniverseId, Result)
						end
					end
				end, function()
					-- upvalues: Logging (upval)
					Logging.warn("Failed to get player feedback metadata")
				end)
			end
		end
	end
end
function GamePlaysAndRatings.getLayoutInfo(p1, Number, Uppered, Number1, Uppered1, p2)
	-- upvalues: PrimaryStatWidgetModule (copy)
	local AppTheme = p1.props.appTheme
	local ContainerWidth: number = p1.props.containerWidth
	local MinimumWidthRethemed = nil
	local MinimumWidthRethemed1 = nil
	
	if p2 then
		MinimumWidthRethemed = PrimaryStatWidgetModule.GetMinimumWidthRethemed(Number, Uppered, p2)
		MinimumWidthRethemed1 = PrimaryStatWidgetModule.GetMinimumWidthRethemed(Number1, Uppered1, p2)
	else
		MinimumWidthRethemed = PrimaryStatWidgetModule.GetMinimumWidth(Number, Uppered, AppTheme.GameDetails.Text.BoldFont)
		MinimumWidthRethemed1 = PrimaryStatWidgetModule.GetMinimumWidth(Number1, Uppered1, AppTheme.GameDetails.Text.BoldFont)
	end
	return if ContainerWidth / 2 < math.max(MinimumWidthRethemed, MinimumWidthRethemed1) * 2 then {
		isOneRow = false,
		subSectionWidth = ContainerWidth,
		widgetWidth = ContainerWidth / 2
	} else {
		isOneRow = true,
		subSectionWidth = ContainerWidth / 2,
		widgetWidth = ContainerWidth / 4
	}
end

function GamePlaysAndRatings.render(p1)
	-- upvalues: WithStyleFunction (copy), AbbreviateCountFunction (copy), RoactModule (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy), GameRatingsModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), PrimaryStatWidgetModule (copy), GamePlayerFeedbackPrompt (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), AbbreviateCountFunction (upval), RoactModule (upval), GetFFlagEdpPlayerFeedbackEnabledFunction (upval), GameRatingsModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), PrimaryStatWidgetModule (upval), GamePlayerFeedbackPrompt (upval), FFlagRenameDeprecatedUIBloxTokens (upval)
		local ShowGlobalCounters = p1.props.showGlobalCounters
		local ShowLikesFavoritesCount = p1.props.showLikesFavoritesCount
		local ContainerWidth = p1.props.containerWidth
		local RowPadding = p1.props.rowPadding
		local Visits = p1.props.visits
		local UniverseId = p1.props.universeId
		local LayoutOrder = p1.props.LayoutOrder
		local Localization = p1.props.localization
		local HideVisits = p1.props.hideVisits
		local AbbreviateCountResult = AbbreviateCountFunction(p1.props.playing, Localization:GetLocale())
		local Uppered = string.upper(Localization:Format("Feature.GameDetails.Label.Playing"))
		local AbbreviateCountResult1 = AbbreviateCountFunction(Visits, Localization:GetLocale())
		local Uppered1 = string.upper(Localization:Format("Feature.GameDetails.Label.Visits"))
		local LayoutInfo = p1:getLayoutInfo(AbbreviateCountResult, Uppered, AbbreviateCountResult1, Uppered1, p2)
		local IsOneRow = LayoutInfo.isOneRow
		local SubSectionWidth = LayoutInfo.subSectionWidth
		local WidgetWidth = LayoutInfo.widgetWidth
		local Frame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ContainerWidth, 0, 0),
			LayoutOrder = if GetFFlagEdpPlayerFeedbackEnabledFunction() then 1 else LayoutOrder,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = IsOneRow and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if IsOneRow then 0 else RowPadding)
			}),
			Ratings = RoactModule.createElement(GameRatingsModule, {
				LayoutOrder = if IsOneRow then 1 else 2,
				universeId = UniverseId,
				width = SubSectionWidth,
				showGlobalCounters = ShowGlobalCounters,
				showLikesFavoritesCount = ShowLikesFavoritesCount,
				onVoteSuccess = if GetFFlagEdpPlayerFeedbackEnabledFunction() then p1.onVoteSuccess else nil,
				shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
			}),
			PlaysAndVisitsSection = not HideVisits and (ShowGlobalCounters and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, SubSectionWidth, 0, 0),
				LayoutOrder = if IsOneRow then 2 else 1,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				PlaySection = RoactModule.createElement(PrimaryStatWidgetModule, {
					icon = "LuaApp/icons/GameDetails/playing_large",
					LayoutOrder = 1,
					number = AbbreviateCountResult,
					label = Uppered,
					width = WidgetWidth
				}),
				VisitsSection = RoactModule.createElement(PrimaryStatWidgetModule, {
					icon = "LuaApp/icons/GameDetails/sessions_large",
					LayoutOrder = 2,
					number = AbbreviateCountResult1,
					label = Uppered1,
					width = WidgetWidth
				})
			}))
		})
		
		return if GetFFlagEdpPlayerFeedbackEnabledFunction() then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ContainerWidth, 0, 0),
			LayoutOrder = LayoutOrder,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, RowPadding)
			}),
			GamePlayerAndRatingsFrame = Frame,
			PlayerFeedbackPrompt = if p1.state.isFeedbackPromptOpen then RoactModule.createElement(GamePlayerFeedbackPrompt, {
				LayoutOrder = 2,
				placeId = p1.props.rootPlaceId,
				width = ContainerWidth,
				backgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Shift.Shift_400 else p2.Tokens.Semantic.Color.Ui.Emphasis).Color3,
				backgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Shift.Shift_400 else p2.Tokens.Semantic.Color.Ui.Emphasis).Transparency,
				onDimiss = p1.closeInlineFeedbackPrompt,
				onButtonClick = p1.onClickFeedbackPromptButton
			}) else nil
		}) else Frame
	end)
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameInfosReducer (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy)
	local GameDetailsVEntry = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2.shouldHydrateLegacyIxp then p1.GameDetailsV2[p2.universeId] else p1.GameDetails[p2.universeId]
	local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][p2.universeId]
	
	return {
		playing = GameDetailsVEntry and GameDetailsVEntry.playing or (PersonalizationEntry and PersonalizationEntry.playerCount or 0),
		visits = GameDetailsVEntry and GameDetailsVEntry.visits or 0,
		rootPlaceId = GetFFlagEdpPlayerFeedbackEnabledFunction() and (GameDetailsVEntry and GameDetailsVEntry.rootPlaceId or PersonalizationEntry and PersonalizationEntry.placeId) or nil
	}
end, function(Callback)
	-- upvalues: GetFFlagEdpPlayerFeedbackEnabledFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), GetGamePlayerFeedbackMetadata (copy)
	return {
		openFeedbackForm = if GetFFlagEdpPlayerFeedbackEnabledFunction() then function(UniverseId, PlayerFeedbackMetadata, OnSubmitted)
			-- upvalues: Callback (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
			return Callback(SetCentralOverlayFunction(CentralOverlayType.GamePlayerFeedbackForm, {
				universeId = UniverseId,
				playerFeedbackMetadata = PlayerFeedbackMetadata,
				onSubmitted = OnSubmitted
			}))
		end else nil,
		getGamePlayerFeedbackMetadata = if GetFFlagEdpPlayerFeedbackEnabledFunction() then function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), GetGamePlayerFeedbackMetadata (upval)
			return Callback(GetGamePlayerFeedbackMetadata.Get(p1, p2, p3, p4))
		end else nil
	}
end)((WithThemeDEPRECATEDModule(GamePlaysAndRatings)))

if GetFFlagEdpPlayerFeedbackEnabledFunction() then
	v1 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.EDPPlayerFeedbackExposureLayer }, function(p1, _)
		-- upvalues: AppUserLayers (copy)
		local v2 = p1[AppUserLayers.EDPPlayerFeedbackExposureLayer] or {}
		
		return {
			enablePlayerFeedback = v2.ShowFeedbackForm,
			showInlineFeedbackPrompt = v2.ShowInlinePrompt
		}
	end, false)(v1)
end
return (RoactServices.connect({
	localization = RoactLocalizationModule,
	networking = if GetFFlagEdpPlayerFeedbackEnabledFunction() then RoactNetworking else nil
})(v1))