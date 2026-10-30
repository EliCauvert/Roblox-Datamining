local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local ReactionModule = require(Reactions.Components.Reaction)
local ReactionSizeModule = require(Reactions.Enums.ReactionSize)
local _ = require(Reactions.Enums.ReactionType)
local ControlState = FoundationModule.Enums.ControlState
local View = FoundationModule.View
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _Vector2 = Vector2.new(0.5, 0.5)
local config = { frequency = 4, dampingRatio = 0.65 }
local config1 = { frequency = 4, dampingRatio = 1 }

local function _(Frame: Frame)
	return Frame.AbsolutePosition + Frame.AbsoluteSize / 2
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), ReactModule (copy), ControlState (copy), ReactOtterModule (copy), config1 (copy), config (copy), View (copy), _Vector2 (copy), ReactionModule (copy), ReactionSizeModule (copy)
	local UseTokensResult = UseTokensFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		return {
			radius = UDim.new(0, UseTokensResult.Radius.Circle),
			offset = UseTokensResult.Size.Size_150,
			borderWidth = UseTokensResult.Stroke.Thicker
		}
	end, { UseTokensResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(Hover)
		-- upvalues: UseStateResult2 (copy), ControlState (upval)
		UseStateResult2(Hover == ControlState.Hover)
	end, {})
	local IsIsHovered = p1.isHovered == true or UseStateResult
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: IsIsHovered (copy), ReducedMotion (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config1 (upval)
		local v1: number = if IsIsHovered then 1 else 0
		
		if ReducedMotion then
			UseAnimatedBindingResult2((ReactOtterModule.instant(v1)))
			
			return
		else
			UseAnimatedBindingResult2((ReactOtterModule.spring(v1, config1)))
		end
	end, { IsIsHovered, ReducedMotion })
	local EntryDelay = p1.entryDelay
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(if EntryDelay == nil then 1 else 0)
	ReactModule.useEffect(function()
		-- upvalues: EntryDelay (copy), ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), config (upval)
		if EntryDelay == nil or ReducedMotion then
			UseAnimatedBindingResult2_1((ReactOtterModule.instant(1)))
			
			return nil
		else
			local DelayedThread = task.delay(EntryDelay, function()
				-- upvalues: UseAnimatedBindingResult2_1 (upval), ReactOtterModule (upval), config (upval)
				UseAnimatedBindingResult2_1((ReactOtterModule.spring(1, config)))
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		end
	end, { EntryDelay, ReducedMotion })
	local JoinBindingsResult = ReactModule.joinBindings({
		entry = UseAnimatedBindingResult1,
		hover = UseAnimatedBindingResult
	})
	local OnActivatedFunction = p1.onActivated
	
	return ReactModule.createElement(View, {
		tag = {
			["size-1000-1000 radius-circle"] = true,
			["bg-surface-300"] = p1.isActive == true
		},
		onActivated = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: OnActivatedFunction (copy)
			OnActivatedFunction(Frame.AbsolutePosition + Frame.AbsoluteSize / 2)
		end, { OnActivatedFunction }),
		onStateChanged = UseResult,
		cursor = UseMemoResult,
		LayoutOrder = p1.layoutOrder,
		ref = p1.buttonRef,
		testId = p1.testId
	}, {
		Glyph = ReactModule.createElement(View, {
			tag = "auto-xy",
			ZIndex = 2,
			Position = JoinBindingsResult:map(function(p2): UDim2
				return UDim2.new(0.5, 0, 0.5, (1 - p2.entry) * 12 - p2.hover * 8)
			end),
			AnchorPoint = _Vector2,
			scale = JoinBindingsResult:map(function(p2)
				return p2.entry * (p2.hover * 0.1 + 1)
			end),
			testId = if p1.testId then `{p1.testId}--glyph` else nil
		}, {
			Reaction = ReactModule.createElement(ReactionModule, {
				reactionType = p1.reactionType,
				size = p1.reactionSize or ReactionSizeModule.Small,
				testId = if p1.testId then `{p1.testId}--reaction` else nil
			})
		})
	})
end)