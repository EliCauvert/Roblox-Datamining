local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local animatedFrame = require(parent.UIBlox).Utility.SpringAnimatedItem.AnimatedFrame
local dashModule = require(parent.Dash)
local t = { dampingRatio = 1, frequency = 3.5 }

local function ExpandingFrame(p0) --[[ line: 38 ]]
	-- upvalues: reactModule (ref), animatedFrame (ref), t (ref)
	return reactModule.createElement(animatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p0.LayoutOrder,
			ClipsDescendants = true,
			ref = p0.frameRef,
			NextSelectionUp = p0.NextSelectionUp,
			NextSelectionDown = p0.NextSelectionDown,
			NextSelectionLeft = p0.NextSelectionLeft,
			NextSelectionRight = p0.NextSelectionRight,
			[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChanged
		},
		animatedValues = {
			yOffset = if p0.isExpanded then p0.Size.Y.Offset else 0,
			yScale = if p0.isExpanded then p0.Size.Y.Scale else 0
		},
		mapValuesToProps = function(p1) --[[ line: 58 ]]
			-- upvalues: p0 (ref)
			return {
				Size = UDim2.new(p0.Size.X.Scale, p0.Size.X.Offset, p1.yScale, p1.yOffset)
			}
		end,
		springOptions = t
	}, p0.children)
end

return reactModule.forwardRef(function(p2, p3) --[[ line: 68 ]]
	-- upvalues: reactModule (ref), ExpandingFrame (ref), dashModule (ref)
	return reactModule.createElement(ExpandingFrame, dashModule.join(p2, { frameRef = p3 }))
end)