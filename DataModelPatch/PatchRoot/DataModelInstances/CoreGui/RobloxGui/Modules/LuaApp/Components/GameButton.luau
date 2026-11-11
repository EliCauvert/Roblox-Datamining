local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactAnalyticsCommonGameEvents = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local FeatureContextModule = require(Modules.LuaApp.Enum.FeatureContext)
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local UserModule = require(Modules.LuaApp.Models.User)
local PlayabilityStatusEnum = require(CorePackages.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local ConvertUniverseIdToStringFunction = require(CorePackages.Workspace.Packages.SharedFlags).ConvertUniverseIdToString
local JoinGameModule = require(Modules.LuaApp.Util.joinGame)
local ConstantsModule = require(Modules.LuaApp.Constants)
local FitImageTextButtonModule = require(Modules.LuaApp.Components.FitImageTextButton)
local LoadingBarWithThemeModule = require(Modules.LuaApp.Components.LoadingBarWithTheme)
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local FFlagPeopleListContextualMenuFixFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPeopleListContextualMenuFixFocusNavigation
local FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel = require(CorePackages.Workspace.Packages.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel
local FFlagEnablePartyNudgeV1DEV = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeV1_DEV
local GREENPRIMARY = ConstantsModule.Color.GREEN_PRIMARY
local WHITE = ConstantsModule.Color.WHITE
local VIEWGAMEDETAILSFROMBUTTON = ConstantsModule.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_BUTTON
local SmallRobuxIcon = ConstantsModule.SmallRobuxIcon

local function v26(Value: number, p1, p2): string
	assert(type(Value) == "number", "formatInteger expects a number; was given type: " .. type(Value))
	local P0 = p1 or ","
	local Count = p2 or 3
	assert(P0, "cannot be nil")
	assert(Count, "cannot be nil")
	local Formatted = string.format("%.0f", (math.abs(Value)))
	local v1 = #Formatted % Count
	
	if v1 == 0 then
		v1 = Count
	end
	local Text = Formatted:sub(1, v1) .. Formatted:sub(v1 + 1):gsub("(" .. string.rep("%d", Count) .. ")", P0 .. "%1")
	
	if Value < 0 then
		Text = "-" .. Text
	end
	return Text
end

local config = {
	[FeatureContextModule.PeopleList] = {
		ViewDetailsEnabled = true,
		JoinGameEnabled = true,
		BuyToPlayButtonEnabled = true
	},
	[FeatureContextModule.PlacesList] = {
		ViewDetailsEnabled = false,
		JoinGameEnabled = false,
		BuyToPlayButtonEnabled = true
	},
	Default = {
		ViewDetailsEnabled = true,
		JoinGameEnabled = true,
		BuyToPlayButtonEnabled = true
	}
}
local GameButton = RoactModule.PureComponent:extend("GameButton")
GameButton.defaultProps = { showLoadingIndicatorWhenDataNotReady = false }

function GameButton.init(p1)
	-- upvalues: FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), FeatureContextModule (copy), VIEWGAMEDETAILSFROMBUTTON (copy), ConstantsModule (copy), JoinGameModule (copy)
	function p1.openGameDetailsFromButton()
		-- upvalues: p1 (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (upval), FeatureContextModule (upval), VIEWGAMEDETAILSFROMBUTTON (upval)
		local UniversePlaceInfo = p1.props.universePlaceInfo
		
		if not FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel and not UniversePlaceInfo then return end
		local Analytics = p1.props.analytics
		local Friend = p1.props.friend
		local Index = p1.props.index
		local AbsolutePosition = p1.props.absolutePosition
		local CallbackOnOpenGameDetailsFunction: () -> () = p1.props.callbackOnOpenGameDetails
		local FeatureContext = p1.props.featureContext
		local UniverseRootPlaceId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.universeRootPlaceId or -1 else UniversePlaceInfo.universeRootPlaceId
		local UniverseId = UniversePlaceInfo.universeId
		
		if UniversePlaceInfo.placeId then
			if FeatureContext == FeatureContextModule.PeopleList then
				Analytics.reportViewProfileFromPeopleList(Friend.id, Index, AbsolutePosition, UniverseRootPlaceId, VIEWGAMEDETAILSFROMBUTTON)
				Analytics.reportOpenGameDetailFromPeopleList(Friend.id, Index, AbsolutePosition, UniverseRootPlaceId, UniverseId, "gameButton", "GameDetailFromGameButton")
			end
			if CallbackOnOpenGameDetailsFunction then
				CallbackOnOpenGameDetailsFunction()
			end
			p1.props.openGameDetails(UniverseId)
		end
	end
	
	function p1.joinGameByUser()
		-- upvalues: p1 (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (upval), FeatureContextModule (upval), ConstantsModule (upval), JoinGameModule (upval)
		local UniversePlaceInfo = p1.props.universePlaceInfo
		
		if not UniversePlaceInfo then return end
		local Analytics = p1.props.analytics
		local Friend = p1.props.friend
		local Index = p1.props.index
		local CallbackOnJoinGameFunction: () -> () = p1.props.callbackOnJoinGame
		local FeatureContext = p1.props.featureContext
		local AbsolutePosition = p1.props.absolutePosition
		local InGameFriendCount = p1.props.inGameFriendCount
		local Source = p1.props.source
		local PlaceId = UniversePlaceInfo.placeId
		local UniverseRootPlaceId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.universeRootPlaceId or -1 else UniversePlaceInfo.universeRootPlaceId
		
		if CallbackOnJoinGameFunction then
			CallbackOnJoinGameFunction()
		end
		local v1: ((any) -> ())? = nil
		local GamePlayIntentInPlacesList = nil
		
		if FeatureContext == FeatureContextModule.PeopleList then
			GamePlayIntentInPlacesList = ConstantsModule.AnalyticsContext.PeopleListInHomePage
			
			v1 = function(p2)
				-- upvalues: Analytics (copy), Friend (copy), Index (copy), AbsolutePosition (copy), PlaceId (copy), UniverseRootPlaceId (copy), InGameFriendCount (copy), Source (copy)
				Analytics.reportPeopleListJoinGame(Friend.id, Index, AbsolutePosition, PlaceId, UniverseRootPlaceId, Friend.gameInstanceId, InGameFriendCount, p2, Source)
			end
		elseif FeatureContext == FeatureContextModule.PlacesList then
			GamePlayIntentInPlacesList = ConstantsModule.AnalyticsContext.GamePlayIntentInPlacesList
			
			v1 = function(p2)
				-- upvalues: Analytics (copy), Friend (copy), PlaceId (copy), UniverseRootPlaceId (copy)
				Analytics.reportJoinGameInPlacesList(Friend.id, PlaceId, UniverseRootPlaceId, Friend.gameInstanceId, p2)
			end
		end
		JoinGameModule:ByUserAndPlaceId(Friend, PlaceId, GamePlayIntentInPlacesList, v1)
	end
end

function GameButton.render(p1)
	-- upvalues: RoactModule (copy), LoadingBarWithThemeModule (copy), FFlagPeopleListContextualMenuFixFocusNavigation (copy), config (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), PlayabilityStatusEnum (copy), GREENPRIMARY (copy), WHITE (copy), ConstantsModule (copy), FFlagEnablePartyNudgeV1DEV (copy), SmallRobuxIcon (copy), v26 (copy), FitImageTextButtonModule (copy), WithStyleFunction (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationModule (copy)
	local UniversePlaceInfo = p1.props.universePlaceInfo
	
	if not UniversePlaceInfo and p1.props.showLoadingIndicatorWhenDataNotReady then
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 104, 0, 32)
		}, {
			LoadingBar = RoactModule.createElement(LoadingBarWithThemeModule)
		})
	end
	local Localization = p1.props.localization
	local LayoutOrder = p1.props.layoutOrder
	local MaxWidth = p1.props.maxWidth
	local SelectionOrder = if FFlagPeopleListContextualMenuFixFocusNavigation then p1.props.selectionOrder else nil
	local Entry = config[p1.props.featureContext] or config.Default
	local NoIsPlayable = false
	local IsReasonProhibitedMatch = false
	local Price = nil
	
	if UniversePlaceInfo then
		NoIsPlayable = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then Entry.JoinGameEnabled and (UniversePlaceInfo.isPlayable == nil or UniversePlaceInfo.isPlayable) else Entry.JoinGameEnabled and UniversePlaceInfo.isPlayable
		IsReasonProhibitedMatch = Entry.BuyToPlayButtonEnabled and UniversePlaceInfo.reasonProhibited == PlayabilityStatusEnum.PurchaseRequired
		Price = UniversePlaceInfo.price
	end
	local ViewDetailsEnabled = Entry.ViewDetailsEnabled
	
	local function v63(p2, p3)
		-- upvalues: GREENPRIMARY (upval), WHITE (upval), ConstantsModule (upval), NoIsPlayable (ref), FFlagEnablePartyNudgeV1DEV (upval), p1 (copy), IsReasonProhibitedMatch (ref), SmallRobuxIcon (upval), ViewDetailsEnabled (copy), v26 (upval), Price (ref), RoactModule (upval), FitImageTextButtonModule (upval), LayoutOrder (copy), MaxWidth (copy), FFlagPeopleListContextualMenuFixFocusNavigation (upval), SelectionOrder (copy)
		local Color = GREENPRIMARY
		local Transparency = 0
		local Color1 = WHITE
		local Transparency1 = 0
		local WHITE1 = ConstantsModule.Color.WHITE
		local Transparency2 = 0
		local GRAY1 = ConstantsModule.Color.GRAY1
		local Transparency3 = 0
		local HeaderFont = nil
		
		if p2 then
			local Theme = p2.Theme
			Color = Theme.ContextualPrimaryDefault.Color
			Transparency = Theme.ContextualPrimaryDefault.Transparency
			Color1 = Theme.ContextualPrimaryContent.Color
			Transparency1 = Theme.ContextualPrimaryContent.Transparency
			WHITE1 = Theme.SystemPrimaryDefault.Color
			Transparency2 = Theme.SystemPrimaryDefault.Transparency
			GRAY1 = Theme.SystemPrimaryContent.Color
			Transparency3 = Theme.SystemPrimaryContent.Transparency
			HeaderFont = p2.Font.Header2.Font
		end
		local BackgroundColor = Color
		local BackgroundTransparency: number = Transparency
		local TextColor = Color1
		local TextTransparency: number = Transparency1
		local JoinWithPartyText = nil
		local OpenGameDetailsFromButton = nil
		local LeftIcon = nil
		
		if NoIsPlayable then
			local IsNotSquadIdMatch: boolean = FFlagEnablePartyNudgeV1DEV and (p1.props.currentSquad and (p1.props.currentSquad.squadId and p1.props.currentSquad.squadId ~= ""))
			JoinWithPartyText = if IsNotSquadIdMatch then p3.joinWithPartyText else p3.joinText
			OpenGameDetailsFromButton = p1.joinGameByUser
		elseif IsReasonProhibitedMatch then
			OpenGameDetailsFromButton = p1.openGameDetailsFromButton
			LeftIcon = SmallRobuxIcon
		else
			if not ViewDetailsEnabled then
				return nil
			end
			JoinWithPartyText = p3.viewDetailsText
			OpenGameDetailsFromButton = p1.openGameDetailsFromButton
			BackgroundColor = WHITE1
			BackgroundTransparency = Transparency2
			TextColor = GRAY1
			TextTransparency = Transparency3
		end
		return RoactModule.createElement(FitImageTextButtonModule, {
			backgroundImage = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png",
			minWidth = 90,
			backgroundColor = BackgroundColor,
			backgroundTransparency = BackgroundTransparency,
			layoutOrder = LayoutOrder,
			leftIconEnabled = LeftIcon ~= nil,
			leftIcon = LeftIcon,
			maxWidth = MaxWidth,
			textFont = HeaderFont,
			text = IsReasonProhibitedMatch and v26(Price) or JoinWithPartyText,
			textColor = TextColor,
			textTransparency = TextTransparency,
			onActivated = OpenGameDetailsFromButton,
			selectionOrder = if FFlagPeopleListContextualMenuFixFocusNavigation then SelectionOrder else nil
		})
	end
	
	local function v64(p2)
		-- upvalues: WithStyleFunction (upval), v63 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: v63 (upval), p2 (copy)
			return v63(p3, p2)
		end)
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then WithLocalizationModule({
		joinText = "Feature.Chat.Drawer.Join",
		joinWithPartyText = "Feature.Squads.Action.JoinWithParty",
		viewDetailsText = "Feature.Chat.Drawer.ViewDetails"
	})(v64) else v64({
		joinText = Localization:Format("Feature.Chat.Drawer.Join"),
		joinWithPartyText = Localization:Format("Feature.Squads.Action.JoinWithParty"),
		viewDetailsText = Localization:Format("Feature.Chat.Drawer.ViewDetails")
	})
