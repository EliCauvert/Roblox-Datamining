local userInputService = game:GetService("UserInputService")
local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local reactModule = require(chatUIPrimitives.Parent.React)
local chatTabNavigationSignalModule = require(chatUIPrimitives.chatTabNavigationSignal)

local function _(value)
	return string.gsub(value, "\t", "")
end

local _ = function(value)
	local text = value.Text
	local replaced = string.gsub(text, "\t", "")
	
	if replaced == text then return end
	local cursorPosition = value.CursorPosition
	value.Text = replaced
	
	if cursorPosition > 0 then
		local _, replaced_1 = string.gsub(string.sub(text, 1, cursorPosition - 1), "\t", "")
		value.CursorPosition = cursorPosition - replaced_1
	end
end

return function(p1, p2)
	-- upvalues: userInputService (ref), reactModule (ref), chatTabNavigationSignalModule (ref)
	p2 = p2 or userInputService
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p1 (ref), chatTabNavigationSignalModule (copy)
		local var1 = nil
		local var2 = nil
		
		local function _(p3)
			-- upvalues: var1 (write), var2 (write)
			if var1 == p3 then return end
			if var2 then
				var2:Disconnect()
			end
			var1 = p3
			var2 = p3:GetPropertyChangedSignal("Text"):Connect(function()
				-- upvalues: p3 (ref)
				local text = p3.Text
				local replaced = string.gsub(text, "\t", "")
				
				if replaced == text then return end
				local cursorPosition = p3.CursorPosition
				p3.Text = replaced
				
				if cursorPosition > 0 then
					local _, replaced_1 = string.gsub(string.sub(text, 1, cursorPosition - 1), "\t", "")
					p3.CursorPosition = cursorPosition - replaced_1
				end
			end)
		end
		
		local inputBeganConnection = p2.InputBegan:connect(function(p3)
			-- upvalues: p1 (copy), var1 (write), var2 (write), chatTabNavigationSignalModule (copy)
			if p3.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if p3.KeyCode ~= Enum.KeyCode.Tab then return end
			local current = p1.current
			
			if current == nil or not current:IsFocused() then return end
			if var1 ~= current then
				if var2 then
					var2:Disconnect()
				end
				var1 = current
				var2 = current:GetPropertyChangedSignal("Text"):Connect(function()
					-- upvalues: current (ref)
					local text = current.Text
					local replaced = string.gsub(text, "\t", "")
					
					if replaced == text then return end
					local cursorPosition = current.CursorPosition
					current.Text = replaced
					
					if cursorPosition > 0 then
						local _, replaced_1 = string.gsub(string.sub(text, 1, cursorPosition - 1), "\t", "")
						current.CursorPosition = cursorPosition - replaced_1
					end
				end)
			end
			local var3 = string.gsub(current.Text, "\t", "") == ""
			local text = current.Text
			local replaced = string.gsub(text, "\t", "")
			
			if replaced ~= text then
				local cursorPosition = current.CursorPosition
				current.Text = replaced
				
				if cursorPosition > 0 then
					local _, replaced_1 = string.gsub(string.sub(text, 1, cursorPosition - 1), "\t", "")
					current.CursorPosition = cursorPosition - replaced_1
				end
			end
			if var3 then
				chatTabNavigationSignalModule:fire(if p3:IsModifierKeyDown(Enum.ModifierKey.Shift) then -1 else 1)
			end
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref), var2 (write)
			inputBeganConnection:Disconnect()
			
			if var2 then
				var2:Disconnect()
			end
		end
	end, { p1, p2 })
end