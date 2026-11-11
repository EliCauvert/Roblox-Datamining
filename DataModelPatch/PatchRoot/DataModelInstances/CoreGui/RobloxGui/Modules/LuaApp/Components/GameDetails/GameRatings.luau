local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AbbreviateCountFunction = require(CorePackages.Workspace.Packages.Localization).abbreviateCount
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local GameVotesRoduxModule = require(CorePackages.Workspace.Packages.GameVotesRodux)
local ReasonForNotVoteable = GameVotesRoduxModule.Enums.ReasonForNotVoteable
local VoteStatus = GameVotesRoduxModule.Enums.VoteStatus
local FetchGameVotes = GameVotesRoduxModule.GameVotes.FetchGameVotes
local FetchUserGameVotes = GameVotesRoduxModule.UserGameVotes.FetchUserGameVotes
local PatchUserVotes = GameVotesRoduxModule.UserGameVotes.PatchUserVotes
local ToastType = require(CorePackages.Workspace.Packages.ToastRodux).Enums.ToastType
local SetCurrentToastMessageFunction = require(CorePackages.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local VoteFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.Vote
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local GenericIconButtonModule = require(Modules.LuaApp.Components.GenericIconButton)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local PrimaryStatWidgetModule = require(Modules.LuaApp.Components.PrimaryStatWidget)
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local _Rect = Rect.new(9, 9, 9, 9)
local GameRatings = RoactModule.PureComponent:extend("GameRatings")

function GameRatings.init(p1)
	-- upvalues: RetrievalStatus (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy), VoteStatus (copy), VoteFunction (copy), ReasonForNotVoteable (copy), ToastType (copy)
	p1.isMounted = false
	
	function p1.onVoteButtonActivated(VotedDown)
		-- upvalues: p1 (copy), RetrievalStatus (upval), GetFFlagEdpPlayerFeedbackEnabledFunction (upval), VoteStatus (upval), VoteFunction (upval), ReasonForNotVoteable (upval), ToastType (upval)
		local UniverseId = p1.props.universeId
		local Networking = p1.props.networking
		local RootPlaceId = p1.props.rootPlaceId
		
		if not p1.isMounted or not RootPlaceId then return end
		if p1.props.dataLoadSucceed then
			local UserGameVotes = p1.props.userGameVotes
			local ReasonForNotVoteable1 = UserGameVotes.reasonForNotVoteable
			
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
							p1.props.onVoteSuccess(VotedDown)
						end
					end)
				else
					p1.props.patchUserVotes(Networking, UniverseId, VotedDown, UserVote)
				end
				VoteFunction(EventIngest, "GameRatings", RootPlaceId, VotedDown, UserVote)
			elseif ReasonForNotVoteable1 == ReasonForNotVoteable.PlayGame then
				p1.props.setCurrentToastMessage({
					toastMessage = "Feature.Toast.VoteError.PlayGame",
					toastType = ToastType.NetworkingError
				})
			elseif ReasonForNotVoteable1 == ReasonForNotVoteable.FloodCheckThresholdMet then
				p1.props.setCurrentToastMessage({
					toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet",
					toastType = ToastType.NetworkingError
				})
			elseif ReasonForNotVoteable1 == ReasonForNotVoteable.AssetNotVoteable then
				p1.props.setCurrentToastMessage({
					toastMessage = "Feature.Toast.VoteError.AssetNotVoteable",
					toastType = ToastType.NetworkingError
				})
			else
				p1.props.setCurrentToastMessage({
					toastMessage = "Feature.Toast.VoteError.Default",
					toastType = ToastType.NetworkingError
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
							p1.props.onVoteSuccess(VotedDown)
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

function GameRatings.render(p1)
	-- upvalues: RetrievalStatus (copy), AbbreviateCountFunction (copy), WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetLabelModule (copy), _Rect (copy), PrimaryStatWidgetModule (copy), GenericIconButtonModule (copy), VoteStatus (copy)
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local Width = p1.props.width
	local GameVotes = p1.props.gameVotes
	local UserGameVotes = p1.props.userGameVotes
	local IsLoading = p1.props.isLoading
	local DataLoadSucceed = p1.props.dataLoadSucceed
	local ShowGlobalCounters = p1.props.showGlobalCounters
	local ShowLikesFavoritesCount = p1.props.showLikesFavoritesCount
	local Localization = p1.props.localization
	local UpVotes = GameVotes and GameVotes.upVotes or 0
	local NewUpVotes = UpVotes + (GameVotes and GameVotes.downVotes or 0)
	local AbbreviateCountResult = p1.props.gameVotesFetchingStatus == RetrievalStatus.Done and AbbreviateCountFunction(NewUpVotes, Localization:GetLocale()) or "--"
	local Uppered: string = if ShowGlobalCounters and ShowLikesFavoritesCount then string.upper(Localization:Format("Feature.GameDetails.Label.Votes", { votes = AbbreviateCountResult })) else string.upper(Localization:Format("Feature.GameDetails.Label.Upvoted"))
	local Text: string = NewUpVotes > 0 and tostring((math.floor(UpVotes / NewUpVotes * 100))) .. "%" or "--"
	local UserVote = DataLoadSucceed and (UserGameVotes and UserGameVotes.userVote)
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), DEPRECATEDImageSetLabelModule (upval), Width (copy), Position (copy), LayoutOrder (copy), _Rect (upval), PrimaryStatWidgetModule (upval), Text (copy), Uppered (ref), GenericIconButtonModule (upval), UserVote (copy), VoteStatus (upval), IsLoading (copy), p1 (copy)
		return RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = "LuaApp/buttons/buttonFill",
			Size = UDim2.new(0, Width, 0, 70),
			Position = Position,
			LayoutOrder = LayoutOrder,
			ImageColor3 = p2.Theme.UIEmphasis.Color,
			ImageTransparency = p2.Theme.UIEmphasis.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = _Rect
		}, {
			RatingsStat = RoactModule.createElement(PrimaryStatWidgetModule, {
				icon = "LuaApp/icons/GameDetails/rating_large",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				number = Text,
				label = Uppered,
				width = Width - 88 - 30
			}),
			VoteUp = RoactModule.createElement(GenericIconButtonModule, {
				withNewThemeProvider = true,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -10, 0.5, 0),
				Size = UDim2.new(0, 44, 0, 44),
				iconImage = if UserVote == VoteStatus.VotedUp then "LuaApp/icons/GameDetails/voteUpOn" else "LuaApp/icons/GameDetails/voteUpOff",
				iconSize = UDim2.new(0, 36, 0, 36),
				isChecked = UserVote == VoteStatus.VotedUp,
				isLoading = IsLoading,
				onActivated = p1.onVoteUpActivated
			}),
			VoteDown = RoactModule.createElement(GenericIconButtonModule, {
				withNewThemeProvider = true,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -64, 0.5, 0),
				Size = UDim2.new(0, 44, 0, 44),
				iconImage = if UserVote == VoteStatus.VotedDown then "LuaApp/icons/GameDetails/voteDownOn" else "LuaApp/icons/GameDetails/voteDownOff",
				iconSize = UDim2.new(0, 36, 0, 36),
				isChecked = UserVote == VoteStatus.VotedDown,
				isLoading = IsLoading,
				onActivated = p1.onVoteDownActivated
			})
		})
	end)
