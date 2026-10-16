local Parent = script:FindFirstAncestor("UserSearch").Parent
local ReactModule = require(Parent.React)
local UserSearchBar = require(Parent.SocialCommon).Components.UserSearchBar.UserSearchBar

return function(p1) --[[ Line: 18 | Named "UserSearchHeaderInput" ]]
	-- upvalues: ReactModule (copy), UserSearchBar (copy)
	local OnSubmitFunction = p1.onSubmit
	local UseRefResult = ReactModule.useRef("")
	local UseRefResult1 = ReactModule.useRef("")
	local UseResult = ReactModule.useCallback(function() --[[ Line: 35 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), OnSubmitFunction (copy)
		if UseRefResult.current ~= UseRefResult1.current then
			UseRefResult1.current = UseRefResult.current
			OnSubmitFunction(UseRefResult.current)
		end
	end, { OnSubmitFunction })
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		maxSize = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }),
		userSearchBar = ReactModule.createElement(UserSearchBar, {
			initialInputText = p1.initialInputText,
			cancelText = p1.cancelText,
			searchPlaceholderText = p1.searchPlaceholderText,
			captureFocusOnMount = p1.captureFocusOnMount,
			cancelCallback = p1.onCancel,
			textChangedCallback = ReactModule.useCallback(function(Current) --[[ Line: 30 ]]
				-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
				UseRefResult1.current = UseRefResult.current
				UseRefResult.current = Current
			end, {}),
			focusChangedCallback = ReactModule.useCallback(function(Enabled, p2) --[[ Line: 42 ]]
				-- upvalues: UseResult (copy)
				if Enabled == false and p2 then
					UseResult()
				end
			end, { UseResult }),
			returnPressedFromOnScreenKeyboardCallback = ReactModule.useCallback(function() --[[ Line: 48 ]]
				-- upvalues: UseResult (copy)
				UseResult()
			end, { UseResult })
		})
	})
end