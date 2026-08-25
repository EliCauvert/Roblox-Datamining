local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local usePreferences = foundationModule.Hooks.usePreferences
local usePulseBinding = foundationModule.Hooks.usePulseBinding
local useTokens = foundationModule.Hooks.useTokens
local useClock = reactUtilsModule.useClock
local color3 = Color3.new(1, 1, 1)

local function generateShimmerGradient(p0)
	local var5 = p0:Lerp(Color3.new(0, 0, 0), 0.2)
	
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, p0),
		ColorSequenceKeypoint.new(0.25, var5),
		ColorSequenceKeypoint.new(0.5, p0:Lerp(Color3.new(1, 1, 1), 0.8)),
		ColorSequenceKeypoint.new(0.75, var5),
		ColorSequenceKeypoint.new(1, p0)
	})
end

return function(p1)
	-- upvalues: usePreferences (ref), useTokens (ref), useClock (ref), usePulseBinding (ref), reactModule (ref), generateShimmerGradient (ref), color3 (ref)
	local var6 = usePreferences()
	local var7 = useTokens()
	local var8 = useClock()
	local var9 = usePulseBinding(0.75)
	local var10 = if p1.animationSpeed ~= nil then 0.75 else math.max(p1.animationSpeed, 0)
	local var11 = if p1.gradientOffset == nil or p1.gradientOffset <= 0 then 1.05 else p1.gradientOffset
	local default = var7.Color.Content.Default
	local textStyle = p1.textStyle or default
	local color3_1 = textStyle.Color3 or default.Color3
	local transparency = textStyle.Transparency or default.Transparency
	
	return if p1.isShimmerEnabled == false then { children = p1.children, textStyle = p1.textStyle } elseif var6.reducedMotion then {
		children = p1.children,
		textStyle = var9:map(function(p3)
			-- upvalues: color3_1 (ref), transparency (ref)
			return {
				Color3 = color3_1,
				Transparency = math.min(transparency + p3 * 0.1, 1)
			}
		end)
	} else {
		children = {
			Content = reactModule.createElement(reactModule.Fragment, nil, p1.children),
			ShimmerGradient = reactModule.createElement("UIGradient", {
				Rotation = 15,
				Color = reactModule.useMemo(function()
					-- upvalues: generateShimmerGradient (copy), color3_1 (ref)
					return generateShimmerGradient(color3_1)
				end, { color3_1 }),
				Offset = var8:map(function(p2)
					-- upvalues: var10 (ref), var11 (ref)
					return Vector2.new(p2 * var10 % var11 - var11 / 2, 0)
				end)
			})
		},
		textStyle = { Color3 = color3, Transparency = transparency }
	}
end