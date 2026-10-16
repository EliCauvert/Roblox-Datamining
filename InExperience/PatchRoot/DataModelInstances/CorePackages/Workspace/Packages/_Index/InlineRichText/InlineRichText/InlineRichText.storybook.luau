local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
require(Parent.UIBlox).init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local RoactModule = require(Parent.Dev.Roact)
local CryoModule = require(Parent.Cryo)
local MockProvidersModule = require(InlineRichText.MockProviders)
local config = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	roact = RoactModule,
	mapStory = function(p1) --[[ Line: 35 ]]
		-- upvalues: config (copy), RoactModule (copy), MockProvidersModule (copy), CryoModule (copy)
		return function(p2) --[[ Line: 36 ]]
			-- upvalues: config (upval), RoactModule (upval), MockProvidersModule (upval), p1 (copy), CryoModule (upval)
			return RoactModule.createElement(MockProvidersModule, {
				themeName = (p2 and config[p2.theme] or config.Default).themeName
			}, {
				story = RoactModule.createElement(p1, CryoModule.Dictionary.union(p2 and p2.definition and p2.definition.props or {}, p2))
			})
		end
	end
}