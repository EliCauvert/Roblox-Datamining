local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local SortFriendsByCorrectedPresenceAndRank = require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = CoreGui.RobloxGui.Modules
local ShareGame = CoreGui:WaitForChild("RobloxGui").Modules.Settings.Pages.ShareGame
local ThemeModule = require(Modules.Settings.Theme)
local ConstantsModule = require(ShareGame.Constants)
local GameInviteEvents = require(CorePackages.Workspace.Packages.GameInvite).GameInviteEvents
local ConversationEntryModule = require(ShareGame.Components.ConversationEntry)
local InviteListEntryModule = require(ShareGame.Components.InviteListEntry)
local FriendsErrorPageModule = require(ShareGame.Components.FriendsErrorPage)
local InviteUserIdToPlaceIdModule = require(ShareGame.Thunks.InviteUserIdToPlaceId)
local InviteUserIdToPlaceIdCustomizedModule = require(ShareGame.Thunks.InviteUserIdToPlaceIdCustomized)
local NewInviteMenuExperimentManagerModule = require(ShareGame.NewInviteMenuExperimentManager)
local LoadingFriendsPageModule = require(ShareGame.Components.LoadingFriendsPage)
local NoFriendsPageModule = require(ShareGame.Components.NoFriendsPage)
local PlayerSearchPredicateModule = require(CoreGui.RobloxGui.Modules.InGameMenu.Utility.PlayerSearchPredicate)
local GetFFlagAbuseReportAnalyticsHasLaunchDataModule = require(Modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local GetFFlagEnableNewInviteMenuModule = require(Modules.Flags.GetFFlagEnableNewInviteMenu)
local GetFFlagEnableNewInviteSendEndpointModule = require(Modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local UserModel = require(CorePackages.Workspace.Packages.UserLib).Models.UserModel
local HttpRequestModule = require(Modules.Common.httpRequest)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local GetFFlagInviteListRerankFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
local Translator = require(ShareGame.getTranslator)()
local FontResult = ThemeModule.font(Enum.Font.SourceSans)
local GRAY3 = ConstantsModule.Color.GRAY3
local TextSizeResult = ThemeModule.textSize(19)
local config = {
	[UserModel.PresenceType.ONLINE] = 3,
	[UserModel.PresenceType.IN_GAME] = 2,
	[UserModel.PresenceType.IN_STUDIO] = 1,
	[UserModel.PresenceType.OFFLINE] = 0
}
local config1 = {
	SORT_BY_FREQUENCY = 1,
	SORT_BY_PRESENCE_AND_FREQUENCY = 2
}
local ConversationList = RoactModule.PureComponent:extend("ConversationList")
ConversationList.defaultProps = { entryHeight = 62, entryPadding = 16 }

function ConversationList.init(p1) --[[ Line: 76 ]]
	-- upvalues: RoactModule (copy)
	p1.scrollingRef = RoactModule.createRef()
	
	function p1.inviteUser(p2) --[[ Line: 78 ]]
		-- upvalues: p1 (copy)
		return p1.props.inviteUser(p2, p1.props.analytics, p1.props.trigger, p1.props.inviteMessageId, p1.props.launchData)
	end
end

function ConversationList.render(p1) --[[ Line: 89 ]]
	-- upvalues: RoactModule (copy), GetFFlagEnableNewInviteSendEndpointModule (copy), GetFFlagEnableNewInviteMenuModule (copy), PlayerSearchPredicateModule (copy), InviteListEntryModule (copy), UserInputService (copy), ConversationEntryModule (copy), RetrievalStatus (copy), LoadingFriendsPageModule (copy), NoFriendsPageModule (copy), FriendsErrorPageModule (copy), FontResult (copy), Translator (copy), GRAY3 (copy), TextSizeResult (copy)
	local Analytics = p1.props.analytics
	local Prop = p1.props[RoactModule.Children] or {}
	local EntryHeight = p1.props.entryHeight
	local EntryPadding = p1.props.entryPadding
	local Friends = p1.props.friends
	local FriendsRetrievalStatus = p1.props.friendsRetrievalStatus
	local LayoutOrder = p1.props.layoutOrder
	local Size = p1.props.size
	local ZIndex = p1.props.zIndex
	local TopPadding = p1.props.topPadding
	local Invites = p1.props.invites
	local InviteUser = p1.props.inviteUser
	local SearchText = p1.props.searchText
	
	if GetFFlagEnableNewInviteSendEndpointModule() then
		InviteUser = p1.inviteUser
	end
	local FFlagEnableNewInviteMenuModule = GetFFlagEnableNewInviteMenuModule()
	Prop.RowListLayout = RoactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, EntryPadding)
	})
	local Count = 0
	
	for LayoutOrder1, friend in ipairs(Friends) do
		local PlayerSearchPredicateModuleResult = PlayerSearchPredicateModule(SearchText, friend.name, friend.displayName)
		
		if FFlagEnableNewInviteMenuModule then
			Prop["User-" .. tostring(LayoutOrder1)] = RoactModule.createElement(InviteListEntryModule, {
				analytics = Analytics,
				user = friend,
				visible = PlayerSearchPredicateModuleResult,
				layoutOrder = LayoutOrder1,
				inviteUser = InviteUser,
				inviteStatus = Invites[friend.id],
				isFullRowActivatable = UserInputService.GamepadEnabled,
				trigger = p1.props.trigger,
				inviteMessageId = p1.props.inviteMessageId,
				launchData = p1.props.launchData
			})
		else
			Prop["User-" .. tostring(LayoutOrder1)] = RoactModule.createElement(ConversationEntryModule, {
				analytics = Analytics,
				visible = PlayerSearchPredicateModuleResult,
				size = UDim2.new(1, 0, 0, EntryHeight),
				layoutOrder = LayoutOrder1,
				zIndex = ZIndex,
				title = friend.displayName,
				subtitle = "@" .. friend.name,
				presence = friend.presence,
				users = { friend },
				inviteUser = InviteUser,
				inviteStatus = Invites[friend.id]
			})
		end
		if PlayerSearchPredicateModuleResult then
			Count += 1
		end
	end
	return if #Friends == 0 or FriendsRetrievalStatus == RetrievalStatus.Fetching then RoactModule.createElement(if FriendsRetrievalStatus == RetrievalStatus.Done then NoFriendsPageModule elseif FriendsRetrievalStatus == RetrievalStatus.Failed then FriendsErrorPageModule else LoadingFriendsPageModule, {
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		Position = UDim2.new(0, 0, 0, TopPadding),
		ZIndex = ZIndex
	}) elseif Count == 0 then RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextTransparency = 0.22,
		LayoutOrder = LayoutOrder,
		Font = FontResult,
		Size = UDim2.new(1, 0, 0, EntryHeight),
		Text = Translator:FormatByKey("Feature.SettingsHub.Label.InviteSearchNoResults"),
		TextColor3 = GRAY3,
		TextSize = TextSizeResult,
		ZIndex = ZIndex,
		Position = UDim2.new(0, 0, 0, TopPadding)
	}) else RoactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		Size = Size,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, TopPadding),
		CanvasSize = if FFlagEnableNewInviteMenuModule then UDim2.new() else UDim2.new(0, 0, 0, Count * (EntryHeight + EntryPadding)),
		AutomaticCanvasSize = if FFlagEnableNewInviteMenuModule then Enum.AutomaticSize.Y else nil,
		ScrollBarThickness = 0,
		ZIndex = ZIndex,
		Selectable = false,
		[RoactModule.Ref] = p1.scrollingRef
	}, Prop)
