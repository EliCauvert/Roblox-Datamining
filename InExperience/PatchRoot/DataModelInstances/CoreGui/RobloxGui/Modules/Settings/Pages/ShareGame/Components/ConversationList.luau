local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local sortFriendsByCorrectedPresenceAndRank = require(corePackagesService.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local modules = coreGuiService.RobloxGui.Modules
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local themeModule = require(modules.Settings.Theme)
local constantsModule = require(shareGame.Constants)
local gameInviteEvents = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteEvents
local conversationEntryModule = require(shareGame.Components.ConversationEntry)
local inviteListEntryModule = require(shareGame.Components.InviteListEntry)
local friendsErrorPageModule = require(shareGame.Components.FriendsErrorPage)
local inviteUserIdToPlaceIdModule = require(shareGame.Thunks.InviteUserIdToPlaceId)
local inviteUserIdToPlaceIdCustomizedModule = require(shareGame.Thunks.InviteUserIdToPlaceIdCustomized)
local newInviteMenuExperimentManagerModule = require(shareGame.NewInviteMenuExperimentManager)
local loadingFriendsPageModule = require(shareGame.Components.LoadingFriendsPage)
local noFriendsPageModule = require(shareGame.Components.NoFriendsPage)
local playerSearchPredicateModule = require(coreGuiService.RobloxGui.Modules.InGameMenu.Utility.PlayerSearchPredicate)
local getFFlagAbuseReportAnalyticsHasLaunchDataModule = require(modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local getFFlagEnableNewInviteMenuModule = require(modules.Flags.GetFFlagEnableNewInviteMenu)
local getFFlagEnableNewInviteSendEndpointModule = require(modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local userModel = require(corePackagesService.Workspace.Packages.UserLib).Models.UserModel
local httpRequestModule = require(modules.Common.httpRequest)
local memoize = require(corePackagesService.Workspace.Packages.AppCommonLib).memoize
local retrievalStatus = require(corePackagesService.Workspace.Packages.Http).Enum.RetrievalStatus
local getFFlagInviteListRerank = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
local var1 = require(shareGame.getTranslator)()
local var2 = themeModule.font(Enum.Font.SourceSans)
local GRAY3 = constantsModule.Color.GRAY3
local var3 = themeModule.textSize(19)
local t = {
	[userModel.PresenceType.ONLINE] = 3,
	[userModel.PresenceType.IN_GAME] = 2,
	[userModel.PresenceType.IN_STUDIO] = 1,
	[userModel.PresenceType.OFFLINE] = 0
}
local t_1 = {
	SORT_BY_FREQUENCY = 1,
	SORT_BY_PRESENCE_AND_FREQUENCY = 2
}
local conversationList = roactModule.PureComponent:extend("ConversationList")
conversationList.defaultProps = { entryHeight = 62, entryPadding = 16 }

function conversationList.init(p1)
	-- upvalues: roactModule (ref)
	p1.scrollingRef = roactModule.createRef()
	
	function p0.inviteUser(p2)
		-- upvalues: p1 (ref)
		return p1.props.inviteUser(p2, p1.props.analytics, p1.props.trigger, p1.props.inviteMessageId, p1.props.launchData)
	end
end

function conversationList.render(p1)
	-- upvalues: roactModule (ref), getFFlagEnableNewInviteSendEndpointModule (ref), getFFlagEnableNewInviteMenuModule (ref), playerSearchPredicateModule (ref), inviteListEntryModule (ref), userInputService (ref), conversationEntryModule (ref), retrievalStatus (ref), loadingFriendsPageModule (ref), noFriendsPageModule (ref), friendsErrorPageModule (ref), var2 (ref), var1 (ref), GRAY3 (ref), var3 (ref)
	local analytics = p1.props.analytics
	local children = p1.props[roactModule.Children] or {}
	local entryHeight = p1.props.entryHeight
	local entryPadding = p1.props.entryPadding
	local friends = p1.props.friends
	local friendsRetrievalStatus = p1.props.friendsRetrievalStatus
	local layoutOrder = p1.props.layoutOrder
	local size = p1.props.size
	local zIndex = p1.props.zIndex
	local topPadding = p1.props.topPadding
	local invites = p1.props.invites
	local inviteUser = p1.props.inviteUser
	local searchText = p1.props.searchText
	
	if getFFlagEnableNewInviteSendEndpointModule() then
		inviteUser = p1.inviteUser
	end
	local var4 = getFFlagEnableNewInviteMenuModule()
	children.RowListLayout = roactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, entryPadding)
	})
	local var5 = 0
	
	for i, v in ipairs(friends) do
		local var6 = playerSearchPredicateModule(searchText, v.name, v.displayName)
		
		if var4 then
			children["User-" .. tostring(i)] = roactModule.createElement(inviteListEntryModule, {
				analytics = analytics,
				user = v,
				visible = var6,
				layoutOrder = i,
				inviteUser = inviteUser,
				inviteStatus = invites[v.id],
				isFullRowActivatable = userInputService.GamepadEnabled,
				trigger = p1.props.trigger,
				inviteMessageId = p1.props.inviteMessageId,
				launchData = p1.props.launchData
			})
		else
			children["User-" .. tostring(i)] = roactModule.createElement(conversationEntryModule, {
				analytics = analytics,
				visible = var6,
				size = UDim2.new(1, 0, 0, entryHeight),
				layoutOrder = i,
				zIndex = zIndex,
				title = v.displayName,
				subtitle = "@" .. v.name,
				presence = v.presence,
				users = { v },
				inviteUser = inviteUser,
				inviteStatus = invites[v.id]
			})
		end
		if var6 then
			var5 += 1
		end
	end
	if #friends == 0 or friendsRetrievalStatus == retrievalStatus.Fetching then
		local var7 = loadingFriendsPageModule
		
		if friendsRetrievalStatus == retrievalStatus.Done then
			var7 = noFriendsPageModule
		elseif friendsRetrievalStatus == retrievalStatus.Failed then
			var7 = friendsErrorPageModule
		end
		return roactModule.createElement(var7, {
			BorderSizePixel = 0,
			LayoutOrder = layoutOrder,
			Position = UDim2.new(0, 0, 0, topPadding),
			ZIndex = zIndex
		})
	else
		return if var5 == 0 then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0.22,
			LayoutOrder = layoutOrder,
			Font = var2,
			Size = UDim2.new(1, 0, 0, entryHeight),
			Text = var1:FormatByKey("Feature.SettingsHub.Label.InviteSearchNoResults"),
			TextColor3 = GRAY3,
			TextSize = var3,
			ZIndex = zIndex,
			Position = UDim2.new(0, 0, 0, topPadding)
		}) else roactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			Size = size,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, topPadding),
			CanvasSize = if var4 then UDim2.new() else UDim2.new(0, 0, 0, var5 * (entryHeight + entryPadding)),
			AutomaticCanvasSize = if var4 then Enum.AutomaticSize.Y else nil,
			ScrollBarThickness = 0,
			ZIndex = zIndex,
			Selectable = false,
			[roactModule.Ref] = p1.scrollingRef
		}, children)
	end
