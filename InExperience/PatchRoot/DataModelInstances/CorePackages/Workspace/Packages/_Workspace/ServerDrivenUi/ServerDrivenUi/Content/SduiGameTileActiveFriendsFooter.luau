local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StatusIndicator = FoundationModule.StatusIndicator
local StatusIndicatorShape = FoundationModule.Enums.StatusIndicatorShape
local StatusIndicatorSize = FoundationModule.Enums.StatusIndicatorSize
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SduiTileFooterModule = require(ServerDrivenUi.Content.SduiTileFooter)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiParsers = SduiCoreSystemModule.SduiParsers
local UserProfilesModule = require(Parent.UserProfiles)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local SduiInGameFriendsDataModule = require(ServerDrivenUi.DataStore.SduiInGameFriendsData)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.DataHydration.UserProfile)
local GetAndFetchUserNamesByUserIdsFunction = DataHydrationModule.UserProfile.getAndFetchUserNamesByUserIds
local FFlagHomeFriendNamesUseUserProfileHydration = require(Parent.SharedFlags).FFlagHomeFriendNamesUseUserProfileHydration
local FFlagSduiActiveFriendsFooterTreatment = require(Parent.SharedFlags).FFlagSduiActiveFriendsFooterTreatment
local FFlagSduiGameTileFixFacePileZIndex = require(Parent.SharedFlags).FFlagSduiGameTileFixFacePileZIndex

local function _(p1, p2)
	local UserIds = {}
	
	for i = 1, p2 do
		UserIds[i] = p1[i].userId
	end
	return UserIds
end

local function getDisplayText(UseMemoResult, Separator: string, Smallest): string
	local DisplayNames = {}
	
	for i = 1, Smallest do
		DisplayNames[i] = UseMemoResult[i].displayName
	end
	return table.concat(DisplayNames, Separator)
end

local function getFormattedText(Entry, Count: number, p3)
	if Count == 0 then
		return nil
	end
	local TextFormatOne = if Count == 1 then p3.textFormatOne elseif Count == 2 then p3.textFormatTwo else p3.textFormatMany
	
	if TextFormatOne and TextFormatOne ~= "" then
		local DisplayName = if Entry[1] then Entry[1].displayName else nil
		
		return if DisplayName or not TextFormatOne:find("{name}", 1, true) then TextFormatOne:gsub("{(%w+)}", { name = DisplayName or "", count = tostring(Count - 1) }) else nil
	else
		return nil
	end
end

local function alphabeticalSort(A, B): boolean
	return if A.displayName then not B.displayName or A.displayName:lower() < B.displayName:lower() else false
end

local function getSortedFriendNames(UseMemoResult, UseSignalStateResult)
	-- upvalues: DataHydrationModule (copy), alphabeticalSort (copy)
	local List = {}
	
	if UseSignalStateResult.status == DataHydrationModule.DataStatus.NotReady then
		return List
	end
	for _, UserId in UseMemoResult do
		local NamesByUserIdEntry = UseSignalStateResult.namesByUserId[tostring(UserId)]
		
		if NamesByUserIdEntry then
			table.insert(List, {
				userId = UserId,
				displayName = NamesByUserIdEntry.combinedName
			})
		end
	end
	table.sort(List, alphabeticalSort)
	
	return List
end

local function getSortedFriendDisplayNames(UseMemoResult, p3)
	-- upvalues: UserProfilesModule (copy), alphabeticalSort (copy)
	if not UseMemoResult or not p3 or not p3.data then
		return {}
	end
	local List = {}
	
	for _, UserId in UseMemoResult do
		table.insert(List, {
			userId = UserId,
			displayName = UserProfilesModule.Selectors.getCombinedNameFromId(p3.data, UserId)
		})
	end
	table.sort(List, alphabeticalSort)
	
	return List
end

