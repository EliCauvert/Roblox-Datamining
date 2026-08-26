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

local function _(p1, p2)
	if p1 == 0 then
		return 2
	end
	local maxValue = math.max(math.ceil(p2 / p1) + 1, 2)
	
	return if maxValue == maxValue then maxValue else 2
end

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useBinding (ref), useState (ref), useCallback (ref), reactModule (ref), foundationModule (ref), useEventConnection (ref), runService (ref)
	local var1
	local var2 = cryoModule.Dictionary.join(t, p1)
	local var3 = if var2.padding then var2.padding else useTokens().Margin.Large
	local var4 = var2.direction == Enum.TextDirection.LeftToRight
	local var5, var6 = useBinding(0)
	local var7, var8 = useState(Vector2.new(1e999, 1e999))
	local var9, var10 = useState(Vector2.new(1e999, 1e999))
	local var11 = var7.X + var3
	local var12 = useCallback(function(p2)
		-- upvalues: var8 (ref)
		var8(p2.AbsoluteSize)
	end, {})
	local var13 = useCallback(function(p2)
		-- upvalues: var10 (ref)
		var10(p2.AbsoluteSize)
	end, {})
	local t_1 = {}
	local x = var7.X
	local x_1 = var9.X
	
	if x == 0 then
		var1 = 2
	else
		local maxValue = math.max(math.ceil(x_1 / x) + 1, 2)
		var1 = if maxValue ~= maxValue then maxValue else 2
	end
	for i = 1, var1 do
		t_1[`Content{i}`] = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy",
			onAbsoluteSizeChanged = if i == 1 then var12 else nil,
			LayoutOrder = i
		}, var2.children)
	end
	useEventConnection(runService.Heartbeat, function(p2)
		-- upvalues: var2 (ref), var5 (ref), var11 (ref), var6 (ref)
		if var2.speed > 0 then
			local var14 = var5:getValue() + var2.speed * p2
			
			if var11 <= var14 then
				var14 -= var11
			end
			var6(var14)
		end
	end, { var2.speed, var11 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full auto-y clip",
		onAbsoluteSizeChanged = var13,
		LayoutOrder = var2.LayoutOrder
	}, {
		Scroller = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy row data-testid=scroller",
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var3)
			},
			Position = var5:map(function(p2)
				-- upvalues: var4 (ref)
				return if var4 then UDim2.new(0, p2 * -1, 0, 0) else UDim2.new(-1, p2, 0, 0)
			end)
		}, t_1)
	})
end