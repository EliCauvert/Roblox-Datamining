local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useTokens = require(parent.Foundation).Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sduiTileFooterModule = require(serverDrivenUi.Content.SduiTileFooter)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiParsers = sduiCoreSystemModule.SduiParsers
local userProfilesModule = require(parent.UserProfiles)
local useUserProfilesFetch = userProfilesModule.Hooks.useUserProfilesFetch
local sduiInGameFriendsDataModule = require(serverDrivenUi.DataStore.SduiInGameFriendsData)

local function _(p0, p1) --[[ line: 51 | named "getUserIdsForFacePile" ]]
	local t = {}
	
	for i = 1, p1 do
		t[i] = p0[i].userId
	end
	return t
end

local function getDisplayText(p2, p3, p4) --[[ line: 60 ]]
	local t = {}
	
	for i = 1, p4 do
		t[i] = p2[i].displayName
	end
	return table.concat(t, p3)
end

local function alphabeticalSort(x, p5) --[[ line: 69 ]]
	return if x.displayName then if p5.displayName then x.displayName:lower() < p5.displayName:lower() else true else false
end

local function getSortedFriendDisplayNames(p6, p7) --[[ line: 79 ]]
	-- upvalues: userProfilesModule (ref), alphabeticalSort (ref)
	if not p6 or not p7 or not p7.data then
		return {}
	end
	local t = {}
	
	for i, v in p6 do
		table.insert(t, {
			userId = v,
			displayName = userProfilesModule.Selectors.getCombinedNameFromId(p7.data, v)
		})
	end
	table.sort(t, alphabeticalSort)
	
	return t
end

return reactModule.memo(function(p8) --[[ line: 98 | named "SduiGameTileActiveFriendsFooter" ]]
	-- upvalues: useTokens (ref), reactModule (ref), sduiParsers (ref), sduiActionType (ref), useLocalization (ref), sduiInGameFriendsDataModule (ref), signalsReactModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), getSortedFriendDisplayNames (ref), getDisplayText (ref), sduiTileFooterModule (ref)
	local layoutOrder = p8.layoutOrder
	local anchorPoint = p8.anchorPoint
	local automaticSize = p8.automaticSize
	local size = p8.size
	local zIndex = p8.zIndex
	local position = p8.position
	local var13 = useTokens()
	local iconWidth = p8.iconWidth or var13.Size.Size_500
	local var15 = reactModule.useCallback(function(p9) --[[ line: 110 ]]
		-- upvalues: p8 (ref), sduiParsers (copy), sduiActionType (copy)
		if p8.onActivated then
			p8.onActivated(p9)
			
			return
		end
		local var25 = sduiParsers.safeParseCallback({
			actionType = sduiActionType.OpenJoinFriends,
			actionParams = { placeId = p8.placeId, universeId = p8.universeId }
		}, p8.sduiContext, p8.analyticsContext)
		
		if var25 then
			var25(p9)
		end
	end, {
		p8.placeId,
		p8.universeId,
		p8.analyticsContext,
		p8.onActivated,
		p8.sduiContext
	})
	local var16 = useLocalization({ separator = "Feature.GameDetails.Label.FriendsSeparator" })
	local var17 = signalsReactModule.useSignalState(sduiInGameFriendsDataModule.getInGameFriendsByGame)
	local var18 = reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: var17 (ref), p8 (ref)
		local t = {}
		
		for i, v in var17[p8.universeId] or {} do
			table.insert(t, i)
		end
		return t
	end, { var17, p8.universeId })
	local var19 = useUserProfilesFetch({
		userIds = var18,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds,
		skip = #var18 == 0
	})
	local var20 = reactModule.useMemo(function() --[[ line: 148 ]]
		-- upvalues: getSortedFriendDisplayNames (copy), var18 (ref), var19 (ref)
		return getSortedFriendDisplayNames(var18, var19)
	end, { var18, var19 })
	local minValue = math.min(p8.maxAvatars or 3, #var20)
	local var22 = getDisplayText(var20, var16.separator, minValue)
	local t = {}
	
	for i = 1, minValue do
		t[i] = var20[i].userId
	end
	local t_1 = {}
	
	for i_1 = 1, minValue do
		t_1[`userId_{i_1}`] = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			LayoutOrder = i_1,
			BackgroundColor3 = var13.Color.Content.Muted.Color3,
			Image = `rbxthumb://type=AvatarHeadShot&id={t[i_1]}&w=100&h=100`,
			Size = UDim2.fromOffset(iconWidth, iconWidth),
			Position = UDim2.fromOffset((i_1 - 1) * iconWidth / 2, 0)
		}, {
			BorderRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			Border = if p8.hideBorder then nil else reactModule.createElement("UIStroke", {
				Transparency = 0,
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = var13.Color.System.Emphasis.Color3
			})
		})
	end
	return reactModule.createElement(sduiTileFooterModule, {
		position = position,
		anchorPoint = anchorPoint,
		automaticSize = automaticSize,
		size = size,
		layoutOrder = layoutOrder,
		zIndex = zIndex,
		sduiContext = p8.sduiContext,
		textIconGap = var13.Gap.Small,
		leftText = var22,
		leftTextFlexMode = Enum.UIFlexMode.Shrink,
		leftIconComponent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, t_1),
		onActivated = var15,
		testId = p8.testId
	})
end)