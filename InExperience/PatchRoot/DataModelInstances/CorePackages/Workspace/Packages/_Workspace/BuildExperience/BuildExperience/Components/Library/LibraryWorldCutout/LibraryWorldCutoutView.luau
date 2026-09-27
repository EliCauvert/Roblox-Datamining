local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local isTapReleaseModule = require(script.Parent.isTapRelease)
local uDim2 = UDim2.new(1, 0, 0, 100000)
local t = {
	AspectRatio = 1.777777777778,
	DominantAxis = Enum.DominantAxis.Width
}

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), isTapReleaseModule (ref), view (ref), skeleton (ref), radius (ref), text (ref), uDim2 (ref), t (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local uDim = UDim.new(0, p1.inset)
	local var2 = reactModule.useRef(nil)
	local onActivated = p1.onActivated
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		testId = "Library.WorldCutout",
		LayoutOrder = p1.LayoutOrder
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center size-full-600",
			testId = "Library.WorldCutout.Header",
			padding = { left = uDim, right = uDim }
		}, {
			Title = if p1.isLoading then reactModule.createElement(skeleton, {
				testId = "Library.WorldCutout.TitleSkeleton",
				Size = UDim2.fromOffset(var1.Size.Size_2800, var1.Size.Size_600),
				radius = radius.Small
			}) else reactModule.createElement(text, {
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				testId = "Library.WorldCutout.Title",
				Text = p1.title
			})
		}),
		Cell = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y",
			padding = { left = uDim, right = uDim }
		}, {
			Window = if p1.isLoading then reactModule.createElement(view, {
				testId = "Library.WorldCutout.Skeleton",
				Size = uDim2,
				aspectRatio = t
			}, {
				Skeleton = reactModule.createElement(skeleton, { radius = radius.Medium })
			}) else reactModule.createElement(view, {
				tag = "radius-medium",
				testId = "Library.WorldCutout.Window",
				Size = uDim2,
				aspectRatio = t,
				backgroundStyle = { Transparency = 1 },
				onActivated = reactModule.useCallback(function(_, p2)
					-- upvalues: var2 (ref), isTapReleaseModule (copy), onActivated (ref)
					local current = var2.current
					var2.current = nil
					
					if isTapReleaseModule(current, p2) then
						onActivated()
					end
				end, { onActivated }),
				selection = { Selectable = true },
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.None
				},
				ref = p1.onRectChanged,
				onAbsolutePositionChanged = p1.onRectChanged,
				onAbsoluteSizeChanged = p1.onRectChanged
			}, {
				PressTracker = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					[reactModule.Event.InputBegan] = reactModule.useCallback(function(_, p2)
						-- upvalues: var2 (ref)
						if p2.UserInputType == Enum.UserInputType.Touch or p2.UserInputType == Enum.UserInputType.MouseButton1 then
							var2.current = p2.Position
						end
					end, {})
				})
			})
		})
	})
end