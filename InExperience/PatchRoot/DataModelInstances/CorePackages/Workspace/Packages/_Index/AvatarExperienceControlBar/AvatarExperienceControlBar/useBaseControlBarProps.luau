local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local roactGamepadModule = require(parent.RoactGamepad)
local useTokens = require(parent.Foundation).Hooks.useTokens
local debounce = require(parent.AvatarExperienceCommon).Utils.debounce
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

return function(p0) --[[ line: 37 | named "useBaseControlBarProps" ]]
	-- upvalues: useTokens (ref), reactModule (ref), roactGamepadModule (ref), debounce (ref), t (ref)
	local var4 = useTokens()
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = roactGamepadModule.useRefCache()
	local var9 = reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref), var8 (ref)
		local t = {}
		local t_1 = {}
		
		if p0.config then
			for i, v in p0.config do
				if v.children then
					t_1[v.id] = v.children
				end
				v.ref = var8[v.id]
				table.insert(t, v)
			end
		end
		return t, t_1
	end, { p0.config })
	local var10, var11 = var9()
	local var12, var13 = reactModule.useState(var10)
	local var14, var15 = reactModule.useState(var11)
	local var16, var17 = reactModule.useState("")
	reactModule.useEffect(function() --[[ line: 77 ]]
		-- upvalues: var9 (ref), var13 (ref), var15 (ref)
		local var21, var22 = var9()
		var13(var21)
		var15(var22)
	end, { var9 })
	reactModule.useEffect(function() --[[ line: 83 ]]
		-- upvalues: p0 (ref), var16 (ref), var14 (ref)
		if p0.onActiveMenuItemChanged then
			p0.onActiveMenuItemChanged(var16, var14[var16] ~= nil)
		end
	end, { var16, var14 })
	local var18 = reactModule.useCallback(debounce(function() --[[ line: 110 ]]
		-- upvalues: var5 (ref)
		var5.current = false
	end, 0.1), {})
	
	return {
		activeMenuItemId = var16,
		menus = var12,
		submenus = var14,
		submenuItems = reactModule.useMemo(function() --[[ line: 89 ]]
			-- upvalues: var14 (ref), var16 (ref)
			return var14[var16]
		end, { var16, var14 }),
		submenuPosition = reactModule.useMemo(function() --[[ line: 93 ]]
			-- upvalues: var8 (ref), var16 (ref), var6 (ref), var7 (ref), var4 (ref)
			local var23 = var8[var16]
			
			if var23 and var23.current and (var6.current and var7.current) then
				local var24 = var23.current.AbsolutePosition - var6.current.AbsolutePosition + Vector2.new(var7.current.AbsoluteSize.X + var4.Size.Size_50, 0)
				
				return UDim2.new(0, var24.X, 0, var24.Y)
			end
			return nil
		end, { var16 }),
		onMenuItemActivated = reactModule.useCallback(function(p1) --[[ line: 116 ]]
			-- upvalues: var17 (ref), var16 (ref), var5 (ref), var18 (ref)
			var17(if p1 == var16 then "" else p1)
			var5.current = true
			var18()
		end, { var16 }),
		onSubmenuItemActivated = reactModule.useCallback(function(_) --[[ line: 122 ]]
			-- upvalues: var17 (ref), var5 (ref), var18 (ref)
			var17("")
			var5.current = true
			var18()
		end, {}),
		onInputEnded = reactModule.useCallback(function(p2) --[[ line: 132 ]]
			-- upvalues: var16 (ref), var5 (ref), t (copy), var17 (ref)
			if var16 ~= "" and not var5.current and not t[p2.KeyCode] then
				var17("")
			end
			var5.current = false
		end, { var16 }),
		containerRef = var6,
		iconMenuRef = var7,
		menuItemsRefCache = var8,
		LayoutOrder = p0.LayoutOrder
	}
end