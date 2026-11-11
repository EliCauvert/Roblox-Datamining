local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FeedContextModule = require(Parent.App.FeedContext)
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local ControlState = FoundationModule.Enums.ControlState
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseRefFunction = ReactModule.useRef
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ContentFeedLongPressThresholdMs = game:DefineFastInt("ContentFeedLongPressThresholdMs", 500)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FeedContextModule (copy), UseRefFunction (copy), ControlState (copy), ContentFeedLongPressThresholdMs (copy), View (copy), Image (copy), Icon (copy)
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(FeedContextModule)
	local UseRefResult = UseRefFunction(nil)
	
	return ReactModule.createElement(View, {
		tag = "radius-medium auto-xy padding-small bg-action-subtle",
		isDisabled = UseContextResult.isZooming,
		onStateChanged = ReactModule.useCallback(function(Default)
			-- upvalues: ControlState (upval), UseRefResult (copy), ContentFeedLongPressThresholdMs (upval), p1 (copy)
			if Default == ControlState.Pressed then
				UseRefResult.current = tick()
				task.delay(ContentFeedLongPressThresholdMs / 1000, function()
					-- upvalues: UseRefResult (upval), p1 (upval)
					if UseRefResult.current ~= nil then
						p1.onLongPress()
					end
				end)
				
				return
			end
			if Default == ControlState.Default then
				if UseRefResult.current == nil then return end
				UseRefResult.current = nil
				
				if tick() - (UseRefResult.current or 0) < ContentFeedLongPressThresholdMs / 1000 then
					p1.onShortPress()
				end
			end
		end, { p1.onLongPress, p1.onShortPress })
	}, {
		ReactIcon = if p1.activeReaction then ReactModule.createElement(Image, {
			ZIndex = 2,
			tag = "anchor-center-center position-center-center size-600-600",
			Image = p1.activeReaction
		}) else nil,
		ReactCTA = if p1.activeReaction then nil else ReactModule.createElement(Icon, {
			name = "icons/controls/emoteOff",
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			style = UseTokensResult.Color.ActionEmphasis.Foreground
		})
	})
end