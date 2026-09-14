local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local overlayModule = require(foundation.Providers.Overlay)
local overlayStoryAnchorModule = require(foundation.Utility.Stories.Shared.OverlayStoryAnchor)
local popoverModule = require(foundation.Components.Popover)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local surfacePresetsModule = require(foundation.Utility.Stories.Shared.SurfacePresets)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useMeasurableRefModule = require(foundation.Components.Popover.useMeasurableRef)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local list = { "Children", "ExternalRef", "VirtualRef" }
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
	radiusModule.Small,
	radiusModule.Medium,
	radiusModule.Circle
}
local list_4 = { "Body", "Title + body", "Title + body + actions" }
local list_5 = { "Default", "Surface_0", "Surface_300", "ActionEmphasis" }
local list_6 = { 0, 8, 16, 32 }
local TALL_SIZE = overlayStoryAnchorModule.TALL_SIZE
local var1 = TALL_SIZE.Y.Offset + 240
local var2 = TALL_SIZE.X.Offset + 368
local uDim2 = UDim2.fromOffset(120, 52)
local vector2 = Vector2.new(120, 52)
local uDim2_1 = UDim2.fromScale(0.5, 0.5)
local vector2_1 = Vector2.new(0.5, 0.5)
local uDim2_2 = UDim2.fromOffset(12, 12)
local zero = Vector2.zero
local uDim2_3 = UDim2.new(0.5, 0, 0.5, -(TALL_SIZE.Y.Offset / 2 + 8))
local vector2_2 = Vector2.new(0.5, 1)
local PLAYGROUND_TAG = overlayStoryAnchorModule.PLAYGROUND_TAG
local uDim2_4 = UDim2.new(1, 0, 0, var1)

local function AnchorTarget(p1)
	-- upvalues: reactModule (ref), viewModule (ref), uDim2_1 (ref), vector2_1 (ref), uDim2 (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "row align-x-center align-y-center radius-medium stroke-neutral bg-surface-300",
		Position = uDim2_1,
		AnchorPoint = vector2_1,
		Size = uDim2,
		ref = p1.instanceRef
	}, {
		Label = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-small text-align-x-center content-muted",
			Text = p1.label
		})
	})
end

local function PopoverPanel(p1)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "row align-x-center align-y-center padding-small",
		Size = UDim2.fromOffset(160, 96)
	}, {
		Label = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-small text-align-x-center content-default",
			Text = p1.label or "Panel"
		})
	})
end

local function PanelSlot(p1)
	-- upvalues: reactModule (ref), viewModule (ref), textModule (ref)
	return reactModule.createElement(viewModule, {
		tag = "row align-x-center align-y-center radius-small bg-shift-200",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p1.height)
	}, {
		Label = reactModule.createElement(textModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-small content-muted",
			Text = p1.label
		})
	})
end

local function useCenteredRect(p1, p2)
	-- upvalues: reactModule (ref)
	local var3, var4 = reactModule.useState(Vector2.zero)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), p2 (ref)
		if p1 == nil then
			return
		end
		local function update()
			-- upvalues: var4 (copy), p1 (copy), p2 (copy)
			var4(p1.AbsolutePosition + (p1.AbsoluteSize - p2) / 2)
		end
		
		var4(p1.AbsolutePosition + (p1.AbsoluteSize - p2) / 2)
		local var5 = p1:GetPropertyChangedSignal("AbsolutePosition"):Connect(update)
		local var6 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function()
			-- upvalues: var5 (ref), var6 (ref)
			var5:Disconnect()
			var6:Disconnect()
		end
	end, { p1, p2 })
	
	return var3
end

