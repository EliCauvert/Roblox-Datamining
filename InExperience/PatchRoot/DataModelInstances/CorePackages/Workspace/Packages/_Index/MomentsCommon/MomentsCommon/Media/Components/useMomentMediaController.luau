local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(MomentsCommon.Media.MediaTypes)
local MediaPreloadProviderModule = require(MomentsCommon.Media.Components.MediaPreloadProvider)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function(p1)
	-- upvalues: MediaPreloadProviderModule (copy), ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy)
	local UseMediaControllerProviderResult = MediaPreloadProviderModule.useMediaControllerProvider()
	
	return UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMediaControllerProviderResult (copy), p1 (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: UseMediaControllerProviderResult (upval), p1 (upval)
			return if UseMediaControllerProviderResult == nil then nil else UseMediaControllerProviderResult.getControllerMap(p2)[p1]
		end)
	end, { UseMediaControllerProviderResult, p1 })))
end