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
local var24 = require(shareGame.getTranslator)()
local var25 = themeModule.font(Enum.Font.SourceSans)
local GRAY3 = constantsModule.Color.GRAY3
local var26 = themeModule.textSize(19)
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

function conversationList.init(p0)
	-- upvalues: roactModule (ref)
	p0.scrollingRef = roactModule.createRef()
	
	function p0.inviteUser(p1)
		-- upvalues: p0 (ref)
		return p0.props.inviteUser(p1, p0.props.analytics, p0.props.trigger, p0.props.inviteMessageId, p0.props.launchData)
	end
end

function conversationList.render(p2)
	-- upvalues: roactModule (ref), getFFlagEnableNewInviteSendEndpointModule (ref), getFFlagEnableNewInviteMenuModule (ref), playerSearchPredicateModule (ref), inviteListEntryModule (ref), userInputService (ref), conversationEntryModule (ref), retrievalStatus (ref), loadingFriendsPageModule (ref), noFriendsPageModule (ref), friendsErrorPageModule (ref), var25 (ref), var24 (ref), GRAY3 (ref), var26 (ref)
	local analytics = p2.props.analytics
	local children = p2.props[roactModule.Children] or {}
	local entryHeight = p2.props.entryHeight
	local entryPadding = p2.props.entryPadding
	local friends = p2.props.friends
	local friendsRetrievalStatus = p2.props.friendsRetrievalStatus
	local layoutOrder = p2.props.layoutOrder
	local size = p2.props.size
	local zIndex = p2.props.zIndex
	local topPadding = p2.props.topPadding
	local invites = p2.props.invites
	local inviteUser = p2.props.inviteUser
	local searchText = p2.props.searchText
	
	if getFFlagEnableNewInviteSendEndpointModule() then
		inviteUser = p2.inviteUser
	end
	local var35 = getFFlagEnableNewInviteMenuModule()
	children.RowListLayout = roactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, entryPadding)
	})
	local var36 = 0
	
	for i, v in ipairs(friends) do
		local var38 = playerSearchPredicateModule(searchText, v.name, v.displayName)
		
		if var35 then
			children["User-" .. tostring(i)] = roactModule.createElement(inviteListEntryModule, {
				analytics = analytics,
				user = v,
				visible = var38,
				layoutOrder = i,
				inviteUser = inviteUser,
				inviteStatus = invites[v.id],
				isFullRowActivatable = userInputService.GamepadEnabled,
				trigger = p2.props.trigger,
				inviteMessageId = p2.props.inviteMessageId,
				launchData = p2.props.launchData
			})
		else
			children["User-" .. tostring(i)] = roactModule.createElement(conversationEntryModule, {
				analytics = analytics,
				visible = var38,
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
		if var38 then
			var36 += 1
		end
	end
	if #friends == 0 or friendsRetrievalStatus == retrievalStatus.Fetching then
		local var37 = loadingFriendsPageModule
		
		if friendsRetrievalStatus == retrievalStatus.Done then
			var37 = noFriendsPageModule
		elseif friendsRetrievalStatus == retrievalStatus.Failed then
			var37 = friendsErrorPageModule
		end
		return roactModule.createElement(var37, {
			BorderSizePixel = 0,
			LayoutOrder = layoutOrder,
			Position = UDim2.new(0, 0, 0, topPadding),
			ZIndex = zIndex
		})
	else
		return if var36 == 0 then roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextTransparency = 0.22,
			LayoutOrder = layoutOrder,
			Font = var25,
			Size = UDim2.new(1, 0, 0, entryHeight),
			Text = var24:FormatByKey("Feature.SettingsHub.Label.InviteSearchNoResults"),
			TextColor3 = GRAY3,
			TextSize = var26,
			ZIndex = zIndex,
			Position = UDim2.new(0, 0, 0, topPadding)
		}) else roactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			Size = size,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0, topPadding),
			CanvasSize = if var35 then UDim2.new() else UDim2.new(0, 0, 0, var36 * (entryHeight + entryPadding)),
			AutomaticCanvasSize = if var35 then Enum.AutomaticSize.Y else nil,
			ScrollBarThickness = 0,
			ZIndex = zIndex,
			Selectable = false,
			[roactModule.Ref] = p2.scrollingRef
		}, children)
	end
end

