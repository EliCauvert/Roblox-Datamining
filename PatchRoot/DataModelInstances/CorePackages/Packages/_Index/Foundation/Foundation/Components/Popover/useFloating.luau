-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Enums.PopoverAlign)
local _ = require(foundation.Enums.PopoverSide)
local reactModule = require(parent.React)
local positioningModule = require(script.Parent.positioning)
local _ = require(foundation.Components.Types)

local function useConnectSignals(value, p0, p1) --[[ line: 27 ]]
	-- upvalues: reactModule (ref)
	local var5 = reactModule.useRef({})
	reactModule.useLayoutEffect(function() --[[ line: 34 ]]
		-- upvalues: value (ref), p0 (ref), var5 (ref), p1 (ref)
		if value ~= nil then
			for i, v in p0 do
				var5.current[v] = (if typeof(value) == "Instance" then value:GetPropertyChangedSignal(v) else value:GetPropertyChangedSignal(v)):Connect(if type(p1) == "table" then function() --[[ line: 43 ]]
					-- upvalues: p1 (copy)
					p1.current()
				end else p1)
			end
		end
		return function() --[[ line: 51 ]]
			-- upvalues: var5 (copy)
			for i, v in var5.current do
				v:Disconnect()
			end
		end
	end, { value, p1 })
end

return function(p2, p3, p4, p5, p6, p7, p8) --[[ line: 59 | named "useFloating" ]]
	-- upvalues: reactModule (ref), flagsModule (ref), positioningModule (ref), useConnectSignals (ref)
	local var6, var7 = reactModule.useBinding(Vector2.new())
	local var8, var9 = reactModule.useBinding(true)
	local var10, var11 = reactModule.useBinding(UDim2.new())
	local var12, var13 = reactModule.useBinding(Vector2.new())
	local var14, var15 = reactModule.useBinding(Vector2.new())
	local var16, var17 = reactModule.useBinding(Vector2.new(0, 0))
	local var18 = reactModule.useRef(function() --[[ line: 74 ]] end)
	local var19 = if flagsModule.FoundationPopoverClipAwareVisibility then reactModule.useRef({}) else nil
	local var20 = if flagsModule.FoundationPopoverClipAwareVisibility then reactModule.useRef(false) else nil
	local var21 = reactModule.useCallback(function() --[[ line: 82 ]]
		-- upvalues: p2 (ref), p3 (ref), p4 (ref), p5 (ref), var9 (ref), positioningModule (copy), flagsModule (copy), var19 (ref), p6 (ref), p7 (ref), p8 (ref), var11 (ref), var13 (ref), var15 (ref), var7 (ref), var17 (ref)
		if not p2 or not p3 or (not p4 or not p5) then
			var9(false)
			
			return
		end
		local absolutePosition = p3.AbsolutePosition
		local absoluteSize = p3.AbsoluteSize
		local absoluteSize_1 = p4.AbsoluteSize
		local absoluteSize_2 = p5.AbsoluteSize
		local absolutePosition_1 = p5.AbsolutePosition
		local rect = Rect.new(absolutePosition, absolutePosition + absoluteSize)
		local rect_1 = Rect.new(absolutePosition_1, absolutePosition_1 + absoluteSize_2)
		
		if not positioningModule.isOnScreen(rect, rect_1) then
			var9(false)
			
			return
		elseif flagsModule.FoundationPopoverClipAwareVisibility then
			local var24 = nil
			
			for i, v in var19.current do
				local rect_2 = Rect.new(v.AbsolutePosition, v.AbsolutePosition + v.AbsoluteSize)
				var24 = if var24 == nil then rect_2 else Rect.new(Vector2.new(math.max(var24.Min.X, rect_2.Min.X), math.max(var24.Min.Y, rect_2.Min.Y)), Vector2.new(math.min(var24.Max.X, rect_2.Max.X), math.min(var24.Max.Y, rect_2.Max.Y)))
			end
			if var24 and not positioningModule.isOnScreen(rect, var24) then
				var9(false)
				
				return
			end
		end
		local var26 = if type(p6) == "table" then p6.position else p6
		local var27 = if type(p6) == "table" then p6.offset else 0
		local var28 = p7
		local var29 = 0
		
		if type(p7) == "table" then
			var28 = p7.position
			var29 = p7.offset
		end
		local p8_1 = p8 or 0
		local var31, var32, var33 = positioningModule.calculatePositions(positioningModule.calculateSide(var26, rect, rect_1, positioningModule.calculatePopoverBounds(var26, var27, var29, p8_1, absoluteSize_1)), var27, var28, var29, rect, rect_1, p8_1, absoluteSize_1)
		var11(UDim2.fromOffset(absoluteSize_1.X, absoluteSize_1.Y))
		var13(absoluteSize_2)
		var15(var32 + var31)
		var7(var31)
		var17(var33)
		var9(true)
		local _ = p4.AbsolutePosition
	end, {
		p2, p3, p4, p5, p6, p7, p8
	})
	
	if flagsModule.FoundationPopoverClipAwareVisibility then
		function var18.current() --[[ line: 175 ]]
			-- upvalues: var20 (ref), var21 (ref)
			if var20.current then
				return
			end
			var20.current = true
			task.defer(function() --[[ line: 180 ]]
				-- upvalues: var20 (copy), var21 (copy)
				var20.current = false
				var21()
			end)
		end
	else
		var18.current = var21
	end
	useConnectSignals(p3, { "AbsolutePosition", "AbsoluteSize" }, var18)
	useConnectSignals(p4, { "AbsoluteSize" }, var18)
	useConnectSignals(p5, { "AbsoluteSize" }, var18)
	
	if flagsModule.FoundationPopoverClipAwareVisibility then
		reactModule.useLayoutEffect(function() --[[ line: 195 ]]
			-- upvalues: p2 (ref), p3 (ref), var19 (ref), var18 (ref)
			if not p2 then return end
			if typeof(p3) == "Instance" and p3:IsA("GuiObject") then
				local t = {}
				
				local function rebuild() --[[ line: 206 ]]
					-- upvalues: t (ref), p3 (ref), var18 (copy), var19 (ref)
					for i, v in t do
						v:Disconnect()
					end
					table.clear(t)
					local t_1 = {}
					local parent = p3.Parent
					while parent and parent:IsA("GuiObject") do
						if parent.ClipsDescendants then
							table.insert(t_1, parent)
							table.insert(t, parent:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 220 ]]
								-- upvalues: var18 (copy)
								var18.current()
							end))
							table.insert(t, parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 226 ]]
								-- upvalues: var18 (copy)
								var18.current()
							end))
						end
						parent = parent.Parent
					end
					var19.current = t_1
					
					if #t_1 > 0 then
						var18.current()
					end
				end
				
				rebuild()
				local ancestryChangedConnection = p3.AncestryChanged:Connect(rebuild)
				
				return function() --[[ line: 244 ]]
					-- upvalues: ancestryChangedConnection (ref), t (ref), var19 (ref)
					ancestryChangedConnection:Disconnect()
					
					for i, v in t do
						v:Disconnect()
					end
					var19.current = {}
				end
			end
		end, { p3, p2 })
	end
	reactModule.useLayoutEffect(function() --[[ line: 254 ]]
		-- upvalues: var21 (ref)
		var21()
	end, { var21 })
	
	return var6, var8, var10, var14, var12, var16
end