local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local BindingConfigsModule = require(Parent.Configs.BindingConfigs)
local _ = require(Parent.Configs.ConfigTypes)
local ConstantsModule = require(Parent.Constants)
local v1 = (function(): number --[[ Line: 21 | Named "getStaticCharacterMovementControlCount" ]]
	-- upvalues: BindingConfigsModule (copy)
	local Count = 0
	
	for _, control in BindingConfigsModule.Controls do
		if control.keyboardInput ~= nil and control.keyboardInput.group.id == BindingConfigsModule.ControlGroups.CharacterMovement.id then
			Count += 1
		end
	end
	return Count
end)()

local function _(Text: string) --[[ Line: 36 | Named "getAbilityLayoutOrder" ]]
	-- upvalues: v1 (copy)
	local Number: number? = tonumber((string.sub(Text, 14)))
	
	return if Number == nil then nil else v1 + Number
end

local _ = function(Object) --[[ Line: 45 | Named "getCharacterContext" ]]
	if Object == nil then
		return nil
	end
	local InputContexts = Object:FindFirstChild("InputContexts")
	
	if InputContexts == nil then
		return nil
	else
		local CharacterContext = InputContexts:FindFirstChild("CharacterContext")
		
		return if CharacterContext == nil or not CharacterContext:IsA("InputContext") then nil else CharacterContext
	end
end

local function getKeyboardCombo(Input) --[[ Line: 63 ]]
	local List = {}
	local PrimaryModifier = Input.PrimaryModifier
	local SecondaryModifier = Input.SecondaryModifier
	local KeyCode = Input.KeyCode
	
	if PrimaryModifier ~= Enum.KeyCode.None then
		table.insert(List, PrimaryModifier)
	end
	if SecondaryModifier ~= Enum.KeyCode.None then
		table.insert(List, SecondaryModifier)
	end
	if KeyCode ~= Enum.KeyCode.None then
		table.insert(List, KeyCode)
	end
	return if #List == 0 then nil else List
end

local function readAction(InputAction) --[[ Line: 84 ]]
	-- upvalues: v1 (copy), ConstantsModule (copy), getKeyboardCombo (copy), BindingConfigsModule (copy)
	local Number: number? = tonumber((string.sub(InputAction.Name, 14)))
	local NewNumber = if Number == nil then nil else v1 + Number
	
	if NewNumber == nil then
		return nil
	end
	local Input = {}
	local Input1 = {}
	
	for _, InputBinding in InputAction:GetChildren() do
		if InputBinding:IsA("InputBinding") then
			local KeyCode = InputBinding.KeyCode
			
			if KeyCode ~= nil then
				if ConstantsModule.HELP_PAGE.GAMEPAD_LAYOUT_ORDER[KeyCode] == nil then
					local KeyboardCombo = getKeyboardCombo(InputBinding)
					
					if KeyboardCombo ~= nil then
						table.insert(Input, KeyboardCombo)
					end
				else
					table.insert(Input1, KeyCode)
				end
			end
		end
	end
	if #Input == 0 and #Input1 == 0 then
		return nil
	end
	local config = {
		label = "CoreScripts.InGameMenu.GameSettings.Default",
		disabled = not InputAction.Enabled
	}
	
	if #Input > 0 then
		config.keyboardInput = {
			input = Input,
			group = BindingConfigsModule.ControlGroups.CharacterMovement,
			layoutOrder = NewNumber
		}
	end
	if #Input1 > 0 then
		config.gamepadInput = { input = Input1 }
	end
	return config
end

local function readAbilities(Object) --[[ Line: 139 ]]
	-- upvalues: readAction (copy)
	local Object1 = nil
	if Object == nil then
		Object1 = nil
	else
		local InputContexts = Object:FindFirstChild("InputContexts")
		
		if InputContexts == nil then
			Object1 = nil
		else
			local CharacterContext = InputContexts:FindFirstChild("CharacterContext")
			Object1 = if CharacterContext == nil or not CharacterContext:IsA("InputContext") then nil else CharacterContext
		end
	end
	if Object1 == nil or not Object1.Enabled then
		return nil
	end
	local t = {}
	
	for _, InputAction in Object1:GetChildren() do
		if InputAction:IsA("InputAction") then
			local Action = readAction(InputAction)
			
			if Action ~= nil then
				t[InputAction.Name] = Action
			end
		end
	end
	return if next(t) == nil then nil else t
end

local _ = function(Tbl) --[[ Line: 161 | Named "disconnectAll" ]]
	for _, Connection in Tbl do
		Connection:Disconnect()
	end
	table.clear(Tbl)
end

