local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local FoundationProvider = require(Parent.Foundation).FoundationProvider
local MockProvidersModule = require(script.Parent.MockProviders)
local Dictionary = require(Parent.Cryo).Dictionary
local LoggerModule = require(GenericAbuseReporting.Logger)
LoggerModule:addSink({
	maxLevel = LoggerModule.Levels.fromString("trace"),
	log = function(_, p1, p2)
		print(`[{p2.loggerName}] {p1}`)
	end
})

return {
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: Dictionary (copy), ReactModule (copy), MockProvidersModule (copy), FoundationProvider (copy)
		return function(p2)
			-- upvalues: Dictionary (upval), ReactModule (upval), MockProvidersModule (upval), FoundationProvider (upval), p1 (copy)
			return ReactModule.createElement(MockProvidersModule, {}, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					theme = "Dark",
					preferences = p2.settings,
					overlayGui = p2.focus
				}, {
					story = ReactModule.createElement(p1, (Dictionary.union(p2, p2.definition and p2.definition.props or {})))
				})
			})
		end
	end,
	storyRoots = { GenericAbuseReporting }
}