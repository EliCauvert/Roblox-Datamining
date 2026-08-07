local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Providers.StudioPanels.Types)
local _ = require(foundation.Enums.PopoverAlign)
local _ = require(foundation.Enums.PopoverSide)
local reactModule = require(parent.React)
local positioningModule = require(script.Parent.Parent.positioning)
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

local function _(value, p0, p1) --[[ line: 28 | named "useConnectSignals" ]]
	-- upvalues: reactModule (ref)
	reactModule.useLayoutEffect(function() --[[ line: 34 ]]
		-- upvalues: value (ref), p0 (ref), p1 (ref)
		local t = {}
		
		if value ~= nil then
			for i, v in p0 do
				t[v] = value:GetPropertyChangedSignal(v):Connect(if type(p1) == "table" then function() --[[ line: 40 ]]
					-- upvalues: p1 (copy)
					p1.current()
				end else p1)
			end
		end
		return function() --[[ line: 47 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { value, p1 })
end

return function(p2, p3, p4, p5, p6) --[[ line: 55 | named "usePanelSizing" ]]
	-- upvalues: reactModule (ref), positioningModule (ref), SHADOW_SIZE (ref)
	local var5, var6 = reactModule.useBinding(UDim2.new())
	local var7, var8 = reactModule.useBinding(UDim2.new())
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(function() --[[ line: 66 ]] end)
	local var11 = reactModule.useCallback(function() --[[ line: 68 ]]
		-- upvalues: p4 (ref), p2 (ref), p3 (ref), p5 (ref), positioningModule (copy), SHADOW_SIZE (copy), var8 (ref), var6 (ref), p6 (ref), var9 (ref)
		if not p4 then return end
		local absoluteSize = p4.AbsoluteSize
		local var13 = positioningModule.calculatePopoverBounds(if type(p2) == "table" then p2.position else p2, if type(p2) == "table" then p2.offset else 0, if type(p3) == "table" then p3.offset else 0, p5 or 0, absoluteSize) + Vector2.new(SHADOW_SIZE * 2, SHADOW_SIZE * 2)
		var8(UDim2.fromOffset(absoluteSize.X, absoluteSize.Y))
		var6(UDim2.fromOffset(var13.X, var13.Y))
		local _ = p4.AbsolutePosition
		
		if p6 then
			if var9.current then
				task.cancel(var9.current)
			end
			var9.current = task.spawn(function() --[[ line: 100 ]]
				-- upvalues: p6 (copy), var13 (ref)
				p6.setSizeAsync(var13)
			end)
		end
	end, {
		p4,
		p2,
		p3,
		p5,
		p6
	})
	var10.current = var11
	local list = { "AbsoluteSize" }
	reactModule.useLayoutEffect(function() --[[ line: 34 ]]
		-- upvalues: p4 (ref), list (ref), var10 (ref)
		local t = {}
		
		if p4 ~= nil then
			for i, v in list do
				t[v] = p4:GetPropertyChangedSignal(v):Connect(if type(var10) == "table" then function() --[[ line: 40 ]]
					-- upvalues: var10 (copy)
					var10.current()
				end else var10)
			end
		end
		return function() --[[ line: 47 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p4, var10 })
	reactModule.useLayoutEffect(function() --[[ line: 109 ]]
		-- upvalues: var11 (ref)
		var11()
	end, { var11 })
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: var9 (ref)
		return function() --[[ line: 114 ]]
			-- upvalues: var9 (copy)
			if var9.current then
				task.cancel(var9.current)
			end
		end
	end, {})
	
	return var5, var7
end