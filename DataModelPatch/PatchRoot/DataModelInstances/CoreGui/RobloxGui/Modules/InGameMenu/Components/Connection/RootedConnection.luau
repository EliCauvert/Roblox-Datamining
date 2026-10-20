local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local RootedConnection = Roact.PureComponent:extend("RootedConnection")
RootedConnection.validateProps = T.strictInterface({ render = T.callback })

function RootedConnection.init(p1)
	-- upvalues: Roact (copy)
	p1.state = { isRooted = false }
	p1.rootRef = Roact.createRef()
	
	function p1.onAncestryChanged(Object)
		-- upvalues: p1 (copy)
		if Object:IsDescendantOf(game) then
			p1:setState({ isRooted = true })
		end
	end
end

function RootedConnection.render(p1)
	-- upvalues: Roact (copy)
	return Roact.createFragment({
		Content = p1.props.render(p1.state.isRooted),
		Folder = Roact.createElement("Folder", {
			[Roact.Event.AncestryChanged] = p1.onAncestryChanged,
			[Roact.Ref] = p1.rootRef
		})
	})
end

function RootedConnection.didMount(p1)
	if p1.rootRef:getValue():IsDescendantOf(game) then
		p1:setState({ isRooted = true })
	end
end

return RootedConnection