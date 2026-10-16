local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local _ = require(script.Parent.SheetShimTypes)
local _ = require(script.Parent.getSheetStructure)
local ReadSheetContentInsetsModule = require(script.Parent.readSheetContentInsets)
local RunService = game:GetService("RunService")
local Frozen = table.freeze({ bottom = 0, right = 0 })

return function(p1, Current) --[[ Line: 22 | Named "useSheetContentInsets" ]]
	-- upvalues: ReactModule (copy), ReadSheetContentInsetsModule (copy), RunService (copy), Frozen (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 32 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		local Current1 = UseRefResult1.current
		
		if Current1 ~= nil and Current1.bottom == Current.bottom and Current1.right == Current.right then return end
		UseRefResult1.current = Current
		
		if UseRefResult.current ~= nil then
			UseRefResult.current(Current)
		end
	end, {})
	local HasCurrent = Current ~= nil
	ReactModule.useLayoutEffect(function() --[[ Line: 45 ]]
		-- upvalues: p1 (copy), HasCurrent (copy), UseRefResult2 (copy), UseResult (copy), ReadSheetContentInsetsModule (upval), RunService (upval), Frozen (upval)
		if p1 == nil or not HasCurrent then
			return nil
		end
		UseRefResult2.current = false
		
		local function sample() --[[ Line: 51 ]]
			-- upvalues: UseRefResult2 (upval), UseResult (upval), ReadSheetContentInsetsModule (upval), p1 (upval)
			if not UseRefResult2.current then
				UseResult(ReadSheetContentInsetsModule(p1))
			end
		end
		
		if not UseRefResult2.current then
			UseResult(ReadSheetContentInsetsModule(p1))
		end
		local Connections = {
			(if p1.scroller == nil then p1.sheet:GetPropertyChangedSignal("Position") else p1.scroller:GetPropertyChangedSignal("CanvasPosition")):Connect(sample),
			RunService.RenderStepped:Connect(sample)
		}
		
		return function() --[[ Line: 69 ]]
			-- upvalues: Connections (copy), UseResult (upval), Frozen (upval)
			for _, connection in Connections do
				connection:Disconnect()
			end
			UseResult(Frozen)
		end
	end, { p1, HasCurrent, UseResult })
	
	return ReactModule.useCallback(function() --[[ Line: 77 ]]
		-- upvalues: UseRefResult2 (copy), UseResult (copy), Frozen (upval)
		UseRefResult2.current = true
		UseResult(Frozen)
	end, { UseResult })
end