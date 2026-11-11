local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local T = DependenciesModule.t
local Tooltip = UIBlox.App.Dialog.Tooltip
local TooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
local WithLocalizationFunction = DependenciesModule.withLocalization
local LocalizedKeysModule = require(SocialTab.Enums.LocalizedKeys)
local AddFriendHint = Roact.PureComponent:extend("AddFriendHint")
AddFriendHint.defaultProps = { layoutOrder = 0, maxHintHeight = 100 }
AddFriendHint.validateProps = T.interface({
	layoutOrder = T.optional(T.number),
	maxHintHeight = T.number
})

function AddFriendHint.render(p1)
	-- upvalues: WithLocalizationFunction (copy), LocalizedKeysModule (copy), Roact (copy), Tooltip (copy), TooltipOrientation (copy)
	return WithLocalizationFunction({
		addFriendsHintText = LocalizedKeysModule.AddFriendsHintText.rawValue(),
		addFriendsHintTitle = LocalizedKeysModule.AddFriendsHintTitle.rawValue()
	})(function(p2)
		-- upvalues: Roact (upval), p1 (copy), Tooltip (upval), TooltipOrientation (upval)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 1, 0),
			LayoutOrder = p1.props.layoutOrder
		}, {
			HintFrame = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, p1.props.maxHintHeight)
			}, {
				Tooltip = Roact.createElement(Tooltip, {
					forceClickTriggerPoint = true,
					isDirectChild = true,
					triggerPosition = Vector2.new(0, p1.props.maxHintHeight),
					triggerSize = Vector2.new(-12, p1.props.maxHintHeight),
					bodyText = p2.addFriendsHintText,
					headerText = p2.addFriendsHintTitle,
					orientation = TooltipOrientation.Right
				})
			})
		})
	end)
end

return AddFriendHint