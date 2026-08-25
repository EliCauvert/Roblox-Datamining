local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = foundationModule.View
local useSignalState = require(parent.SignalsReact).useSignalState
local reactionExplosionModule = require(script.Parent.ReactionExplosion)
local useReactionEffects = require(script.Parent.ReactionEffectsContext).useReactionEffects
local EXPLOSION_LAYER_ZINDEX = require(script.Parent.reactionsConstants).EXPLOSION_LAYER_ZINDEX
local var4 = signalsModule.createSignal({})

return reactModule.memo(function()
	-- upvalues: useReactionEffects (ref), var4 (ref), useSignalState (ref), reactModule (ref), reactionExplosionModule (ref), view (ref), EXPLOSION_LAYER_ZINDEX (ref)
	local var5 = useReactionEffects()
	local t = {}
	
	for i, v in useSignalState(if var5 ~= nil then var4 else var5.getExplosions) do
		t[`explosion_{v.id}`] = reactModule.createElement(reactionExplosionModule, {
			reactionType = v.reactionType,
			position = UDim2.fromOffset(v.originLocal.X, v.originLocal.Y),
			onComplete = function()
				-- upvalues: var5 (ref), v (ref)
				if var5 ~= nil then
					var5.onExplosionComplete(v.id)
				end
			end
		})
	end
	return reactModule.createElement(view, {
		tag = "size-full",
		BackgroundTransparency = 1,
		ref = if var5 ~= nil then nil else var5.layerRef,
		ZIndex = EXPLOSION_LAYER_ZINDEX
	}, t)
end)