local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local useKeybindsModule = require(parent.Hooks.useKeybinds)
local keyboardGroupModule = require(script.Parent.KeyboardGroup)
local _ = require(parent.Configs.ConfigTypes)
local view = foundationModule.View

return reactModule.memo(function() --[[ line: 18 | named "KeyboardHelpPage" ]]
	-- upvalues: useKeybindsModule (ref), reactModule (ref), view (ref), keyboardGroupModule (ref)
	local controls = useKeybindsModule().controls
	local groups = useKeybindsModule().groups
	local var4 = reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: controls (ref), groups (ref), reactModule (copy), view (copy), keyboardGroupModule (copy)
		if controls == nil or groups == nil then
			return nil
		end
		local t = {}
		
		for i, v in groups do
			t[v.id] = { controls = {}, group = v }
		end
		for i_1, v_1 in controls do
			if v_1.keyboardInput ~= nil then
				local group = v_1.keyboardInput.group
				
				if t[group.id] ~= nil then
					t[group.id].controls[i_1] = v_1
				end
			end
		end
		local t_1 = {}
		
		for i_2, v_2 in t do
			if next(v_2.controls) ~= nil then
				table.insert(t_1, reactModule.createElement(view, {
					tag = "auto-y padding-xxsmall",
					LayoutOrder = v_2.group.layoutOrder,
					Size = UDim2.new(0.333333333333, -1, 0, 0),
					key = v_2.group.id
				}, reactModule.createElement(keyboardGroupModule, v_2)))
			end
		end
		return t_1
	end, { controls, groups })
	
	return if var4 == nil then nil else reactModule.createElement(view, {
		tag = "row size-full-0 auto-y wrap align-x-left align-y-top"
	}, var4)
end)