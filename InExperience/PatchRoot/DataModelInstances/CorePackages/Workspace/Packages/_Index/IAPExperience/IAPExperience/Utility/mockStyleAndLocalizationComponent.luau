local parent = script.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local UIBloxModule = require(parent_1.UIBlox)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local dark = require(parent_1.Foundation).Enums.ColorMode.Dark
local gotham = UIBloxModule.App.Style.Constants.FontName.Gotham
local localeProviderModule = require(parent.Locale.LocaleProvider)

return function(p0) --[[ line: 17 ]]
	-- upvalues: roactModule (ref), localeProviderModule (ref), appStyleProvider (ref), dark (ref), gotham (ref)
	return roactModule.createElement(localeProviderModule, {
		locale = "en-us",
		render = function() --[[ line: 20 ]]
			-- upvalues: roactModule (copy), appStyleProvider (copy), dark (copy), gotham (copy), p0 (ref)
			return roactModule.createElement(appStyleProvider, { style = { themeName = dark, fontName = gotham } }, {
				roactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p0)
			})
		end
	})
end