return ReactModule.memo(function(p4)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), SduiParsers (copy), SduiActionType (copy), UseLocalizationFunction (copy), SduiInGameFriendsDataModule (copy), SignalsReactModule (copy), FFlagHomeFriendNamesUseUserProfileHydration (copy), UseUserProfilesFetchFunction (copy), UserProfilesModule (copy), GetAndFetchUserNamesByUserIdsFunction (copy), getSortedFriendNames (copy), getSortedFriendDisplayNames (copy), FFlagSduiActiveFriendsFooterTreatment (copy), getFormattedText (copy), getDisplayText (copy), FFlagSduiGameTileFixFacePileZIndex (copy), StatusIndicator (copy), StatusIndicatorVariant (copy), StatusIndicatorShape (copy), StatusIndicatorSize (copy), SduiTileFooterModule (copy)
	local LayoutOrder = p4.layoutOrder
	local AnchorPoint = p4.anchorPoint
	local AutomaticSize = p4.automaticSize
	local Size = p4.size
	local ZIndex = p4.zIndex
	local Position = p4.position
	local UseTokensResult = UseTokensFunction()
	local IconWidth = p4.iconWidth or UseTokensResult.Size.Size_500
	local UseResult = ReactModule.useCallback(function(p5)
		-- upvalues: p4 (copy), SduiParsers (upval), SduiActionType (upval)
		if p4.onActivated then
			p4.onActivated(p5)
			
			return
		end
		local SafeParseResult: (any) -> () = SduiParsers.safeParseCallback({
			actionType = SduiActionType.OpenJoinFriends,
			actionParams = { placeId = p4.placeId, universeId = p4.universeId }
		}, p4.sduiContext, p4.analyticsContext)
		
		if SafeParseResult then
			SafeParseResult(p5)
		end
	end, {
		p4.placeId,
		p4.universeId,
		p4.analyticsContext,
		p4.onActivated,
		p4.sduiContext
	})
	local UseLocalizationResult = UseLocalizationFunction({ separator = "Feature.GameDetails.Label.FriendsSeparator" })
	local UseSignalStateResult = SignalsReactModule.useSignalState(SduiInGameFriendsDataModule.getInGameFriendsByGame)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), p4 (copy)
		local List = {}
		local UseSignalStateResultEntry = UseSignalStateResult[p4.universeId] or {}
		for i, _ in UseSignalStateResultEntry do
			table.insert(List, i)
		end
		return List
	end, { UseSignalStateResult, p4.universeId })
	local UseUserProfilesFetchResult = if FFlagHomeFriendNamesUseUserProfileHydration then nil else UseUserProfilesFetchFunction({
		userIds = UseMemoResult,
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds,
		skip = #UseMemoResult == 0
	})
	local UseSignalStateResult1 = nil
	
	if FFlagHomeFriendNamesUseUserProfileHydration then
		local Joined = table.concat(UseMemoResult, ",")
		UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: GetAndFetchUserNamesByUserIdsFunction (upval), Joined (copy)
			return GetAndFetchUserNamesByUserIdsFunction(string.split(Joined, ","))
		end, { Joined })))
	end
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (ref), getSortedFriendNames (upval), UseMemoResult (copy), getSortedFriendDisplayNames (upval), UseUserProfilesFetchResult (copy)
		return if UseSignalStateResult1 then getSortedFriendNames(UseMemoResult, UseSignalStateResult1) else getSortedFriendDisplayNames(UseMemoResult, UseUserProfilesFetchResult)
	end, {
		UseMemoResult,
		UseUserProfilesFetchResult,
		UseSignalStateResult1
	})
	local Smallest = math.min(p4.maxAvatars or 3, #UseMemoResult1)
	local FormattedText = FFlagSduiActiveFriendsFooterTreatment and getFormattedText(UseMemoResult1, #UseMemoResult, p4) or getDisplayText(UseMemoResult1, UseLocalizationResult.separator, Smallest)
	local UserIds = {}
	
	for i = 1, Smallest do
		UserIds[i] = UseMemoResult1[i].userId
	end
	local ImageLabels = {}
	
	for i1 = 1, Smallest do
		ImageLabels[`userId_{i1}`] = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			LayoutOrder = i1,
			BackgroundColor3 = UseTokensResult.Color.Content.Muted.Color3,
			Image = `rbxthumb://type=AvatarHeadShot&id={UserIds[i1]}&w=100&h=100`,
			Size = UDim2.fromOffset(IconWidth, IconWidth),
			Position = UDim2.fromOffset((i1 - 1) * IconWidth / 2, 0),
			ZIndex = if FFlagSduiGameTileFixFacePileZIndex then Smallest - i1 + 1 else nil
		}, {
			BorderRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			Border = if p4.hideBorder then nil else ReactModule.createElement("UIStroke", {
				Transparency = 0,
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = UseTokensResult.Color.System.Emphasis.Color3
			}),
			PresenceDot = if FFlagSduiActiveFriendsFooterTreatment and p4.showPresenceDot then ReactModule.createElement(StatusIndicator, {
				variant = StatusIndicatorVariant.Success,
				shape = StatusIndicatorShape.Circle,
				size = StatusIndicatorSize.XSmall,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.fromScale(1, 1)
			}) else nil
		})
	end
	return ReactModule.createElement(SduiTileFooterModule, {
		position = Position,
		anchorPoint = AnchorPoint,
		automaticSize = AutomaticSize,
		size = Size,
		layoutOrder = LayoutOrder,
		zIndex = ZIndex,
		sduiContext = p4.sduiContext,
		textIconGap = FFlagSduiActiveFriendsFooterTreatment and p4.textIconGap or UseTokensResult.Gap.Small,
		leftText = FormattedText,
		leftTextFlexMode = Enum.UIFlexMode.Shrink,
		leftIconComponent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, ImageLabels),
		onActivated = UseResult,
		testId = p4.testId
	})
end)