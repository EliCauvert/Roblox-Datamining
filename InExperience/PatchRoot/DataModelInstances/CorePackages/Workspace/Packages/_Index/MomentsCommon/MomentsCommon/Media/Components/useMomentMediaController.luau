local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(momentsCommon.Media.MediaTypes)
local mediaPreloadProviderModule = require(momentsCommon.Media.Components.MediaPreloadProvider)
local useSignalState = signalsReactModule.useSignalState

return function(p0) --[[ line: 28 | named "useMomentMediaController" ]]
	-- upvalues: mediaPreloadProviderModule (ref), reactModule (ref), signalsModule (ref), useSignalState (ref)
	local var5 = mediaPreloadProviderModule.useMediaControllerProvider()
	
	return useSignalState(reactModule.useMemo(function() --[[ line: 35 ]]
		-- upvalues: signalsModule (copy), var5 (ref), p0 (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 36 ]]
			-- upvalues: var5 (copy), p0 (copy)
			return if var5 == nil then nil else var5.getControllerMap(p1)[p0]
		end)
	end, { var5, p0 }))
end