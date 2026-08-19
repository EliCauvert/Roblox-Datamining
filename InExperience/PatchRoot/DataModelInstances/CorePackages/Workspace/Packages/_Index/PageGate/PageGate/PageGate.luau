local enablePLTPrefetchCallbacks = game:DefineFastFlag("EnablePLTPrefetchCallbacks", false)
local resolveEnumItemModule = require(script.Parent.resolveEnumItem)
local signalWithModule = require(script.Parent.signalWith)
local t = {
	FFlagEnablePLTPrefetchCallbacks = enablePLTPrefetchCallbacks,
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
	}
}
local t_1 = {
	isEnabled = function() --[[ line: 28 ]]
		return game:GetEngineFeature("PageMilestoneSignalEnabled")
	end,
	getService = function() --[[ line: 31 ]]
		return game:GetService("AppLifecycleObserverService")
	end,
	resolveEnumItem = resolveEnumItemModule,
	defer = function(p0) --[[ line: 35 ]]
		task.defer(p0)
	end,
	warn = warn
}

function t.signal(value, p1) --[[ line: 41 ]]
	-- upvalues: signalWithModule (ref), t_1 (ref)
	signalWithModule(t_1, value, p1)
end

return t