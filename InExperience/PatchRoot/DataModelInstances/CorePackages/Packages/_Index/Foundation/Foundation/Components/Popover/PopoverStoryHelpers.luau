local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local OverlayModule = require(Foundation.Providers.Overlay)
local OverlayStoryAnchorModule = require(Foundation.Utility.Stories.Shared.OverlayStoryAnchor)
local PopoverModule = require(Foundation.Components.Popover)
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local RadiusModule = require(Foundation.Enums.Radius)
local SurfacePresetsModule = require(Foundation.Utility.Stories.Shared.SurfacePresets)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseMeasurableRefModule = require(Foundation.Components.Popover.useMeasurableRef)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local TALLSIZE = OverlayStoryAnchorModule.TALL_SIZE
local NewOffset = TALLSIZE.Y.Offset + 240
local _UDim2 = UDim2.fromOffset(120, 52)
local _Vector2 = Vector2.new(120, 52)
local _UDim2_1 = UDim2.fromScale(0.5, 0.5)
local _Vector2_1 = Vector2.new(0.5, 0.5)
local _UDim2_2 = UDim2.fromOffset(12, 12)
local ZeroVector = Vector2.zero
local _UDim2_3 = UDim2.new(0.5, 0, 0.5, -(TALLSIZE.Y.Offset / 2 + 8))
local _Vector2_2 = Vector2.new(0.5, 1)

local function AnchorTarget(p1) --[[ Line: 192 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), _UDim2_1 (copy), _Vector2_1 (copy), _UDim2 (copy), TextModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = "row align-x-center align-y-center radius-medium stroke-neutral bg-surface-300",
		Position = _UDim2_1,
		AnchorPoint = _Vector2_1,
		Size = _UDim2,
		ref = p1.instanceRef
	}, {
		Label = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-small text-align-x-center content-muted",
			Text = p1.label
		})
	})
end

local function PopoverPanel(p1) --[[ Line: 215 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = "row align-x-center align-y-center padding-small",
		Size = UDim2.fromOffset(160, 96)
	}, {
		Label = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-small text-align-x-center content-default",
			Text = p1.label or "Panel"
		})
	})
end

local function PanelSlot(Frame) --[[ Line: 233 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = "row align-x-center align-y-center radius-small bg-shift-200",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, Frame.height)
	}, {
		Label = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-small content-muted",
			Text = Frame.label
		})
	})
end

