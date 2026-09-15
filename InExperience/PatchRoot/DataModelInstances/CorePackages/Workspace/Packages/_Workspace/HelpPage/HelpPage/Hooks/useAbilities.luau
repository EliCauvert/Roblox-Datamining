local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local bindingConfigsModule = require(parent.Configs.BindingConfigs)
local _ = require(parent.Configs.ConfigTypes)
local constantsModule = require(parent.Constants)
local var1 = (function()
	-- upvalues: bindingConfigsModule (ref)
	local var2 = 0
	
	for i, v in bindingConfigsModule.Controls do
		if v.keyboardInput ~= nil and v.keyboardInput.group.id == bindingConfigsModule.ControlGroups.CharacterMovement.id then
			var2 += 1
		end
	end
	return var2
end)()

local function _(p1)
	-- upvalues: var1 (ref)
	local var3 = tonumber(string.sub(p1, 14))
	
	return if var3 == nil then nil else var1 + var3
end

local _ = function(p1)
	if p1 == nil then
		return nil
	end
	local inputContexts = p1:FindFirstChild("InputContexts")
	
	if inputContexts == nil then
		return nil
	end
	local characterContext = inputContexts:FindFirstChild("CharacterContext")
	
	return if characterContext == nil or not characterContext:IsA("InputContext") then nil else characterContext
end

local function getKeyboardCombo(p1)
	local t = {}
	local primaryModifier = p1.PrimaryModifier
	local secondaryModifier = p1.SecondaryModifier
	local keyCode = p1.KeyCode
	
	if primaryModifier ~= Enum.KeyCode.None then
		table.insert(t, primaryModifier)
	end
	if secondaryModifier ~= Enum.KeyCode.None then
		table.insert(t, secondaryModifier)
	end
	if keyCode ~= Enum.KeyCode.None then
		table.insert(t, keyCode)
	end
	return if #t == 0 then nil else t
end

local function readAction(p1)
	-- upvalues: var1 (ref), constantsModule (ref), getKeyboardCombo (ref), bindingConfigsModule (ref)
	local var3 = tonumber(string.sub(p1.Name, 14))
	local var4 = if var3 == nil then nil else var1 + var3
	
	if var4 == nil then
		return nil
	end
	local t = {}
	local t_1 = {}
	
	for i, v in p1:GetChildren() do
		if v:IsA("InputBinding") then
			local keyCode = v.KeyCode
			
			if keyCode ~= nil then
				if constantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[keyCode] == nil then
					local var5 = getKeyboardCombo(v)
					
					if var5 ~= nil then
						table.insert(t, var5)
					end
				else
					table.insert(t_1, keyCode)
				end
			end
		end
	end
	if #t == 0 and #t_1 == 0 then
		return nil
	end
	local t_2 = {
		label = "CoreScripts.InGameMenu.GameSettings.Default",
		disabled = not p1.Enabled
	}
	
	if #t > 0 then
		t_2.keyboardInput = {
			input = t,
			group = bindingConfigsModule.ControlGroups.CharacterMovement,
			layoutOrder = var4
		}
	end
	if #t_1 > 0 then
		t_2.gamepadInput = { input = t_1 }
	end
	return t_2
end

local function readAbilities(p2)
	-- upvalues: readAction (ref)
	local var6
	if p2 == nil then
		var6 = nil
	else
		local inputContexts = p2:FindFirstChild("InputContexts")
		
		if inputContexts == nil then
			var6 = nil
		else
			local characterContext = inputContexts:FindFirstChild("CharacterContext")
			var6 = if characterContext == nil or not characterContext:IsA("InputContext") then nil else characterContext
		end
	end
	if var6 == nil or not var6.Enabled then
		return nil
	end
	local t = {}
	
	for i, v in var6:GetChildren() do
		if v:IsA("InputAction") then
			local var7 = readAction(v)
			
			if var7 ~= nil then
				t[v.Name] = var7
			end
		end
	end
	return if next(t) == nil then nil else t
end

local _ = function(p3)
	for i, v in p3 do
		v:Disconnect()
	end
	table.clear(p3)
end

