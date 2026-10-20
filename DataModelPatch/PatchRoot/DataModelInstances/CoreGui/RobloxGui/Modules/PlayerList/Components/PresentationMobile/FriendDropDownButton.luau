local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local LocalizationService = game:GetService("LocalizationService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local DropDownButtonAnimatorModule = require(script.Parent.DropDownButtonAnimator)
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local FFlagConnectionsToFriendsRename = require(CorePackages.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename
local LocalPlayer = game:GetService("Players").LocalPlayer
local config = {
	unfriend = if FFlagConnectionsToFriendsRename then "Feature.Friends.Action.Unfriend" else nil,
	friendRequest = if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRequest" else nil,
	removeConnection = if FFlagConnectionsToFriendsRename then nil else "CommonUI.Features.Label.RemoveConnection",
	connectionRequest = if FFlagConnectionsToFriendsRename then nil else "InGame.PlayerDropDown.Action.ConnectionRequest"
}
local FriendDropDownButton = RoactModule.PureComponent:extend("FriendDropDownButton")
FriendDropDownButton.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	playerRelationship = TModule.strictInterface({
		isBlocked = TModule.boolean,
		friendStatus = TModule.enum(Enum.FriendStatus),
		isFollowing = TModule.boolean,
		isFollower = TModule.boolean
	}),
	selectedPlayer = TModule.optional(TModule.instanceIsA("Player")),
	dropDownOpen = TModule.boolean,
	requestFriendship = TModule.callback,
	contentVisible = TModule.boolean,
	isUsingGamepad = TModule.optional(TModule.boolean),
	focusGuiObject = TModule.callback
})

local function getFriendTextAndIcon(FriendStatus)
	-- upvalues: Images (copy), Localization (copy), LocalizationService (copy), FFlagConnectionsToFriendsRename (copy), config (copy), RobloxTranslatorModule (copy)
	local IconsActionsFriendsFriendAdd = Images["icons/actions/friends/friendAdd"]
	local IconsActionsFriendsFriendRemove = Images["icons/actions/friends/friendRemove"]
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	
	if FriendStatus == Enum.FriendStatus.Friend then
		return NewLocalization:Format(if FFlagConnectionsToFriendsRename then config.unfriend else config.removeConnection), IconsActionsFriendsFriendRemove
	elseif FriendStatus == Enum.FriendStatus.Unknown or FriendStatus == Enum.FriendStatus.NotFriend then
		return NewLocalization:Format(if FFlagConnectionsToFriendsRename then config.friendRequest else config.connectionRequest), IconsActionsFriendsFriendAdd
	elseif FriendStatus == Enum.FriendStatus.FriendRequestSent then
		return RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.CancelRequest"), IconsActionsFriendsFriendAdd
	elseif FriendStatus == Enum.FriendStatus.FriendRequestReceived then
		return RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Accept"), IconsActionsFriendsFriendAdd
	else
		return NewLocalization:Format(config.connectionRequest), IconsActionsFriendsFriendAdd
	end
end

function FriendDropDownButton.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = { unfriendConfirm = false }
	p1.dropDownButtonAnimatorRef = RoactModule.createRef()
	
	function p1.onAnimationComplete()
		-- upvalues: p1 (copy)
		if p1.props.isUsingGamepad then
			p1.props.focusGuiObject(p1.dropDownButtonAnimatorRef.current)
		end
	end
end

function FriendDropDownButton.render(p1)
	-- upvalues: LocalPlayer (copy), RbxAnalyticsService (copy), getFriendTextAndIcon (copy), RoactModule (copy), DropDownButtonAnimatorModule (copy)
	local PlayerRelationship = p1.props.playerRelationship
	local SelectedPlayer = p1.props.selectedPlayer
	local OnActivated = if PlayerRelationship.friendStatus == Enum.FriendStatus.Friend and not p1.state.unfriendConfirm then function()
		-- upvalues: p1 (copy)
		p1:setState({ unfriendConfirm = true })
	end else function()
		-- upvalues: PlayerRelationship (copy), LocalPlayer (upval), SelectedPlayer (copy), p1 (copy), RbxAnalyticsService (upval)
		if PlayerRelationship.friendStatus == Enum.FriendStatus.Friend then
			LocalPlayer:RevokeFriendship(SelectedPlayer)
			
			return
		end
		if PlayerRelationship.friendStatus == Enum.FriendStatus.Unknown or PlayerRelationship.friendStatus == Enum.FriendStatus.NotFriend then
			p1.props.requestFriendship(SelectedPlayer, false)
			
			return
		end
		if PlayerRelationship.friendStatus == Enum.FriendStatus.FriendRequestSent then
			RbxAnalyticsService:ReportCounter("PlayerDropDown-RevokeFriendship")
			RbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
			LocalPlayer:RevokeFriendship(SelectedPlayer)
			
			return
		end
		if PlayerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			RbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
			RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
			p1.props.requestFriendship(SelectedPlayer, true)
		end
	end
	local OnDecline = if PlayerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then function()
		-- upvalues: LocalPlayer (upval), SelectedPlayer (copy)
		LocalPlayer:RevokeFriendship(SelectedPlayer)
	end else nil
	local OnDismiss = if p1.state.unfriendConfirm then function()
		-- upvalues: p1 (copy)
		p1:setState({ unfriendConfirm = false })
	end else nil
	local FriendTextAndIcon, FriendTextAndIcon2 = getFriendTextAndIcon(PlayerRelationship.friendStatus)
	
	return RoactModule.createElement(DropDownButtonAnimatorModule, {
		lastButton = false,
		layoutOrder = p1.props.layoutOrder,
		text = FriendTextAndIcon,
		icon = FriendTextAndIcon2,
		onActivated = OnActivated,
		forceShowOptions = p1.state.unfriendConfirm,
		selectedPlayer = SelectedPlayer,
		onDecline = OnDecline,
		onDismiss = OnDismiss,
		contentVisible = p1.props.contentVisible,
		forwardRef = p1.dropDownButtonAnimatorRef,
		onAnimationComplete = p1.onAnimationComplete
	})
end

function FriendDropDownButton.didUpdate(p1, p2, p3)
	if p2.playerRelationship.friendStatus ~= p1.props.playerRelationship.friendStatus then
		p1:setState({ unfriendConfirm = false })
	end
	if p2.selectedPlayer ~= p1.props.selectedPlayer or p2.dropDownOpen ~= p1.props.dropDownOpen then
		p1:setState({ unfriendConfirm = false })
	end
	if p1.props.isUsingGamepad then
		local UnfriendConfirm = p1.state.unfriendConfirm or p1.props.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived
		local UnfriendConfirm1 = p3.unfriendConfirm or p2.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived
		
		if UnfriendConfirm and UnfriendConfirm ~= UnfriendConfirm1 then
			p1.props.focusGuiObject(p1.dropDownButtonAnimatorRef.current)
			
			return
		end
	elseif p2.isUsingGamepad ~= p1.props.isUsingGamepad then
		p1.props.focusGuiObject(nil)
	end
end

function FriendDropDownButtonWrapper(p1)
	-- upvalues: UseFocusGuiObjectFunction (copy), RoactModule (copy), FriendDropDownButton (copy), CryoModule (copy)
	return RoactModule.createElement(FriendDropDownButton, CryoModule.Dictionary.join(p1, { focusGuiObject = UseFocusGuiObjectFunction() }))
end

return FriendDropDownButtonWrapper