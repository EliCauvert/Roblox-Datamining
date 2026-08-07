local parent = script.Parent.Parent.Parent.Parent
local tModule = require(parent.t)
local roactModule = require(parent.Roact)
local onRootedListener = roactModule.Component:extend("OnRootedListener")
onRootedListener.validateProps = tModule.strictInterface({ onRooted = tModule.callback })

function onRootedListener.init(p0) --[[ line: 16 ]]
	function p0.onAncestryChanged(p1) --[[ line: 17 ]]
		-- upvalues: p0 (ref)
		if p1:IsDescendantOf(game) then
			p0.props.onRooted(p1)
		end
	end
end

function onRootedListener.render(p2) --[[ line: 24 ]]
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Folder", {
		[roactModule.Event.AncestryChanged] = p2.onAncestryChanged
	})
end

return onRootedListener