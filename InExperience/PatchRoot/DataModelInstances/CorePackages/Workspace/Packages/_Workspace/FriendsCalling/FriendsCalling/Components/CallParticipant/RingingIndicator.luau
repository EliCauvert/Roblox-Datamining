local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local RunService = game:GetService("RunService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseEventConnectionFunction (copy), RunService (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	UseEventConnectionFunction(RunService.Heartbeat, function(p1)
		-- upvalues: UseBindingResult2 (copy), UseBindingResult (copy)
		UseBindingResult2((UseBindingResult:getValue() + p1) % 1.2)
	end)
	local Default = UseTokensResult.Color.Content.Default
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy)
		return UseBindingResult:map(function(p1: number): number
			return math.floor(p1 / 1.2 * 3) + 1
		end)
	end, { UseBindingResult })
	
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-xxsmall size-400-400",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), View (upval), UseMemoResult (copy), Default (copy)
		local Elements = {}
		
		for i = 1, 3 do
			Elements[`Dot{i}`] = ReactModule.createElement(View, {
				tag = "radius-circle",
				LayoutOrder = i,
				Size = UDim2.fromOffset(3, 3),
				backgroundStyle = UseMemoResult:map(function(LayoutOrder)
					-- upvalues: Default (upval), i (copy)
					return {
						Color3 = Default.Color3,
						Transparency = if LayoutOrder == i then Default.Transparency else 0.7
					}
				end)
			})
		end
		return Elements
	end, { UseMemoResult, Default })))
end