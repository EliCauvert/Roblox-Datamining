local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local LoggerModule = require(AppChat.Logger)
require(Parent.UIBlox).init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local RoactModule = require(Parent.Roact)
local CryoModule = require(Parent.Cryo)
local MockProvidersModule = require(AppChat.Components.MockProviders)
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}
local Logger = require(Parent.Loggers).Logger
Logger:addSink({
	maxLevel = Logger.Levels.fromString("trace"),
	log = function(_, p1, _) --[[ Line: 38 ]]
		print(p1)
	end
})
LoggerModule:setParent(Logger)

return {
	roact = RoactModule,
	mapStory = function(p1) --[[ Line: 47 ]]
		-- upvalues: config (copy), RoactModule (copy), MockProvidersModule (copy), CryoModule (copy)
		return function(p2) --[[ Line: 48 ]]
			-- upvalues: config (upval), RoactModule (upval), MockProvidersModule (upval), p1 (copy), CryoModule (upval)
			local Props = p2 and p2.definition and p2.definition.props or {}
			
			return RoactModule.createElement(MockProvidersModule, {
				rodux = Props.rodux,
				themeName = (p2 and config[p2.theme] or config.Default).themeName
			}, {
				story = RoactModule.createElement(p1, CryoModule.Dictionary.union(Props, p2))
			})
		end
	end
}