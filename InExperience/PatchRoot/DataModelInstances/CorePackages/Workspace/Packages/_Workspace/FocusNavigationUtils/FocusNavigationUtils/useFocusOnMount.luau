local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local responsiveModule = require(parent.Responsive)
local useIsSpatial = responsiveModule.useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput
local input = responsiveModule.Input
local useDescendantHasFocusModule = require(script.Parent.useDescendantHasFocus)

return function(p1, p2)
	-- upvalues: useFocusGuiObject (ref), reactModule (ref), usePreferredInput (ref), input (ref), useIsSpatial (ref), coreGuiService (ref), useDescendantHasFocusModule (ref)
	local var1 = p2 == nil or p2
	local var2 = useFocusGuiObject()
	local var3, var4 = reactModule.useState(nil)
	local var5 = reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), var4 (ref)
		if p1 then
			if type(p1) == "function" then
				p1(p3)
			elseif type(p1) == "table" then
				p1.current = p3
			end
		end
		if p3 == nil then
			var4(nil)
			
			return
		elseif p3:IsA("GuiObject") then
			var4(p3)
			
			return
		end
		warn("useFocusOnMount: ref is not a GuiObject")
	end, { p1 })
	local var6 = usePreferredInput() == input.Directional
	local var7 = useIsSpatial()
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: coreGuiService (copy), var6 (ref), var7 (ref), var2 (ref)
		if not p3:IsDescendantOf(coreGuiService) then return end
		if var6 and not var7 then
			var2(p3)
		end
	end, { var6, var7, var2 })
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(false)
	local var11 = useDescendantHasFocusModule(var3)
	local var12 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var9 (ref), var10 (ref), var8 (ref), var1 (ref), var11 (ref), var12 (ref)
		if not var3 then
			var9.current = false
			var10.current = false
			
			return
		elseif not var9.current then
			var8(var3)
			var9.current = true
		end
		if var1 and not var10.current and var11 then
			var10.current = true
		end
		local var13 = if var1 and not var10.current then var3.DescendantAdded:Connect(function(p3)
			-- upvalues: var12 (copy), var8 (copy), var3 (copy)
			if not var12.current and p3:IsA("GuiObject") and p3.Selectable then
				var12.current = task.delay(0.1, function()
					-- upvalues: var8 (copy), var3 (copy), var12 (copy)
					var8(var3)
					var12.current = nil
				end)
			end
		end) else nil
		
		return function()
			-- upvalues: var13 (ref), var12 (copy)
			if var13 then
				var13:Disconnect()
			end
			if var12.current then
				task.cancel(var12.current)
				var12.current = nil
			end
		end
	end, { var3, var1, var8, var11 })
	
	return var5
end