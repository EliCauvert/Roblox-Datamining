local parent = script.Parent.Parent.Parent.Parent
local tModule = require(parent.t)
local roactModule = require(parent.Roact)
local onRootedListener = roactModule.Component:extend("OnRootedListener")
onRootedListener.validateProps = tModule.strictInterface({ onRooted = tModule.callback })

function onRootedListener.init(p1)
	function p0.onAncestryChanged(p2)
		-- upvalues: p1 (ref)
		if p2:IsDescendantOf(game) then
			p1.props.onRooted(p2)
		end
	end
end

function onRootedListener.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Folder", {
		[roactModule.Event.AncestryChanged] = p1.onAncestryChanged
	})
end

return onRootedListener