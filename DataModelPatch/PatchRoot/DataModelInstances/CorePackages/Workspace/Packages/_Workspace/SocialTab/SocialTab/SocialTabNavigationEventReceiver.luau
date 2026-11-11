local Roact = require(script:FindFirstAncestor("SocialTab").dependencies).Roact
local SocialTabNavigationEventReceiver = Roact.PureComponent:extend("SocialTabNavigationEventReceiver")

function SocialTabNavigationEventReceiver.init(p1)
	p1.skipDidFocusOnMount = true
	
	function p1.onDidFocusHandler()
		-- upvalues: p1 (copy)
		if p1.skipDidFocusOnMount then
			p1.skipDidFocusOnMount = false
		end
	end
end

function SocialTabNavigationEventReceiver.render(p1)
	-- upvalues: Roact (copy)
	return Roact.createElement(p1.props.navigationEventReceiver, { onDidFocus = p1.onDidFocusHandler })
end

return SocialTabNavigationEventReceiver