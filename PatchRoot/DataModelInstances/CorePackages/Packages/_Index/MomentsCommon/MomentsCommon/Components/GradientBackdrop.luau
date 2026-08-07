-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

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

return function(p0) --[[ line: 34 ]]
	-- upvalues: cryoModule (ref), t (ref), useMemo (ref), getEasingNumberSequenceModule (ref), reactModule (ref), view (ref)
	local var5 = cryoModule.Dictionary.union(t, p0)
	
	return reactModule.createElement(view, {
		tag = "bg-contrast",
		AnchorPoint = var5.anchorPoint,
		Position = var5.position,
		Size = var5.size,
		ZIndex = var5.zIndex or 1
	}, {
		UIGradient = reactModule.createElement("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, var5.color3),
				ColorSequenceKeypoint.new(1, var5.color3)
			}),
			Rotation = var5.rotation,
			Transparency = useMemo(function() --[[ line: 37 ]]
				-- upvalues: getEasingNumberSequenceModule (copy), var5 (ref)
				return NumberSequence.new(getEasingNumberSequenceModule(var5.startingTransparency, var5.endingTransparency, 15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
			end, { var5.startingTransparency, var5.endingTransparency })
		})
	})
end