-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:05 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local userInputService = require(foundation.Utility.Wrappers).Services.UserInputService
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local reactUtilsModule = require(parent.ReactUtils)
local getVisualForKeyModule = require(script.Parent.getVisualForKey)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local circularProgressBarModule = require(foundation.Components.CircularProgressBar)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local eventConnection = reactUtilsModule.EventConnection
local t = { holdTime = 1, resetTime = 0.5 }
local t_1 = { testId = "--foundation-key-label" }
local rect = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25))

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 53 | named "KeyLabel" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), t (ref), useTokensModule (ref), reactModule (ref), reactOtterModule (ref), getVisualForKeyModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), rect (ref), textModule (ref), circularProgressBarModule (ref), eventConnection (ref), userInputService (ref)
	local var15 = withDefaultsModule(p0, t_1)
	local var16 = if var15.holdBehavior then withDefaultsModule(var15.holdBehavior, t) else nil
	local var17 = useTokensModule()
	local var18, var19 = reactModule.useState(nil)
	local _ = nil
	local var20 = nil
	local var21, var22 = reactOtterModule.useAnimatedBinding(0, function(p2) --[[ line: 61 ]]
		-- upvalues: var16 (ref), var18 (ref), var20 (write), reactOtterModule (copy), var19 (ref)
		if var16 and p2 == 1 and var18 then
			var20(reactOtterModule.ease(0, {
				duration = var16.resetTime,
				easingStyle = Enum.EasingStyle.Linear
			}))
			var19(nil)
			var16.onEndHold(true)
		end
	end)
	local var23 = var21
	var20 = var22
	local var24 = getVisualForKeyModule(var15.keyCode)
	local isImage = var24.keyVisualType == "Image"
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, { Size = var15.Size, ref = p1 }), {
		Image = reactModule.createElement(imageModule, {
			tag = "position-center-center anchor-center-center",
			Image = if isImage then var24.key else "icons/controls/keys/key_single",
			Size = var24.size,
			ScaleType = if not isImage then Enum.ScaleType.Slice else nil,
			imageStyle = if var18 then var17.Color.Content.Emphasis else var17.Color.Content.Muted,
			slice = if not isImage then { center = rect } else nil
		}, {
			CustomPadding = if not isImage then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 3) }) else nil,
			Text = if not isImage then reactModule.createElement(textModule, {
				tag = "size-full-full auto-xy text-body-medium text-align-x-center",
				Text = var24.key,
				textStyle = if var18 then var17.Color.Content.Emphasis else var17.Color.Content.Muted
			}) else nil
		}),
		Indicator = if var16 and var16.holdTime > 0 then reactModule.createElement(circularProgressBarModule, {
			tag = "size-full-full",
			progress = var23,
			testId = `{var15.testId}--indicator`
		}, {}) else nil,
		InputBeganConnection = if var16 then reactModule.createElement(eventConnection, {
			event = userInputService.InputBegan,
			callback = function(p3) --[[ line: 121 ]]
				-- upvalues: var18 (ref), var15 (ref), var16 (ref), var19 (ref), var20 (write), reactOtterModule (copy), var23 (write)
				if var18 then return end
				if p3.KeyCode == var15.keyCode then
					if var16.onBeginHold then
						var16.onBeginHold()
					end
					if var16.holdTime == 0 then
						var16.onEndHold(true)
						
						return
					end
					var19(p3)
					var20(reactOtterModule.ease(1, {
						duration = (1 - var23:getValue()) * var16.holdTime,
						easingStyle = Enum.EasingStyle.Linear
					}))
				end
			end
		}) else nil,
		InputEndedConnection = if var16 then reactModule.createElement(eventConnection, {
			event = userInputService.InputEnded,
			callback = function(p4) --[[ line: 147 ]]
				-- upvalues: var18 (ref), var16 (ref), var19 (ref), var20 (write), reactOtterModule (copy), var23 (write)
				if p4 == var18 then
					if var16.onEndHold then
						var16.onEndHold(false)
					end
					var19(nil)
					var20(reactOtterModule.ease(0, {
						duration = var23:getValue() * var16.resetTime,
						easingStyle = Enum.EasingStyle.Linear
					}))
				end
			end
		}) else nil
	})
end))