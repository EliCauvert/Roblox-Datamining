local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local socialCommonModule = require(parent_1.SocialCommon)
local UIBloxModule = require(parent_1.UIBlox)
local reactUtilsModule = require(parent_1.ReactUtils)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local inputUtilities = socialCommonModule.Utils.InputUtilities
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEventConnection = reactUtilsModule.useEventConnection
local useStyle = UIBloxModule.Core.Style.useStyle
local carouselNavigatedModule = require(parent.Thunks.CarouselNavigated)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local cycleLeft = images["icons/actions/cycleLeft"]
local cycleRight = images["icons/actions/cycleRight"]

return function(p0) --[[ line: 39 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), reactModule (ref), constantsModule (ref), cycleLeft (ref), cycleRight (ref), inputUtilities (ref), eventNamesModule (ref), carouselNavigatedModule (ref), runService (ref), useEventConnection (ref), userInputService (ref), imageSetLabel (ref)
	local var11 = useAnalyticsModule()
	local var12 = useDispatch()
	local var13 = useStyle()
	local var14 = reactModule.useRef(nil)
	local var15 = p0.direction == constantsModule.CarouselDirection.Left
	local var16 = if var15 then Vector2.new(0, 0.5) else Vector2.new(1, 0.5)
	local var17 = if var15 then cycleLeft else cycleRight
	local var18 = if var15 then UDim2.fromScale(0, 0.5) else UDim2.fromScale(1, 0.5)
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: var14 (ref)
		return function() --[[ line: 53 ]]
			-- upvalues: var14 (copy)
			if var14.current then
				var14.current:Disconnect()
				var14.current = nil
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: p0 (ref), var14 (ref)
		if p0.isDisabled and var14.current then
			var14.current:Disconnect()
			var14.current = nil
		end
	end, { p0.isDisabled })
	local var19 = reactModule.useCallback(function(_, p1) --[[ line: 68 ]]
		-- upvalues: p0 (ref), inputUtilities (copy), var14 (ref), var11 (ref), eventNamesModule (copy), var12 (ref), carouselNavigatedModule (copy), runService (copy)
		if p0.isDisabled then return end
		if p1.UserInputState ~= Enum.UserInputState.Begin then return end
		if not inputUtilities.isActivationInput(p1) then return end
		if var14.current then
			var14.current:Disconnect()
			var14.current = nil
		end
		var11.fireEvent(eventNamesModule.CapturesCarouselNavigated, { direction = p0.direction })
		var12(carouselNavigatedModule(p0.direction))
		local currentTime = tick()
		local var22 = currentTime
		var14.current = runService.RenderStepped:Connect(function(_) --[[ line: 94 ]]
			-- upvalues: var22 (ref), currentTime (write), var11 (copy), eventNamesModule (copy), p0 (copy), var12 (copy), carouselNavigatedModule (copy)
			if math.max(0.5 / (tick() - var22), 0.15) < tick() - currentTime then
				var11.fireEvent(eventNamesModule.CapturesCarouselNavigated, { direction = p0.direction })
				var12(carouselNavigatedModule(p0.direction))
				currentTime = tick()
			end
		end)
	end, { p0.isDisabled })
	local var20 = reactModule.useCallback(function(_, p2) --[[ line: 108 ]]
		-- upvalues: inputUtilities (copy), var14 (ref)
		if inputUtilities.isActivationInput(p2) and var14.current then
			var14.current:Disconnect()
			var14.current = nil
		end
	end, {})
	useEventConnection(userInputService.InputEnded, function(p3) --[[ line: 117 ]]
		-- upvalues: inputUtilities (copy), var14 (ref)
		if inputUtilities.isActivationInput(p3) and var14.current then
			var14.current:Disconnect()
			var14.current = nil
		end
	end)
	
	return reactModule.createElement("TextButton", {
		AnchorPoint = var16,
		BackgroundTransparency = 1,
		Position = var18,
		Size = p0.Size,
		Text = "",
		ZIndex = p0.ZIndex,
		Visible = not p0.isDisabled,
		[reactModule.Event.InputBegan] = var19,
		[reactModule.Event.InputEnded] = var20
	}, {
		Arrow = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = var17,
			ImageColor3 = var13.Theme.IconEmphasis.Color,
			ImageTransparency = var13.Theme.IconEmphasis.Transparency,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(36, 36)
		})
	})
end