end

local function handleBinding(p2)
	-- upvalues: getFFlagEnableNewInviteMenuModule (ref), userInputService (ref), guiService (ref)
	if getFFlagEnableNewInviteMenuModule() and not userInputService.GamepadEnabled then return end
	local value = p2.scrollingRef:getValue()
	
	if value and value:FindFirstAncestorOfClass("ScreenGui").Enabled and guiService.SelectedCoreObject == nil then
		guiService:AddSelectionParent("invitePrompt", value)
		
		for i, v in ipairs(value:GetChildren()) do
			if v:IsA("GuiObject") and v.LayoutOrder == 1 then
				guiService.SelectedCoreObject = v
				
				return
			end
		end
	end
end

conversationList.didUpdate = handleBinding

if getFFlagEnableNewInviteSendEndpointModule() then
	function conversationList.didMount(p3)
		-- upvalues: constantsModule (ref), gameInviteEvents (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), handleBinding (ref)
		if p3.props.analytics and p3.props.trigger == constantsModule.Triggers.GameMenu then
			p3.props.analytics:sendEvent(p3.props.trigger, gameInviteEvents.ModalOpened, if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then {
				isLaunchDataProvided = p3.props.launchData ~= nil and p3.props.launchData ~= ""
			} else nil)
		end
		handleBinding(p3)
	end