end

local function handleBinding(p2) --[[ Line: 211 ]]
	-- upvalues: GetFFlagEnableNewInviteMenuModule (copy), UserInputService (copy), GuiService (copy)
	if GetFFlagEnableNewInviteMenuModule() and not UserInputService.GamepadEnabled then return end
	local Value = p2.scrollingRef:getValue()
	
	if Value and Value:FindFirstAncestorOfClass("ScreenGui").Enabled and GuiService.SelectedCoreObject == nil then
		GuiService:AddSelectionParent("invitePrompt", Value)
		
		for _, Gui in ipairs(Value:GetChildren()) do
			if Gui:IsA("GuiObject") and Gui.LayoutOrder == 1 then
				GuiService.SelectedCoreObject = Gui
				break
			end
		end
	end
end

ConversationList.didUpdate = handleBinding

if GetFFlagEnableNewInviteSendEndpointModule() then
	function ConversationList.didMount(p3) --[[ Line: 237 ]]
		-- upvalues: ConstantsModule (copy), GameInviteEvents (copy), GetFFlagAbuseReportAnalyticsHasLaunchDataModule (copy), handleBinding (copy)
		if p3.props.analytics and p3.props.trigger == ConstantsModule.Triggers.GameMenu then
			local IsNotLaunchDataMatch: boolean = p3.props.launchData ~= nil and p3.props.launchData ~= ""
			p3.props.analytics:sendEvent(p3.props.trigger, GameInviteEvents.ModalOpened, if GetFFlagAbuseReportAnalyticsHasLaunchDataModule() then { isLaunchDataProvided = IsNotLaunchDataMatch } else nil)
		end
		handleBinding(p3)
	end
