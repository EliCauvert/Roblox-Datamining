local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)

return {
	getBubbleMaxWidth = function(p1, p2, p3): number
		local Size3000: number = p1.Size.Size_3000
		
		return if p3 then Size3000 * 3 elseif p2 then Size3000 * 2 else Size3000
	end,
	getBubblePaddingX = function(p1)
		return p1.Padding.Medium
	end,
	getBubbleContentMaxWidth = function(p1, p2, p3): number
		local Size3000: number = p1.Size.Size_3000
		
		return (math.max(0, (if p3 then Size3000 * 3 elseif p2 then Size3000 * 2 else Size3000) - p1.Padding.Medium * 2))
	end,
	useBubbleMaxWidth = function(): number
		-- upvalues: FoundationModule (copy), ResponsiveModule (copy)
		local UseBreakpointXOrLargerResult = ResponsiveModule.useBreakpointXOrLarger(ResponsiveModule.Keys.Medium)
		local Size3000: number = FoundationModule.Hooks.useTokens().Size.Size_3000
		
		return if ResponsiveModule.useBreakpointXOrLarger(ResponsiveModule.Keys.Large) then Size3000 * 3 elseif UseBreakpointXOrLargerResult then Size3000 * 2 else Size3000
	end,
	useBubbleContentMaxWidth = function(): number
		-- upvalues: FoundationModule (copy), ResponsiveModule (copy)
		local UseTokensResult = FoundationModule.Hooks.useTokens()
		local UseBreakpointXOrLargerResult = ResponsiveModule.useBreakpointXOrLarger(ResponsiveModule.Keys.Medium)
		local Size3000: number = UseTokensResult.Size.Size_3000
		
		return (math.max(0, (if ResponsiveModule.useBreakpointXOrLarger(ResponsiveModule.Keys.Large) then Size3000 * 3 elseif UseBreakpointXOrLargerResult then Size3000 * 2 else Size3000) - UseTokensResult.Padding.Medium * 2))
	end
}