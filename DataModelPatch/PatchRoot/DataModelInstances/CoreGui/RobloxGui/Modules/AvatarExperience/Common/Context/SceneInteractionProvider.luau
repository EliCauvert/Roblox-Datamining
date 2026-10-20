local MakeEventsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Util.makeEvents)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local SceneInteractionCallbacksContextModule = require(script.Parent.SceneInteractionCallbacksContext)
local SceneInteractionEventsContextModule = require(script.Parent.SceneInteractionEventsContext)
local SceneInteractionProvider = RoactModule.PureComponent:extend("SceneInteractionProvider")

function SceneInteractionProvider.init(p1)
	-- upvalues: MakeEventsModule (copy)
	p1.events, p1.callbacks, p1.cleanups = MakeEventsModule({
		"panByDistance", "panByPixels", "rotateByRadians", "rotateByPixels",
		"setAngularVelocityByPixels", "zoomStraight", "zoomToPoint"
	})
end

function SceneInteractionProvider.render(p1)
	-- upvalues: RoactModule (copy), SceneInteractionCallbacksContextModule (copy), SceneInteractionEventsContextModule (copy)
	return RoactModule.createElement(SceneInteractionCallbacksContextModule.Provider, { value = p1.callbacks }, {
		SceneInteractionEventsProvider = RoactModule.createElement(SceneInteractionEventsContextModule.Provider, { value = p1.events }, p1.props[RoactModule.Children])
	})
end

function SceneInteractionProvider.willUnmount(p1)
	for _, cleanup in p1.cleanups do
		cleanup()
	end
end

return SceneInteractionProvider