local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local UIBloxModule = require(Parent1.UIBlox)
local LocaleProviderModule = require(Parent.Locale.LocaleProvider)
local StyleProviderWithDefaultTheme = require(Parent1.Style).StyleProviderWithDefaultTheme
local Success, Result = pcall(function()
	-- upvalues: UIBloxModule (copy), Parent1 (copy)
	UIBloxModule.init(require(Parent1.Dev.RobloxAppUIBloxConfig))
end)

if not Success then
	warn("Error initializing UIBlox", Result)
end
local SelectionCursorProvider = UIBloxModule.App.SelectionImage.SelectionCursorProvider
local CursorProvider = UIBloxModule.App.SelectionCursor.CursorProvider

local function renderWithStyleProvider(p1, p2)
	-- upvalues: RoactModule (copy), StyleProviderWithDefaultTheme (copy)
	return RoactModule.createElement(StyleProviderWithDefaultTheme, { theme = p1.theme }, p2)
end

local function _(p1)
	-- upvalues: RoactModule (copy), LocaleProviderModule (copy)
	return RoactModule.createElement(LocaleProviderModule, { locale = "en-us" }, p1)
end

local function renderWithCursorProvider(p1)
	-- upvalues: RoactModule (copy), SelectionCursorProvider (copy), CursorProvider (copy)
	return RoactModule.createElement(SelectionCursorProvider, {}, {
		NewCursorProvider = RoactModule.createElement(CursorProvider, {}, p1)
	})
end

return function(p1)
	-- upvalues: renderWithStyleProvider (copy), renderWithCursorProvider (copy), RoactModule (copy), LocaleProviderModule (copy)
	return function(p2)
		-- upvalues: renderWithStyleProvider (upval), renderWithCursorProvider (upval), RoactModule (upval), p1 (copy), LocaleProviderModule (upval)
		return renderWithStyleProvider(p2, {
			LocaleProvider = RoactModule.createElement(LocaleProviderModule, { locale = "en-us" }, {
				CursorProvider = renderWithCursorProvider({ Child = RoactModule.createElement(p1, p2) })
			})
		})
	end
end