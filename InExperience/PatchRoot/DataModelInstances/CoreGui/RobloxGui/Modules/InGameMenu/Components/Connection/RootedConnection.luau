local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local rootedConnection = roact.PureComponent:extend("RootedConnection")
rootedConnection.validateProps = t.strictInterface({ render = t.callback })

function rootedConnection.init(p1)
	-- upvalues: roact (ref)
	p1.state = { isRooted = false }
	p1.rootRef = roact.createRef()
	
	function p0.onAncestryChanged(p2)
		-- upvalues: p1 (ref)
		if p2:IsDescendantOf(game) then
			p1:setState({ isRooted = true })
		end
	end
end

function rootedConnection.render(p1)
	-- upvalues: roact (ref)
	return roact.createFragment({
		Content = p1.props.render(p1.state.isRooted),
		Folder = roact.createElement("Folder", {
			[roact.Event.AncestryChanged] = p1.onAncestryChanged,
			[roact.Ref] = p1.rootRef
		})
	})
end

function rootedConnection.didMount(p1)
	if p1.rootRef:getValue():IsDescendantOf(game) then
		p1:setState({ isRooted = true })
	end
end

return rootedConnection