local LocalizationService = game:GetService("LocalizationService")
local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local IXPService = game:GetService("IXPService")
local Parent = DiscoveryMonolith.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local VoteStates = UIBloxModule.App.Indicator.Enum.VoteStates
local RateCount = UIBloxModule.App.Indicator.RateCount
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local RoactAppPolicy = require(Parent.UniversalAppPolicy).RoactAppPolicy
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local Localization = require(Parent.RobloxAppLocales).Localization
local AbbreviateCountFunction = require(Parent.Localization).abbreviateCount
local GameVotesRoduxModule = require(Parent.GameVotesRodux)
local FetchGameVotes = GameVotesRoduxModule.GameVotes.FetchGameVotes
local FetchUserGameVotes = GameVotesRoduxModule.UserGameVotes.FetchUserGameVotes
local PatchUserVotes = GameVotesRoduxModule.UserGameVotes.PatchUserVotes
local ReasonForNotVoteable = GameVotesRoduxModule.Enums.ReasonForNotVoteable
local VoteStatus = GameVotesRoduxModule.Enums.VoteStatus
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local ToastType = require(Parent.ToastRodux).Enums.ToastType
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local GamePlayerFeedbackPrompt = require(Parent.PlayerFeedback).GamePlayerFeedbackPrompt
local GetGamePlayerFeedbackMetadata = require(Parent.PlayerFeedback).Thunks.GetGamePlayerFeedbackMetadata
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local Logging = require(Parent.AppCommonLib).Logging
local VoteFunction = require(DiscoveryMonolith.Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents).Vote
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(Parent.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local GetFFlagEdpPlayerFeedbackLogIXPExposureFunction = require(Parent.SharedFlags).GetFFlagEdpPlayerFeedbackLogIXPExposure
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppGameStatsFallbackRendering = require(Parent.SharedFlags).FFlagLuaAppGameStatsFallbackRendering
local ExperienceRatings = RoactModule.PureComponent:extend("ExperienceRatings")
ExperienceRatings.validateProps = TModule.interface({
	universeId = TModule.string,
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil,
	height = TModule.optional(TModule.number),
	styleProps = TModule.optional(TModule.table)
})
local config = {
	[VoteStatus.NotVoted] = VoteStates.notVoted,
	[VoteStatus.VotedDown] = VoteStates.votedDown,
	[VoteStatus.VotedUp] = VoteStates.votedUp
}

function ExperienceRatings.init(p1)
	-- upvalues: GetFFlagEdpPlayerFeedbackEnabledFunction (copy), Logging (copy), GetFFlagEdpPlayerFeedbackLogIXPExposureFunction (copy), IXPService (copy), AppUserLayers (copy), VoteStatus (copy), Localization (copy), LocalizationService (copy), MemoizeFunction (copy), AbbreviateCountFunction (copy), ReasonForNotVoteable (copy), RetrievalStatus (copy), VoteFunction (copy), ToastType (copy)
	p1.isMounted = false
	
	if GetFFlagEdpPlayerFeedbackEnabledFunction() then
		p1.state = {
			isFeedbackPromptOpen = false,
			playerFeedbackMetadata = nil
		}
		
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
				p1.props.getGamePlayerFeedbackMetadata(Networking, UniverseId, NotVoted, RootPlaceId):andThen(function(Result)
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
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	p1.getVoteTexts = MemoizeFunction(function(p2, p3, p4, p5)
		-- upvalues: AbbreviateCountFunction (upval), NewLocalization (copy)
		local v1 = if p2 and p3 then p2 + p3 else nil
		local AbbreviateCountResult = v1 and AbbreviateCountFunction(v1, NewLocalization:GetLocale()) or "--"
		
		return {
			votePercentageText = v1 and v1 > 0 and tostring((math.floor(p2 / v1 * 100))) .. "%" or "--",
			totalVotesText = if p4 and p5 then string.upper(NewLocalization:Format("Feature.GameDetails.Label.Votes", { votes = AbbreviateCountResult })) else string.upper(NewLocalization:Format("Feature.GameDetails.Label.Upvoted"))
		}
	end)
	local config = {
		[ReasonForNotVoteable.PlayGame] = "Feature.Toast.VoteError.PlayGame",
		[ReasonForNotVoteable.FloodCheckThresholdMet] = "Feature.Toast.VoteError.FloodCheckThresholdMet",
		[ReasonForNotVoteable.AssetNotVoteable] = "Feature.Toast.VoteError.AssetNotVoteable",
		Default = "Feature.Toast.VoteError.Default"
	}
	
	function p1.onVoteButtonActivated(VotedDown)
		-- upvalues: p1 (copy), RetrievalStatus (upval), GetFFlagEdpPlayerFeedbackEnabledFunction (upval), VoteStatus (upval), VoteFunction (upval), config (copy), ToastType (upval)
		local UniverseId = p1.props.universeId
		local Networking = p1.props.networking
		local RootPlaceId = p1.props.rootPlaceId
		
		if p1.props.voteDataIsLoading then return end
		if not p1.isMounted or not RootPlaceId then return end
		if p1.props.voteDataLoadSucceed then
			local UserGameVotes = p1.props.userGameVotes
			local ReasonForNotVoteable = UserGameVotes.reasonForNotVoteable
			
			if UserGameVotes.canVote then
				local EventIngest = p1.props.eventIngest
				local UserVote = UserGameVotes.userVote
				
				if UserVote == VotedDown then
					VotedDown = VoteStatus.NotVoted
				end
				if GetFFlagEdpPlayerFeedbackEnabledFunction() then
					p1.props.patchUserVotes(Networking, UniverseId, VotedDown, UserVote):andThen(function(Result)
						-- upvalues: p1 (upval), VotedDown (ref)
						if Result ~= nil then
							p1.onVoteSuccess(VotedDown)
						end
					end)
				else
					p1.props.patchUserVotes(Networking, UniverseId, VotedDown, UserVote)
				end
				VoteFunction(EventIngest, "GameRatings", RootPlaceId, VotedDown, UserVote)
			else
				p1.props.setCurrentToastMessage({
					toastType = ToastType.NetworkingError,
					toastMessage = config[ReasonForNotVoteable] or config.Default
				})
			end
			return
		else
			if p1.props.gameVotesFetchingStatus == RetrievalStatus.Failed then
				p1.props.dispatchFetchGameVotes(Networking, UniverseId)
			else
				local EventIngest = p1.props.eventIngest
				
				if GetFFlagEdpPlayerFeedbackEnabledFunction() then
					p1.props.patchUserVotes(Networking, UniverseId, VotedDown, VoteStatus.NotVoted):andThen(function(Result)
						-- upvalues: p1 (upval), VotedDown (ref)
						if Result ~= nil then
							p1.onVoteSuccess(VotedDown)
						end
					end)
				else
					p1.props.patchUserVotes(Networking, UniverseId, VotedDown, VoteStatus.NotVoted)
				end
				VoteFunction(EventIngest, "GameRatings", RootPlaceId, VotedDown, VoteStatus.NotVoted)
			end
		end
	end
	
	function p1.onVoteUpActivated()
		-- upvalues: p1 (copy), VoteStatus (upval)
		p1.onVoteButtonActivated(VoteStatus.VotedUp)
	end
	
	function p1.onVoteDownActivated()
		-- upvalues: p1 (copy), VoteStatus (upval)
		p1.onVoteButtonActivated(VoteStatus.VotedDown)
	end
end

function ExperienceRatings.render(p1)
	-- upvalues: RetrievalStatus (copy), VoteStatus (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy), RoactModule (copy), RateCount (copy), config (copy), WithStyleFunction (copy), GamePlayerFeedbackPrompt (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local GameVotes = p1.props.gameVotes
	local UserGameVotes = p1.props.userGameVotes
	local VoteDataLoadSucceed = p1.props.voteDataLoadSucceed
	local UpVotes = GameVotes and GameVotes.upVotes
	local DownVotes = GameVotes and GameVotes.downVotes
	
	if p1.props.gameVotesFetchingStatus == RetrievalStatus.Done then
		UpVotes = UpVotes or 0
		DownVotes = DownVotes or 0
	end
	local UserVote = VoteDataLoadSucceed and (UserGameVotes and UserGameVotes.userVote) or VoteStatus.NotVoted
	local VoteTexts = p1.getVoteTexts(UpVotes, DownVotes, p1.props.showGlobalCounters, p1.props.showLikesFavoritesCount)
	
	return if GetFFlagEdpPlayerFeedbackEnabledFunction() then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 10)
		}),
		RateCount = RoactModule.createElement(RateCount, {
			height = p1.props.height,
			rateText = VoteTexts.votePercentageText,
			rateLabel = VoteTexts.totalVotesText,
			voteState = config[UserVote],
			onVoteDownActivated = p1.onVoteDownActivated,
			onVoteUpActivated = p1.onVoteUpActivated,
			styleProps = p1.props.styleProps
		}),
		PlayerFeedbackPrompt = p1.state.isFeedbackPromptOpen and WithStyleFunction(function(p2)
			-- upvalues: RoactModule (upval), GamePlayerFeedbackPrompt (upval), p1 (copy), FFlagRenameDeprecatedUIBloxTokens (upval)
			return RoactModule.createElement(GamePlayerFeedbackPrompt, {
				placeId = p1.props.rootPlaceId,
				backgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Surface.Surface_100 else p2.Tokens.Semantic.Color.Background.Contrast).Transparency,
				backgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Surface.Surface_100 else p2.Tokens.Semantic.Color.Background.Contrast).Color3,
				onDimiss = p1.closeInlineFeedbackPrompt,
				onButtonClick = p1.onClickFeedbackPromptButton
			}) or nil
		end)
	}) else RoactModule.createElement(RateCount, {
		rateText = VoteTexts.votePercentageText,
		rateLabel = VoteTexts.totalVotesText,
		voteState = config[UserVote],
		onVoteDownActivated = p1.onVoteDownActivated,
		onVoteUpActivated = p1.onVoteUpActivated
	})
