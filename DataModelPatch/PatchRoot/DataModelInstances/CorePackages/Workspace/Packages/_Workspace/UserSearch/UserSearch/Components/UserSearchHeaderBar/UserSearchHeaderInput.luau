local Parent = script:FindFirstAncestor("UserSearch").Parent
local ReactModule = require(Parent.React)
local UserSearchBar = require(Parent.SocialCommon).Components.UserSearchBar.UserSearchBar
local FixDoubleSubmit = game:DefineFastFlag("FixDoubleSubmit", false)
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole

return function(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), ReactModule (copy), FixDoubleSubmit (copy), UserSearchBar (copy)
	local InitialInputText = p1.initialInputText
	local SearchPlaceholderText = p1.searchPlaceholderText
	local CancelText = p1.cancelText
	local OnCancel = p1.onCancel
	local OnSubmitFunction = p1.onSubmit
	local CaptureFocusOnMount = p1.captureFocusOnMount
	local v1 = nil
	local Callback = nil
	local v2 = nil
	local Callback1 = nil
	local UseRefResult = nil
	local UseRefResult1 = nil
	
	if FFlagEnableLeftNavOnConsole then
		UseRefResult = ReactModule.useRef("")
		UseRefResult1 = ReactModule.useRef("")
	else
		v1, Callback = ReactModule.useState(InitialInputText)
		v2, Callback1 = ReactModule.useState("")
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagEnableLeftNavOnConsole (upval), UseRefResult (ref), UseRefResult1 (ref), OnSubmitFunction (copy), v1 (ref), v2 (ref), Callback1 (ref)
		if FFlagEnableLeftNavOnConsole then
			if UseRefResult.current ~= UseRefResult1.current then
				UseRefResult1.current = UseRefResult.current
				OnSubmitFunction(UseRefResult.current)
				
				return
			end
		elseif v1 ~= v2 then
			Callback1(v1)
			OnSubmitFunction(v1)
		end
	end, {
		OnSubmitFunction,
		if FFlagEnableLeftNavOnConsole then nil else v1,
		if FFlagEnableLeftNavOnConsole then nil else v2
	})
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		maxSize = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(400, 1e999) }),
		userSearchBar = ReactModule.createElement(UserSearchBar, {
			initialInputText = InitialInputText,
			cancelText = CancelText,
			searchPlaceholderText = SearchPlaceholderText,
			captureFocusOnMount = CaptureFocusOnMount,
			cancelCallback = OnCancel,
			textChangedCallback = ReactModule.useCallback(function(Current)
				-- upvalues: FFlagEnableLeftNavOnConsole (upval), UseRefResult1 (ref), UseRefResult (ref), Callback (ref)
				if FFlagEnableLeftNavOnConsole then
					UseRefResult1.current = UseRefResult.current
					UseRefResult.current = Current
					
					return
				else
					Callback(Current)
				end
			end, {}),
			focusChangedCallback = ReactModule.useCallback(function(Enabled, p2)
				-- upvalues: FixDoubleSubmit (upval), UseResult (copy), OnSubmitFunction (copy), v1 (ref)
				if Enabled == false and p2 then
					if FixDoubleSubmit then
						UseResult()
						
						return
					end
					OnSubmitFunction(v1)
				end
			end, { v1, OnSubmitFunction }),
			returnPressedFromOnScreenKeyboardCallback = ReactModule.useCallback(function()
				-- upvalues: FixDoubleSubmit (upval), UseResult (copy), OnSubmitFunction (copy), v1 (ref)
				if FixDoubleSubmit then
					UseResult()
					
					return
				else
					OnSubmitFunction(v1)
				end
			end, { v1, OnSubmitFunction })
		})
	})
end