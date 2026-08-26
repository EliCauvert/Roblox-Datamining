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

local function _(p1, p2)
	local t = {}
	
	for i = 1, p2 do
		t[i] = p1[i].userId
	end
	return t
end

local function getDisplayText(p3, p4, p5)
	local t = {}
	
	for i = 1, p5 do
		t[i] = p3[i].displayName
	end
	return table.concat(t, p4)
end

local function alphabeticalSort(x, p6)
	return if x.displayName then if p6.displayName then x.displayName:lower() < p6.displayName:lower() else true else false
end

local function getSortedFriendDisplayNames(p6, p7)
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

return reactModule.memo(function(p8)
	-- upvalues: useTokens (ref), reactModule (ref), sduiParsers (ref), sduiActionType (ref), useLocalization (ref), sduiInGameFriendsDataModule (ref), signalsReactModule (ref), useUserProfilesFetch (ref), userProfilesModule (ref), getSortedFriendDisplayNames (ref), getDisplayText (ref), sduiTileFooterModule (ref)
	local layoutOrder = p8.layoutOrder
	local anchorPoint = p8.anchorPoint
	local automaticSize = p8.automaticSize
	local size = p8.size
	local zIndex = p8.zIndex
	local position = p8.position
	local var1 = useTokens()
	local iconWidth = p8.iconWidth or var1.Size.Size_500
	local var2 = reactModule.useCallback(function(p9)
		-- upvalues: p8 (ref), sduiParsers (copy), sduiActionType (copy)
		if p8.onActivated then
			p8.onActivated(p9)
			
			return
		end
		local var3 = sduiParsers.safeParseCallback({
			actionType = sduiActionType.OpenJoinFriends,
			actionParams = { placeId = p8.placeId, universeId = p8.universeId }
		}, p8.sduiContext, p8.analyticsContext)
		
		if var3 then
			var3(p9)
		end
	end, {
		p8.placeId,
		p8.universeId,
		p8.analyticsContext,
		p8.onActivated,
		p8.sduiContext
	})
	local var3 = useLocalization({ separator = "Feature.GameDetails.Label.FriendsSeparator" })
	local var4 = signalsReactModule.useSignalState(sduiInGameFriendsDataModule.getInGameFriendsByGame)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p8 (ref)
		local t = {}
		
		for i, v in var4[p8.universeId] or {} do
			table.insert(t, i)
		end
		return t
	end, { var4, p8.universeId })
	local var6 = useUserProfilesFetch({
		userIds = var5,
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds,
		skip = #var5 == 0
	})
	local var7 = reactModule.useMemo(function()
		-- upvalues: getSortedFriendDisplayNames (copy), var5 (ref), var6 (ref)
		return getSortedFriendDisplayNames(var5, var6)
	end, { var5, var6 })
	local minValue = math.min(p8.maxAvatars or 3, #var7)
	local var8 = getDisplayText(var7, var3.separator, minValue)
	local t = {}
	
	for i = 1, minValue do
		t[i] = var7[i].userId
	end
	local t_1 = {}
	
	for i_1 = 1, minValue do
		t_1[`userId_{i_1}`] = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 0,
			LayoutOrder = i_1,
			BackgroundColor3 = var1.Color.Content.Muted.Color3,
			Image = `rbxthumb://type=AvatarHeadShot&id={t[i_1]}&w=100&h=100`,
			Size = UDim2.fromOffset(iconWidth, iconWidth),
			Position = UDim2.fromOffset((i_1 - 1) * iconWidth / 2, 0)
		}, {
			BorderRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			Border = if p8.hideBorder then nil else reactModule.createElement("UIStroke", {
				Transparency = 0,
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = var1.Color.System.Emphasis.Color3
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
		textIconGap = var1.Gap.Small,
		leftText = var8,
		leftTextFlexMode = Enum.UIFlexMode.Shrink,
		leftIconComponent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, t_1),
		onActivated = var2,
		testId = p8.testId
	})
end)