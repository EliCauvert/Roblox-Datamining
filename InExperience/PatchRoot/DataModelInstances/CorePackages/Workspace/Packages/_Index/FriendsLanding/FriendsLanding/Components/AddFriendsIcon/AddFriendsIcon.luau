local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local fFlagConnectionsToFriendsRename = require(friendsLanding.Parent.SharedFlags).FFlagConnectionsToFriendsRename
local dependenciesModule = require(friendsLanding.dependencies)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local textKeysModule = require(friendsLanding.Common.TextKeys)
local iconButton = UIBlox.App.Button.IconButton
local images = UIBlox.App.ImageSet.Images
local badge = UIBlox.App.Indicator.Badge
local tooltip = UIBlox.App.Dialog.Tooltip
local dash = dependenciesModule.Dash
local useState = react.useState
local useLocalization = dependenciesModule.Hooks.useLocalization
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local t = {
	layoutOrder = 0,
	friendRequestCount = 0,
	showTooltip = false,
	onActivated = dash.noop
}

return function(p0) --[[ line: 36 ]]
	-- upvalues: dash (ref), t (ref), useState (ref), getDeepValue (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), react (ref), iconButton (ref), images (ref), badge (ref), tooltip (ref)
	local var4 = dash.join(t, p0)
	local var5, var6 = useState(240)
	
	return react.createElement(iconButton, {
		size = UDim2.fromOffset(0, 0),
		icon = images["icons/actions/friends/friendAdd"],
		position = var4.position,
		anchorPoint = Vector2.new(1, 0.5),
		layoutOrder = var4.layoutOrder,
		onActivated = var4.onActivated
	}, {
		ImagesContainer = react.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[react.Change.AbsoluteSize] = function(p1) --[[ line: 40 ]]
				-- upvalues: var6 (ref), getDeepValue (copy)
				if p1 and p1:FindFirstChild("CallToActionTooltip", true) then
					var6(getDeepValue(p1, "CallToActionTooltip.TooltipContainer.AbsoluteSize.X") or 240)
				end
			end
		}, {
			FriendRequestsBadge = var4.friendRequestCount > 0 and react.createElement(badge, {
				position = UDim2.new(0.5, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 1),
				value = var4.friendRequestCount
			}),
			CallToActionTooltip = var4.showTooltip and react.createElement(tooltip, {
				forceClickTriggerPoint = true,
				isDirectChild = true,
				position = UDim2.new(0, 42.5 - var5, 0, 36),
				triggerPosition = Vector2.new(0, 0),
				triggerSize = Vector2.new(36, 0),
				bodyText = useLocalization({
					tooltipMessage = if fFlagConnectionsToFriendsRename then textKeysModule.NO_FRIENDS_TOOLTIP else textKeysModule.NO_CONNECTIONS_TOOLTIP
				}).tooltipMessage
			})
		})
	})
end