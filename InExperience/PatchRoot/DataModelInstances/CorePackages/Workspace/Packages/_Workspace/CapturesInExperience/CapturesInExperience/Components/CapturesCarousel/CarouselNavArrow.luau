local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local InputUtilities = require(Parent1.SocialCommon).Utils.InputUtilities
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local CarouselNavigatedModule = require(Parent.Thunks.CarouselNavigated)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local IconsActionsCycleLeft = Images["icons/actions/cycleLeft"]
local IconsActionsCycleRight = Images["icons/actions/cycleRight"]

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), ReactModule (copy), ConstantsModule (copy), IconsActionsCycleLeft (copy), IconsActionsCycleRight (copy), InputUtilities (copy), EventNamesModule (copy), CarouselNavigatedModule (copy), RunService (copy), UseEventConnectionFunction (copy), UserInputService (copy), ImageSetLabel (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local IsDirectionMatch = p1.direction == ConstantsModule.CarouselDirection.Left
	local _Vector2: Vector2 = if IsDirectionMatch then Vector2.new(0, 0.5) else Vector2.new(1, 0.5)
	local IconsActionsCycleLeft1 = if IsDirectionMatch then IconsActionsCycleLeft else IconsActionsCycleRight
	local _UDim2: UDim2 = if IsDirectionMatch then UDim2.fromScale(0, 0.5) else UDim2.fromScale(1, 0.5)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy)
		if p1.isDisabled and UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end, { p1.isDisabled })
	local UseResult = ReactModule.useCallback(function(_, Input)
		-- upvalues: p1 (copy), InputUtilities (upval), UseRefResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CarouselNavigatedModule (upval), RunService (upval)
		if p1.isDisabled then return end
		if Input.UserInputState ~= Enum.UserInputState.Begin then return end
		if not InputUtilities.isActivationInput(Input) then return end
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselNavigated, { direction = p1.direction })
		UseDispatchResult(CarouselNavigatedModule(p1.direction))
		local CurrentTime = tick()
		local CurrentTime1: number = CurrentTime
		UseRefResult.current = RunService.RenderStepped:Connect(function(_)
			-- upvalues: CurrentTime1 (copy), CurrentTime (ref), UseAnalyticsModuleResult (upval), EventNamesModule (upval), p1 (upval), UseDispatchResult (upval), CarouselNavigatedModule (upval)
			if math.max(0.5 / (tick() - CurrentTime1), 0.15) < tick() - CurrentTime then
				UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselNavigated, { direction = p1.direction })
				UseDispatchResult(CarouselNavigatedModule(p1.direction))
				CurrentTime = tick()
			end
		end)
	end, { p1.isDisabled })
	local UseResult1 = ReactModule.useCallback(function(_, p2)
		-- upvalues: InputUtilities (upval), UseRefResult (copy)
		if InputUtilities.isActivationInput(p2) and UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end, {})
	UseEventConnectionFunction(UserInputService.InputEnded, function(p2)
		-- upvalues: InputUtilities (upval), UseRefResult (copy)
		if InputUtilities.isActivationInput(p2) and UseRefResult.current then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
	end)
	
	return ReactModule.createElement("TextButton", {
		AnchorPoint = _Vector2,
		BackgroundTransparency = 1,
		Position = _UDim2,
		Size = p1.Size,
		Text = "",
		ZIndex = p1.ZIndex,
		Visible = not p1.isDisabled,
		[ReactModule.Event.InputBegan] = UseResult,
		[ReactModule.Event.InputEnded] = UseResult1
	}, {
		Arrow = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = IconsActionsCycleLeft1,
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
			ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(36, 36)
		})
	})
end