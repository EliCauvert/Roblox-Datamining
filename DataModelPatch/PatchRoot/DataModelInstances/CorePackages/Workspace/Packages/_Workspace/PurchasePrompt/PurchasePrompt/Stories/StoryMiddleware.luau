local Parent = script:FindFirstAncestor("PurchasePrompt").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local Success, Result = pcall(function()
	-- upvalues: UIBloxModule (copy), Parent (copy)
	UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
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

local function renderWithCursorProvider(p1)
	-- upvalues: RoactModule (copy), SelectionCursorProvider (copy), CursorProvider (copy)
	return RoactModule.createElement(SelectionCursorProvider, {}, {
		NewCursorProvider = RoactModule.createElement(CursorProvider, {}, p1)
	})
end

return function(p1)
	-- upvalues: renderWithStyleProvider (copy), renderWithCursorProvider (copy), RoactModule (copy)
	return function(p2)
		-- upvalues: renderWithStyleProvider (upval), renderWithCursorProvider (upval), RoactModule (upval), p1 (copy)
		return renderWithStyleProvider(p2, {
			CursorProvider = renderWithCursorProvider({ Child = RoactModule.createElement(p1, p2) })
		})
	end
end