else
	ConversationList.didMount = handleBinding
end
local MemoizeResult = MemoizeFunction(function(List) --[[ Line: 256 ]]
	-- upvalues: config (copy)
	local List1 = {}
	
	local function friendPreference(A, B): boolean --[[ Line: 258 ]]
		-- upvalues: config (upval)
		local Entry = config[A.presence]
		local Entry1 = config[B.presence]
		
		return if Entry == Entry1 then A.name:lower() < B.name:lower() else Entry1 < Entry
	end
	
	for _, value in pairs(List) do
		if value.isFriend then
			List1[#List1 + 1] = value
		end
	end
	table.sort(List1, friendPreference)
	
	return List1
end)
local MemoizeResult1 = MemoizeFunction(function(List) --[[ Line: 280 ]]
	-- upvalues: SortFriendsByCorrectedPresenceAndRank (copy)
	local List1 = {}
	
	for _, value in pairs(List) do
		if value.isFriend then
			List1[#List1 + 1] = value
		end
	end
	table.sort(List1, SortFriendsByCorrectedPresenceAndRank)
	
	return List1
end)
local MemoizeResult2 = MemoizeFunction(function(List) --[[ Line: 293 ]]
	local List1 = {}
	
	local function friendPreference(A, B): boolean --[[ Line: 295 ]]
		local Number: number = tonumber(A.friendFrequentRank) or 0
		local Number1: number = tonumber(B.friendFrequentRank) or 0
		
		return if Number == Number1 then A.name:lower() < B.name:lower() else Number < Number1
	end
	
	for _, value in pairs(List) do
		if value.isFriend then
			List1[#List1 + 1] = value
		end
	end
	table.sort(List1, friendPreference)
	
	return List1
end)

local function _() --[[ Line: 317 ]]
	-- upvalues: NewInviteMenuExperimentManagerModule (copy), MemoizeResult2 (copy), MemoizeResult1 (copy), MemoizeResult (copy)
	local InviteListSortOrder = NewInviteMenuExperimentManagerModule.default:getInviteListSortOrder() or 0
	
	return if InviteListSortOrder == 1 then MemoizeResult2 elseif InviteListSortOrder == 2 then MemoizeResult1 else MemoizeResult
end

return RoactRoduxModule.UNSTABLE_connect2(function(p3, _) --[[ Line: 329 ]]
	-- upvalues: MemoizeResult (copy), GetFFlagInviteListRerankFunction (copy), NewInviteMenuExperimentManagerModule (copy), config1 (copy), MemoizeResult2 (copy), MemoizeResult1 (copy), Players (copy)
	local Callback = MemoizeResult
	
	if GetFFlagInviteListRerankFunction() then
		local InviteListSortOrder = NewInviteMenuExperimentManagerModule.default:getInviteListSortOrder() or 0
		Callback = if InviteListSortOrder == config1.SORT_BY_FREQUENCY then MemoizeResult2 elseif InviteListSortOrder == config1.SORT_BY_PRESENCE_AND_FREQUENCY then MemoizeResult1 else MemoizeResult
	end
	return {
		friends = Callback(p3.Users),
		friendsRetrievalStatus = p3.Friends.retrievalStatus[tostring(Players.LocalPlayer.UserId)],
		invites = p3.Invites
	}
end, function(Callback) --[[ Line: 341 ]]
	-- upvalues: HttpRequestModule (copy), HttpRbxApiService (copy), GetFFlagEnableNewInviteSendEndpointModule (copy), InviteUserIdToPlaceIdCustomizedModule (copy), InviteUserIdToPlaceIdModule (copy)
	return {
		inviteUser = function(p3, p4, p5, p6, p7) --[[ Line: 343 ]]
			-- upvalues: HttpRequestModule (upval), HttpRbxApiService (upval), GetFFlagEnableNewInviteSendEndpointModule (upval), Callback (copy), InviteUserIdToPlaceIdCustomizedModule (upval), InviteUserIdToPlaceIdModule (upval)
			local HttpRequestModuleResult = HttpRequestModule(HttpRbxApiService)
			local Text = tostring(game.PlaceId)
			
			return if GetFFlagEnableNewInviteSendEndpointModule() then Callback(InviteUserIdToPlaceIdCustomizedModule(HttpRequestModuleResult, p3, Text, p4, p5, p6, p7)) else Callback(InviteUserIdToPlaceIdModule(HttpRequestModuleResult, p3, Text))
		end
	}
end)(ConversationList)