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
	log = function(_, p0, p1) --[[ line: 17 ]]
		print(`[{p1.loggerName}] {p0}`)
	end
})

return {
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p2) --[[ line: 25 ]]
		-- upvalues: dictionary (ref), reactModule (ref), mockProvidersModule (ref), foundationProvider (ref)
		return function(p3) --[[ line: 26 ]]
			-- upvalues: dictionary (copy), reactModule (copy), mockProvidersModule (copy), foundationProvider (copy), p2 (ref)
			return reactModule.createElement(mockProvidersModule, {}, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					colorMode = "Dark",
					preferences = p3.settings,
					overlayGui = p3.focus
				}, {
					story = reactModule.createElement(p2, dictionary.union(p3, if p3.definition then p3.definition.props else {}))
				})
			})
		end
	end,
	storyRoots = { genericAbuseReporting }
}