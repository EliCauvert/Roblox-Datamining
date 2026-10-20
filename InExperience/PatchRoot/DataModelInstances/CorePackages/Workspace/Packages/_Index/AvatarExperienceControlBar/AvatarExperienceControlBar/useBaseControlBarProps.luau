local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local RoactGamepadModule = require(Parent.RoactGamepad)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local DebounceFunction = require(Parent.AvatarExperienceCommon).Utils.debounce
local FFlagAXFixVRControlBarFlicker = require(Parent.AvatarExperienceFlags).FFlagAXFixVRControlBarFlicker
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local config = {
	[Enum.KeyCode.Up] = true,
	[Enum.KeyCode.Down] = true,
	[Enum.KeyCode.Left] = true,
	[Enum.KeyCode.Right] = true,
	[Enum.KeyCode.DPadDown] = true,
	[Enum.KeyCode.DPadUp] = true,
	[Enum.KeyCode.DPadLeft] = true,
	[Enum.KeyCode.DPadRight] = true,
	[Enum.KeyCode.Thumbstick1] = true
}

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), RoactGamepadModule (copy), DebounceFunction (copy), config (copy), FFlagAXFixVRControlBarFlicker (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), UseRefCacheResult (copy)
		local List = {}
		local t = {}
		
		if Frame.config then
			for _, value in Frame.config do
				if value.children then
					t[value.id] = value.children
				end
				value.ref = UseRefCacheResult[value.id]
				table.insert(List, value)
			end
		end
		return List, t
	end, { Frame.config })
	local UseResultResult, UseResultResult2 = UseResult()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseResultResult)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseResultResult2)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		local UseResultResult, UseResultResult2 = UseResult()
		UseStateResult2(UseResultResult)
		UseStateResult2_1(UseResultResult2)
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult3 (copy), UseStateResult1 (copy)
		if Frame.onActiveMenuItemChanged then
			Frame.onActiveMenuItemChanged(UseStateResult3, UseStateResult1[UseStateResult3] ~= nil)
		end
	end, { UseStateResult3, UseStateResult1 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult3 (copy)
		return UseStateResult1[UseStateResult3]
	end, { UseStateResult3, UseStateResult1 })
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim2?
		-- upvalues: UseRefCacheResult (copy), UseStateResult3 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseTokensResult (copy)
		local UseRefCacheResultEntry = UseRefCacheResult[UseStateResult3]
		
		if UseRefCacheResultEntry and UseRefCacheResultEntry.current and UseRefResult1.current and UseRefResult2.current then
			local NewAbsolutePosition = UseRefCacheResultEntry.current.AbsolutePosition - UseRefResult1.current.AbsolutePosition + Vector2.new(UseRefResult2.current.AbsoluteSize.X + UseTokensResult.Size.Size_50, 0)
			
			return UDim2.new(0, NewAbsolutePosition.X, 0, NewAbsolutePosition.Y)
		else
			return nil
		end
	end, { UseStateResult3 })
	local UseResult1 = ReactModule.useCallback(DebounceFunction(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = false
	end, 0.1), {})
	
	return {
		activeMenuItemId = UseStateResult3,
		menus = UseStateResult,
		submenus = UseStateResult1,
		submenuItems = UseMemoResult,
		submenuPosition = UseMemoResult1,
		onMenuItemActivated = ReactModule.useCallback(function(ActiveMenuItemId)
			-- upvalues: UseStateResult2_2 (copy), UseStateResult3 (copy), UseRefResult (copy), UseResult1 (copy)
			UseStateResult2_2(if ActiveMenuItemId == UseStateResult3 then "" else ActiveMenuItemId)
			UseRefResult.current = true
			UseResult1()
		end, { UseStateResult3 }),
		onSubmenuItemActivated = ReactModule.useCallback(function(_)
			-- upvalues: UseStateResult2_2 (copy), UseRefResult (copy), UseResult1 (copy)
			UseStateResult2_2("")
			UseRefResult.current = true
			UseResult1()
		end, {}),
		onInputEnded = ReactModule.useCallback(function(Input)
			-- upvalues: UseStateResult3 (copy), UseRefResult (copy), config (upval), UseStateResult2_2 (copy), FFlagAXFixVRControlBarFlicker (upval)
			if UseStateResult3 ~= "" and not UseRefResult.current and not config[Input.KeyCode] then
				UseStateResult2_2("")
			end
			if not FFlagAXFixVRControlBarFlicker then
				UseRefResult.current = false
			end
		end, { UseStateResult3 }),
		containerRef = UseRefResult1,
		iconMenuRef = UseRefResult2,
		menuItemsRefCache = UseRefCacheResult,
		LayoutOrder = Frame.LayoutOrder
	}
end