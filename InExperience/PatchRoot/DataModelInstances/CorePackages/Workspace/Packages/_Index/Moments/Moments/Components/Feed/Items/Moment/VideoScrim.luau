local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local MomentContextModule = require(script.Parent.MomentContext)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), MomentContextModule (copy), UseSignalStateFunction (copy), GetColorStyleWithTransparencyModule (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMomentResult = MomentContextModule.useMoment()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseTokensResult.Color.Common.Scrim.Color3,
		BackgroundTransparency = UseMomentResult.animationRatio:map(function(p2: number)
			-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
			return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Common.Scrim, 1 - p2).Transparency or 0
		end),
		Active = UseSignalStateFunction(UseMomentResult.store.getIsScrubbing),
		ZIndex = p1.ZIndex
	})
end)