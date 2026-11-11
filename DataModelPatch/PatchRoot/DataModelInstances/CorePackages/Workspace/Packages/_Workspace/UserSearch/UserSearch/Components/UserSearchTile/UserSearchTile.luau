local HttpService = game:GetService("HttpService")
local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local PlayerTile = UIBloxModule.App.Tile.PlayerTile
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Enums = require(Parent.FriendsNetworking).Enums
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(Parent.UserLib).Utils.Constants
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseContextualInfoModule = require(script.Parent.useContextualInfo)
local UseSearchTileButtonsModule = require(script.Parent.useSearchTileButtons)
local UseProfileNamesModule = require(script.Parent.useProfileNames)
local UseRelationshipSelectorModule = require(script.Parent.useRelationshipSelector)
local ResponsiveModule = require(Parent.Responsive)
local EventNamesModule = require(UserSearch.Analytics.EventNames)
local _ = require(UserSearch.Common.LocalTypes)
local RoundCTAButtonModule = require(UserSearch.Components.RoundCTAButton)
local _ = require(Parent.GraphQLServer)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local FFlagBlendedSerpUserPresenceInLineEnabled = require(Parent.SharedFlags).FFlagBlendedSerpUserPresenceInLineEnabled
local FFlagUserSearchAddFocusActionsSupport = require(Parent.SharedFlags).FFlagUserSearchAddFocusActionsSupport
local FFlagPPVEnabledOnConsole = require(Parent.SharedFlags).FFlagPPVEnabledOnConsole
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(Parent.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local FFlagUserSearchPresenceStoreMigrationModule = require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local RODUXKEY = require(UserSearch.Common.Constants).RODUX_KEY
local PresenceHelpersModule = require(UserSearch.Utils.PresenceHelpers)
local UserTileEventHandlers = require(Parent.UserTile).UserTileEventHandlers

local function _(p1, p2)
	-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	return if p2 then GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p1))) else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(p1), Constants.RbxthumbTypes.Avatar, 720)
end

