local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local SceneInteractionEventsContextModule = require(script.Parent.SceneInteractionEventsContext)

return function(p1)
	-- upvalues: RoactModule (copy), SceneInteractionEventsContextModule (copy), CryoModule (copy)
	return function(p2)
		-- upvalues: RoactModule (upval), SceneInteractionEventsContextModule (upval), p1 (copy), CryoModule (upval)
		return RoactModule.createElement(SceneInteractionEventsContextModule.Consumer, {
			render = function(InteractionEvents)
				-- upvalues: RoactModule (upval), p1 (upval), CryoModule (upval), p2 (copy)
				return RoactModule.createElement(p1, CryoModule.Dictionary.join(p2, { interactionEvents = InteractionEvents }))
			end
		})
	end
end