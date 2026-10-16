local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local RoactModule = require(Parent1.Parent.Roact)
local TModule = require(Parent1.Parent.t)
local SlidingDirectionModule = require(Parent.Enum.SlidingDirection)
local SpringAnimatedItemModule = require(Parent1.Utility.SpringAnimatedItem)
local SlidingContainer = RoactModule.PureComponent:extend("SlidingContainer")
local config = {
	[SlidingDirectionModule.Up] = UDim2.new(0, 0, 1, 0),
	[SlidingDirectionModule.Down] = UDim2.new(0, 0, -1, 0),
	[SlidingDirectionModule.Left] = UDim2.new(1, 0, 0, 0),
	[SlidingDirectionModule.Right] = UDim2.new(-1, 0, 0, 0)
}
SlidingContainer.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.integer),
	onComplete = TModule.optional(TModule.callback),
	show = TModule.optional(TModule.boolean),
	slidingDirection = SlidingDirectionModule.isEnumValue,
	springOptions = TModule.optional(TModule.table),
	[RoactModule.Children] = TModule.optional(TModule.table)
})
SlidingContainer.defaultProps = { springOptions = { dampingRatio = 1, frequency = 4 } }

function SlidingContainer.render(p1) --[[ Line: 45 ]]
	-- upvalues: RoactModule (copy), SpringAnimatedItemModule (copy), config (copy)
	local Show = p1.props.show
	local SlidingDirection = p1.props.slidingDirection
	
	return RoactModule.createElement(SpringAnimatedItemModule.AnimatedFrame, {
		springOptions = p1.props.springOptions,
		animatedValues = { step = if Show then 0 else 1 },
		mapValuesToProps = function(p2) --[[ Line: 54 ]]
			-- upvalues: config (upval), SlidingDirection (copy)
			local Entry = config[SlidingDirection]
			
			return {
				Position = UDim2.new(Entry.X.Scale * p2.step, 0, Entry.Y.Scale * p2.step, 0)
			}
		end,
		regularProps = {
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			Position = Show and config[SlidingDirection] or UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0)
		},
		onComplete = p1.props.onComplete,
		[RoactModule.Children] = p1.props[RoactModule.Children]
	})
end

return SlidingContainer