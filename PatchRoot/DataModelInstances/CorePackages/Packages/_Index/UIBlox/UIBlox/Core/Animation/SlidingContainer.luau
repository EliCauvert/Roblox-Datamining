-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent
local roactModule = require(parent_1.Parent.Roact)
local tModule = require(parent_1.Parent.t)
local slidingDirectionModule = require(parent.Enum.SlidingDirection)
local springAnimatedItemModule = require(parent_1.Utility.SpringAnimatedItem)
local t = { dampingRatio = 1, frequency = 4 }
local slidingContainer = roactModule.PureComponent:extend("SlidingContainer")
local t_1 = {
	[slidingDirectionModule.Up] = UDim2.new(0, 0, 1, 0),
	[slidingDirectionModule.Down] = UDim2.new(0, 0, -1, 0),
	[slidingDirectionModule.Left] = UDim2.new(1, 0, 0, 0),
	[slidingDirectionModule.Right] = UDim2.new(-1, 0, 0, 0)
}
slidingContainer.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.integer),
	onComplete = tModule.optional(tModule.callback),
	show = tModule.optional(tModule.boolean),
	slidingDirection = slidingDirectionModule.isEnumValue,
	springOptions = tModule.optional(tModule.table),
	[roactModule.Children] = tModule.optional(tModule.table)
})
slidingContainer.defaultProps = { springOptions = t }

function slidingContainer.render(p0) --[[ line: 45 ]]
	-- upvalues: roactModule (ref), springAnimatedItemModule (ref), t_1 (ref)
	local show = p0.props.show
	local slidingDirection = p0.props.slidingDirection
	
	return roactModule.createElement(springAnimatedItemModule.AnimatedFrame, {
		springOptions = p0.props.springOptions,
		animatedValues = { step = if show then 0 else 1 },
		mapValuesToProps = function(p1) --[[ line: 54 ]]
			-- upvalues: t_1 (copy), slidingDirection (ref)
			local var7 = t_1[slidingDirection]
			
			return {
				Position = UDim2.new(var7.X.Scale * p1.step, 0, var7.Y.Scale * p1.step, 0)
			}
		end,
		regularProps = {
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			Position = if show then t_1[slidingDirection] else UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0)
		},
		onComplete = p0.props.onComplete,
		[roactModule.Children] = p0.props[roactModule.Children]
	})
end

return slidingContainer