return function(p1) --[[ Line: 168 | Named "useAbilities" ]]
	-- upvalues: Players (copy), ReactModule (copy), readAbilities (copy)
	local P4 = p1 or Players.LocalPlayer
	local UseStateResult, UseStateResult2 = ReactModule.useState((readAbilities(P4)))
	ReactModule.useEffect(function() --[[ Line: 172 ]]
		-- upvalues: P4 (copy), UseStateResult2 (copy), readAbilities (upval)
		if P4 == nil then return end
		local List = {}
		local List1 = {}
		local List2 = {}
		local List3 = {}
		
		local function refresh() --[[ Line: 182 ]]
			-- upvalues: UseStateResult2 (upval), readAbilities (upval), P4 (upval)
			UseStateResult2((readAbilities(P4)))
		end
		
		local _ = nil
		local _ = nil
		
		local function v43() --[[ Line: 189 ]]
			-- upvalues: List3 (copy), P4 (upval), refresh (copy), v43 (ref), UseStateResult2 (upval), readAbilities (upval)
			for _, Connection in List3 do
				Connection:Disconnect()
			end
			table.clear(List3)
			local Object = nil
			
			if P4 == nil then
				Object = nil
			else
				local InputContexts = P4:FindFirstChild("InputContexts")
				
				if InputContexts == nil then
					Object = nil
				else
					local CharacterContext = InputContexts:FindFirstChild("CharacterContext")
					Object = if CharacterContext == nil or not CharacterContext:IsA("InputContext") then nil else CharacterContext
				end
			end
			if Object == nil then return end
			for _, InputAction in Object:GetChildren() do
				if InputAction:IsA("InputAction") and string.match(InputAction.Name, "^AbilityAction%d+$") then
					table.insert(List3, InputAction.Changed:Connect(refresh))
					table.insert(List3, InputAction.ChildAdded:Connect(function() --[[ Line: 206 ]]
						-- upvalues: v43 (upval), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
						v43()
						UseStateResult2((readAbilities(P4)))
					end))
					table.insert(List3, InputAction.ChildRemoved:Connect(function() --[[ Line: 213 ]]
						-- upvalues: v43 (upval), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
						v43()
						UseStateResult2((readAbilities(P4)))
					end))
					
					for _, InputBinding in InputAction:GetChildren() do
						if InputBinding:IsA("InputBinding") then
							table.insert(List3, InputBinding.Changed:Connect(refresh))
						end
					end
				end
			end
		end
		
		local function v44() --[[ Line: 227 ]]
			-- upvalues: List1 (copy), List2 (copy), List3 (copy), P4 (upval), v44 (ref), UseStateResult2 (upval), readAbilities (upval), refresh (copy), v43 (ref)
			for _, Connection in List1 do
				Connection:Disconnect()
			end
			table.clear(List1)
			
			for _, Connection1 in List2 do
				Connection1:Disconnect()
			end
			table.clear(List2)
			
			for _, Connection2 in List3 do
				Connection2:Disconnect()
			end
			table.clear(List3)
			local InputContexts = P4:FindFirstChild("InputContexts")
			
			if InputContexts == nil then return end
			table.insert(List1, InputContexts.ChildAdded:Connect(function() --[[ Line: 239 ]]
				-- upvalues: v44 (upval), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
				v44()
				UseStateResult2((readAbilities(P4)))
			end))
			table.insert(List1, InputContexts.ChildRemoved:Connect(function() --[[ Line: 246 ]]
				-- upvalues: v44 (upval), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
				v44()
				UseStateResult2((readAbilities(P4)))
			end))
			local v2 = nil
			
			if P4 == nil then
				v2 = nil
			else
				local InputContexts1 = P4:FindFirstChild("InputContexts")
				
				if InputContexts1 == nil then
					v2 = nil
				else
					local CharacterContext = InputContexts1:FindFirstChild("CharacterContext")
					v2 = if CharacterContext == nil or not CharacterContext:IsA("InputContext") then nil else CharacterContext
				end
			end
			if v2 ~= nil then
				table.insert(List2, v2.Changed:Connect(refresh))
				table.insert(List2, v2.ChildAdded:Connect(function() --[[ Line: 260 ]]
					-- upvalues: v43 (upval), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
					v43()
					UseStateResult2((readAbilities(P4)))
				end))
				table.insert(List2, v2.ChildRemoved:Connect(function() --[[ Line: 267 ]]
					-- upvalues: v43 (upval), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
					v43()
					UseStateResult2((readAbilities(P4)))
				end))
				v43()
				
				return
			end
		end
		
		table.insert(List, P4.ChildAdded:Connect(function(Child) --[[ Line: 277 ]]
			-- upvalues: v44 (ref), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
			if Child.Name == "InputContexts" then
				v44()
				UseStateResult2((readAbilities(P4)))
			end
		end))
		table.insert(List, P4.ChildRemoved:Connect(function(Child) --[[ Line: 286 ]]
			-- upvalues: v44 (ref), UseStateResult2 (upval), readAbilities (upval), P4 (upval)
			if Child.Name == "InputContexts" then
				v44()
				UseStateResult2((readAbilities(P4)))
			end
		end))
		v44()
		UseStateResult2((readAbilities(P4)))
		
		return function() --[[ Line: 297 ]]
			-- upvalues: List (copy), List1 (copy), List2 (copy), List3 (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			
			for _, Connection1 in List1 do
				Connection1:Disconnect()
			end
			table.clear(List1)
			
			for _, Connection2 in List2 do
				Connection2:Disconnect()
			end
			table.clear(List2)
			
			for _, Connection3 in List3 do
				Connection3:Disconnect()
			end
			table.clear(List3)
		end
	end, { P4 })
	
	return UseStateResult
end