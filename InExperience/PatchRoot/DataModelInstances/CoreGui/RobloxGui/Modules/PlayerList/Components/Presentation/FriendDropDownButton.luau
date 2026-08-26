local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local localizationService = game:GetService("LocalizationService")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local dropDownButtonAnimatorModule = require(script.Parent.DropDownButtonAnimator)
local images = UIBloxModule.App.ImageSet.Images
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local fFlagConnectionsToFriendsRename = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename
local localPlayer = playersService.LocalPlayer
local t = {
	unfriend = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.Unfriend" else nil,
	friendRequest = if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRequest" else nil,
	removeConnection = if fFlagConnectionsToFriendsRename then nil else "CommonUI.Features.Label.RemoveConnection",
	connectionRequest = if fFlagConnectionsToFriendsRename then nil else "InGame.PlayerDropDown.Action.ConnectionRequest"
}
local friendDropDownButton = roactModule.PureComponent:extend("FriendDropDownButton")
friendDropDownButton.validateProps = tModule.strictInterface({
	layoutOrder = tModule.integer,
	playerRelationship = tModule.strictInterface({
		isBlocked = tModule.boolean,
		friendStatus = tModule.enum(Enum.FriendStatus),
		isFollowing = tModule.boolean,
		isFollower = tModule.boolean
	}),
	selectedPlayer = tModule.optional(tModule.instanceIsA("Player")),
	dropDownOpen = tModule.boolean,
	requestFriendship = tModule.callback,
	contentVisible = tModule.optional(tModule.boolean)
})

local function getFriendTextAndIcon(p1)
	-- upvalues: images (ref), localization (ref), localizationService (ref), fFlagConnectionsToFriendsRename (ref), t (ref), robloxTranslatorModule (ref)
	local friendAdd = images["icons/actions/friends/friendAdd"]
	local friendRemove = images["icons/actions/friends/friendRemove"]
	local var1 = localization.new(localizationService.RobloxLocaleId)
	
	if p1 == Enum.FriendStatus.Friend then
		return var1:Format(if fFlagConnectionsToFriendsRename then t.unfriend else t.removeConnection), friendRemove
	elseif p1 == Enum.FriendStatus.Unknown or p1 == Enum.FriendStatus.NotFriend then
		return var1:Format(if fFlagConnectionsToFriendsRename then t.friendRequest else t.connectionRequest), friendAdd
	elseif p1 == Enum.FriendStatus.FriendRequestSent then
		return robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.CancelRequest"), friendAdd
	elseif p1 == Enum.FriendStatus.FriendRequestReceived then
		return robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Accept"), friendAdd
	end
	return var1:Format(t.connectionRequest), friendAdd
end

function friendDropDownButton.init(p1)
	p1.state = { unfriendConfirm = false }
end

function friendDropDownButton.render(p1)
	-- upvalues: localPlayer (ref), rbxAnalyticsService (ref), getFriendTextAndIcon (ref), roactModule (ref), dropDownButtonAnimatorModule (ref)
	local playerRelationship = p1.props.playerRelationship
	local selectedPlayer = p1.props.selectedPlayer
	local _ = nil
	local var1 = if playerRelationship.friendStatus == Enum.FriendStatus.Friend and not p1.state.unfriendConfirm then function()
		-- upvalues: p1 (ref)
		p1:setState({ unfriendConfirm = true })
	end else function()
		-- upvalues: playerRelationship (ref), localPlayer (copy), selectedPlayer (ref), p1 (ref), rbxAnalyticsService (copy)
		if playerRelationship.friendStatus == Enum.FriendStatus.Friend then
			localPlayer:RevokeFriendship(selectedPlayer)
			
			return
		elseif playerRelationship.friendStatus == Enum.FriendStatus.Unknown or playerRelationship.friendStatus == Enum.FriendStatus.NotFriend then
			p1.props.requestFriendship(selectedPlayer, false)
			
			return
		elseif playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestSent then
			rbxAnalyticsService:ReportCounter("PlayerDropDown-RevokeFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
			localPlayer:RevokeFriendship(selectedPlayer)
			
			return
		elseif playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			rbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
			p1.props.requestFriendship(selectedPlayer, true)
		end
	end
	local var2 = if playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then function()
		-- upvalues: localPlayer (copy), selectedPlayer (ref)
		localPlayer:RevokeFriendship(selectedPlayer)
	end else nil
	local var3 = if p1.state.unfriendConfirm then function()
		-- upvalues: p1 (ref)
		p1:setState({ unfriendConfirm = false })
	end else nil
	local var4, var5 = getFriendTextAndIcon(playerRelationship.friendStatus)
	
	return roactModule.createElement(dropDownButtonAnimatorModule, {
		lastButton = false,
		layoutOrder = p1.props.layoutOrder,
		text = var4,
		icon = var5,
		onActivated = var1,
		forceShowOptions = p1.state.unfriendConfirm,
		selectedPlayer = selectedPlayer,
		onDecline = var2,
		onDismiss = var3
	})
end

function friendDropDownButton.didUpdate(p1, p2, _)
	if p2.playerRelationship.friendStatus ~= p1.props.playerRelationship.friendStatus then
		p1:setState({ unfriendConfirm = false })
	end
	if p2.selectedPlayer ~= p1.props.selectedPlayer or p2.dropDownOpen ~= p1.props.dropDownOpen then
		p1:setState({ unfriendConfirm = false })
	end
end

return friendDropDownButton