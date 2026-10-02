local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local shouldFocusBackButtonOnKeyModule = require(script.Parent.shouldFocusBackButtonOnKey)

return function(p1, p2, p3)
	-- upvalues: useFocusGuiObject (ref), userInputService (ref), reactModule (ref), shouldFocusBackButtonOnKeyModule (ref)
	local var1 = useFocusGuiObject()
	p3 = p3 or userInputService
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p3 (ref), p1 (ref), shouldFocusBackButtonOnKeyModule (copy), var1 (ref)
		if p2 == nil then
			return
		end
		local inputBeganConnection = p3.InputBegan:Connect(function(p4)
			-- upvalues: p1 (copy), p3 (copy), shouldFocusBackButtonOnKeyModule (copy), p2 (copy), var1 (copy)
			local current = p1.current
			
			if not shouldFocusBackButtonOnKeyModule(p4.KeyCode, current ~= nil and p3:GetFocusedTextBox() == current, if current ~= nil then nil else current.Text) then return end
			local current_1 = p2.current
			
			if current_1 == nil then return end
			if current ~= nil then
				current:ReleaseFocus()
			end
			var1(current_1)
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { p2, p3 })
end