return {
	ANCHOR_SOURCE_CHILDREN = "Children",
	ANCHOR_SOURCE_EXTERNAL_REF = "ExternalRef",
	ANCHOR_SOURCE_VIRTUAL_REF = "VirtualRef",
	BACKGROUND_PRESET_DEFAULT = "Default",
	BACKGROUND_PRESET_EMPHASIS = "ActionEmphasis",
	SIDE_OFFSET_EXAMPLE = 16,
	ALIGN_OFFSET_EXAMPLE = 32,
	STAGE_WIDTH = 280,
	PAGE_TAG = "col gap-xxlarge size-full-0 auto-y padding-y-large bg-surface-0",
	MATRIX_SECTION_TAG = "col gap-large size-full-0 auto-y",
	ANCHOR_SOURCE_ORDER = list,
	SIDE_ORDER = list_1,
	ALIGN_ORDER = list_2,
	RADIUS_ORDER = list_3,
	COMPOSITION_ORDER = list_4,
	makePanelChildren = function(p1)
		-- upvalues: reactModule (ref), viewModule (ref), PanelSlot (ref)
		return reactModule.createElement(viewModule, {
			tag = "col gap-small auto-y padding-medium",
			Size = UDim2.fromOffset(240, 0)
		}, {
			Title = if p1 ~= "Body" then reactModule.createElement(PanelSlot, { LayoutOrder = 1, label = "Title", height = 20 }) else nil,
			Body = reactModule.createElement(PanelSlot, { LayoutOrder = 2, label = "Body", height = 56 }),
			Actions = if p1 == "Title + body + actions" then reactModule.createElement(PanelSlot, { LayoutOrder = 3, label = "Actions", height = 32 }) else nil
		})
	end,
	BACKGROUND_PRESET_ORDER = list_5,
	OFFSET_OPTIONS = list_6,
	STAGE_HEIGHT = var1,
	WIDE_STAGE_WIDTH = var2,
	TALL_ANCHOR_SIZE = TALL_SIZE,
	PLAYGROUND_FRAME_SIZE = uDim2_4,
	PLAYGROUND_TAG = PLAYGROUND_TAG,
	PopoverStage = function(p1)
		-- upvalues: reactModule (ref), useCenteredRect (ref), vector2 (ref), useMeasurableRefModule (ref), overlayStoryAnchorModule (ref), uDim2_2 (ref), zero (ref), popoverModule (ref), uDim2_1 (ref), vector2_1 (ref), PopoverPanel (ref), AnchorTarget (ref), textModule (ref), uDim2_3 (ref), vector2_2 (ref), viewModule (ref), var1 (ref), overlayModule (ref)
		local var3, var4 = reactModule.useState(false)
		local var5, var6 = reactModule.useState(nil)
		local anchorSource = p1.anchorSource or "Children"
		local var7 = reactModule.useRef(nil)
		local var8 = if anchorSource == "ExternalRef" then var7 elseif anchorSource == "VirtualRef" then useMeasurableRefModule(useCenteredRect(var5, vector2), vector2) else nil
		local var9 = reactModule.createElement(overlayStoryAnchorModule.Anchor, {
			Position = if var8 then uDim2_2 else nil,
			AnchorPoint = if var8 then zero else nil,
			Size = p1.anchorSize,
			onActivated = function()
				-- upvalues: var4 (ref), var3 (ref)
				var4(not var3)
			end
		})
		
		return reactModule.createElement(viewModule, {
			tag = "radius-medium bg-surface-200",
			Size = UDim2.fromOffset(p1.width or 280, p1.height or var1),
			LayoutOrder = p1.LayoutOrder,
			ref = var6
		}, {
			Overlay = if var5 then reactModule.createElement(overlayModule, { gui = var5 }, {
				Fill = reactModule.createElement(viewModule, { tag = "size-full" }, {
					Target = if anchorSource == "ExternalRef" then reactModule.createElement(AnchorTarget, { label = "Target (instance)", instanceRef = var7 }) elseif anchorSource == "VirtualRef" then reactModule.createElement(AnchorTarget, { label = "Target (virtual)" }) else nil,
					Popover = reactModule.createElement(popoverModule.Root, { isOpen = var3 }, {
						Anchor = if var8 then reactModule.createElement(popoverModule.Anchor, { anchorRef = var8 }) else reactModule.createElement(popoverModule.Anchor, { Position = uDim2_1, AnchorPoint = vector2_1 }, { Anchor = var9 }),
						Content = reactModule.createElement(popoverModule.Content, {
							side = p1.side,
							align = p1.align,
							hasArrow = p1.hasArrow,
							radius = p1.radius,
							backgroundStyle = p1.backgroundStyle,
							onPressedOutside = if p1.hasOutsidePressDismiss then function()
								-- upvalues: var4 (ref)
								var4(false)
							end else nil
						}, reactModule.createElement(PopoverPanel, {}))
					}),
					Trigger = if var8 then var9 else nil,
					OpenState = if p1.hasOpenStateLabel then reactModule.createElement(textModule, {
						tag = "auto-xy text-caption-small content-muted",
						Text = `isOpen = {var3}`,
						Position = uDim2_3,
						AnchorPoint = vector2_2
					}) else nil
				})
			}) else nil
		})
	end,
	PopoverTarget = function(p1)
		-- upvalues: reactModule (ref), popoverModule (ref), overlayStoryAnchorModule (ref), PopoverPanel (ref)
		local var3, var4 = reactModule.useState(false)
		
		return reactModule.createElement(popoverModule.Root, { isOpen = var3 }, {
			Anchor = reactModule.createElement(popoverModule.Anchor, { LayoutOrder = p1.LayoutOrder }, {
				Anchor = reactModule.createElement(overlayStoryAnchorModule.Anchor, {
					Size = p1.anchorSize,
					onActivated = function()
						-- upvalues: var4 (ref), var3 (ref)
						var4(not var3)
					end
				})
			}),
			Content = reactModule.createElement(popoverModule.Content, {
				side = p1.side,
				align = p1.align,
				hasArrow = p1.hasArrow,
				radius = p1.radius,
				backgroundStyle = p1.backgroundStyle,
				onPressedOutside = function()
					-- upvalues: var4 (ref)
					var4(false)
				end
			}, p1.panel or reactModule.createElement(PopoverPanel, {}))
		})
	end,
	headerLabels = function(p1)
		-- upvalues: dashModule (ref)
		return dashModule.map(p1, function(p2)
			return tostring(p2)
		end)
	end,
	useBackgroundStylePreset = function(value)
		-- upvalues: useTokensModule (ref), surfacePresetsModule (ref)
		local var3 = useTokensModule()
		
		return if value == "ActionEmphasis" then var3.Color.ActionEmphasis.Background else surfacePresetsModule.resolveSurfacePreset(var3, value)
	end
}