local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local reactModule = require(momentsCreation.Parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState
local clampTtsStartTimeModule = require(momentsCreation.Utils.clampTtsStartTime)

return function(value, p1, p2, p3, p4, p5)
	-- upvalues: useRef (ref), useState (ref), useEffect (ref), useCallback (ref), clampTtsStartTimeModule (ref)
	local var1 = useRef(nil)
	local var2 = useRef(false)
	local var3, var4 = useState(false)
	local var5 = useRef(p2)
	local var6 = useRef(0)
	useEffect(function()
		-- upvalues: var5 (ref), p2 (ref)
		var5.current = p2
	end, { p2 })
	local var7 = useCallback(function()
		-- upvalues: var2 (ref), var6 (ref), var5 (ref), var4 (ref), p4 (ref)
		if var2.current then return end
		var2.current = true
		var6.current = var5.current
		var4(true)
		
		if p4 ~= nil then
			p4()
		end
	end, { p4 })
	local var8 = useCallback(function()
		-- upvalues: var2 (ref), var1 (ref), p1 (ref), p3 (ref), clampTtsStartTimeModule (copy), var6 (ref)
		if not var2.current then return end
		local current = var1.current
		
		if current == nil or p1 <= 0 then
			return
		end
		p3(clampTtsStartTimeModule(var6.current + current.DragUDim2.X.Scale * p1, p1))
	end, { p1, p3 })
	local var9 = useCallback(function()
		-- upvalues: var2 (ref), var4 (ref), p5 (ref)
		if not var2.current then return end
		var2.current = false
		var4(false)
		
		if p5 ~= nil then
			p5()
		end
	end, { p5 })
	useEffect(function()
		-- upvalues: value (ref), var1 (ref), var7 (ref), var8 (ref), var9 (ref), var2 (ref), var4 (ref), p5 (ref)
		if not value then return end
		local current = var1.current
		
		if current == nil then
			return
		end
		local list = {
			current.DragStart:Connect(var7),
			current.DragContinue:Connect(var8),
			current.DragEnd:Connect(var9)
		}
		
		return function()
			-- upvalues: list (ref), var2 (copy), var4 (copy), p5 (copy)
			for i, v in list do
				v:Disconnect()
			end
			if var2.current then
				var2.current = false
				var4(false)
				
				if p5 ~= nil then
					p5()
				end
			end
		end
	end, {
		value,
		var7,
		var8,
		var9,
		p5
	})
	
	return { dragDetectorRef = var1, isSelected = var3 }
end