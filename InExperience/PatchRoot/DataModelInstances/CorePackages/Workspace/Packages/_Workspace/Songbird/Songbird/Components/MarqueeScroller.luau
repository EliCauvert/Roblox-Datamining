local songbird = script:FindFirstAncestor("Songbird")
local runService = game:GetService("RunService")
local cryoModule = require(songbird.Parent.Cryo)
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local useCallback = reactModule.useCallback
local useBinding = reactModule.useBinding
local useState = reactModule.useState
local useTokens = foundationModule.Hooks.useTokens
local useEventConnection = reactUtilsModule.useEventConnection
local t = { speed = 20, direction = Enum.TextDirection.LeftToRight }

local function _(p0, p1)
	if p0 == 0 then
		return 2
	end
	local maxValue = math.max(math.ceil(p1 / p0) + 1, 2)
	
	return if maxValue == maxValue then maxValue else 2
end

return function(p2)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useBinding (ref), useState (ref), useCallback (ref), reactModule (ref), foundationModule (ref), useEventConnection (ref), runService (ref)
	local var21
	local var8 = cryoModule.Dictionary.join(t, p2)
	local var9 = if var8.padding then var8.padding else useTokens().Margin.Large
	local var10 = var8.direction == Enum.TextDirection.LeftToRight
	local var11, var12 = useBinding(0)
	local var13, var14 = useState(Vector2.new(1e999, 1e999))
	local var15, var16 = useState(Vector2.new(1e999, 1e999))
	local var17 = var13.X + var9
	local var18 = useCallback(function(p3)
		-- upvalues: var14 (ref)
		var14(p3.AbsoluteSize)
	end, {})
	local var19 = useCallback(function(p4)
		-- upvalues: var16 (ref)
		var16(p4.AbsoluteSize)
	end, {})
	local t_1 = {}
	local x = var13.X
	local x_1 = var15.X
	
	if x == 0 then
		var21 = 2
	else
		local maxValue = math.max(math.ceil(x_1 / x) + 1, 2)
		var21 = if maxValue ~= maxValue then maxValue else 2
	end
	for i = 1, var21 do
		t_1[`Content{i}`] = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy",
			onAbsoluteSizeChanged = if i == 1 then var18 else nil,
			LayoutOrder = i
		}, var8.children)
	end
	useEventConnection(runService.Heartbeat, function(p5)
		-- upvalues: var8 (ref), var11 (ref), var17 (ref), var12 (ref)
		if var8.speed > 0 then
			local var23 = var11:getValue() + var8.speed * p5
			
			if var17 <= var23 then
				var23 -= var17
			end
			var12(var23)
		end
	end, { var8.speed, var17 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full auto-y clip",
		onAbsoluteSizeChanged = var19,
		LayoutOrder = var8.LayoutOrder
	}, {
		Scroller = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy row data-testid=scroller",
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var9)
			},
			Position = var11:map(function(p6)
				-- upvalues: var10 (ref)
				return if var10 then UDim2.new(0, p6 * -1, 0, 0) else UDim2.new(-1, p6, 0, 0)
			end)
		}, t_1)
	})
end