local function useCenteredRect(Frame: Frame, p1) --[[ Line: 278 ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	ReactModule.useEffect(function() --[[ Line: 281 ]]
		-- upvalues: Frame (copy), UseStateResult2 (copy), p1 (copy)
		if Frame == nil then return end
		local function update() --[[ Line: 286 ]]
			-- upvalues: UseStateResult2 (upval), Frame (upval), p1 (upval)
			UseStateResult2(Frame.AbsolutePosition + (Frame.AbsoluteSize - p1) / 2)
		end
		
		UseStateResult2(Frame.AbsolutePosition + (Frame.AbsoluteSize - p1) / 2)
		local Connection = Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(update)
		local Connection1 = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
		
		return function() --[[ Line: 294 ]]
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, { Frame, p1 })
	
	return UseStateResult
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
	ANCHOR_SOURCE_ORDER = { "Children", "ExternalRef", "VirtualRef" },
	SIDE_ORDER = {
		PopoverSideModule.Top,
		PopoverSideModule.Bottom,
		PopoverSideModule.Left,
		PopoverSideModule.Right
	},
	ALIGN_ORDER = {
		PopoverAlignModule.Start,
		PopoverAlignModule.Center,
		PopoverAlignModule.End
	},
	RADIUS_ORDER = {
		RadiusModule.Small,
		RadiusModule.Medium,
		RadiusModule.Circle
	},
	COMPOSITION_ORDER = { "Body", "Title + body", "Title + body + actions" },
	makePanelChildren = function(p1) --[[ Line: 255 ]]
		-- upvalues: ReactModule (copy), ViewModule (copy), PanelSlot (copy)
		local IsNotBody = p1 ~= "Body"
		local IsTitleBodyActions = p1 == "Title + body + actions"
		
		return ReactModule.createElement(ViewModule, {
			tag = "col gap-small auto-y padding-medium",
			Size = UDim2.fromOffset(240, 0)
		}, {
			Title = if IsNotBody then ReactModule.createElement(PanelSlot, { LayoutOrder = 1, label = "Title", height = 20 }) else nil,
			Body = ReactModule.createElement(PanelSlot, { LayoutOrder = 2, label = "Body", height = 56 }),
			Actions = if IsTitleBodyActions then ReactModule.createElement(PanelSlot, { LayoutOrder = 3, label = "Actions", height = 32 }) else nil
		})
	end,
	BACKGROUND_PRESET_ORDER = { "Default", "Surface_0", "Surface_300", "ActionEmphasis" },
	OFFSET_OPTIONS = { 0, 8, 16, 32 },
	STAGE_HEIGHT = NewOffset,
	WIDE_STAGE_WIDTH = TALLSIZE.X.Offset + 368,
	TALL_ANCHOR_SIZE = TALLSIZE,
	PLAYGROUND_FRAME_SIZE = UDim2.new(1, 0, 0, NewOffset),
	PLAYGROUND_TAG = OverlayStoryAnchorModule.PLAYGROUND_TAG,
	PopoverStage = function(Frame) --[[ Line: 328 ]]
		-- upvalues: ReactModule (copy), useCenteredRect (copy), _Vector2 (copy), UseMeasurableRefModule (copy), OverlayStoryAnchorModule (copy), _UDim2_2 (copy), ZeroVector (copy), PopoverModule (copy), _UDim2_1 (copy), _Vector2_1 (copy), PopoverPanel (copy), AnchorTarget (copy), TextModule (copy), _UDim2_3 (copy), _Vector2_2 (copy), ViewModule (copy), NewOffset (copy), OverlayModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
		local AnchorSource = Frame.anchorSource or "Children"
		local UseRefResult = ReactModule.useRef(nil)
		local UseMeasurableRefModuleResult = UseMeasurableRefModule(useCenteredRect(UseStateResult1, _Vector2), _Vector2)
		local UseRefResult1 = if AnchorSource == "ExternalRef" then UseRefResult elseif AnchorSource == "VirtualRef" then UseMeasurableRefModuleResult else nil
		local Element = ReactModule.createElement(OverlayStoryAnchorModule.Anchor, {
			Position = if UseRefResult1 then _UDim2_2 else nil,
			AnchorPoint = if UseRefResult1 then ZeroVector else nil,
			Size = Frame.anchorSize,
			onActivated = function() --[[ Line: 345 ]]
				-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
				UseStateResult2(not UseStateResult)
			end
		})
		local config = {
			Target = if AnchorSource == "ExternalRef" then ReactModule.createElement(AnchorTarget, { label = "Target (instance)", instanceRef = UseRefResult }) elseif AnchorSource == "VirtualRef" then ReactModule.createElement(AnchorTarget, { label = "Target (virtual)" }) else nil,
			Popover = ReactModule.createElement(PopoverModule.Root, { isOpen = UseStateResult }, {
				Anchor = if UseRefResult1 then ReactModule.createElement(PopoverModule.Anchor, { anchorRef = UseRefResult1 }) else ReactModule.createElement(PopoverModule.Anchor, { Position = _UDim2_1, AnchorPoint = _Vector2_1 }, { Anchor = Element }),
				Content = ReactModule.createElement(PopoverModule.Content, {
					side = Frame.side,
					align = Frame.align,
					hasArrow = Frame.hasArrow,
					radius = Frame.radius,
					backgroundStyle = Frame.backgroundStyle,
					onPressedOutside = if Frame.hasOutsidePressDismiss then function() --[[ Line: 364 ]]
						-- upvalues: UseStateResult2 (copy)
						UseStateResult2(false)
					end else nil
				}, ReactModule.createElement(PopoverPanel, {}))
			}),
			Trigger = if UseRefResult1 then Element else nil,
			OpenState = if Frame.hasOpenStateLabel then ReactModule.createElement(TextModule, {
				tag = "auto-xy text-caption-small content-muted",
				Text = `isOpen = {UseStateResult}`,
				Position = _UDim2_3,
				AnchorPoint = _Vector2_2
			}) else nil
		}
		
		return ReactModule.createElement(ViewModule, {
			tag = "radius-medium bg-surface-200",
			Size = UDim2.fromOffset(Frame.width or 280, Frame.height or NewOffset),
			LayoutOrder = Frame.LayoutOrder,
			ref = UseStateResult2_1
		}, {
			Overlay = if UseStateResult1 then ReactModule.createElement(OverlayModule, { gui = UseStateResult1 }, {
				Fill = ReactModule.createElement(ViewModule, { tag = "size-full" }, config)
			}) else nil
		})
	end,
	PopoverTarget = function(Frame) --[[ Line: 425 ]]
		-- upvalues: ReactModule (copy), PopoverModule (copy), OverlayStoryAnchorModule (copy), PopoverPanel (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		
		return ReactModule.createElement(PopoverModule.Root, { isOpen = UseStateResult }, {
			Anchor = ReactModule.createElement(PopoverModule.Anchor, { LayoutOrder = Frame.LayoutOrder }, {
				Anchor = ReactModule.createElement(OverlayStoryAnchorModule.Anchor, {
					Size = Frame.anchorSize,
					onActivated = function() --[[ Line: 432 ]]
						-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
						UseStateResult2(not UseStateResult)
					end
				})
			}),
			Content = ReactModule.createElement(PopoverModule.Content, {
				side = Frame.side,
				align = Frame.align,
				hasArrow = Frame.hasArrow,
				radius = Frame.radius,
				backgroundStyle = Frame.backgroundStyle,
				onPressedOutside = function() --[[ Line: 443 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end
			}, Frame.panel or ReactModule.createElement(PopoverPanel, {}))
		})
	end,
	headerLabels = function(p1) --[[ Line: 454 ]]
		-- upvalues: DashModule (copy)
		return DashModule.map(p1, function(p2): string --[[ Line: 455 ]]
			return (tostring(p2))
		end)
	end,
	useBackgroundStylePreset = function(p1) --[[ Line: 460 ]]
		-- upvalues: UseTokensModule (copy), SurfacePresetsModule (copy)
		local UseTokensModuleResult = UseTokensModule()
		
		return if p1 == "ActionEmphasis" then UseTokensModuleResult.Color.ActionEmphasis.Background else SurfacePresetsModule.resolveSurfacePreset(UseTokensModuleResult, p1)
	end
}