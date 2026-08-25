local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local momentContextModule = require(script.Parent.MomentContext)
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), momentContextModule (ref), useSignalState (ref), getColorStyleWithTransparencyModule (ref), reactModule (ref)
	local var6 = useTokens()
	local var7 = momentContextModule.useMoment()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var6.Color.Common.Scrim.Color3,
		BackgroundTransparency = var7.animationRatio:map(function(p1)
			-- upvalues: getColorStyleWithTransparencyModule (copy), var6 (ref)
			return getColorStyleWithTransparencyModule(var6.Color.Common.Scrim, 1 - p1).Transparency or 0
		end),
		Active = useSignalState(var7.store.getIsScrubbing),
		ZIndex = p0.ZIndex
	})
end)