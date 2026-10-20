local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local InputSizeModule = require(Foundation.Enums.InputSize)
local MenuModule = require(Foundation.Components.Menu)
local OverlayModule = require(Foundation.Providers.Overlay)
local OverlayStoryAnchorModule = require(Foundation.Utility.Stories.Shared.OverlayStoryAnchor)
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local list = {
	{ id = "option-1", text = "Option 1" },
	{ id = "option-2", text = "Option 2" }
}
local Offset: number = OverlayStoryAnchorModule.DEFAULT_SIZE.Y.Offset
local YOffset = Offset + 224
local _UDim2 = UDim2.new(0.5, 0, 0.5, -(Offset / 2 + 8))

return {
	MATRIX_SECTION_TAG = "col gap-large size-full-0 auto-y",
	PAGE_TAG = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0",
	ALIGN_ORDER = {
		PopoverAlignModule.Start,
		PopoverAlignModule.Center,
		PopoverAlignModule.End
	},
	MenuStage = function(Frame)
		-- upvalues: ReactModule (copy), MenuModule (copy), list (copy), OverlayStoryAnchorModule (copy), ViewModule (copy), YOffset (copy), OverlayModule (copy), TextModule (copy), _UDim2 (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
		local Element = ReactModule.createElement(MenuModule, {
			isOpen = UseStateResult,
			items = Frame.items or list,
			size = Frame.size,
			width = Frame.width,
			maxHeight = Frame.maxHeight,
			side = Frame.side,
			align = Frame.align,
			onPressedOutside = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end,
			onActivated = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}, {
			Anchor = ReactModule.createElement(OverlayStoryAnchorModule.Anchor, {
				onActivated = function()
					-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
					UseStateResult2(not UseStateResult)
				end
			})
		})
		
		return ReactModule.createElement(ViewModule, {
			tag = "radius-medium bg-surface-200",
			LayoutOrder = Frame.LayoutOrder,
			Size = UDim2.fromOffset(292, YOffset),
			ref = UseStateResult2_1
		}, {
			Overlay = if UseStateResult1 then ReactModule.createElement(OverlayModule, { gui = UseStateResult1 }, {
				Fill = ReactModule.createElement(ViewModule, { tag = "size-full" }, {
					Menu = ReactModule.createElement(ViewModule, {
						tag = "auto-xy",
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, { Content = Element }),
					OpenState = if Frame.hasOpenStateLabel then ReactModule.createElement(TextModule, {
						tag = "auto-xy text-caption-small content-muted",
						Text = `isOpen = {UseStateResult}`,
						Position = _UDim2,
						AnchorPoint = Vector2.new(0.5, 1)
					}) else nil
				})
			}) else nil
		})
	end,
	MenuTarget = function(Frame)
		-- upvalues: ReactModule (copy), MenuModule (copy), list (copy), OverlayStoryAnchorModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		
		return ReactModule.createElement(MenuModule, {
			LayoutOrder = Frame.LayoutOrder,
			isOpen = UseStateResult,
			items = Frame.items or list,
			size = Frame.size,
			width = Frame.width,
			maxHeight = Frame.maxHeight,
			side = Frame.side,
			align = Frame.align,
			onPressedOutside = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end,
			onActivated = function(p1)
				-- upvalues: Frame (copy), UseStateResult2 (copy)
				if Frame.onActivated then
					Frame.onActivated(p1)
				end
				UseStateResult2(false)
			end
		}, {
			Anchor = ReactModule.createElement(OverlayStoryAnchorModule.Anchor, {
				Size = Frame.anchorSize,
				onActivated = function()
					-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
					UseStateResult2(not UseStateResult)
				end
			})
		})
	end,
	PLAYGROUND_FRAME_SIZE = OverlayStoryAnchorModule.PLAYGROUND_FRAME_SIZE,
	PLAYGROUND_TAG = OverlayStoryAnchorModule.PLAYGROUND_TAG,
	SAMPLE_ITEMS = list,
	SIDE_ORDER = {
		PopoverSideModule.Top,
		PopoverSideModule.Bottom,
		PopoverSideModule.Left,
		PopoverSideModule.Right
	},
	SIZE_ORDER = {
		InputSizeModule.XSmall,
		InputSizeModule.Small,
		InputSizeModule.Medium,
		InputSizeModule.Large
	},
	TALL_ANCHOR_SIZE = OverlayStoryAnchorModule.TALL_SIZE,
	headerLabels = function(p1)
		-- upvalues: DashModule (copy)
		return DashModule.map(p1, function(p2): string
			return (tostring(p2))
		end)
	end
}