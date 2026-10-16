local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.Parent.Hooks.useMomentProgress)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function formatTime(Duration: number): string --[[ Line: 13 ]]
	local Largest = math.max(0, Duration)
	
	return string.format("%d:%02d", math.floor(Largest / 60), (math.floor(Largest % 60)))
end

return ReactModule.memo(function(Frame) --[[ Line: 28 | Named "TimeLabel" ]]
	-- upvalues: UseTokensFunction (copy), formatTime (copy), GetColorStyleWithTransparencyModule (copy), ReactModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Text, {
		tag = "auto-xy text-label-medium content-emphasis",
		Text = Frame.progress:map(function(p1): string --[[ Line: 31 ]]
			-- upvalues: formatTime (upval)
			local Largest = math.max(0, p1.time)
			
			return string.format("%s / %s", string.format("%d:%02d", math.floor(Largest / 60), (math.floor(Largest % 60))), formatTime(p1.duration))
		end),
		textStyle = Frame.animationRatio:map(function(p1: number) --[[ Line: 35 ]]
			-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
			return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Content.Emphasis, 1 - p1)
		end),
		LayoutOrder = Frame.LayoutOrder
	})
end)