end

function GameRatings.didMount(p1)
	p1.isMounted = true
end

function GameRatings.willUnmount(p1)
	p1.isMounted = false
end

return RoactServices.connect({
	localization = RoactLocalizationModule,
	networking = RoactNetworking,
	eventIngest = AppEventIngestService
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: PatchUserVotes (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageModule (copy), FetchGameVotes (copy), FetchUserGameVotes (copy), GameInfosReducer (copy), RetrievalStatus (copy)
	local PatchingStatus = PatchUserVotes.GetPatchingStatus(p1, p2.universeId)
	local FetchingStatus = nil
	local FetchingStatus1 = nil
	
	if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2.shouldHydrateLegacyIxp then
		FetchingStatus = ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p1, p2.universeId)
		FetchingStatus1 = ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p1, p2.universeId)
	else
		FetchingStatus = FetchGameVotes.GetFetchingStatus(p1, p2.universeId)
		FetchingStatus1 = FetchUserGameVotes.GetFetchingStatus(p1, p2.universeId)
	end
	local GameVote = p1.GameVotes[p2.universeId]
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
		gameVotes = GameVote,
		userGameVotes = UserGameVote,
		rootPlaceId = RootPlaceId,
		gameVotesFetchingStatus = FetchingStatus,
		isLoading = FetchingStatus == RetrievalStatus.Fetching or (FetchingStatus1 == RetrievalStatus.Fetching or PatchingStatus == RetrievalStatus.Fetching),
		dataLoadSucceed = GameVote and UserGameVote
	}
end, function(Callback)
	-- upvalues: SetCurrentToastMessageFunction (copy), FetchGameVotes (copy), PatchUserVotes (copy)
	return {
		setCurrentToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageFunction (upval)
			return Callback(SetCurrentToastMessageFunction(p1))
		end,
		dispatchFetchGameVotes = function(p1, p2)
			-- upvalues: Callback (copy), FetchGameVotes (upval)
			return Callback(FetchGameVotes.Fetch(p1, p2))
		end,
		patchUserVotes = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), PatchUserVotes (upval)
			return Callback(PatchUserVotes.Patch(p1, p2, p3, p4))
		end
	}
end)(GameRatings)))