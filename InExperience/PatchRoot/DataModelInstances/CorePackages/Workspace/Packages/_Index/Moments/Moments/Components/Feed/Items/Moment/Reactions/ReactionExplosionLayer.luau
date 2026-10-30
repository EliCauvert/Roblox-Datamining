local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ReactionExplosionModule = if require(Moments.Flags.FFlagMomentsUseSharedReactions) then require(Parent.Reactions.ReactionExplosion) else require(script.Parent.ReactionExplosion)
local UseReactionEffectsFunction = require(script.Parent.ReactionEffectsContext).useReactionEffects
local EXPLOSIONLAYERZINDEX = require(script.Parent.reactionsConstants).EXPLOSION_LAYER_ZINDEX
local Signal = require(Parent.Signals).createSignal({})

return ReactModule.memo(function()
	-- upvalues: UseReactionEffectsFunction (copy), Signal (copy), UseSignalStateFunction (copy), ReactModule (copy), ReactionExplosionModule (copy), View (copy), EXPLOSIONLAYERZINDEX (copy)
	local UseReactionEffectsResult = UseReactionEffectsFunction()
	local Elements = {}
	
	for _, value in UseSignalStateFunction(if UseReactionEffectsResult == nil then Signal else UseReactionEffectsResult.getExplosions) do
		Elements[`explosion_{value.id}`] = ReactModule.createElement(ReactionExplosionModule, {
			reactionType = value.reactionType,
			position = UDim2.fromOffset(value.originLocal.X, value.originLocal.Y),
			onComplete = function()
				-- upvalues: UseReactionEffectsResult (copy), value (copy)
				if UseReactionEffectsResult ~= nil then
					UseReactionEffectsResult.onExplosionComplete(value.id)
				end
			end
		})
	end
	return ReactModule.createElement(View, {
		tag = "size-full",
		BackgroundTransparency = 1,
		ref = if UseReactionEffectsResult == nil then nil else UseReactionEffectsResult.layerRef,
		ZIndex = EXPLOSIONLAYERZINDEX
	}, Elements)
end)