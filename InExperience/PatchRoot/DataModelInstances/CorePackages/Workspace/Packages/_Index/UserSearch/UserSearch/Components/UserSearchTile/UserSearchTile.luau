local httpService = game:GetService("HttpService")
local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local playerTile = UIBloxModule.App.Tile.PlayerTile
local useStyle = UIBloxModule.Core.Style.useStyle
local enums = require(parent.FriendsNetworking).Enums
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local getStandardSizeAvatarHeadShotRbxthumb = require(parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local getRbxthumbWithTypeSizeAndOptions = require(parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local constants = require(parent.UserLib).Utils.Constants
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useContextualInfoModule = require(script.Parent.useContextualInfo)
local useSearchTileButtonsModule = require(script.Parent.useSearchTileButtons)
local useProfileNamesModule = require(script.Parent.useProfileNames)
local useRelationshipSelectorModule = require(script.Parent.useRelationshipSelector)
local responsiveModule = require(parent.Responsive)
local signalsReactModule = require(parent.SignalsReact)
local profileInsightsStore = require(parent.DataHydration.ProfileInsights).ProfileInsightsStore
local eventNamesModule = require(userSearch.Analytics.EventNames)
local _ = require(userSearch.Common.LocalTypes)
local roundCTAButtonModule = require(userSearch.Components.RoundCTAButton)
local constantsModule = require(userSearch.Common.Constants)
local _ = require(parent.GraphQLServer)
local useGetPresenceByUserId = require(parent.FriendsCommon).Hooks.useGetPresenceByUserId
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local fFlagBlendedSerpUserPresenceInLineEnabled = require(parent.SharedFlags).FFlagBlendedSerpUserPresenceInLineEnabled
local fFlagUserSearchAddFocusActionsSupport = require(parent.SharedFlags).FFlagUserSearchAddFocusActionsSupport
local fFlagPPVEnabledOnConsole = require(parent.SharedFlags).FFlagPPVEnabledOnConsole
local fFlagLuaAppSearchPeopleUnifiedSchemaFields = require(parent.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local fFlagUserSearchPresenceStoreMigrationModule = require(userSearch.Flags.FFlagUserSearchPresenceStoreMigration)
local fFlagUserSearchUseProfileFrameThumbnailModule = require(userSearch.Flags.FFlagUserSearchUseProfileFrameThumbnail)
local fFlagUserSearchCancelTileActivationOnHoldIntent = require(parent.SharedFlags).FFlagUserSearchCancelTileActivationOnHoldIntent
local fFlagSduiUserSearchTile = require(parent.SharedFlags).FFlagSduiUserSearchTile
local fFlagPlayerSearchEnableOnlineFrequentsForAll = require(parent.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll
local fFlagUserSearchClassmatesInsight = require(parent.SharedFlags).FFlagUserSearchClassmatesInsight
local RODUX_KEY = constantsModule.RODUX_KEY
local presenceHelpersModule = require(userSearch.Utils.PresenceHelpers)
local userTileEventHandlers = require(parent.UserTile).UserTileEventHandlers

local _ = function(p1, p2)
	-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagUserSearchUseProfileFrameThumbnailModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
	return if p2 then getStandardSizeAvatarHeadShotRbxthumb(tostring(p1), fFlagUserSearchUseProfileFrameThumbnailModule) else getRbxthumbWithTypeSizeAndOptions(tostring(p1), constants.RbxthumbTypes.Avatar, 720)
end

return function(p1)
	-- upvalues: fFlagUserSearchAddFocusActionsSupport (ref), reactModule (ref), fFlagUserSearchCancelTileActivationOnHoldIntent (ref), useStyle (ref), useDispatch (ref), useRelationshipSelectorModule (ref), fFlagSduiUserSearchTile (ref), fFlagPlayerSearchEnableOnlineFrequentsForAll (ref), profileInsightsStore (ref), fFlagUserSearchClassmatesInsight (ref), signalsReactModule (ref), useUserExperiment (ref), appUserLayers (ref), useLastInputMode (ref), fFlagUserSearchPresenceStoreMigrationModule (ref), useGetPresenceByUserId (ref), useSelector (ref), getDeepValue (ref), RODUX_KEY (ref), useContextualInfoModule (ref), fFlagPPVEnabledOnConsole (ref), responsiveModule (ref), cryoModule (ref), fFlagLuaAppSearchPeopleUnifiedSchemaFields (ref), httpService (ref), setCentralOverlay (ref), enums (ref), eventNamesModule (ref), useSearchTileButtonsModule (ref), useProfileNamesModule (ref), presenceHelpersModule (ref), playerTile (ref), fFlagBlendedSerpUserPresenceInLineEnabled (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), fFlagUserSearchUseProfileFrameThumbnailModule (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), userTileEventHandlers (ref), roundCTAButtonModule (ref)
	local var1 = if fFlagUserSearchAddFocusActionsSupport then reactModule.useRef(nil) else nil
	local var2 = nil
	local var3 = nil
	
	if fFlagUserSearchCancelTileActivationOnHoldIntent then
		local var4 = reactModule.useRef(false)
		var2 = var4
		var3 = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref)
			var4.current = p2
		end, {})
	end
	local var5
	local user = p1.user
	local var6 = useStyle()
	local var7 = useDispatch()
	local var8 = useRelationshipSelectorModule(user.id)
	local var9 = if fFlagSduiUserSearchTile then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: fFlagPlayerSearchEnableOnlineFrequentsForAll (copy), profileInsightsStore (copy), user (ref), fFlagUserSearchClassmatesInsight (copy)
		local var10 = if fFlagPlayerSearchEnableOnlineFrequentsForAll then "profile_info_boost" else nil
		
		return profileInsightsStore.get().GetProfileInsight(user.id, {
			rankingStrategy = var10,
			count = if fFlagUserSearchClassmatesInsight and var10 then 3 else nil
		})
	end, { user.id }).data) else p1.profileInsight
	local var10 = p1.enablePresenceIndicator and not p1.shouldUseCompactTiles
	local size250 = var6.Tokens.Size.Size_250
	local var11 = useUserExperiment({ appUserLayers.OmniSearchResultsPageUXExposureLayer }, function(p2)
		-- upvalues: appUserLayers (copy)
		return (p2[appUserLayers.OmniSearchResultsPageUXExposureLayer] or {}).userPresenceIndicator == "showPresenceInLine"
	end, false)
	local var12 = useLastInputMode()
	local var13 = if fFlagUserSearchPresenceStoreMigrationModule then useGetPresenceByUserId(tostring(user.id)) else useSelector(function(p2)
		-- upvalues: getDeepValue (copy), RODUX_KEY (copy), user (ref)
		return getDeepValue(p2, string.format("%s.Presence.byUserId.%s", RODUX_KEY, user.id)) or {}
	end)
	local var14, var15 = useContextualInfoModule({
		userId = user.id,
		previousUsernames = user.previousUsernames,
		searchKeyword = p1.searchParameters.searchKeyword,
		profileInsight = var9,
		shouldUseCompactTiles = p1.shouldUseCompactTiles,
		userPresence = var13
	})
	local var16 = if fFlagPPVEnabledOnConsole then nil elseif fFlagPPVEnabledOnConsole then nil else responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	
	if fFlagUserSearchAddFocusActionsSupport then
		var5 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		var5 = nil
	else
		var5 = nil
	end
	local var17 = function(p2, p3)
		-- upvalues: p1 (ref), cryoModule (copy), user (ref), var15 (ref), fFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), httpService (copy)
		if p1.fireAnalyticsEvent then
			p1.fireAnalyticsEvent(p2, cryoModule.Dictionary.join({
				playerId = user.id,
				tilePos = p1.index,
				contextualInfoType = var15,
				hasEmphasis = p1.hasEmphasis,
				rowInSort = p1.rowInSort,
				positionInRow = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.positionInRow else nil,
				feedRowNumber = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.feedRowNumber else nil,
				interactionUuid = if fFlagLuaAppSearchPeopleUnifiedSchemaFields then httpService:GenerateGUID(false) else nil
			}, p3 or {}))
		end
	end
	
	local var18 = function()
		-- upvalues: fFlagUserSearchCancelTileActivationOnHoldIntent (copy), var2 (write), var16 (ref), fFlagPPVEnabledOnConsole (copy), var7 (ref), setCentralOverlay (copy), user (ref), var8 (ref), enums (copy), p1 (ref), var15 (ref), var14 (ref), var17 (ref), eventNamesModule (copy)
		if fFlagUserSearchCancelTileActivationOnHoldIntent and var2.current then
			var2.current = false
			
			return
		elseif var16 and not fFlagPPVEnabledOnConsole then
			var7(setCentralOverlay("PlayerContextualMenu", {
				subjectUserId = user.id,
				robloxFriendshipStatus = var8.status,
				friendshipOriginSourceType = enums.FriendshipOriginSourceType.PlayerSearch.rawValue()
			}))
		else
			p1.luaAppNavigation.navigateToUserInfo({
				userId = user.id,
				index = p1.index,
				hasEmphasis = p1.hasEmphasis,
				contextualInfoType = var15,
				contextualInfoDisplay = var14
			})
		end
		var17(eventNamesModule.PlayerTileClick)
	end
	
	local var19 = useSearchTileButtonsModule({
		userId = user.id,
		index = p1.index,
		contextualInfoType = var15,
		shouldUseCompactTiles = p1.shouldUseCompactTiles,
		userPresence = var13,
		subpage = p1.subpage,
		shouldAddFocusEventName = if fFlagUserSearchAddFocusActionsSupport then var5 else nil
	}, var17)
	local var20 = var14 and ({
		text = var14.text,
		fontStyle = var6.Font.CaptionBody,
		icon = if p1.shouldUseCompactTiles then nil else var14.icon,
		horizontalAlignment = if p1.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil,
		textXAlignment = if p1.shouldUseCompactTiles then Enum.TextXAlignment.Center else nil
	} or nil)
	local var21 = useProfileNamesModule({ userId = user.id })
	
	local var22 = function(p2, p3)
		-- upvalues: presenceHelpersModule (copy), var6 (ref)
		if not p3 or not p3.combinedName then
			return ""
		elseif p2 and presenceHelpersModule.isUserOnline(p2.userPresenceType) then
			local color = var6.Theme.OnlineStatus.Color
			
			return `<font color="rgb({math.round(color.R * 255)},{math.round(color.G * 255)},{math.round(color.B * 255)})">\226\151\143 </font>` .. p9.combinedName
		end
		return p3.combinedName
	end
	
	local createElement = reactModule.createElement
	local var23 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		Size = if fFlagSduiUserSearchTile then UDim2.fromScale(1, 1) else UDim2.fromScale(1, 0)
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var24 = "Frame"
	local t_2 = {
		BackgroundTransparency = 1,
		ZIndex = 1,
		Size = if fFlagSduiUserSearchTile then UDim2.fromScale(1, 1) else UDim2.fromScale(1, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		Selectable = true,
		buttonRef = if fFlagUserSearchAddFocusActionsSupport then var1 else nil,
		tileSize = p1.size,
		title = if var10 or var11 or fFlagBlendedSerpUserPresenceInLineEnabled then var22(var13, var21) else var21 and var21.combinedName,
		subtitle = var21 and var21.username
	}
	local id = user.id
	t_4.thumbnail = if p1.shouldUseCompactTiles then getStandardSizeAvatarHeadShotRbxthumb(tostring(id), fFlagUserSearchUseProfileFrameThumbnailModule) else getRbxthumbWithTypeSizeAndOptions(tostring(id), constants.RbxthumbTypes.Avatar, 720)
	t_4.onActivated = var18
	t_4.buttons = if fFlagUserSearchAddFocusActionsSupport then if var5 or p1.shouldUseCompactTiles then nil else var19 elseif p1.shouldUseCompactTiles or var12 == "Focus" then nil else var19
	t_4.relevancyInfo = var20
	t_4.horizontalAlignment = if p1.shouldUseCompactTiles then Enum.HorizontalAlignment.Center else nil
	t_4.isCircular = p1.shouldUseCompactTiles
	t_4.thumbnailFrameSize = if p1.shouldUseCompactTiles then UDim2.new(1, -size250, 1, -size250) else nil
	t_4.openTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil
	t_3.Tile = createElement_2(playerTile, t_4)
	t_3.UserTileEventHandlers = if fFlagUserSearchAddFocusActionsSupport and var5 then reactModule.createElement(userTileEventHandlers, {
		buttons = var19,
		onTileActivated = var18,
		tileRef = var1,
		setDisabledForHold = if fFlagUserSearchCancelTileActivationOnHoldIntent then var3 else nil,
		disableRegularActionOnHoldIntent = if fFlagUserSearchCancelTileActivationOnHoldIntent then true else nil
	}) else nil
	t_1.UserTile = createElement_1(var24, t_2, t_3)
	t_1.UserTileRoundCTAButton = if p1.shouldUseCompactTiles and var19 and #var19 > 0 and (not fFlagUserSearchAddFocusActionsSupport or not var5) then if fFlagSduiUserSearchTile then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeXX
	}, {
		RoundCTAButton = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var6.Tokens.Size.Size_900, var6.Tokens.Size.Size_900),
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -var6.Tokens.Size.Size_250, 1, -var6.Tokens.Size.Size_250)
		}, {
			RoundCTAButton = reactModule.createElement(roundCTAButtonModule, {
				searchTileButtonProps = var19[1],
				playerTileSize = p1.size
			})
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromOffset(var6.Tokens.Size.Size_900, var6.Tokens.Size.Size_900),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.fromOffset(p1.size.X.Offset - var6.Tokens.Size.Size_250, p1.size.X.Offset - var6.Tokens.Size.Size_250)
	}, {
		RoundCTAButton = reactModule.createElement(roundCTAButtonModule, {
			searchTileButtonProps = var19[1],
			playerTileSize = p1.size
		})
	}) else nil
	
	return createElement(var23, t, t_1)
end