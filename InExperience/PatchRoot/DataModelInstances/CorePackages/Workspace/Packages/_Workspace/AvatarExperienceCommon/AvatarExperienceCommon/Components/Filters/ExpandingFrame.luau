local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local animatedFrame = require(parent.UIBlox).Utility.SpringAnimatedItem.AnimatedFrame
local dashModule = require(parent.Dash)
local t = { dampingRatio = 1, frequency = 3.5 }

local function ExpandingFrame(p1)
	-- upvalues: reactModule (ref), animatedFrame (ref), t (ref)
	return reactModule.createElement(animatedFrame, {
		regularProps = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.LayoutOrder,
			ClipsDescendants = true,
			ref = p1.frameRef,
			NextSelectionUp = p1.NextSelectionUp,
			NextSelectionDown = p1.NextSelectionDown,
			NextSelectionLeft = p1.NextSelectionLeft,
			NextSelectionRight = p1.NextSelectionRight,
			[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
		},
		animatedValues = {
			yOffset = if p1.isExpanded then p1.Size.Y.Offset else 0,
			yScale = if p1.isExpanded then p1.Size.Y.Scale else 0
		},
		mapValuesToProps = function(p2)
			-- upvalues: p1 (ref)
			return {
				Size = UDim2.new(p1.Size.X.Scale, p1.Size.X.Offset, p2.yScale, p2.yOffset)
			}
		end,
		springOptions = t
	}, p1.children)
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), ExpandingFrame (ref), dashModule (ref)
	return reactModule.createElement(ExpandingFrame, dashModule.join(p1, { frameRef = p2 }))
end)