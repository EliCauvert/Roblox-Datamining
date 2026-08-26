local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(momentsCommon.Media.MediaTypes)
local mediaPreloadProviderModule = require(momentsCommon.Media.Components.MediaPreloadProvider)
local useSignalState = signalsReactModule.useSignalState

return function(p1)
	-- upvalues: mediaPreloadProviderModule (ref), reactModule (ref), signalsModule (ref), useSignalState (ref)
	local var1 = mediaPreloadProviderModule.useMediaControllerProvider()
	
	return useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), p1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (copy), p1 (copy)
			return if var1 == nil then nil else var1.getControllerMap(p2)[p1]
		end)
	end, { var1, p1 }))
end