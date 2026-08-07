local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local loggerModule = require(appChat.Logger)
require(parent.UIBlox).init(require(parent.Dev.RobloxAppUIBloxConfig))
local roactModule = require(parent.Roact)
local cryoModule = require(parent.Cryo)
local mockProvidersModule = require(appChat.Components.MockProviders)
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local logger = require(parent.Loggers).Logger
logger:addSink({
	maxLevel = logger.Levels.fromString("trace"),
	log = function(_, p0, _) --[[ line: 38 ]]
		print(p0)
	end
})
loggerModule:setParent(logger)

return {
	roact = roactModule,
	mapStory = function(p1) --[[ line: 47 ]]
		-- upvalues: t (ref), roactModule (ref), mockProvidersModule (ref), cryoModule (ref)
		return function(p2) --[[ line: 48 ]]
			-- upvalues: t (copy), roactModule (copy), mockProvidersModule (copy), p1 (ref), cryoModule (copy)
			local props
			if p2 then
				props = p2.definition and (p2.definition.props or {})
			end
			return roactModule.createElement(mockProvidersModule, {
				rodux = props.rodux,
				themeName = (if p2 then t[p2.theme] else t.Default).themeName
			}, {
				story = roactModule.createElement(p1, cryoModule.Dictionary.union(props, p2))
			})
		end
	end
}