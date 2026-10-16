local SignalWithModule = require(script.Parent.signalWith)
local config = {
	isEnabled = function() --[[ Line: 28 ]]
		return game:GetEngineFeature("PageMilestoneSignalEnabled")
	end,
	getService = function() --[[ Line: 31 ]]
		return game:GetService("AppLifecycleObserverService")
	end,
	resolveEnumItem = require(script.Parent.resolveEnumItem),
	defer = function(Callback) --[[ Line: 35 ]]
		task.defer(Callback)
	end,
	warn = warn
}

return {
	FFlagEnablePLTPrefetchCallbacks = game:DefineFastFlag("EnablePLTPrefetchCallbacks", false),
	Page = {
		AvatarEditor = "AvatarEditor",
		Party = "Party",
		ExperienceDetail = "ExperienceDetail",
		AvatarMarketplace = "AvatarMarketplace"
	},
	Milestone = {
		Interactive = "Interactive",
		SurfaceMounted = "SurfaceMounted",
		FunctionallyReady = "FunctionallyReady",
		SurfaceReady = "SurfaceReady"
	},
	signal = function(p1, p2) --[[ Line: 41 ]]
		-- upvalues: SignalWithModule (copy), config (copy)
		SignalWithModule(config, p1, p2)
	end
}