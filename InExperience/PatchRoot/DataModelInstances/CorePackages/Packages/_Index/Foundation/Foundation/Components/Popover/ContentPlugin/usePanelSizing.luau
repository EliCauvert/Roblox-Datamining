local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Providers.StudioPanels.Types)
local _ = require(foundation.Enums.PopoverAlign)
local _ = require(foundation.Enums.PopoverSide)
local reactModule = require(parent.React)
local positioningModule = require(script.Parent.Parent.positioning)
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

local function _(value, p1, p2)
	-- upvalues: reactModule (ref)
	reactModule.useLayoutEffect(function()
		-- upvalues: value (ref), p1 (ref), p2 (ref)
		local t = {}
		
		if value ~= nil then
			for i, v in p1 do
				t[v] = value:GetPropertyChangedSignal(v):Connect(if type(p2) == "table" then function()
					-- upvalues: p2 (copy)
					p2.current()
				end else p2)
			end
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { value, p2 })
end

return function(p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), positioningModule (ref), SHADOW_SIZE (ref)
	local var1, var2 = reactModule.useBinding(UDim2.new())
	local var3, var4 = reactModule.useBinding(UDim2.new())
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(function() end)
	local var7 = reactModule.useCallback(function()
		-- upvalues: p5 (ref), p3 (ref), p4 (ref), p6 (ref), positioningModule (copy), SHADOW_SIZE (copy), var4 (ref), var2 (ref), p7 (ref), var5 (ref)
		if not p5 then return end
		local absoluteSize = p5.AbsoluteSize
		local var8 = positioningModule.calculatePopoverBounds(if type(p3) == "table" then p3.position else p3, if type(p3) == "table" then p3.offset else 0, if type(p4) == "table" then p4.offset else 0, p6 or 0, absoluteSize) + Vector2.new(SHADOW_SIZE * 2, SHADOW_SIZE * 2)
		var4(UDim2.fromOffset(absoluteSize.X, absoluteSize.Y))
		var2(UDim2.fromOffset(var8.X, var8.Y))
		local _ = p5.AbsolutePosition
		
		if p7 then
			if var5.current then
				task.cancel(var5.current)
			end
			var5.current = task.spawn(function()
				-- upvalues: p7 (copy), var8 (ref)
				p7.setSizeAsync(var8)
			end)
		end
	end, {
		p5,
		p3,
		p4,
		p6,
		p7
	})
	var6.current = var7
	local list = { "AbsoluteSize" }
	reactModule.useLayoutEffect(function()
		-- upvalues: p5 (ref), list (ref), var6 (ref)
		local t = {}
		
		if p5 ~= nil then
			for i, v in list do
				t[v] = p5:GetPropertyChangedSignal(v):Connect(if type(var6) == "table" then function()
					-- upvalues: var6 (copy)
					var6.current()
				end else var6)
			end
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p5, var6 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var7 (ref)
		var7()
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		return function()
			-- upvalues: var5 (copy)
			if var5.current then
				task.cancel(var5.current)
			end
		end
	end, {})
	
	return var1, var3
end