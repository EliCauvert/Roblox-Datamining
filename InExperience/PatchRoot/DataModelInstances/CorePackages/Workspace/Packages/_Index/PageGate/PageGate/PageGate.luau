local SignalWithModule = require(script.Parent.signalWith)
local config = {
	isEnabled = function()
		return game:GetEngineFeature("PageMilestoneSignalEnabled")
	end,
	getService = function()
		return game:GetService("AppLifecycleObserverService")
	end,
	resolveEnumItem = require(script.Parent.resolveEnumItem),
	defer = function(Callback)
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
	signal = function(p1, p2)
		-- upvalues: SignalWithModule (copy), config (copy)
		SignalWithModule(config, p1, p2)
	end
}