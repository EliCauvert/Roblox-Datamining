local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local getEasingNumberSequenceModule = require(momentsCommon.Utils.getEasingNumberSequence)
local useMemo = reactModule.useMemo
local t = {
	endingTransparency = 1,
	startingTransparency = 0.4,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.fromScale(0, 0)
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useMemo (ref), getEasingNumberSequenceModule (ref), reactModule (ref), view (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	
	return reactModule.createElement(view, {
		tag = "bg-contrast",
		AnchorPoint = var1.anchorPoint,
		Position = var1.position,
		Size = var1.size,
		ZIndex = var1.zIndex or 1
	}, {
		UIGradient = reactModule.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, var1.color3),
				ColorSequenceKeypoint.new(1, var1.color3)
			}),
			Rotation = var1.rotation,
			Transparency = useMemo(function()
				-- upvalues: getEasingNumberSequenceModule (copy), var1 (ref)
				return NumberSequence.new(getEasingNumberSequenceModule(var1.startingTransparency, var1.endingTransparency, 15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
			end, { var1.startingTransparency, var1.endingTransparency })
		})
	})
end