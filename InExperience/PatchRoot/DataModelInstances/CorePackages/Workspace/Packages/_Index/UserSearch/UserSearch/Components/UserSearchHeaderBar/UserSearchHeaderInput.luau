local parent = script:FindFirstAncestor("UserSearch").Parent
local reactModule = require(parent.React)
local userSearchBar = require(parent.SocialCommon).Components.UserSearchBar.UserSearchBar

return function(p1)
	-- upvalues: reactModule (ref), userSearchBar (ref)
	local initialInputText = p1.initialInputText
	local searchPlaceholderText = p1.searchPlaceholderText
	local cancelText = p1.cancelText
	local onCancel = p1.onCancel
	local onSubmit = p1.onSubmit
	local captureFocusOnMount = p1.captureFocusOnMount
	local var1 = reactModule.useRef("")
	local var2 = reactModule.useRef("")
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var2 (ref), onSubmit (ref)
		if var1.current ~= var2.current then
			var2.current = var1.current
			onSubmit(var1.current)
		end
	end, { onSubmit })
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		maxSize = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }),
		userSearchBar = reactModule.createElement(userSearchBar, {
			initialInputText = initialInputText,
			cancelText = cancelText,
			searchPlaceholderText = searchPlaceholderText,
			captureFocusOnMount = captureFocusOnMount,
			cancelCallback = onCancel,
			textChangedCallback = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref), var1 (ref)
				var2.current = var1.current
				var1.current = p2
			end, {}),
			focusChangedCallback = reactModule.useCallback(function(p2, p3)
				-- upvalues: var3 (ref)
				if p2 == false and p3 then
					var3()
				end
			end, { var3 }),
			returnPressedFromOnScreenKeyboardCallback = reactModule.useCallback(function()
				-- upvalues: var3 (ref)
				var3()
			end, { var3 })
		})
	})
end