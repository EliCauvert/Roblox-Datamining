local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local UIBloxModule = require(Parent1.UIBlox)
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Dark = require(Parent1.Foundation).Enums.ColorMode.Dark
local Gotham = UIBloxModule.App.Style.Constants.FontName.Gotham
local LocaleProviderModule = require(Parent.Locale.LocaleProvider)

return function(p1)
	-- upvalues: RoactModule (copy), LocaleProviderModule (copy), AppStyleProvider (copy), Dark (copy), Gotham (copy)
	return RoactModule.createElement(LocaleProviderModule, {
		locale = "en-us",
		render = function()
			-- upvalues: RoactModule (upval), AppStyleProvider (upval), Dark (upval), Gotham (upval), p1 (copy)
			return RoactModule.createElement(AppStyleProvider, { style = { themeName = Dark, fontName = Gotham } }, {
				RoactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p1)
			})
		end
	})
end