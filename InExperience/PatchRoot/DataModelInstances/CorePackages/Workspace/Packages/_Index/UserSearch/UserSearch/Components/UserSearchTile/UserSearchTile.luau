local HttpService = game:GetService("HttpService")
local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local PlayerTile = UIBloxModule.App.Tile.PlayerTile
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(Parent.UserLib).Utils.Constants
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseContextualInfoModule = require(script.Parent.useContextualInfo)
local UseSearchTileButtonsModule = require(script.Parent.useSearchTileButtons)
local UseProfileNamesModule = require(script.Parent.useProfileNames)
local ResponsiveModule = require(Parent.Responsive)
local SignalsReactModule = require(Parent.SignalsReact)
local ProfileInsightsStore = require(Parent.DataHydration.ProfileInsights).ProfileInsightsStore
local EventNamesModule = require(UserSearch.Analytics.EventNames)
local _ = require(UserSearch.Common.LocalTypes)
local RoundCTAButtonModule = require(UserSearch.Components.RoundCTAButton)
local _ = require(Parent.GraphQLServer)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local FFlagBlendedSerpUserPresenceInLineEnabled = require(Parent.SharedFlags).FFlagBlendedSerpUserPresenceInLineEnabled
local FFlagUserSearchAddFocusActionsSupport = require(Parent.SharedFlags).FFlagUserSearchAddFocusActionsSupport
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(Parent.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local FFlagUserSearchPresenceStoreMigrationModule = require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local FFlagUserSearchUseProfileFrameThumbnailModule = require(UserSearch.Flags.FFlagUserSearchUseProfileFrameThumbnail)
local FFlagUserSearchCancelTileActivationOnHoldIntent = require(Parent.SharedFlags).FFlagUserSearchCancelTileActivationOnHoldIntent
local FFlagSduiUserSearchTile = require(Parent.SharedFlags).FFlagSduiUserSearchTile
local FFlagPlayerSearchEnableOnlineFrequentsForAll = require(Parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll
local FFlagUserSearchClassmatesInsight = require(Parent.SharedFlags).FFlagUserSearchClassmatesInsight
local RODUXKEY = require(UserSearch.Common.Constants).RODUX_KEY
local PresenceHelpersModule = require(UserSearch.Utils.PresenceHelpers)
local UserTileEventHandlers = require(Parent.UserTile).UserTileEventHandlers

local function _(p1, p2) --[[ Line: 89 ]]
	-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagUserSearchUseProfileFrameThumbnailModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	return if p2 then GetStandardSizeAvatarHeadShotRbxthumbFunction(tostring(p1), FFlagUserSearchUseProfileFrameThumbnailModule) else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(p1), Constants.RbxthumbTypes.Avatar, 720)
end

return function(p1) --[[ Line: 97 ]]
	-- upvalues: FFlagUserSearchAddFocusActionsSupport (copy), ReactModule (copy), FFlagUserSearchCancelTileActivationOnHoldIntent (copy), UseStyleFunction (copy), FFlagSduiUserSearchTile (copy), FFlagPlayerSearchEnableOnlineFrequentsForAll (copy), ProfileInsightsStore (copy), FFlagUserSearchClassmatesInsight (copy), SignalsReactModule (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), UseLastInputModeFunction (copy), FFlagUserSearchPresenceStoreMigrationModule (copy), UseGetPresenceByUserIdFunction (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RODUXKEY (copy), UseContextualInfoModule (copy), ResponsiveModule (copy), CryoModule (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), HttpService (copy), EventNamesModule (copy), UseSearchTileButtonsModule (copy), UseProfileNamesModule (copy), PresenceHelpersModule (copy), PlayerTile (copy), FFlagBlendedSerpUserPresenceInLineEnabled (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagUserSearchUseProfileFrameThumbnailModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), UserTileEventHandlers (copy), RoundCTAButtonModule (copy)
	local UseRefResult = if FFlagUserSearchAddFocusActionsSupport then ReactModule.useRef(nil) else nil
	local v1 = nil
	local UseResult = nil
	
	if FFlagUserSearchCancelTileActivationOnHoldIntent then
		local UseRefResult1 = ReactModule.useRef(false)
		v1 = UseRefResult1
		UseResult = ReactModule.useCallback(function(Current) --[[ Line: 104 ]]
			-- upvalues: UseRefResult1 (copy)
			UseRefResult1.current = Current
		end, {})
	end
	local User = p1.user
	local UseStyleResult = UseStyleFunction()
	local NoShouldUseCompactTiles: boolean = p1.enablePresenceIndicator and not p1.shouldUseCompactTiles
	local Size250 = UseStyleResult.Tokens.Size.Size_250
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.OmniSearchResultsPageUXExposureLayer }, function(p2): boolean --[[ Line: 130 ]]
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.OmniSearchResultsPageUXExposureLayer] or {}).userPresenceIndicator == "showPresenceInLine"
	end, false)
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseGetPresenceByUserIdResult = if FFlagUserSearchPresenceStoreMigrationModule then UseGetPresenceByUserIdFunction((tostring(User.id))) else UseSelectorFunction(function(p2) --[[ Line: 144 ]]
		-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), User (copy)
		return GetDeepValueFunction(p2, string.format("%s.Presence.byUserId.%s", RODUXKEY, User.id)) or {}
	end)
	local UseContextualInfoModuleResult, UseContextualInfoModuleResult2 = UseContextualInfoModule({
		userId = User.id,
		previousUsernames = User.previousUsernames,
		searchKeyword = p1.searchParameters.searchKeyword,
		profileInsight = if FFlagSduiUserSearchTile then SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 113 ]]
			-- upvalues: FFlagPlayerSearchEnableOnlineFrequentsForAll (upval), ProfileInsightsStore (upval), User (copy), FFlagUserSearchClassmatesInsight (upval)
			local ProfileInfoBoost = if FFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
			
			return ProfileInsightsStore.get().GetProfileInsight(User.id, {
				rankingStrategy = ProfileInfoBoost,
				count = if FFlagUserSearchClassmatesInsight and ProfileInfoBoost then 3 else nil
			})
		end, { User.id }).data) else p1.profileInsight,
		shouldUseCompactTiles = p1.shouldUseCompactTiles,
		userPresence = UseGetPresenceByUserIdResult
	})
	local IsUsePreferredInputResultMatch = if FFlagUserSearchAddFocusActionsSupport then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional else nil
	
	local function v47(PlayerTileClick, p2) --[[ Line: 162 ]]
		-- upvalues: p1 (copy), CryoModule (upval), User (copy), UseContextualInfoModuleResult2 (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (upval), HttpService (upval)
		if p1.fireAnalyticsEvent then
			p1.fireAnalyticsEvent(PlayerTileClick, CryoModule.Dictionary.join({
				playerId = User.id,
				tilePos = p1.index,
				contextualInfoType = UseContextualInfoModuleResult2,
				hasEmphasis = p1.hasEmphasis,
				rowInSort = p1.rowInSort,
				positionInRow = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.positionInRow else nil,
				feedRowNumber = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.feedRowNumber else nil,
				interactionUuid = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then HttpService:GenerateGUID(false) else nil
			}, p2 or {}))
		end
	end
	
	local function OnActivated() --[[ Line: 182 ]]
		-- upvalues: FFlagUserSearchCancelTileActivationOnHoldIntent (upval), v1 (ref), p1 (copy), User (copy), UseContextualInfoModuleResult2 (copy), UseContextualInfoModuleResult (copy), v47 (copy), EventNamesModule (upval)
		if FFlagUserSearchCancelTileActivationOnHoldIntent and v1.current then
			v1.current = false
			
			return
		else
			p1.luaAppNavigation.navigateToUserInfo({
				userId = User.id,
				index = p1.index,
				hasEmphasis = p1.hasEmphasis,
				contextualInfoType = UseContextualInfoModuleResult2,
				contextualInfoDisplay = UseContextualInfoModuleResult
			})
			v47(EventNamesModule.PlayerTileClick)
		end
	end
	
	local UseSearchTileButtonsModuleResult = UseSearchTileButtonsModule({
		userId = User.id,
		index = p1.index,
		contextualInfoType = UseContextualInfoModuleResult2,
		shouldUseCompactTiles = p1.shouldUseCompactTiles,
		userPresence = UseGetPresenceByUserIdResult,
		subpage = p1.subpage,
		shouldAddFocusEventName = if FFlagUserSearchAddFocusActionsSupport then IsUsePreferredInputResultMatch else nil
	}, v47)
	local Config = UseContextualInfoModuleResult and {
		text = UseContextualInfoModuleResult.text,
		fontStyle = UseStyleResult.Font.CaptionBody,
		icon = if p1.shouldUseCompactTiles then nil else UseContextualInfoModuleResult.icon,
		horizontalAlignment = if p1.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil,
		textXAlignment = if p1.shouldUseCompactTiles then Enum.TextXAlignment.Center else nil
	} or nil
	local UseProfileNamesModuleResult = UseProfileNamesModule({ userId = User.id })
	
	local function v52(UserPresence, p2) --[[ Line: 223 ]]
		-- upvalues: PresenceHelpersModule (upval), UseStyleResult (copy)
		if not p2 or not p2.combinedName then
			return ""
		elseif UserPresence and PresenceHelpersModule.isUserOnline(UserPresence.userPresenceType) then
			local Color = UseStyleResult.Theme.OnlineStatus.Color
			
			return `<font color="rgb({math.round(Color.R * 255)},{math.round(Color.G * 255)},{math.round(Color.B * 255)})">● </font>` .. p2.combinedName
		else
			return p2.combinedName
		end
	end
	
	local Id = User.id
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if FFlagSduiUserSearchTile then UDim2.fromScale(1, 1) else UDim2.fromScale(1, 0)
	}, {
		UserTile = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = if FFlagSduiUserSearchTile then UDim2.fromScale(1, 1) else UDim2.fromScale(1, 0)
		}, {
			Tile = ReactModule.createElement(PlayerTile, {
				Selectable = true,
				buttonRef = if FFlagUserSearchAddFocusActionsSupport then UseRefResult else nil,
				tileSize = p1.size,
				title = if NoShouldUseCompactTiles or UseUserExperimentResult or FFlagBlendedSerpUserPresenceInLineEnabled then v52(UseGetPresenceByUserIdResult, UseProfileNamesModuleResult) else UseProfileNamesModuleResult and UseProfileNamesModuleResult.combinedName,
				subtitle = UseProfileNamesModuleResult and UseProfileNamesModuleResult.username,
				thumbnail = if p1.shouldUseCompactTiles then GetStandardSizeAvatarHeadShotRbxthumbFunction(tostring(Id), FFlagUserSearchUseProfileFrameThumbnailModule) else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(Id), Constants.RbxthumbTypes.Avatar, 720),
				onActivated = OnActivated,
				buttons = if FFlagUserSearchAddFocusActionsSupport then if IsUsePreferredInputResultMatch or p1.shouldUseCompactTiles then nil else UseSearchTileButtonsModuleResult elseif p1.shouldUseCompactTiles or UseLastInputModeResult == "Focus" then nil else UseSearchTileButtonsModuleResult,
				relevancyInfo = Config,
				horizontalAlignment = if p1.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil,
				isCircular = p1.shouldUseCompactTiles,
				thumbnailFrameSize = if p1.shouldUseCompactTiles then UDim2.new(1, -Size250, 1, -Size250) else nil,
				openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
			}),
			UserTileEventHandlers = if FFlagUserSearchAddFocusActionsSupport and IsUsePreferredInputResultMatch then ReactModule.createElement(UserTileEventHandlers, {
				buttons = UseSearchTileButtonsModuleResult,
				onTileActivated = OnActivated,
				tileRef = UseRefResult,
				setDisabledForHold = if FFlagUserSearchCancelTileActivationOnHoldIntent then UseResult else nil,
				disableRegularActionOnHoldIntent = if FFlagUserSearchCancelTileActivationOnHoldIntent then true else nil
			}) else nil
		}),
		UserTileRoundCTAButton = if p1.shouldUseCompactTiles and UseSearchTileButtonsModuleResult and #UseSearchTileButtonsModuleResult > 0 and (not FFlagUserSearchAddFocusActionsSupport or not IsUsePreferredInputResultMatch) then if FFlagSduiUserSearchTile then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			RoundCTAButton = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(UseStyleResult.Tokens.Size.Size_900, UseStyleResult.Tokens.Size.Size_900),
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, -UseStyleResult.Tokens.Size.Size_250, 1, -UseStyleResult.Tokens.Size.Size_250)
			}, {
				RoundCTAButton = ReactModule.createElement(RoundCTAButtonModule, {
					searchTileButtonProps = UseSearchTileButtonsModuleResult[1],
					playerTileSize = p1.size
				})
			})
		}) else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.fromOffset(UseStyleResult.Tokens.Size.Size_900, UseStyleResult.Tokens.Size.Size_900),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.fromOffset(p1.size.X.Offset - UseStyleResult.Tokens.Size.Size_250, p1.size.X.Offset - UseStyleResult.Tokens.Size.Size_250)
		}, {
			RoundCTAButton = ReactModule.createElement(RoundCTAButtonModule, {
				searchTileButtonProps = UseSearchTileButtonsModuleResult[1],
				playerTileSize = p1.size
			})
		}) else nil
	})
end