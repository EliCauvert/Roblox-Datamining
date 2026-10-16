local Songbird = script:FindFirstAncestor("Songbird")
local RunService = game:GetService("RunService")
local CryoModule = require(Songbird.Parent.Cryo)
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseBindingFunction = ReactModule.useBinding
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseEventConnectionFunction = require(Songbird.Parent.ReactUtils).useEventConnection
local config = { speed = 20, direction = Enum.TextDirection.LeftToRight }

local function _(p1, p2): number --[[ Line: 31 | Named "calculateInstances" ]]
	if p1 == 0 then
		return 2
	else
		local Largest = math.max(math.ceil(p2 / p1) + 1, 2)
		
		return if Largest == Largest then Largest else 2
	end
end

return function(p1) --[[ Line: 45 | Named "MarqueeScroller" ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseBindingFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), ReactModule (copy), FoundationModule (copy), UseEventConnectionFunction (copy), RunService (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = UseTokensFunction()
	local Padding = if JoinResult.padding then JoinResult.padding else UseTokensResult.Margin.Large
	local IsDirectionMatch = JoinResult.direction == Enum.TextDirection.LeftToRight
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(0)
	local UseStateResult, UseStateResult2 = UseStateFunction(Vector2.new(1e999, 1e999))
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(Vector2.new(1e999, 1e999))
	local NewX = UseStateResult.X + Padding
	local UseCallbackResult = UseCallbackFunction(function(Frame) --[[ Line: 57 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function(Frame) --[[ Line: 61 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize)
	end, {})
	local Elements = {}
	local X = UseStateResult.X
	local X1 = UseStateResult1.X
	local v1 = nil
	
	if X == 0 then
		v1 = 2
	else
		local Largest = math.max(math.ceil(X1 / X) + 1, 2)
		v1 = if Largest == Largest then Largest else 2
	end
	for i = 1, v1 do
		local config1 = {
			tag = "auto-xy",
			onAbsoluteSizeChanged = if i == 1 then UseCallbackResult else nil
		}
		config1.LayoutOrder = i
		Elements[`Content{i}`] = ReactModule.createElement(FoundationModule.View, config1, JoinResult.children)
	end
	UseEventConnectionFunction(RunService.Heartbeat, function(p2) --[[ Line: 76 ]]
		-- upvalues: JoinResult (copy), UseBindingResult (copy), NewX (copy), UseBindingResult2 (copy)
		if JoinResult.speed > 0 then
			local NewValue = UseBindingResult:getValue() + JoinResult.speed * p2
			
			if NewX <= NewValue then
				NewValue -= NewX
			end
			UseBindingResult2(NewValue)
		end
	end, { JoinResult.speed, NewX })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full auto-y clip",
		onAbsoluteSizeChanged = UseCallbackResult1,
		LayoutOrder = JoinResult.LayoutOrder
	}, {
		Scroller = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy row data-testid=scroller",
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Padding)
			},
			Position = UseBindingResult:map(function(XOffset: number): UDim2 --[[ Line: 97 ]]
				-- upvalues: IsDirectionMatch (copy)
				return if IsDirectionMatch then UDim2.new(0, XOffset * -1, 0, 0) else UDim2.new(-1, XOffset, 0, 0)
			end)
		}, Elements)
	})
end