return function(p1)
	-- upvalues: FFlagUserSearchAddFocusActionsSupport (copy), ReactModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseRelationshipSelectorModule (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), UseLastInputModeFunction (copy), FFlagUserSearchPresenceStoreMigrationModule (copy), UseGetPresenceByUserIdFunction (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), RODUXKEY (copy), UseContextualInfoModule (copy), FFlagPPVEnabledOnConsole (copy), ResponsiveModule (copy), CryoModule (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), HttpService (copy), SetCentralOverlayFunction (copy), Enums (copy), EventNamesModule (copy), UseSearchTileButtonsModule (copy), UseProfileNamesModule (copy), PresenceHelpersModule (copy), PlayerTile (copy), FFlagBlendedSerpUserPresenceInLineEnabled (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), UserTileEventHandlers (copy), RoundCTAButtonModule (copy)
	local UseRefResult = if FFlagUserSearchAddFocusActionsSupport then ReactModule.useRef(nil) else nil
	local User = p1.user
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRelationshipSelectorModuleResult = UseRelationshipSelectorModule(User.id)
	local NoShouldUseCompactTiles: boolean = p1.enablePresenceIndicator and not p1.shouldUseCompactTiles
	local Size250 = UseStyleResult.Tokens.Size.Size_250
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.OmniSearchResultsPageUXExposureLayer }, function(p2): boolean
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.OmniSearchResultsPageUXExposureLayer] or {}).userPresenceIndicator == "showPresenceInLine"
	end, false)
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseGetPresenceByUserIdResult = if FFlagUserSearchPresenceStoreMigrationModule then UseGetPresenceByUserIdFunction((tostring(User.id))) else UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), User (copy)
		return GetDeepValueFunction(p2, string.format("%s.Presence.byUserId.%s", RODUXKEY, User.id)) or {}
	end)
	local UseContextualInfoModuleResult, UseContextualInfoModuleResult2 = UseContextualInfoModule({
		userId = User.id,
		previousUsernames = User.previousUsernames,
		searchKeyword = p1.searchParameters.searchKeyword,
		profileInsight = p1.profileInsight,
		shouldUseCompactTiles = p1.shouldUseCompactTiles,
		userPresence = UseGetPresenceByUserIdResult
	})
	local IsUsePreferredInputResultMatch = if FFlagPPVEnabledOnConsole then nil else ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local IsUsePreferredInputResultMatch1 = if FFlagPPVEnabledOnConsole then nil else IsUsePreferredInputResultMatch
	local IsUsePreferredInputResultMatch2 = if FFlagUserSearchAddFocusActionsSupport then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional else nil
	
	local function v44(PlayerTileClick, p2)
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
	
	local function OnActivated()
		-- upvalues: IsUsePreferredInputResultMatch1 (copy), FFlagPPVEnabledOnConsole (upval), UseDispatchResult (copy), SetCentralOverlayFunction (upval), User (copy), UseRelationshipSelectorModuleResult (copy), Enums (upval), p1 (copy), UseContextualInfoModuleResult2 (copy), UseContextualInfoModuleResult (copy), v44 (copy), EventNamesModule (upval)
		if IsUsePreferredInputResultMatch1 and not FFlagPPVEnabledOnConsole then
			UseDispatchResult(SetCentralOverlayFunction("PlayerContextualMenu", {
				subjectUserId = User.id,
				robloxFriendshipStatus = UseRelationshipSelectorModuleResult.status,
				friendshipOriginSourceType = Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()
			}))
		else
			p1.luaAppNavigation.navigateToUserInfo({
				userId = User.id,
				index = p1.index,
				hasEmphasis = p1.hasEmphasis,
				contextualInfoType = UseContextualInfoModuleResult2,
				contextualInfoDisplay = UseContextualInfoModuleResult
			})
		end
		v44(EventNamesModule.PlayerTileClick)
	end
	
	local UseSearchTileButtonsModuleResult = UseSearchTileButtonsModule({
		userId = User.id,
		index = p1.index,
		contextualInfoType = UseContextualInfoModuleResult2,
		shouldUseCompactTiles = p1.shouldUseCompactTiles,
		userPresence = UseGetPresenceByUserIdResult,
		subpage = p1.subpage,
		shouldAddFocusEventName = if FFlagUserSearchAddFocusActionsSupport then IsUsePreferredInputResultMatch2 else nil
	}, v44)
	local Config = UseContextualInfoModuleResult and {
		text = UseContextualInfoModuleResult.text,
		fontStyle = UseStyleResult.Font.CaptionBody,
		icon = if p1.shouldUseCompactTiles then nil else UseContextualInfoModuleResult.icon,
		horizontalAlignment = if p1.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil,
		textXAlignment = if p1.shouldUseCompactTiles then Enum.TextXAlignment.Center else nil
	} or nil
	local UseProfileNamesModuleResult = UseProfileNamesModule({ userId = User.id })
	
	local function v49(UserPresence, p2)
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
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0) }, {
		UserTile = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 0)
		}, {
			Tile = ReactModule.createElement(PlayerTile, {
				Selectable = true,
				buttonRef = if FFlagUserSearchAddFocusActionsSupport then UseRefResult else nil,
				tileSize = p1.size,
				title = if NoShouldUseCompactTiles or UseUserExperimentResult or FFlagBlendedSerpUserPresenceInLineEnabled then v49(UseGetPresenceByUserIdResult, UseProfileNamesModuleResult) else UseProfileNamesModuleResult and UseProfileNamesModuleResult.combinedName,
				subtitle = UseProfileNamesModuleResult and UseProfileNamesModuleResult.username,
				thumbnail = if p1.shouldUseCompactTiles then GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(Id))) else GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(Id), Constants.RbxthumbTypes.Avatar, 720),
				onActivated = OnActivated,
				buttons = if FFlagUserSearchAddFocusActionsSupport then if IsUsePreferredInputResultMatch2 or p1.shouldUseCompactTiles then nil else UseSearchTileButtonsModuleResult elseif p1.shouldUseCompactTiles or UseLastInputModeResult == "Focus" then nil else UseSearchTileButtonsModuleResult,
				relevancyInfo = Config,
				horizontalAlignment = if p1.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil,
				isCircular = p1.shouldUseCompactTiles,
				thumbnailFrameSize = if p1.shouldUseCompactTiles then UDim2.new(1, -Size250, 1, -Size250) else nil,
				openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
			}),
			UserTileEventHandlers = if FFlagUserSearchAddFocusActionsSupport and IsUsePreferredInputResultMatch2 then ReactModule.createElement(UserTileEventHandlers, {
				buttons = UseSearchTileButtonsModuleResult,
				onTileActivated = OnActivated,
				tileRef = UseRefResult
			}) else nil
		}),
		UserTileRoundCTAButton = if p1.shouldUseCompactTiles and (UseSearchTileButtonsModuleResult and #UseSearchTileButtonsModuleResult > 0) and (not FFlagUserSearchAddFocusActionsSupport or not IsUsePreferredInputResultMatch2) then ReactModule.createElement("Frame", {
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