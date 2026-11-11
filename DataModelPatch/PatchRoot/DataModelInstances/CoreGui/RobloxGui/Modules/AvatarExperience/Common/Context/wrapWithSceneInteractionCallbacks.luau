local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local SceneInteractionCallbacksContextModule = require(script.Parent.SceneInteractionCallbacksContext)

return function(p1)
	-- upvalues: RoactModule (copy), SceneInteractionCallbacksContextModule (copy), CryoModule (copy)
	return function(p2)
		-- upvalues: RoactModule (upval), SceneInteractionCallbacksContextModule (upval), p1 (copy), CryoModule (upval)
		return RoactModule.createElement(SceneInteractionCallbacksContextModule.Consumer, {
			render = function(p3)
				-- upvalues: RoactModule (upval), p1 (upval), CryoModule (upval), p2 (copy)
				return RoactModule.createElement(p1, CryoModule.Dictionary.join(p2, p3))
			end
		})
	end
end