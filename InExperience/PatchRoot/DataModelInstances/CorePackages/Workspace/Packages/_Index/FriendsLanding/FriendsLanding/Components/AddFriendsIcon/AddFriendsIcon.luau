local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local TextKeysModule = require(FriendsLanding.Common.TextKeys)
local IconButton = UIBlox.App.Button.IconButton
local Images = UIBlox.App.ImageSet.Images
local Badge = UIBlox.App.Indicator.Badge
local Tooltip = UIBlox.App.Dialog.Tooltip
local Dash = DependenciesModule.Dash
local UseStateFunction = React.useState
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local config = {
	layoutOrder = 0,
	friendRequestCount = 0,
	showTooltip = false,
	onActivated = Dash.noop
}

return function(p1) --[[ Line: 34 ]]
	-- upvalues: Dash (copy), config (copy), UseStateFunction (copy), GetDeepValueFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), React (copy), IconButton (copy), Images (copy), Badge (copy), Tooltip (copy)
	local JoinResult = Dash.join(config, p1)
	local UseStateResult, UseStateResult2 = UseStateFunction(240)
	
	local function v14(Object) --[[ Line: 38 ]]
		-- upvalues: UseStateResult2 (copy), GetDeepValueFunction (upval)
		if Object and Object:FindFirstChild("CallToActionTooltip", true) then
			UseStateResult2(GetDeepValueFunction(Object, "CallToActionTooltip.TooltipContainer.AbsoluteSize.X") or 240)
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({ tooltipMessage = TextKeysModule.NO_FRIENDS_TOOLTIP })
	
	return React.createElement(IconButton, {
		size = UDim2.fromOffset(0, 0),
		icon = Images["icons/actions/friends/friendAdd"],
		position = JoinResult.position,
		anchorPoint = Vector2.new(1, 0.5),
		layoutOrder = JoinResult.layoutOrder,
		onActivated = JoinResult.onActivated
	}, {
		ImagesContainer = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[React.Change.AbsoluteSize] = v14
		}, {
			FriendRequestsBadge = JoinResult.friendRequestCount > 0 and React.createElement(Badge, {
				position = UDim2.new(0.5, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 1),
				value = JoinResult.friendRequestCount
			}),
			CallToActionTooltip = JoinResult.showTooltip and React.createElement(Tooltip, {
				forceClickTriggerPoint = true,
				isDirectChild = true,
				position = UDim2.new(0, 42.5 - UseStateResult, 0, 36),
				triggerPosition = Vector2.new(0, 0),
				triggerSize = Vector2.new(36, 0),
				bodyText = UseLocalizationResult.tooltipMessage
			})
		})
	})
end