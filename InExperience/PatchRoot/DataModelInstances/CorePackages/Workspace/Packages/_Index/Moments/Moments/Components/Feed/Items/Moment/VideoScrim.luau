local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local momentContextModule = require(script.Parent.MomentContext)
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), momentContextModule (ref), useSignalState (ref), getColorStyleWithTransparencyModule (ref), reactModule (ref)
	local var1 = useTokens()
	local var2 = momentContextModule.useMoment()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var1.Color.Common.Scrim.Color3,
		BackgroundTransparency = var2.animationRatio:map(function(p2)
			-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
			return getColorStyleWithTransparencyModule(var1.Color.Common.Scrim, 1 - p2).Transparency or 0
		end),
		Active = useSignalState(var2.store.getIsScrubbing),
		ZIndex = p1.ZIndex
	})
end)