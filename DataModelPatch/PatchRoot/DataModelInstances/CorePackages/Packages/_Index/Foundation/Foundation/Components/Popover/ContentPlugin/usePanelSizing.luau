local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Providers.StudioPanels.Types)
local _ = require(Foundation.Enums.PopoverAlign)
local _ = require(Foundation.Enums.PopoverSide)
local ReactModule = require(Foundation.Parent.React)
local PositioningModule = require(script.Parent.Parent.positioning)
local SHADOWSIZE = require(Foundation.Constants).SHADOW_SIZE

local function _(Frame: Frame, p1, p2)
	-- upvalues: ReactModule (copy)
	ReactModule.useLayoutEffect(function()
		-- upvalues: Frame (copy), p1 (copy), p2 (copy)
		local Connections = {}
		
		if Frame ~= nil then
			for _, PropertyName in p1 do
				Connections[PropertyName] = Frame:GetPropertyChangedSignal(PropertyName):Connect(if type(p2) == "table" then function()
					-- upvalues: p2 (upval)
					p2.current()
				end else p2)
			end
		end
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { Frame, p2 })
end

return function(p3, p4, Frame: Frame, p5, p6)
	-- upvalues: ReactModule (copy), PositioningModule (copy), SHADOWSIZE (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UDim2.new())
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(function() end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), p3 (copy), p4 (copy), p5 (copy), PositioningModule (upval), SHADOWSIZE (upval), UseBindingResult2_1 (copy), UseBindingResult2 (copy), p6 (copy), UseRefResult (copy)
		if not Frame then return end
		local AbsoluteSize = Frame.AbsoluteSize
		local NewPopoverBounds = PositioningModule.calculatePopoverBounds(if type(p3) == "table" then p3.position else p3, if type(p3) == "table" then p3.offset else 0, if type(p4) == "table" then p4.offset else 0, p5 or 0, AbsoluteSize) + Vector2.new(SHADOWSIZE * 2, SHADOWSIZE * 2)
		UseBindingResult2_1(UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y))
		UseBindingResult2(UDim2.fromOffset(NewPopoverBounds.X, NewPopoverBounds.Y))
		local _ = Frame.AbsolutePosition
		
		if p6 then
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
			end
			UseRefResult.current = task.spawn(function()
				-- upvalues: p6 (upval), NewPopoverBounds (copy)
				p6.setSizeAsync(NewPopoverBounds)
			end)
		end
	end, {
		Frame,
		p3,
		p4,
		p5,
		p6
	})
	UseRefResult1.current = UseResult
	local PropertyNames = { "AbsoluteSize" }
	ReactModule.useLayoutEffect(function()
		-- upvalues: Frame (copy), PropertyNames (copy), UseRefResult1 (copy)
		local Connections = {}
		
		if Frame ~= nil then
			for _, PropertyName in PropertyNames do
				Connections[PropertyName] = Frame:GetPropertyChangedSignal(PropertyName):Connect(if type(UseRefResult1) == "table" then function()
					-- upvalues: UseRefResult1 (upval)
					UseRefResult1.current()
				end else UseRefResult1)
			end
		end
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { Frame, UseRefResult1 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
			end
		end
	end, {})
	
	return UseBindingResult, UseBindingResult1
end