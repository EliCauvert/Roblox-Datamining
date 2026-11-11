local InAppIntervention = script:FindFirstAncestor("InAppIntervention")
local Parent = InAppIntervention.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
require(Parent.UIBlox).init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local MockProvidersModule = require(script.Parent.MockProviders)
local Dictionary = CryoModule.Dictionary
local LoggerModule = require(InAppIntervention.Logger)
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
		-- upvalues: Dictionary (copy), ReactModule (copy), MockProvidersModule (copy)
		return function(p2)
			-- upvalues: Dictionary (upval), ReactModule (upval), MockProvidersModule (upval), p1 (copy)
			return ReactModule.createElement(MockProvidersModule, {}, {
				story = ReactModule.createElement(p1, (Dictionary.union(p2, p2.definition and p2.definition.props or {})))
			})
		end
	end,
	storyRoots = { InAppIntervention }
}