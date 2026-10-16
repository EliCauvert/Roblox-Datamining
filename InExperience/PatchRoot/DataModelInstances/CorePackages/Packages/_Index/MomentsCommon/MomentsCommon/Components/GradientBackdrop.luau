local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local GetEasingNumberSequenceModule = require(MomentsCommon.Utils.getEasingNumberSequence)
local UseMemoFunction = ReactModule.useMemo
local config = {
	endingTransparency = 1,
	startingTransparency = 0.4,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.fromScale(0, 0)
}

return function(p1) --[[ Line: 34 ]]
	-- upvalues: CryoModule (copy), config (copy), UseMemoFunction (copy), GetEasingNumberSequenceModule (copy), ReactModule (copy), View (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	
	return ReactModule.createElement(View, {
		tag = "bg-contrast",
		AnchorPoint = UnionResult.anchorPoint,
		Position = UnionResult.position,
		Size = UnionResult.size,
		ZIndex = UnionResult.zIndex or 1
	}, {
		UIGradient = ReactModule.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, UnionResult.color3),
				ColorSequenceKeypoint.new(1, UnionResult.color3)
			}),
			Rotation = UnionResult.rotation,
			Transparency = UseMemoFunction(function(): NumberSequence --[[ Line: 37 ]]
				-- upvalues: GetEasingNumberSequenceModule (upval), UnionResult (copy)
				return NumberSequence.new(GetEasingNumberSequenceModule(UnionResult.startingTransparency, UnionResult.endingTransparency, 15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
			end, {
				UnionResult.startingTransparency,
				UnionResult.endingTransparency
			})
		})
	})
end