local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local UserInputService = require(Foundation.Utility.Wrappers).Services.UserInputService
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local GetVisualForKeyModule = require(script.Parent.getVisualForKey)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local CircularProgressBarModule = require(Foundation.Components.CircularProgressBar)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local EventConnection = require(Parent.ReactUtils).EventConnection
local config = { holdTime = 1, resetTime = 0.5 }
local config1 = { testId = "--foundation-key-label" }
local _Rect = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25))

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ReactOtterModule (copy), GetVisualForKeyModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ImageModule (copy), _Rect (copy), TextModule (copy), CircularProgressBarModule (copy), EventConnection (copy), UserInputService (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local WithDefaultsModuleResult1 = if WithDefaultsModuleResult.holdBehavior then WithDefaultsModule(WithDefaultsModuleResult.holdBehavior, config) else nil
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseAnimatedBindingResult = nil
	local Callback = nil
	local Callback
	UseAnimatedBindingResult, Callback = ReactOtterModule.useAnimatedBinding(0, function(p2)
		-- upvalues: WithDefaultsModuleResult1 (copy), UseStateResult (copy), Callback (ref), ReactOtterModule (upval), UseStateResult2 (copy)
		if WithDefaultsModuleResult1 and p2 == 1 and UseStateResult then
			Callback(ReactOtterModule.ease(0, {
				duration = WithDefaultsModuleResult1.resetTime,
				easingStyle = Enum.EasingStyle.Linear
			}))
			UseStateResult2(nil)
			WithDefaultsModuleResult1.onEndHold(true)
		end
	end)
	local VisualForKeyModule = GetVisualForKeyModule(WithDefaultsModuleResult.keyCode)
	local IsImage = VisualForKeyModule.keyVisualType == "Image"
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { Size = WithDefaultsModuleResult.Size, ref = Ref }), {
		Image = ReactModule.createElement(ImageModule, {
			tag = "position-center-center anchor-center-center",
			Image = if IsImage then VisualForKeyModule.key else "icons/controls/keys/key_single",
			Size = VisualForKeyModule.size,
			ScaleType = if IsImage then nil else Enum.ScaleType.Slice,
			imageStyle = if UseStateResult then UseTokensModuleResult.Color.Content.Emphasis else UseTokensModuleResult.Color.Content.Muted,
			slice = if IsImage then nil else { center = _Rect }
		}, {
			CustomPadding = if IsImage then nil else ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 3) }),
			Text = if IsImage then nil else ReactModule.createElement(TextModule, {
				tag = "size-full-full auto-xy text-body-medium text-align-x-center",
				Text = VisualForKeyModule.key,
				textStyle = if UseStateResult then UseTokensModuleResult.Color.Content.Emphasis else UseTokensModuleResult.Color.Content.Muted
			})
		}),
		Indicator = if WithDefaultsModuleResult1 and WithDefaultsModuleResult1.holdTime > 0 then ReactModule.createElement(CircularProgressBarModule, {
			tag = "size-full-full",
			progress = UseAnimatedBindingResult,
			testId = `{WithDefaultsModuleResult.testId}--indicator`
		}, {}) else nil,
		InputBeganConnection = if WithDefaultsModuleResult1 then ReactModule.createElement(EventConnection, {
			event = UserInputService.InputBegan,
			callback = function(Input)
				-- upvalues: UseStateResult (copy), WithDefaultsModuleResult (copy), WithDefaultsModuleResult1 (copy), UseStateResult2 (copy), Callback (ref), ReactOtterModule (upval), UseAnimatedBindingResult (ref)
				if UseStateResult then return end
				if Input.KeyCode == WithDefaultsModuleResult.keyCode then
					if WithDefaultsModuleResult1.onBeginHold then
						WithDefaultsModuleResult1.onBeginHold()
					end
					if WithDefaultsModuleResult1.holdTime == 0 then
						WithDefaultsModuleResult1.onEndHold(true)
						
						return
					end
					UseStateResult2(Input)
					Callback(ReactOtterModule.ease(1, {
						duration = (1 - UseAnimatedBindingResult:getValue()) * WithDefaultsModuleResult1.holdTime,
						easingStyle = Enum.EasingStyle.Linear
					}))
				end
			end
		}) else nil,
		InputEndedConnection = if WithDefaultsModuleResult1 then ReactModule.createElement(EventConnection, {
			event = UserInputService.InputEnded,
			callback = function(p2)
				-- upvalues: UseStateResult (copy), WithDefaultsModuleResult1 (copy), UseStateResult2 (copy), Callback (ref), ReactOtterModule (upval), UseAnimatedBindingResult (ref)
				if p2 == UseStateResult then
					if WithDefaultsModuleResult1.onEndHold then
						WithDefaultsModuleResult1.onEndHold(false)
					end
					UseStateResult2(nil)
					Callback(ReactOtterModule.ease(0, {
						duration = UseAnimatedBindingResult:getValue() * WithDefaultsModuleResult1.resetTime,
						easingStyle = Enum.EasingStyle.Linear
					}))
				end
			end
		}) else nil
	})
end))