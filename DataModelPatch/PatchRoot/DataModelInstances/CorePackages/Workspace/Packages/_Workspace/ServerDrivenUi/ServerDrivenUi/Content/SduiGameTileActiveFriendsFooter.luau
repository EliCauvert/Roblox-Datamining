local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SduiTileFooterModule = require(ServerDrivenUi.Content.SduiTileFooter)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiParsers = SduiCoreSystemModule.SduiParsers
local UserProfilesModule = require(Parent.UserProfiles)
local UseUserProfilesFetchFunction = UserProfilesModule.Hooks.useUserProfilesFetch
local SduiInGameFriendsDataModule = require(ServerDrivenUi.DataStore.SduiInGameFriendsData)

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

local function alphabeticalSort(A, B): boolean
	return if A.displayName then not B.displayName or A.displayName:lower() < B.displayName:lower() else false
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
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), SduiParsers (copy), SduiActionType (copy), UseLocalizationFunction (copy), SduiInGameFriendsDataModule (copy), SignalsReactModule (copy), UseUserProfilesFetchFunction (copy), UserProfilesModule (copy), getSortedFriendDisplayNames (copy), getDisplayText (copy), SduiTileFooterModule (copy)
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
	local UseUserProfilesFetchResult = UseUserProfilesFetchFunction({
		userIds = UseMemoResult,
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds,
		skip = #UseMemoResult == 0
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: getSortedFriendDisplayNames (upval), UseMemoResult (copy), UseUserProfilesFetchResult (copy)
		return (getSortedFriendDisplayNames(UseMemoResult, UseUserProfilesFetchResult))
	end, { UseMemoResult, UseUserProfilesFetchResult })
	local Smallest = math.min(p4.maxAvatars or 3, #UseMemoResult1)
	local DisplayText = getDisplayText(UseMemoResult1, UseLocalizationResult.separator, Smallest)
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
			Position = UDim2.fromOffset((i1 - 1) * IconWidth / 2, 0)
		}, {
			BorderRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			Border = if p4.hideBorder then nil else ReactModule.createElement("UIStroke", {
				Transparency = 0,
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = UseTokensResult.Color.System.Emphasis.Color3
			})
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
		textIconGap = UseTokensResult.Gap.Small,
		leftText = DisplayText,
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