local ShareTargetGame = script:FindFirstAncestor("ShareTargetGame")
local Roact = require(ShareTargetGame.dependencies).Roact
local SendButtonModule = require(ShareTargetGame.Components.SendButton)
local SendButtonBase = Roact.PureComponent:extend("SendButtonBase")

function SendButtonBase.init(p1)
	p1.state = { sentStatus = nil }
	
	function p1.send()
		-- upvalues: p1 (copy)
		p1:setState({ sentStatus = p1.props.sentStatus })
	end
end

function SendButtonBase.render(p1)
	-- upvalues: Roact (copy), SendButtonModule (copy)
	return Roact.createElement(SendButtonModule, { sentStatus = p1.state.sentStatus, onActivated = p1.send })
end

return SendButtonBase