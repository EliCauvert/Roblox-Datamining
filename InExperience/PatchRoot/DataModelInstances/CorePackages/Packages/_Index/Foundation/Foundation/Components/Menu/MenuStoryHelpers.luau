local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local inputSizeModule = require(foundation.Enums.InputSize)
local menuModule = require(foundation.Components.Menu)
local overlayModule = require(foundation.Providers.Overlay)
local overlayStoryAnchorModule = require(foundation.Utility.Stories.Shared.OverlayStoryAnchor)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local list = {
	inputSizeModule.XSmall,
	inputSizeModule.Small,
	inputSizeModule.Medium,
	inputSizeModule.Large
}
local list_1 = {
	popoverSideModule.Top,
	popoverSideModule.Bottom,
	popoverSideModule.Left,
	popoverSideModule.Right
}
local list_2 = {
	popoverAlignModule.Start,
	popoverAlignModule.Center,
	popoverAlignModule.End
}
local list_3 = {
	{ id = "option-1", text = "Option 1" },
	{ id = "option-2", text = "Option 2" }
}
local PLAYGROUND_FRAME_SIZE = overlayStoryAnchorModule.PLAYGROUND_FRAME_SIZE
local PLAYGROUND_TAG = overlayStoryAnchorModule.PLAYGROUND_TAG
local TALL_SIZE = overlayStoryAnchorModule.TALL_SIZE
local offset = overlayStoryAnchorModule.DEFAULT_SIZE.Y.Offset
local var1 = offset + 224
local uDim2 = UDim2.new(0.5, 0, 0.5, -(offset / 2 + 8))

return {
	MATRIX_SECTION_TAG = "col gap-large size-full-0 auto-y",
	PAGE_TAG = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0",
	ALIGN_ORDER = list_2,
	MenuStage = function(p1)
		-- upvalues: reactModule (ref), menuModule (ref), list_3 (ref), overlayStoryAnchorModule (ref), viewModule (ref), var1 (ref), overlayModule (ref), textModule (ref), uDim2 (ref)
		local var2, var3 = reactModule.useState(false)
		local var4, var5 = reactModule.useState(nil)
		
		return reactModule.createElement(viewModule, {
			tag = "radius-medium bg-surface-200",
			LayoutOrder = p1.LayoutOrder,
			Size = UDim2.fromOffset(292, var1),
			ref = var5
		}, {
			Overlay = if var4 then reactModule.createElement(overlayModule, { gui = var4 }, {
				Fill = reactModule.createElement(viewModule, { tag = "size-full" }, {
					Menu = reactModule.createElement(viewModule, {
						tag = "auto-xy",
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						Content = reactModule.createElement(menuModule, {
							isOpen = var2,
							items = p1.items or list_3,
							size = p1.size,
							width = p1.width,
							maxHeight = p1.maxHeight,
							side = p1.side,
							align = p1.align,
							onPressedOutside = function()
								-- upvalues: var3 (ref)
								var3(false)
							end,
							onActivated = function()
								-- upvalues: var3 (ref)
								var3(false)
							end
						}, {
							Anchor = reactModule.createElement(overlayStoryAnchorModule.Anchor, {
								onActivated = function()
									-- upvalues: var3 (ref), var2 (ref)
									var3(not var2)
								end
							})
						})
					}),
					OpenState = if p1.hasOpenStateLabel then reactModule.createElement(textModule, {
						tag = "auto-xy text-caption-small content-muted",
						Text = `isOpen = {var2}`,
						Position = uDim2,
						AnchorPoint = Vector2.new(0.5, 1)
					}) else nil
				})
			}) else nil
		})
	end,
	MenuTarget = function(p1)
		-- upvalues: reactModule (ref), menuModule (ref), list_3 (ref), overlayStoryAnchorModule (ref)
		local var2, var3 = reactModule.useState(false)
		
		return reactModule.createElement(menuModule, {
			LayoutOrder = p1.LayoutOrder,
			isOpen = var2,
			items = p1.items or list_3,
			size = p1.size,
			width = p1.width,
			maxHeight = p1.maxHeight,
			side = p1.side,
			align = p1.align,
			onPressedOutside = function()
				-- upvalues: var3 (ref)
				var3(false)
			end,
			onActivated = function(p2)
				-- upvalues: p1 (ref), var3 (ref)
				if p1.onActivated then
					p1.onActivated(p2)
				end
				var3(false)
			end
		}, {
			Anchor = reactModule.createElement(overlayStoryAnchorModule.Anchor, {
				Size = p1.anchorSize,
				onActivated = function()
					-- upvalues: var3 (ref), var2 (ref)
					var3(not var2)
				end
			})
		})
	end,
	PLAYGROUND_FRAME_SIZE = PLAYGROUND_FRAME_SIZE,
	PLAYGROUND_TAG = PLAYGROUND_TAG,
	SAMPLE_ITEMS = list_3,
	SIDE_ORDER = list_1,
	SIZE_ORDER = list,
	TALL_ANCHOR_SIZE = TALL_SIZE,
	headerLabels = function(p1)
		-- upvalues: dashModule (ref)
		return dashModule.map(p1, function(p2)
			return tostring(p2)
		end)
	end
}