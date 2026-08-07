local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local responsiveModule = require(parent.Responsive)
local useIsSpatial = responsiveModule.useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput
local input = responsiveModule.Input
local useDescendantHasFocusModule = require(script.Parent.useDescendantHasFocus)

return function(p0, p1) --[[ line: 30 | named "useFocusOnMount" ]]
	-- upvalues: useFocusGuiObject (ref), reactModule (ref), usePreferredInput (ref), input (ref), useIsSpatial (ref), coreGuiService (ref), useDescendantHasFocusModule (ref)
	local var4 = p1 == nil or p1
	local var5 = useFocusGuiObject()
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useCallback(function(p2) --[[ line: 38 ]]
		-- upvalues: p0 (ref), var7 (ref)
		if p0 then
			if type(p0) == "function" then
				p0(p2)
			elseif type(p0) == "table" then
				p0.current = p2
			end
		end
		if p2 == nil then
			var7(nil)
			
			return
		elseif p2:IsA("GuiObject") then
			var7(p2)
			
			return
		end
		warn("useFocusOnMount: ref is not a GuiObject")
	end, { p0 })
	local var9 = usePreferredInput() == input.Directional
	local var10 = useIsSpatial()
	local var11 = reactModule.useCallback(function(p3) --[[ line: 61 ]]
		-- upvalues: coreGuiService (copy), var9 (ref), var10 (ref), var5 (ref)
		if not p3:IsDescendantOf(coreGuiService) then return end
		if var9 and not var10 then
			var5(p3)
		end
	end, { var9, var10, var5 })
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(false)
	local var14 = useDescendantHasFocusModule(var6)
	local var15 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: var6 (ref), var12 (ref), var13 (ref), var11 (ref), var4 (ref), var14 (ref), var15 (ref)
		if not var6 then
			var12.current = false
			var13.current = false
			
			return
		elseif not var12.current then
			var11(var6)
			var12.current = true
		end
		if var4 and not var13.current and var14 then
			var13.current = true
		end
		local var16 = if var4 and not var13.current then var6.DescendantAdded:Connect(function(p4) --[[ line: 98 ]]
			-- upvalues: var15 (copy), var11 (copy), var6 (copy)
			if not var15.current and p4:IsA("GuiObject") and p4.Selectable then
				var15.current = task.delay(0.1, function() --[[ line: 100 ]]
					-- upvalues: var11 (copy), var6 (copy), var15 (copy)
					var11(var6)
					var15.current = nil
				end)
			end
		end) else nil
		
		return function() --[[ line: 107 ]]
			-- upvalues: var16 (ref), var15 (copy)
			if var16 then
				var16:Disconnect()
			end
			if var15.current then
				task.cancel(var15.current)
				var15.current = nil
			end
		end
	end, { var6, var4, var11, var14 })
	
	return var8
end