else
	conversationList.didMount = handleBinding
end
local var8 = memoize(function(p3)
	-- upvalues: t (ref)
	local t_1 = {}
	
	local function friendPreference(p4, p5)
		-- upvalues: t (copy)
		local presence = t[p4.presence]
		local presence_1 = t[p5.presence]
		
		return if presence == presence_1 then p4.name:lower() < p5.name:lower() else presence_1 < presence
	end
	
	for i, v in pairs(p3) do
		if v.isFriend then
			t_1[#t_1 + 1] = v
		end
	end
	table.sort(t_1, friendPreference)
	
	return t_1
end)
local var9 = memoize(function(p4)
	-- upvalues: sortFriendsByCorrectedPresenceAndRank (ref)
	local t = {}
	
	for i, v in pairs(p4) do
		if v.isFriend then
			t[#t + 1] = v
		end
	end
	table.sort(t, sortFriendsByCorrectedPresenceAndRank)
	
	return t
end)
local var10 = memoize(function(p5)
	local t = {}
	
	local function friendPreference(p6, p7)
		local friendFrequentRank = tonumber(p6.friendFrequentRank) or 0
		local friendFrequentRank_1 = tonumber(p7.friendFrequentRank) or 0
		
		return if friendFrequentRank == friendFrequentRank_1 then p6.name:lower() < p7.name:lower() else friendFrequentRank < friendFrequentRank_1
	end
	
	for i, v in pairs(p5) do
		if v.isFriend then
			t[#t + 1] = v
		end
	end
	table.sort(t, friendPreference)
	
	return t
end)

local _ = function()
	-- upvalues: newInviteMenuExperimentManagerModule (ref), var10 (ref), var9 (ref), var8 (ref)
	local var11 = newInviteMenuExperimentManagerModule.default:getInviteListSortOrder() or 0
	
	return if var11 == 1 then var10 elseif var11 == 2 then var9 else var8
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _)
	-- upvalues: var8 (ref), getFFlagInviteListRerank (ref), newInviteMenuExperimentManagerModule (ref), t_1 (ref), var10 (ref), var9 (ref), playersService (ref)
	local var11 = var8
	
	if getFFlagInviteListRerank() then
		local var12 = newInviteMenuExperimentManagerModule.default:getInviteListSortOrder() or 0
		var11 = if var12 == t_1.SORT_BY_FREQUENCY then var10 elseif var12 == t_1.SORT_BY_PRESENCE_AND_FREQUENCY then var9 else var8
	end
	return {
		friends = var11(p6.Users),
		friendsRetrievalStatus = p6.Friends.retrievalStatus[tostring(playersService.LocalPlayer.UserId)],
		invites = p6.Invites
	}
end, function(p6)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getFFlagEnableNewInviteSendEndpointModule (ref), inviteUserIdToPlaceIdCustomizedModule (ref), inviteUserIdToPlaceIdModule (ref)
	return {
		inviteUser = function(p7, p8, p9, p10, p11)
			-- upvalues: httpRequestModule (copy), httpRbxApiService (copy), getFFlagEnableNewInviteSendEndpointModule (copy), p6 (ref), inviteUserIdToPlaceIdCustomizedModule (copy), inviteUserIdToPlaceIdModule (copy)
			local var11 = httpRequestModule(httpRbxApiService)
			local var12 = tostring(game.PlaceId)
			
			return if getFFlagEnableNewInviteSendEndpointModule() then p6(inviteUserIdToPlaceIdCustomizedModule(var11, p7, var12, p8, p9, p10, p11)) else p6(inviteUserIdToPlaceIdModule(var11, p7, var12))
		end
	}
end)(conversationList)