end

return (RoactServices.connect({
	analytics = RoactAnalyticsCommonGameEvents,
	guiService = AppGuiService,
	localization = RoactLocalizationModule
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ConvertUniverseIdToStringFunction (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), CryoModule (copy), UserModule (copy), FFlagEnablePartyNudgeV1DEV (copy)
	local ConvertUniverseIdToStringResult = ConvertUniverseIdToStringFunction(p2.universeId)
	local Config = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then {
		universeId = ConvertUniverseIdToStringResult,
		universeRootPlaceId = p2.universeRootPlaceId,
		placeId = p2.placeId
	} else nil
	
	return {
		universePlaceInfo = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then CryoModule.Dictionary.union(p1.UniversePlaceInfos[ConvertUniverseIdToStringResult] or {}, Config) else p1.UniversePlaceInfos[ConvertUniverseIdToStringResult],
		inGameFriendCount = p1.FriendPresenceCounts[UserModule.PresenceType.IN_GAME],
		currentSquad = if FFlagEnablePartyNudgeV1DEV then p1.Squad and (p1.Squad.Squad and p1.Squad.Squad.currentSquad) else nil
	}
end, function(Callback)
	-- upvalues: OpenGameDetailsModule (copy)
	return {
		openGameDetails = function(p1)
			-- upvalues: Callback (copy), OpenGameDetailsModule (upval)
			Callback(OpenGameDetailsModule(p1))
		end
	}
end)(GameButton))))