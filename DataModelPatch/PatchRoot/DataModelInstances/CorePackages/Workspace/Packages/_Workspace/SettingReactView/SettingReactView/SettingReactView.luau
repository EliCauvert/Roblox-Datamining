local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.SettingsService)
local FieldRowModule = require(Parent.FieldRow)
local ReactModule = require(Parent1.React)
local View = require(Parent1.Foundation).View

return function(p1)
	-- upvalues: ReactModule (copy), FieldRowModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "padding-x-medium align-x-center align-y-top padding-small col size-full auto-y gui-object-defaults",
		Visible = p1.visible
	}, {
		((function()
			-- upvalues: p1 (copy), ReactModule (upval), FieldRowModule (upval)
			local Elements = {}
			
			for _, setting in p1.settings do
				Elements[setting.id] = ReactModule.createElement(FieldRowModule, setting)
			end
			return Elements
		end)())
	})
end