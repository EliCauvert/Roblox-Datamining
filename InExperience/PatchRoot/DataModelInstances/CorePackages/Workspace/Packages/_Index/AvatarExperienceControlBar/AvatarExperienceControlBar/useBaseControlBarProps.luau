local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local roactGamepadModule = require(parent.RoactGamepad)
local useTokens = require(parent.Foundation).Hooks.useTokens
local debounce = require(parent.AvatarExperienceCommon).Utils.debounce
local fFlagAXFixVRControlBarFlicker = require(parent.AvatarExperienceFlags).FFlagAXFixVRControlBarFlicker
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local t = {
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

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), roactGamepadModule (ref), debounce (ref), t (ref), fFlagAXFixVRControlBarFlicker (ref)
	local var1 = useTokens()
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = roactGamepadModule.useRefCache()
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var5 (ref)
		local t = {}
		local t_1 = {}
		
		if p1.config then
			for i, v in p1.config do
				if v.children then
					t_1[v.id] = v.children
				end
				v.ref = var5[v.id]
				table.insert(t, v)
			end
		end
		return t, t_1
	end, { p1.config })
	local var7, var8 = var6()
	local var9, var10 = reactModule.useState(var7)
	local var11, var12 = reactModule.useState(var8)
	local var13, var14 = reactModule.useState("")
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var10 (ref), var12 (ref)
		local var15, var16 = var6()
		var10(var15)
		var12(var16)
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var13 (ref), var11 (ref)
		if p1.onActiveMenuItemChanged then
			p1.onActiveMenuItemChanged(var13, var11[var13] ~= nil)
		end
	end, { var13, var11 })
	local var15 = reactModule.useCallback(debounce(function()
		-- upvalues: var2 (ref)
		var2.current = false
	end, 0.1), {})
	
	return {
		activeMenuItemId = var13,
		menus = var9,
		submenus = var11,
		submenuItems = reactModule.useMemo(function()
			-- upvalues: var11 (ref), var13 (ref)
			return var11[var13]
		end, { var13, var11 }),
		submenuPosition = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var13 (ref), var3 (ref), var4 (ref), var1 (ref)
			local var16 = var5[var13]
			
			if var16 and var16.current and (var3.current and var4.current) then
				local var17 = var16.current.AbsolutePosition - var3.current.AbsolutePosition + Vector2.new(var4.current.AbsoluteSize.X + var1.Size.Size_50, 0)
				
				return UDim2.new(0, var17.X, 0, var17.Y)
			end
			return nil
		end, { var13 }),
		onMenuItemActivated = reactModule.useCallback(function(p2)
			-- upvalues: var14 (ref), var13 (ref), var2 (ref), var15 (ref)
			var14(if p2 == var13 then "" else p2)
			var2.current = true
			var15()
		end, { var13 }),
		onSubmenuItemActivated = reactModule.useCallback(function(_)
			-- upvalues: var14 (ref), var2 (ref), var15 (ref)
			var14("")
			var2.current = true
			var15()
		end, {}),
		onInputEnded = reactModule.useCallback(function(p2)
			-- upvalues: var13 (ref), var2 (ref), t (copy), var14 (ref), fFlagAXFixVRControlBarFlicker (copy)
			if var13 ~= "" and not var2.current and not t[p2.KeyCode] then
				var14("")
			end
			if not fFlagAXFixVRControlBarFlicker then
				var2.current = false
			end
		end, { var13 }),
		containerRef = var3,
		iconMenuRef = var4,
		menuItemsRefCache = var5,
		LayoutOrder = p1.LayoutOrder
	}
end