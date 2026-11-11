local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseKeybindsModule = require(Parent.Hooks.useKeybinds)
local KeyboardGroupModule = require(script.Parent.KeyboardGroup)
local _ = require(Parent.Configs.ConfigTypes)
local View = require(Parent1.Foundation).View

return ReactModule.memo(function()
	-- upvalues: UseKeybindsModule (copy), ReactModule (copy), View (copy), KeyboardGroupModule (copy)
	local Controls = UseKeybindsModule().controls
	local Groups = UseKeybindsModule().groups
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Controls (copy), Groups (copy), ReactModule (upval), View (upval), KeyboardGroupModule (upval)
		if Controls == nil or Groups == nil then
			return nil
		end
		local t = {}
		
		for i, group in Groups do
			t[group.id] = { controls = {}, group = group }
		end
		for i, control in Controls do
			local NoKeyboardInput = control.keyboardInput == nil
			local Group = nil
			
			if not NoKeyboardInput then
				Group = control.keyboardInput.group
				NoKeyboardInput = t[Group.id] == nil
			end
			if not NoKeyboardInput then
				t[Group.id].controls[i] = control
			end
		end
		local Elements = {}
		
		for _, value in t do
			if next(value.controls) ~= nil then
				table.insert(Elements, ReactModule.createElement(View, {
					tag = "auto-y padding-xxsmall",
					LayoutOrder = value.group.layoutOrder,
					Size = UDim2.new(0.3333333333333333, -1, 0, 0),
					key = value.group.id
				}, ReactModule.createElement(KeyboardGroupModule, value)))
			end
		end
		return Elements
	end, { Controls, Groups })
	
	return if UseMemoResult == nil then nil else ReactModule.createElement(View, {
		tag = "row size-full-0 auto-y wrap align-x-left align-y-top"
	}, UseMemoResult)
end)