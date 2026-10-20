local UserInputService = game:GetService("UserInputService")
local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local ReactModule = require(ChatUIPrimitives.Parent.React)
local ChatTabNavigationSignalModule = require(ChatUIPrimitives.chatTabNavigationSignal)

local function _(Text: string): string
	return (string.gsub(Text, "\t", ""))
end

local _ = function(TextBox)
	local Text: string = TextBox.Text
	local Replaced = string.gsub(Text, "\t", "")
	
	if Replaced == Text then return end
	local CursorPosition: number = TextBox.CursorPosition
	TextBox.Text = Replaced
	
	if CursorPosition > 0 then
		local _, Replaced2 = string.gsub(string.sub(Text, 1, CursorPosition - 1), "\t", "")
		TextBox.CursorPosition = CursorPosition - Replaced2
	end
end

return function(p1, p2)
	-- upvalues: UserInputService (copy), ReactModule (copy), ChatTabNavigationSignalModule (copy)
	local P2 = p2 or UserInputService
	ReactModule.useEffect(function()
		-- upvalues: P2 (copy), p1 (copy), ChatTabNavigationSignalModule (upval)
		local Current = nil
		local Connection = nil
		
		local function _(Object)
			-- upvalues: Current (ref), Connection (ref)
			if Current == Object then return end
			if Connection then
				Connection:Disconnect()
			end
			Current = Object
			Connection = Object:GetPropertyChangedSignal("Text"):Connect(function()
				-- upvalues: Object (copy)
				local Text: string = Object.Text
				local Replaced = string.gsub(Text, "\t", "")
				
				if Replaced == Text then return end
				local CursorPosition: number = Object.CursorPosition
				Object.Text = Replaced
				
				if CursorPosition > 0 then
					local _, Replaced2 = string.gsub(string.sub(Text, 1, CursorPosition - 1), "\t", "")
					Object.CursorPosition = CursorPosition - Replaced2
				end
			end)
		end
		
		local InputBeganConnection = P2.InputBegan:connect(function(Input)
			-- upvalues: p1 (upval), Current (ref), Connection (ref), ChatTabNavigationSignalModule (upval)
			if Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if Input.KeyCode ~= Enum.KeyCode.Tab then return end
			local Current1 = p1.current
			
			if Current1 == nil or not Current1:IsFocused() then return end
			if Current ~= Current1 then
				if Connection then
					Connection:Disconnect()
				end
				Current = Current1
				Connection = Current1:GetPropertyChangedSignal("Text"):Connect(function()
					-- upvalues: Current1 (copy)
					local Text: string = Current1.Text
					local Replaced = string.gsub(Text, "\t", "")
					
					if Replaced == Text then return end
					local CursorPosition: number = Current1.CursorPosition
					Current1.Text = Replaced
					
					if CursorPosition > 0 then
						local _, Replaced2 = string.gsub(string.sub(Text, 1, CursorPosition - 1), "\t", "")
						Current1.CursorPosition = CursorPosition - Replaced2
					end
				end)
			end
			local IsReplacedMatch = string.gsub(Current1.Text, "\t", "") == ""
			local Text: string = Current1.Text
			local Replaced = string.gsub(Text, "\t", "")
			
			if Replaced ~= Text then
				local CursorPosition: number = Current1.CursorPosition
				Current1.Text = Replaced
				
				if CursorPosition > 0 then
					local _, Replaced2 = string.gsub(string.sub(Text, 1, CursorPosition - 1), "\t", "")
					Current1.CursorPosition = CursorPosition - Replaced2
				end
			end
			if IsReplacedMatch then
				ChatTabNavigationSignalModule:fire(if Input:IsModifierKeyDown(Enum.ModifierKey.Shift) then -1 else 1)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy), Connection (ref)
			InputBeganConnection:Disconnect()
			
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { p1, P2 })
end