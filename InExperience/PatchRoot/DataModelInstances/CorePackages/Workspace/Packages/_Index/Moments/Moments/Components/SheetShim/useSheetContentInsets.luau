local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.SheetShimTypes)
local _ = require(script.Parent.getSheetStructure)
local readSheetContentInsetsModule = require(script.Parent.readSheetContentInsets)
local runService = game:GetService("RunService")
local frozen = table.freeze({ bottom = 0, right = 0 })

return function(value, p1)
	-- upvalues: reactModule (ref), readSheetContentInsetsModule (ref), runService (ref), frozen (ref)
	local var1 = reactModule.useRef(p1)
	var1.current = p1
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), var1 (ref)
		local current = var2.current
		
		if current ~= nil and current.bottom == p2.bottom and current.right == p2.right then return end
		var2.current = p2
		
		if var1.current ~= nil then
			var1.current(p2)
		end
	end, {})
	local var5 = p1 ~= nil
	reactModule.useLayoutEffect(function()
		-- upvalues: value (ref), var5 (ref), var3 (ref), var4 (ref), readSheetContentInsetsModule (copy), runService (copy), frozen (copy)
		if value == nil or not var5 then
			return nil
		end
		var3.current = false
		
		local function sample()
			-- upvalues: var3 (copy), var4 (copy), readSheetContentInsetsModule (copy), value (copy)
			if not var3.current then
				var4(readSheetContentInsetsModule(value))
			end
		end
		
		if not var3.current then
			var4(readSheetContentInsetsModule(value))
		end
		local list = {
			(if value.scroller ~= nil then value.sheet:GetPropertyChangedSignal("Position") else value.scroller:GetPropertyChangedSignal("CanvasPosition")):Connect(sample),
			runService.RenderStepped:Connect(sample)
		}
		
		return function()
			-- upvalues: list (ref), var4 (copy), frozen (copy)
			for i, v in list do
				v:Disconnect()
			end
			var4(frozen)
		end
	end, { value, var5, var4 })
	
	return reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), frozen (copy)
		var3.current = true
		var4(frozen)
	end, { var4 })
end