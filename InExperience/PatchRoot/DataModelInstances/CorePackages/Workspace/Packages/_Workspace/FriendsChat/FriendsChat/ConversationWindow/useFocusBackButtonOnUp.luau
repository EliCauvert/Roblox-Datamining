local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local ShouldFocusBackButtonOnKeyModule = require(script.Parent.shouldFocusBackButtonOnKey)

return function(p1, p2, p3)
	-- upvalues: UseFocusGuiObjectFunction (copy), UserInputService (copy), ReactModule (copy), ShouldFocusBackButtonOnKeyModule (copy)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local P2 = p3 or UserInputService
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), P2 (copy), p1 (copy), ShouldFocusBackButtonOnKeyModule (upval), UseFocusGuiObjectResult (copy)
		if p2 == nil then return end
		local InputBeganConnection = P2.InputBegan:Connect(function(Input)
			-- upvalues: p1 (upval), P2 (upval), ShouldFocusBackButtonOnKeyModule (upval), p2 (upval), UseFocusGuiObjectResult (upval)
			local Current = p1.current
			
			if not ShouldFocusBackButtonOnKeyModule(Input.KeyCode, Current ~= nil and P2:GetFocusedTextBox() == Current, if Current == nil then nil else Current.Text) then return end
			local Current1 = p2.current
			
			if Current1 == nil then return end
			if Current ~= nil then
				Current:ReleaseFocus()
			end
			UseFocusGuiObjectResult(Current1)
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { p2, P2 })
end