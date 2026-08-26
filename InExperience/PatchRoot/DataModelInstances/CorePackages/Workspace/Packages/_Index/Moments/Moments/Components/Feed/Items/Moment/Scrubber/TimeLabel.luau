local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(script.Parent.Parent.Hooks.useMomentProgress)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

local function formatTime(p1)
	local maxValue = math.max(0, p1)
	
	return string.format("%d:%02d", math.floor(maxValue / 60), math.floor(maxValue % 60))
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), formatTime (ref), getColorStyleWithTransparencyModule (ref), reactModule (ref), text (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(text, {
		tag = "auto-xy text-label-medium content-emphasis",
		Text = p1.progress:map(function(p2)
			-- upvalues: formatTime (copy)
			local maxValue = math.max(0, p2.time)
			
			return string.format("%s / %s", string.format("%d:%02d", math.floor(maxValue / 60), math.floor(maxValue % 60)), formatTime(p2.duration))
		end),
		textStyle = p1.animationRatio:map(function(p2)
			-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
			return getColorStyleWithTransparencyModule(var1.Color.Content.Emphasis, 1 - p2)
		end),
		LayoutOrder = p1.LayoutOrder
	})
end)