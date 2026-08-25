local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local rootedConnection = roact.PureComponent:extend("RootedConnection")
rootedConnection.validateProps = t.strictInterface({ render = t.callback })

function rootedConnection.init(p0)
	-- upvalues: roact (ref)
	p0.state = { isRooted = false }
	p0.rootRef = roact.createRef()
	
	function p0.onAncestryChanged(p1)
		-- upvalues: p0 (ref)
		if p1:IsDescendantOf(game) then
			p0:setState({ isRooted = true })
		end
	end
end

function rootedConnection.render(p2)
	-- upvalues: roact (ref)
	return roact.createFragment({
		Content = p2.props.render(p2.state.isRooted),
		Folder = roact.createElement("Folder", {
			[roact.Event.AncestryChanged] = p2.onAncestryChanged,
			[roact.Ref] = p2.rootRef
		})
	})
end

function rootedConnection.didMount(p3)
	if p3.rootRef:getValue():IsDescendantOf(game) then
		p3:setState({ isRooted = true })
	end
end

return rootedConnection