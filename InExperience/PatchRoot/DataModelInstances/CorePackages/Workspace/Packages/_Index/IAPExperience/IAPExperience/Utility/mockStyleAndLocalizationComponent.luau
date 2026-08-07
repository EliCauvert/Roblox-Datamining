local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local UIBloxModule = require(parent_1.UIBlox)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local constants = UIBloxModule.App.Style.Constants
local dark = constants.ThemeName.Dark
local gotham = constants.FontName.Gotham
local localeProviderModule = require(parent.Locale.LocaleProvider)

return function(p0) --[[ line: 15 ]]
	-- upvalues: roactModule (ref), localeProviderModule (ref), appStyleProvider (ref), dark (ref), gotham (ref)
	return roactModule.createElement(localeProviderModule, {
		locale = "en-us",
		render = function() --[[ line: 18 ]]
			-- upvalues: roactModule (copy), appStyleProvider (copy), dark (copy), gotham (copy), p0 (ref)
			return roactModule.createElement(appStyleProvider, { style = { themeName = dark, fontName = gotham } }, {
				roactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p0)
			})
		end
	})
end