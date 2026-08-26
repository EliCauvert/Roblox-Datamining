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

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), reactModule (ref), constantsModule (ref), cycleLeft (ref), cycleRight (ref), inputUtilities (ref), eventNamesModule (ref), carouselNavigatedModule (ref), runService (ref), useEventConnection (ref), userInputService (ref), imageSetLabel (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useStyle()
	local var4 = reactModule.useRef(nil)
	local var5 = p1.direction == constantsModule.CarouselDirection.Left
	local var6 = if var5 then Vector2.new(0, 0.5) else Vector2.new(1, 0.5)
	local var7 = if var5 then cycleLeft else cycleRight
	local var8 = if var5 then UDim2.fromScale(0, 0.5) else UDim2.fromScale(1, 0.5)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		return function()
			-- upvalues: var4 (copy)
			if var4.current then
				var4.current:Disconnect()
				var4.current = nil
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		if p1.isDisabled and var4.current then
			var4.current:Disconnect()
			var4.current = nil
		end
	end, { p1.isDisabled })
	local var9 = reactModule.useCallback(function(_, p2)
		-- upvalues: p1 (ref), inputUtilities (copy), var4 (ref), var1 (ref), eventNamesModule (copy), var2 (ref), carouselNavigatedModule (copy), runService (copy)
		if p1.isDisabled then return end
		if p2.UserInputState ~= Enum.UserInputState.Begin then return end
		if not inputUtilities.isActivationInput(p2) then return end
		if var4.current then
			var4.current:Disconnect()
			var4.current = nil
		end
		var1.fireEvent(eventNamesModule.CapturesCarouselNavigated, { direction = p1.direction })
		var2(carouselNavigatedModule(p1.direction))
		local currentTime = tick()
		local var10 = currentTime
		var4.current = runService.RenderStepped:Connect(function(_)
			-- upvalues: var10 (ref), currentTime (write), var1 (copy), eventNamesModule (copy), p1 (copy), var2 (copy), carouselNavigatedModule (copy)
			if math.max(0.5 / (tick() - var10), 0.15) < tick() - currentTime then
				var1.fireEvent(eventNamesModule.CapturesCarouselNavigated, { direction = p1.direction })
				var2(carouselNavigatedModule(p1.direction))
				currentTime = tick()
			end
		end)
	end, { p1.isDisabled })
	local var10 = reactModule.useCallback(function(_, p2)
		-- upvalues: inputUtilities (copy), var4 (ref)
		if inputUtilities.isActivationInput(p2) and var4.current then
			var4.current:Disconnect()
			var4.current = nil
		end
	end, {})
	useEventConnection(userInputService.InputEnded, function(p2)
		-- upvalues: inputUtilities (copy), var4 (ref)
		if inputUtilities.isActivationInput(p2) and var4.current then
			var4.current:Disconnect()
			var4.current = nil
		end
	end)
	
	return reactModule.createElement("TextButton", {
		AnchorPoint = var6,
		BackgroundTransparency = 1,
		Position = var8,
		Size = p1.Size,
		Text = "",
		ZIndex = p1.ZIndex,
		Visible = not p1.isDisabled,
		[reactModule.Event.InputBegan] = var9,
		[reactModule.Event.InputEnded] = var10
	}, {
		Arrow = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = var7,
			ImageColor3 = var3.Theme.IconEmphasis.Color,
			ImageTransparency = var3.Theme.IconEmphasis.Transparency,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(36, 36)
		})
	})
end