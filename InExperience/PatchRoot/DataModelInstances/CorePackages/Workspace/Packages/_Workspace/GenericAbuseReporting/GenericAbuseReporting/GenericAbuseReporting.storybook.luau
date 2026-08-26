local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local foundationProvider = foundationModule.FoundationProvider
local mockProvidersModule = require(script.Parent.MockProviders)
local dictionary = cryoModule.Dictionary
local loggerModule = require(genericAbuseReporting.Logger)
loggerModule:addSink({
	maxLevel = loggerModule.Levels.fromString("trace"),
	log = function(_, p1, p2)
		print(`[{p2.loggerName}] {p1}`)
	end
})

return {
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: dictionary (ref), reactModule (ref), mockProvidersModule (ref), foundationProvider (ref)
		return function(p2)
			-- upvalues: dictionary (copy), reactModule (copy), mockProvidersModule (copy), foundationProvider (copy), p1 (ref)
			return reactModule.createElement(mockProvidersModule, {}, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					colorMode = "Dark",
					preferences = p2.settings,
					overlayGui = p2.focus
				}, {
					story = reactModule.createElement(p1, dictionary.union(p2, if p2.definition then p2.definition.props else {}))
				})
			})
		end
	end,
	storyRoots = { genericAbuseReporting }
}