local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local localizationService = game:GetService("LocalizationService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local useFocusGuiObject = require(corePackagesService.Packages.ReactFocusNavigation).useFocusGuiObject
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
	contentVisible = tModule.boolean,
	isUsingGamepad = tModule.optional(tModule.boolean),
	focusGuiObject = tModule.callback
})

local function getFriendTextAndIcon(p0) --[[ line: 55 ]]
	-- upvalues: images (ref), localization (ref), localizationService (ref), fFlagConnectionsToFriendsRename (ref), t (ref), robloxTranslatorModule (ref)
	local friendAdd = images["icons/actions/friends/friendAdd"]
	local friendRemove = images["icons/actions/friends/friendRemove"]
	local var13 = localization.new(localizationService.RobloxLocaleId)
	
	if p0 == Enum.FriendStatus.Friend then
		return var13:Format(if fFlagConnectionsToFriendsRename then t.unfriend else t.removeConnection), friendRemove
	elseif p0 == Enum.FriendStatus.Unknown or p0 == Enum.FriendStatus.NotFriend then
		return var13:Format(if fFlagConnectionsToFriendsRename then t.friendRequest else t.connectionRequest), friendAdd
	elseif p0 == Enum.FriendStatus.FriendRequestSent then
		return robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.CancelRequest"), friendAdd
	elseif p0 == Enum.FriendStatus.FriendRequestReceived then
		return robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.Accept"), friendAdd
	end
	return var13:Format(t.connectionRequest), friendAdd
end

function friendDropDownButton.init(p1) --[[ line: 81 ]]
	-- upvalues: roactModule (ref)
	p1.state = { unfriendConfirm = false }
	p1.dropDownButtonAnimatorRef = roactModule.createRef()
	
	function p1.onAnimationComplete() --[[ line: 88 ]]
		-- upvalues: p1 (ref)
		if p1.props.isUsingGamepad then
			p1.props.focusGuiObject(p1.dropDownButtonAnimatorRef.current)
		end
	end
end

function friendDropDownButton.render(p2) --[[ line: 95 ]]
	-- upvalues: localPlayer (ref), rbxAnalyticsService (ref), getFriendTextAndIcon (ref), roactModule (ref), dropDownButtonAnimatorModule (ref)
	local playerRelationship = p2.props.playerRelationship
	local selectedPlayer = p2.props.selectedPlayer
	local _ = nil
	local var14 = if playerRelationship.friendStatus == Enum.FriendStatus.Friend and not p2.state.unfriendConfirm then function() --[[ line: 101 ]]
		-- upvalues: p2 (ref)
		p2:setState({ unfriendConfirm = true })
	end else function() --[[ line: 107 ]]
		-- upvalues: playerRelationship (ref), localPlayer (copy), selectedPlayer (ref), p2 (ref), rbxAnalyticsService (copy)
		if playerRelationship.friendStatus == Enum.FriendStatus.Friend then
			localPlayer:RevokeFriendship(selectedPlayer)
			
			return
		elseif playerRelationship.friendStatus == Enum.FriendStatus.Unknown or playerRelationship.friendStatus == Enum.FriendStatus.NotFriend then
			p2.props.requestFriendship(selectedPlayer, false)
			
			return
		elseif playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestSent then
			rbxAnalyticsService:ReportCounter("PlayerDropDown-RevokeFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
			localPlayer:RevokeFriendship(selectedPlayer)
			
			return
		elseif playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			rbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
			p2.props.requestFriendship(selectedPlayer, true)
		end
	end
	local var15 = if playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived then function() --[[ line: 129 ]]
		-- upvalues: localPlayer (copy), selectedPlayer (ref)
		localPlayer:RevokeFriendship(selectedPlayer)
	end else nil
	local var16 = if p2.state.unfriendConfirm then function() --[[ line: 135 ]]
		-- upvalues: p2 (ref)
		p2:setState({ unfriendConfirm = false })
	end else nil
	local var17, var18 = getFriendTextAndIcon(playerRelationship.friendStatus)
	
	return roactModule.createElement(dropDownButtonAnimatorModule, {
		lastButton = false,
		layoutOrder = p2.props.layoutOrder,
		text = var17,
		icon = var18,
		onActivated = var14,
		forceShowOptions = p2.state.unfriendConfirm,
		selectedPlayer = selectedPlayer,
		onDecline = var15,
		onDismiss = var16,
		contentVisible = p2.props.contentVisible,
		forwardRef = p2.dropDownButtonAnimatorRef,
		onAnimationComplete = p2.onAnimationComplete
	})
end

function friendDropDownButton.didUpdate(p3, p4, p5) --[[ line: 159 ]]
	if p4.playerRelationship.friendStatus ~= p3.props.playerRelationship.friendStatus then
		p3:setState({ unfriendConfirm = false })
	end
	if p4.selectedPlayer ~= p3.props.selectedPlayer or p4.dropDownOpen ~= p3.props.dropDownOpen then
		p3:setState({ unfriendConfirm = false })
	end
	if p3.props.isUsingGamepad then
		local unfriendConfirm = p3.state.unfriendConfirm or p3.props.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived
		
		if unfriendConfirm and unfriendConfirm ~= (p5.unfriendConfirm or p4.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived) then
			p3.props.focusGuiObject(p3.dropDownButtonAnimatorRef.current)
			
			return
		end
	elseif p4.isUsingGamepad ~= p3.props.isUsingGamepad then
		p3.props.focusGuiObject(nil)
	end
end

function FriendDropDownButtonWrapper(p6) --[[ line: 188 ]]
	-- upvalues: useFocusGuiObject (ref), roactModule (ref), friendDropDownButton (ref), cryoModule (ref)
	return roactModule.createElement(friendDropDownButton, cryoModule.Dictionary.join(p6, { focusGuiObject = useFocusGuiObject() }))
end

return FriendDropDownButtonWrapper