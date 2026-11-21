local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactionsModule = require(Parent.Reactions)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMessageReactionPickerStoreModule = require(AppChat.Stores.GetMessageReactionPickerStore)
local FocusedBubbleContextModule = require(script.Parent.Parent.Bubble.FocusedBubbleContext)
local MessageReactionChipModule = require(script.Parent.MessageReactionChip)
local GetFocusedMessageOffsetModule = require(script.Parent.Parent.Utils.getFocusedMessageOffset)
local UseMessageReactionPickerViewModelModule = require(script.Parent.useMessageReactionPickerViewModel)
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local _Vector2 = Vector2.new(1, 0)
local config = {
	frequency = 3,
	dampingRatio = 1,
	restingVelocityLimit = 0.05,
	restingPositionLimit = 0.0005
}

local function ignorePress() end

local function _(Frame: Frame, p1, Frame1): Vector2
	return Vector2.new(Frame.AbsolutePosition.X + (if p1 then 0 else Frame.AbsoluteSize.X), Frame.AbsolutePosition.Y) - Frame1.AbsolutePosition
end

local function toScale(p1, AreaSize): UDim2
	local Vector = p1 / AreaSize
	
	return UDim2.fromScale(Vector.X, Vector.Y)
end

local _ = function(p1)
	local Parent = p1.Parent
	
	return if Parent == nil or not Parent:IsA("GuiObject") then nil else Parent
end

