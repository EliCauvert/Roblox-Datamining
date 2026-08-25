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
	mapStory = function(p0)
		-- upvalues: t (ref), roactModule (ref), mockProvidersModule (ref), cryoModule (ref)
		return function(p1)
			-- upvalues: t (copy), roactModule (copy), mockProvidersModule (copy), p0 (ref), cryoModule (copy)
			local props
			if p1 then
				props = p1.definition and (p1.definition.props or {})
			end
			return roactModule.createElement(mockProvidersModule, {
				themeName = (if p1 then t[p1.theme] else t.Default).themeName
			}, {
				story = roactModule.createElement(p0, cryoModule.Dictionary.union(props, p1))
			})
		end
	end
}