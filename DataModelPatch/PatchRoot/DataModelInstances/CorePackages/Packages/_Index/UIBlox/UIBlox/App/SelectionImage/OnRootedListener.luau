local Parent = script.Parent.Parent.Parent.Parent
local TModule = require(Parent.t)
local RoactModule = require(Parent.Roact)
local OnRootedListener = RoactModule.Component:extend("OnRootedListener")
OnRootedListener.validateProps = TModule.strictInterface({ onRooted = TModule.callback })

function OnRootedListener.init(p1)
	function p1.onAncestryChanged(Object)
		-- upvalues: p1 (copy)
		if Object:IsDescendantOf(game) then
			p1.props.onRooted(Object)
		end
	end
end

function OnRootedListener.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Folder", {
		[RoactModule.Event.AncestryChanged] = p1.onAncestryChanged
	})
end

return OnRootedListener