local function OpenReactionPickerContent(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), UseMessageReactionPickerViewModelModule (copy), GetFocusedMessageOffsetModule (copy), toScale (copy), _Vector2 (copy), ReactRobloxModule (copy), StateLayerAffordance (copy), GetMessageReactionPickerStoreModule (copy), FocusedBubbleContextModule (copy), MessageReactionChipModule (copy), ignorePress (copy), ReactionsModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local OpenPicker = p1.openPicker
	local IsOpen = p1.isOpen
	local OnClosedFunction = p1.onClosed
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (ReactModule.useCallback(function(p2)
		-- upvalues: OnClosedFunction (copy)
		if p2 == 0 then
			OnClosedFunction()
		end
	end, { OnClosedFunction })))
	ReactModule.useEffect(function()
		-- upvalues: IsOpen (copy), ReducedMotion (copy), ReactOtterModule (upval), config (upval), UseAnimatedBindingResult2 (copy)
		local v1: number = if IsOpen then 1 else 0
		UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(v1) else ReactOtterModule.spring(v1, config))
	end, { IsOpen, ReducedMotion })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: OpenPicker (copy), p1 (copy), UseTokensResult (copy), GetFocusedMessageOffsetModule (upval)
		local Bubble = OpenPicker.bubble
		local VectorDelta = Vector2.new(Bubble.AbsolutePosition.X + (if OpenPicker.isIncoming then 0 else Bubble.AbsoluteSize.X), Bubble.AbsolutePosition.Y) - p1.overlay.AbsolutePosition
		local Current = p1.messageAreaRef.current
		local AbsolutePositionDelta = if Current then Current.AbsolutePosition - p1.overlay.AbsolutePosition else Vector2.zero
		local AbsoluteSize = if Current then Current.AbsoluteSize else p1.overlay.AbsoluteSize
		local Parent = Bubble.Parent
		local Parent1 = if Parent == nil or not Parent:IsA("GuiObject") then nil else Parent
		
		return {
			homePosition = VectorDelta,
			openPosition = Vector2.new(if OpenPicker.isIncoming then AbsolutePositionDelta.X + UseTokensResult.Padding.XLarge else VectorDelta.X - UseTokensResult.Padding.XSmall, VectorDelta.Y + math.max(GetFocusedMessageOffsetModule(VectorDelta.Y, Bubble.AbsoluteSize.Y, UseTokensResult.Size.Size_1000 + 2 * UseTokensResult.Padding.Small + UseTokensResult.Size.Size_300, UseTokensResult.Padding.Large, AbsolutePositionDelta.Y + AbsoluteSize.Y), AbsolutePositionDelta.Y - VectorDelta.Y)),
			slot = Parent1,
			slotOffset = if Parent1 then VectorDelta - (Vector2.new(Parent1.AbsolutePosition.X + (if OpenPicker.isIncoming then 0 else Parent1.AbsoluteSize.X), Parent1.AbsolutePosition.Y) - p1.overlay.AbsolutePosition) else Vector2.zero,
			areaPosition = AbsolutePositionDelta,
			areaSize = AbsoluteSize,
			bubbleSize = Bubble.AbsoluteSize
		}
	end, {
		OpenPicker,
		p1.overlay,
		p1.messageAreaRef,
		UseTokensResult
	})
	local IsOpen1 = UseMemoResult.openPosition ~= UseMemoResult.homePosition and IsOpen
	local Vector = if OpenPicker.isIncoming then nil else _Vector2
	local AreaPositionRatio = UseMemoResult.areaPosition / p1.overlay.AbsoluteSize
	local _UDim2 = UDim2.fromScale(AreaPositionRatio.X, AreaPositionRatio.Y)
	local AreaSizeRatio = UseMemoResult.areaSize / p1.overlay.AbsoluteSize
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Overlay = ReactRobloxModule.createPortal({
			ReactionPickerBackdrop = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full",
				ZIndex = 1,
				testId = "MessageReactionPickerBackdrop",
				backgroundStyle = ReactModule.useMemo(function()
					-- upvalues: UseTokensResult (copy), UseAnimatedBindingResult (copy)
					local Backdrop = UseTokensResult.Color.Common.Backdrop
					
					return UseAnimatedBindingResult:map(function(Alpha: number)
						-- upvalues: Backdrop (copy)
						return {
							Color3 = Backdrop.Color3,
							Transparency = math.lerp(1, Backdrop.Transparency, Alpha)
						}
					end)
				end, { UseTokensResult, UseAnimatedBindingResult }),
				stateLayer = { affordance = StateLayerAffordance.None },
				onActivated = GetMessageReactionPickerStoreModule(false).closePicker,
				isDisabled = not IsOpen
			}),
			ReactionPickerBarAnchor = ReactModule.createElement(FoundationModule.View, {
				Position = UDim2.fromOffset(UseMemoResult.openPosition.X, UseMemoResult.openPosition.Y),
				Size = UDim2.fromOffset(UseMemoResult.bubbleSize.X, UseMemoResult.bubbleSize.Y),
				AnchorPoint = Vector,
				ref = UseStateResult2
			}),
			ReactionPickerArea = ReactModule.createElement(FoundationModule.View, {
				tag = "clip",
				ZIndex = 2,
				Position = _UDim2,
				Size = UDim2.fromScale(AreaSizeRatio.X, AreaSizeRatio.Y)
			}, {
				ReactionPickerBubble = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy",
					testId = "MessageReactionPickerBubble",
					Position = ReactModule.useMemo(function()
						-- upvalues: UseMemoResult (copy), UseAnimatedBindingResult (copy), IsOpen (copy), OpenPicker (copy), p1 (copy), toScale (upval)
						local Slot = UseMemoResult.slot
						
						return UseAnimatedBindingResult:map(function(Alpha)
							-- upvalues: IsOpen (upval), Slot (copy), UseMemoResult (upval), OpenPicker (upval), p1 (upval), toScale (upval)
							local HomePosition = if IsOpen or Slot == nil then UseMemoResult.homePosition else Vector2.new(Slot.AbsolutePosition.X + (if OpenPicker.isIncoming then 0 else Slot.AbsoluteSize.X), Slot.AbsolutePosition.Y) - p1.overlay.AbsolutePosition + UseMemoResult.slotOffset
							local Interpolated = HomePosition:Lerp(UseMemoResult.openPosition, Alpha)
							local OpenPosition = if IsOpen then UseMemoResult.openPosition else HomePosition
							
							if (Interpolated - OpenPosition).Magnitude < 0.5 then
								Interpolated = OpenPosition
							end
							return toScale(Interpolated - UseMemoResult.areaPosition, UseMemoResult.areaSize)
						end)
					end, {
						UseAnimatedBindingResult,
						UseMemoResult,
						IsOpen,
						OpenPicker,
						p1.overlay
					}),
					AnchorPoint = Vector
				}, {
					Message = ReactModule.createElement(FoundationModule.View, {
						tag = {
							["col auto-xy"] = true,
							["align-x-left"] = OpenPicker.isIncoming,
							["align-x-right"] = not OpenPicker.isIncoming
						}
					}, {
						Bubble = ReactModule.createElement(FocusedBubbleContextModule.Provider, {
							value = ReactModule.useMemo(function()
								-- upvalues: IsOpen1 (copy)
								return { isUngrouped = IsOpen1 }
							end, { IsOpen1 })
						}, OpenPicker.renderBubble()),
						ReactionChip = ReactModule.createElement(MessageReactionChipModule, {
							layoutOrder = 1,
							isDisabled = true,
							conversationId = OpenPicker.conversationId,
							messageId = OpenPicker.messageId,
							isIncoming = OpenPicker.isIncoming
						})
					}),
					InputShield = ReactModule.createElement(FoundationModule.View, {
						tag = "size-full",
						ZIndex = 2,
						testId = "MessageReactionPickerBubbleShield",
						stateLayer = { affordance = StateLayerAffordance.None },
						onActivated = ignorePress
					})
				})
			})
		}, p1.overlay),
		Picker = ReactModule.createElement(ReactionsModule.ReactionPickerPopover, (UseMessageReactionPickerViewModelModule(OpenPicker, IsOpen, (ReactModule.useMemo(function()
			-- upvalues: UseStateResult (copy)
			return { current = UseStateResult }
		end, { UseStateResult })))))
	})
end

local function OpenReactionPicker(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), OpenReactionPickerContent (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	
	return if UseOverlayResult == nil then nil else ReactModule.createElement(OpenReactionPickerContent, {
		messageAreaRef = p1.messageAreaRef,
		openPicker = p1.openPicker,
		isOpen = p1.isOpen,
		onClosed = p1.onClosed,
		overlay = UseOverlayResult
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: GetMessageReactionPickerStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), OpenReactionPicker (copy)
	local MessageReactionPickerStoreModule = GetMessageReactionPickerStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(MessageReactionPickerStoreModule.getOpenPicker)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(MessageReactionPickerStoreModule.getShownPicker)
	
	return if UseSignalStateResult1 == nil then nil else ReactModule.createElement(OpenReactionPicker, {
		messageAreaRef = p1.messageAreaRef,
		openPicker = UseSignalStateResult1,
		isOpen = UseSignalStateResult ~= nil,
		onClosed = MessageReactionPickerStoreModule.onPickerClosed
	})
end)