local parent = script.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.SettingsService)
local fieldRowModule = require(parent.FieldRow)
local reactModule = require(parent_1.React)
local view = require(parent_1.Foundation).View

return function(p1)
	-- upvalues: reactModule (ref), fieldRowModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "padding-x-medium align-x-center align-y-top padding-small col size-full auto-y gui-object-defaults",
		Visible = p1.visible
	}, {
		(function()
			-- upvalues: p1 (ref), reactModule (copy), fieldRowModule (copy)
			local t = {}
			
			for i, v in p1.settings do
				t[v.id] = reactModule.createElement(fieldRowModule, v)
			end
			return t
		end)()
	})
end