local function handleBinding(p3)
	-- upvalues: getFFlagEnableNewInviteMenuModule (ref), userInputService (ref), guiService (ref)
	if getFFlagEnableNewInviteMenuModule() and not userInputService.GamepadEnabled then return end
	local value = p3.scrollingRef:getValue()
	
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
	function conversationList.didMount(p4)
		-- upvalues: constantsModule (ref), gameInviteEvents (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), handleBinding (ref)
		if p4.props.analytics and p4.props.trigger == constantsModule.Triggers.GameMenu then
			p4.props.analytics:sendEvent(p4.props.trigger, gameInviteEvents.ModalOpened, if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then {
				isLaunchDataProvided = p4.props.launchData ~= nil and p4.props.launchData ~= ""
			} else nil)
		end
		handleBinding(p4)
	end
else
	conversationList.didMount = handleBinding
end
local var31 = memoize(function(p5)
	-- upvalues: t (ref)
	local t_1 = {}
	
	local function friendPreference(p6, p7)
		-- upvalues: t (copy)
		local presence = t[p6.presence]
		local presence_1 = t[p7.presence]
		
		return if presence == presence_1 then p6.name:lower() < p7.name:lower() else presence_1 < presence
	end
	
	for i, v in pairs(p5) do
		if v.isFriend then
			t_1[#t_1 + 1] = v
		end
	end
	table.sort(t_1, friendPreference)
	
	return t_1
end)
local var32 = memoize(function(p8)
	-- upvalues: sortFriendsByCorrectedPresenceAndRank (ref)
	local t = {}
	
	for i, v in pairs(p8) do
		if v.isFriend then
			t[#t + 1] = v
		end
	end
	table.sort(t, sortFriendsByCorrectedPresenceAndRank)
	
	return t
end)
local var33 = memoize(function(p9)
	local t = {}
	
	local function friendPreference(p10, p11)
		local friendFrequentRank = tonumber(p10.friendFrequentRank) or 0
		local friendFrequentRank_1 = tonumber(p11.friendFrequentRank) or 0
		
		return if friendFrequentRank == friendFrequentRank_1 then p10.name:lower() < p11.name:lower() else friendFrequentRank < friendFrequentRank_1
	end
	
	for i, v in pairs(p9) do
		if v.isFriend then
			t[#t + 1] = v
		end
	end
	table.sort(t, friendPreference)
	
	return t
end)

local _ = function()
	-- upvalues: newInviteMenuExperimentManagerModule (ref), var33 (ref), var32 (ref), var31 (ref)
	local var47 = newInviteMenuExperimentManagerModule.default:getInviteListSortOrder() or 0
	
	return if var47 == 1 then var33 elseif var47 == 2 then var32 else var31
end

return roactRoduxModule.UNSTABLE_connect2(function(p12, _)
	-- upvalues: var31 (ref), getFFlagInviteListRerank (ref), newInviteMenuExperimentManagerModule (ref), t_1 (ref), var33 (ref), var32 (ref), playersService (ref)
	local var48 = var31
	
	if getFFlagInviteListRerank() then
		local var49 = newInviteMenuExperimentManagerModule.default:getInviteListSortOrder() or 0
		var48 = if var49 == t_1.SORT_BY_FREQUENCY then var33 elseif var49 == t_1.SORT_BY_PRESENCE_AND_FREQUENCY then var32 else var31
	end
	return {
		friends = var48(p12.Users),
		friendsRetrievalStatus = p12.Friends.retrievalStatus[tostring(playersService.LocalPlayer.UserId)],
		invites = p12.Invites
	}
end, function(p13)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getFFlagEnableNewInviteSendEndpointModule (ref), inviteUserIdToPlaceIdCustomizedModule (ref), inviteUserIdToPlaceIdModule (ref)
	return {
		inviteUser = function(p14, p15, p16, p17, p18)
			-- upvalues: httpRequestModule (copy), httpRbxApiService (copy), getFFlagEnableNewInviteSendEndpointModule (copy), p13 (ref), inviteUserIdToPlaceIdCustomizedModule (copy), inviteUserIdToPlaceIdModule (copy)
			local var50 = httpRequestModule(httpRbxApiService)
			local var51 = tostring(game.PlaceId)
			
			return if getFFlagEnableNewInviteSendEndpointModule() then p13(inviteUserIdToPlaceIdCustomizedModule(var50, p14, var51, p15, p16, p17, p18)) else p13(inviteUserIdToPlaceIdModule(var50, p14, var51))
		end
	}
end)(conversationList)