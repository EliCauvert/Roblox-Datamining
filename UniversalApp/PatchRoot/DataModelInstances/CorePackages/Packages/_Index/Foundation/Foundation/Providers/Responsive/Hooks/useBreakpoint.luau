local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UsePreviousFunction = require(Parent.ReactUtils).usePrevious
local _Instance = require(Foundation.Utility.Wrappers).Instance
local _ = require(Foundation.Enums.Breakpoint)
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Providers.Responsive.ResponsiveContext)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)

local function _(p1, p2)
	local OrderEntry = p1.order[#p1.order]
	
	for _, value in p1.order do
		if p2 <= p1.widths[value] then
			OrderEntry = value
			
			return OrderEntry
		end
	end
	return OrderEntry
end

local _ = function(p3, p4)
	-- upvalues: DashModule (copy)
	return DashModule.findIndex(p3.order, function(OrderEntry): boolean
		-- upvalues: p4 (copy)
		return OrderEntry == p4
	end)
end

local _ = function(p3, p4, p5, p6): boolean
	-- upvalues: DashModule (copy)
	return not p6 or p5 ~= p6 and (if DashModule.findIndex(p3.order, function(OrderEntry): boolean
		-- upvalues: p6 (copy)
		return OrderEntry == p6
	end) < DashModule.findIndex(p3.order, function(OrderEntry): boolean
		-- upvalues: p5 (copy)
		return OrderEntry == p5
	end) then p3.widths[p6] + 5 < p4 else p4 < p3.widths[p5] - 5)
end

return function(Frame: Frame, p3)
	-- upvalues: WithDefaultsModule (copy), ConstantsModule (copy), UseResponsiveModule (copy), ReactModule (copy), UsePreviousFunction (copy), DashModule (copy), _Instance (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p3 or {}, { throttleTime = ConstantsModule.DEFAULT_DELAY_TIME })
	local Breakpoint = UseResponsiveModule().config.breakpoint
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local X = UseStateResult.X
	local OrderEntry = Breakpoint.order[#Breakpoint.order]
	
	for _, value in Breakpoint.order do
		if X <= Breakpoint.widths[value] then
			OrderEntry = value
			break
		end
	end
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(OrderEntry)
	local UsePreviousResult = UsePreviousFunction(UseStateResult1)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		return DashModule.throttle(UseStateResult2, WithDefaultsModuleResult.throttleTime, { leading = true, trailing = true })
	end, { WithDefaultsModuleResult.throttleTime })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), _Instance (upval), UseMemoResult (copy), UseStateResult2 (copy)
		local Connection = nil
		
		if Frame then
			Connection = _Instance.GetPropertyChangedSignal(Frame, "AbsoluteSize"):Connect(function()
				-- upvalues: UseMemoResult (upval), Frame (upval)
				UseMemoResult(Frame.AbsoluteSize)
			end)
			UseStateResult2(Frame.AbsoluteSize)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { Frame })
	ReactModule.useEffect(function()
		-- upvalues: Breakpoint (copy), UseStateResult (copy), OrderEntry (copy), UsePreviousResult (copy), DashModule (upval), UseStateResult2_1 (copy)
		local X = UseStateResult.X
		
		if not UsePreviousResult or OrderEntry ~= UsePreviousResult and (if DashModule.findIndex(Breakpoint.order, function(OrderEntry): boolean
			-- upvalues: UsePreviousResult (copy)
			return OrderEntry == UsePreviousResult
		end) < DashModule.findIndex(Breakpoint.order, function(OrderEntry): boolean
			-- upvalues: OrderEntry (copy)
			return OrderEntry == OrderEntry
		end) then Breakpoint.widths[UsePreviousResult] + 5 < X else X < Breakpoint.widths[OrderEntry] - 5) then
			UseStateResult2_1(OrderEntry)
		end
	end, {
		Breakpoint,
		UseStateResult.X,
		OrderEntry,
		UsePreviousResult
	})
	
	return UseStateResult1, UseStateResult
end