return function(p4)
	-- upvalues: playersService (ref), reactModule (ref), readAbilities (ref)
	p4 = p4 or playersService.LocalPlayer
	local var8, var9 = reactModule.useState(readAbilities(p4))
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var9 (ref), readAbilities (copy)
		if p4 == nil then
			return
		end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		local function refresh()
			-- upvalues: var9 (copy), readAbilities (copy), p4 (copy)
			var9(readAbilities(p4))
		end
		
		local _ = nil
		local _ = nil
		
		local var10 = function()
			-- upvalues: t_3 (ref), p4 (copy), refresh (ref), var10 (write), var9 (copy), readAbilities (copy)
			for i, v in t_3 do
				v:Disconnect()
			end
			local var11
			table.clear(t_3)
			
			if p4 == nil then
				var11 = nil
			else
				local inputContexts = p4:FindFirstChild("InputContexts")
				
				if inputContexts == nil then
					var11 = nil
				else
					local characterContext = inputContexts:FindFirstChild("CharacterContext")
					var11 = if characterContext == nil or not characterContext:IsA("InputContext") then nil else characterContext
				end
			end
			if var11 == nil then return end
			for i, v_1 in var11:GetChildren() do
				if v_1:IsA("InputAction") and string.match(v_1.Name, "^AbilityAction%d+$") then
					table.insert(t_3, v_1.Changed:Connect(refresh))
					table.insert(t_3, v_1.ChildAdded:Connect(function()
						-- upvalues: var10 (copy), var9 (copy), readAbilities (copy), p4 (copy)
						var10()
						var9(readAbilities(p4))
					end))
					table.insert(t_3, v_1.ChildRemoved:Connect(function()
						-- upvalues: var10 (copy), var9 (copy), readAbilities (copy), p4 (copy)
						var10()
						var9(readAbilities(p4))
					end))
					
					for i_2, v_2 in v_1:GetChildren() do
						if v_2:IsA("InputBinding") then
							table.insert(t_3, v_2.Changed:Connect(refresh))
						end
					end
				end
			end
		end
		
		local var12 = function()
			-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref), p4 (copy), var12 (write), var9 (copy), readAbilities (copy), refresh (ref), var10 (write)
			for i, v in t_1 do
				v:Disconnect()
			end
			table.clear(t_1)
			
			for i_1, v_1 in t_2 do
				v_1:Disconnect()
			end
			table.clear(t_2)
			
			for i_2, v_2 in t_3 do
				v_2:Disconnect()
			end
			table.clear(t_3)
			local inputContexts = p4:FindFirstChild("InputContexts")
			
			if inputContexts == nil then return end
			local var13
			table.insert(t_1, inputContexts.ChildAdded:Connect(function()
				-- upvalues: var12 (copy), var9 (copy), readAbilities (copy), p4 (copy)
				var12()
				var9(readAbilities(p4))
			end))
			table.insert(t_1, inputContexts.ChildRemoved:Connect(function()
				-- upvalues: var12 (copy), var9 (copy), readAbilities (copy), p4 (copy)
				var12()
				var9(readAbilities(p4))
			end))
			
			if p4 == nil then
				var13 = nil
			else
				local inputContexts_1 = p4:FindFirstChild("InputContexts")
				
				if inputContexts_1 == nil then
					var13 = nil
				else
					local characterContext = inputContexts_1:FindFirstChild("CharacterContext")
					var13 = if characterContext == nil or not characterContext:IsA("InputContext") then nil else characterContext
				end
			end
			if var13 == nil then
				return
			end
			table.insert(t_2, var13.Changed:Connect(refresh))
			table.insert(t_2, var13.ChildAdded:Connect(function()
				-- upvalues: var10 (copy), var9 (copy), readAbilities (copy), p4 (copy)
				var10()
				var9(readAbilities(p4))
			end))
			table.insert(t_2, var13.ChildRemoved:Connect(function()
				-- upvalues: var10 (copy), var9 (copy), readAbilities (copy), p4 (copy)
				var10()
				var9(readAbilities(p4))
			end))
			var10()
		end
		
		table.insert(t, p4.ChildAdded:Connect(function(p5)
			-- upvalues: var12 (write), var9 (copy), readAbilities (copy), p4 (copy)
			if p5.Name == "InputContexts" then
				var12()
				var9(readAbilities(p4))
			end
		end))
		table.insert(t, p4.ChildRemoved:Connect(function(p5)
			-- upvalues: var12 (write), var9 (copy), readAbilities (copy), p4 (copy)
			if p5.Name == "InputContexts" then
				var12()
				var9(readAbilities(p4))
			end
		end))
		var12()
		var9(readAbilities(p4))
		
		return function()
			-- upvalues: t (ref), t_1 (ref), t_2 (ref), t_3 (ref)
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			
			for i, v_1 in t_1 do
				v_1:Disconnect()
			end
			table.clear(t_1)
			
			for i, v_2 in t_2 do
				v_2:Disconnect()
			end
			table.clear(t_2)
			
			for i, v_3 in t_3 do
				v_3:Disconnect()
			end
			table.clear(t_3)
		end
	end, { p4 })
	
	return var8
end