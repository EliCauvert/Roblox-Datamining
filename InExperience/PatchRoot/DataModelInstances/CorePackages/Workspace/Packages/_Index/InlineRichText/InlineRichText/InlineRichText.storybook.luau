local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
require(parent.UIBlox).init(require(parent.Dev.RobloxAppUIBloxConfig))
local roactModule = require(parent.Dev.Roact)
local cryoModule = require(parent.Cryo)
local mockProvidersModule = require(inlineRichText.MockProviders)
local t = {
	Default = { themeName = "Light", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	roact = roactModule,
	mapStory = function(p1)
		-- upvalues: t (ref), roactModule (ref), mockProvidersModule (ref), cryoModule (ref)
		return function(p2)
			-- upvalues: t (copy), roactModule (copy), mockProvidersModule (copy), p1 (ref), cryoModule (copy)
			local props
			if p2 then
				props = p2.definition and (p2.definition.props or {})
			end
			return roactModule.createElement(mockProvidersModule, {
				themeName = (if p2 then t[p2.theme] else t.Default).themeName
			}, {
				story = roactModule.createElement(p1, cryoModule.Dictionary.union(props, p2))
			})
		end
	end
}