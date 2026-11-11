local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local ControlState = FoundationModule.Enums.ControlState
local Image = FoundationModule.Image
local View = FoundationModule.View
local ConstantsModule = require(Parent.Constants)

return function(p1)
	-- upvalues: ReactModule (copy), ConstantsModule (copy), Image (copy), ControlState (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "radius-medium bg-over-media-0 padding-medium gap-medium auto-xy row"
	}, (ReactModule.useMemo(function()
		-- upvalues: ConstantsModule (upval), ReactModule (upval), Image (upval), ControlState (upval), p1 (copy)
		local Elements = {}
		local LayoutOrder = 1
		
		for i, reactionIconMapping in ConstantsModule.ReactionIconMappings do
			Elements[i] = ReactModule.createElement(Image, {
				ZIndex = 2,
				tag = "anchor-center-center position-center-center size-900-900",
				Image = reactionIconMapping,
				LayoutOrder = LayoutOrder,
				onStateChanged = function(Pressed)
					-- upvalues: ControlState (upval), p1 (upval), i (copy)
					if Pressed == ControlState.Pressed then
						p1.reactToContent(i)
					end
				end
			})
			LayoutOrder += 1
		end
		return Elements
	end, { p1.reactToContent })))
end