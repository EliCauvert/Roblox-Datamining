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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), t (ref), useTokensModule (ref), reactModule (ref), reactOtterModule (ref), getVisualForKeyModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), rect (ref), textModule (ref), circularProgressBarModule (ref), eventConnection (ref), userInputService (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = if var1.holdBehavior then withDefaultsModule(var1.holdBehavior, t) else nil
	local var3 = useTokensModule()
	local var4, var5 = reactModule.useState(nil)
	local _ = nil
	local var6 = nil
	local var7, var8 = reactOtterModule.useAnimatedBinding(0, function(p3)
		-- upvalues: var2 (ref), var4 (ref), var6 (write), reactOtterModule (copy), var5 (ref)
		if var2 and p3 == 1 and var4 then
			var6(reactOtterModule.ease(0, {
				duration = var2.resetTime,
				easingStyle = Enum.EasingStyle.Linear
			}))
			var5(nil)
			var2.onEndHold(true)
		end
	end)
	local var9 = var7
	var6 = var8
	local var10 = getVisualForKeyModule(var1.keyCode)
	local isImage = var10.keyVisualType == "Image"
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { Size = var1.Size, ref = p2 }), {
		Image = reactModule.createElement(imageModule, {
			tag = "position-center-center anchor-center-center",
			Image = if isImage then var10.key else "icons/controls/keys/key_single",
			Size = var10.size,
			ScaleType = if not isImage then Enum.ScaleType.Slice else nil,
			imageStyle = if var4 then var3.Color.Content.Emphasis else var3.Color.Content.Muted,
			slice = if not isImage then { center = rect } else nil
		}, {
			CustomPadding = if not isImage then reactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 3) }) else nil,
			Text = if not isImage then reactModule.createElement(textModule, {
				tag = "size-full-full auto-xy text-body-medium text-align-x-center",
				Text = var10.key,
				textStyle = if var4 then var3.Color.Content.Emphasis else var3.Color.Content.Muted
			}) else nil
		}),
		Indicator = if var2 and var2.holdTime > 0 then reactModule.createElement(circularProgressBarModule, {
			tag = "size-full-full",
			progress = var9,
			testId = `{var1.testId}--indicator`
		}, {}) else nil,
		InputBeganConnection = if var2 then reactModule.createElement(eventConnection, {
			event = userInputService.InputBegan,
			callback = function(p3)
				-- upvalues: var4 (ref), var1 (ref), var2 (ref), var5 (ref), var6 (write), reactOtterModule (copy), var9 (write)
				if var4 then return end
				if p3.KeyCode == var1.keyCode then
					if var2.onBeginHold then
						var2.onBeginHold()
					end
					if var2.holdTime == 0 then
						var2.onEndHold(true)
						
						return
					end
					var5(p3)
					var6(reactOtterModule.ease(1, {
						duration = (1 - var9:getValue()) * var2.holdTime,
						easingStyle = Enum.EasingStyle.Linear
					}))
				end
			end
		}) else nil,
		InputEndedConnection = if var2 then reactModule.createElement(eventConnection, {
			event = userInputService.InputEnded,
			callback = function(p3)
				-- upvalues: var4 (ref), var2 (ref), var5 (ref), var6 (write), reactOtterModule (copy), var9 (write)
				if p3 == var4 then
					if var2.onEndHold then
						var2.onEndHold(false)
					end
					var5(nil)
					var6(reactOtterModule.ease(0, {
						duration = var9:getValue() * var2.resetTime,
						easingStyle = Enum.EasingStyle.Linear
					}))
				end
			end
		}) else nil
	})
end))