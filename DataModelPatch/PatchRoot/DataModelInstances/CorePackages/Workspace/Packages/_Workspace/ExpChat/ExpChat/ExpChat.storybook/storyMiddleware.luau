local Parent = script:FindFirstAncestor("ExpChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local Dictionary = require(Parent.llama).Dictionary
UIBloxModule.init((require(Parent.Dev.RobloxAppUIBloxConfig)))
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local Constants = UIBloxModule.App.Style.Constants
local Gotham = Constants.FontName.Gotham
local config = {
	Light = { themeName = Constants.ThemeName.Light, fontName = Gotham },
	Dark = { themeName = Constants.ThemeName.Dark, fontName = Gotham }
}
local t = {}

return function(Key)
	-- upvalues: t (copy), RoactModule (copy), AppStyleProvider (copy), config (copy), Dictionary (copy)
	if not t[Key] then
		t[Key] = function(p1)
			-- upvalues: RoactModule (upval), AppStyleProvider (upval), config (upval), Key (copy), Dictionary (upval)
			return RoactModule.createElement(AppStyleProvider, { style = config[p1.theme or "Dark"] }, {
				Child = RoactModule.createElement(Key, Dictionary.join(p1, p1.definition and p1.definition.props))
			})
		end
	end
	return t[Key]
end