end

function ExperienceRatings.didMount(p1)
	p1.isMounted = true
end

function ExperienceRatings.willUnmount(p1)
	p1.isMounted = false
end

local function _(p1, p2)
	-- upvalues: FFlagLuaAppGameStatsFallbackRendering (copy), GameInfosReducer (copy)
	local GameVote = p1.GameVotes[p2]
	
	if GameVote then
		return GameVote
	end
	if FFlagLuaAppGameStatsFallbackRendering then
		local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][p2]
		
		if PersonalizationEntry then
			return {
				upVotes = PersonalizationEntry.totalUpVotes or 0,
				downVotes = PersonalizationEntry.totalDownVotes or 0
			}
		end
	end
	return nil
end

local v1 = RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FetchGameVotes (copy), FetchUserGameVotes (copy), PatchUserVotes (copy), FFlagLuaAppGameStatsFallbackRendering (copy), GameInfosReducer (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), RetrievalStatus (copy)
	local UniverseId = p2.universeId
	local FetchingStatus = FetchGameVotes.GetFetchingStatus(p1, UniverseId)
	local FetchingStatus1 = FetchUserGameVotes.GetFetchingStatus(p1, UniverseId)
	local PatchingStatus = PatchUserVotes.GetPatchingStatus(p1, UniverseId)
	local GameVote = p1.GameVotes[UniverseId]
	local GameVotes = nil
	repeat
		if GameVote then
			GameVotes = GameVote
			break
		end
		if FFlagLuaAppGameStatsFallbackRendering then
			local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][UniverseId]
			
			if PersonalizationEntry then
				GameVotes = {
					upVotes = PersonalizationEntry.totalUpVotes or 0,
					downVotes = PersonalizationEntry.totalDownVotes or 0
				}
				break
			end
		end
		GameVotes = nil
	until true
	local UserGameVote = p1.UserGameVotes[p2.universeId]
	local RootPlaceId = nil
	
	if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2.shouldHydrateLegacyIxp then
		if p1.GameDetailsV2 and p1.GameDetailsV2[p2.universeId] then
			RootPlaceId = p1.GameDetailsV2 and p1.GameDetailsV2[p2.universeId].rootPlaceId
		else
			local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][p2.universeId]
			
			if PersonalizationEntry then
				RootPlaceId = PersonalizationEntry.placeId
			end
		end
	elseif p1.GameDetails and p1.GameDetails[p2.universeId] then
		RootPlaceId = p1.GameDetails and p1.GameDetails[p2.universeId].rootPlaceId
	else
		local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][p2.universeId]
		
		if PersonalizationEntry then
			RootPlaceId = PersonalizationEntry.placeId
		end
	end
	return {
		gameVotesFetchingStatus = FetchingStatus,
		voteDataIsLoading = FetchingStatus == RetrievalStatus.Fetching or (FetchingStatus1 == RetrievalStatus.Fetching or PatchingStatus == RetrievalStatus.Fetching),
		voteDataLoadSucceed = GameVotes and UserGameVote,
		gameVotes = GameVotes,
		userGameVotes = UserGameVote,
		rootPlaceId = RootPlaceId
	}
end, function(Callback)
	-- upvalues: FetchGameVotes (copy), PatchUserVotes (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), GetGamePlayerFeedbackMetadata (copy), SetCurrentToastMessageFunction (copy)
	return {
		dispatchFetchGameVotes = function(p1, p2)
			-- upvalues: Callback (copy), FetchGameVotes (upval)
			return Callback(FetchGameVotes.Fetch(p1, p2))
		end,
		patchUserVotes = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), PatchUserVotes (upval)
			return Callback(PatchUserVotes.Patch(p1, p2, p3, p4))
		end,
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
			return Callback(GetGamePlayerFeedbackMetadata.Get(p1, p2, p4, p3))
		end else nil,
		setCurrentToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval)
			return Callback(SetCurrentToastMessageFunction(p1))
		end
	}
end)(ExperienceRatings)

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
return (RoactAppPolicy.connect(function(p1)
	return {
		showGlobalCounters = p1.getShowGlobalCounters(),
		showLikesFavoritesCount = p1.getEnableAggregateLikesFavoritesCount()
	}
end)((RoactServices.connect({
	networking = RoactNetworking,
	eventIngest = AppEventIngestService
})(v1))))