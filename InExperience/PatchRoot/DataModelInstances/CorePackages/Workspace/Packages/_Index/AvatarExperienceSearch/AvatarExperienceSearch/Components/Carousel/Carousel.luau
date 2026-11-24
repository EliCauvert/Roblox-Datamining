local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("AvatarExperienceSearch").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local OtterModule = require(Parent.Otter)
local TutilsModule = require(Parent.tutils)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Interactable = UIBloxModule.Core.Control.Interactable
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local IconsActionsCycleLeft = Images["icons/actions/cycleLeft"]
local IconsActionsCycleRight = Images["icons/actions/cycleRight"]
local config = {
	frequency = 2,
	dampingRatio = 0.9,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}

function getMaxNumOfItemsVisible(p1): number
	return (math.floor((p1.absoluteWidth + p1.itemPadding) / (p1.itemWidth + p1.itemPadding)))
end

function CarouselScrollButton(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Interactable (copy), ImageSetLabel (copy), GetIconSizeFunction (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Interactable, {
		AutoButtonColor = false,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseTokensResult.Color.OverMedia.OverMedia_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.OverMedia.OverMedia_0.Transparency,
		BorderSizePixel = 0,
		[ReactModule.Event.Activated] = p1.onActivate
	}, {
		CarouselScrollButtonIcon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(GetIconSizeFunction(IconSize.Medium), GetIconSizeFunction(IconSize.Medium)),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = p1.icon,
			ImageColor3 = UseTokensResult.Color.ActionStandard.Foreground.Color3,
			ImageTransparency = UseTokensResult.Color.ActionStandard.Foreground.Transparency
		})
	})
end

function Carousel(p1)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), ReactModule (copy), OtterModule (copy), UserGameSettings (copy), config (copy), TutilsModule (copy), FoundationModule (copy), IconsActionsCycleLeft (copy), IconsActionsCycleRight (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(OtterModule.createSingleMotor(0))
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2_4 (copy)
		UseStateResult2_4(Frame.AbsoluteSize.X)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactModule (upval), UseResult (copy)
		local Frames = {}
		local Flag = false
		
		for i, value in p1.children or {} do
			if Flag then
				Frames[i] = value
			else
				Frames[i] = ReactModule.createElement("Frame", {
					Size = UDim2.fromOffset(0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[ReactModule.Change.AbsoluteSize] = UseResult,
					LayoutOrder = if value.props and value.props.LayoutOrder then value.props.LayoutOrder else 1
				}, value)
				Flag = true
			end
		end
		return Frames
	end, { p1.children, UseResult })
	local UseResult1 = ReactModule.useCallback(function(): number
		-- upvalues: UseRefResult1 (copy), UseStateResult5 (copy), p1 (copy)
		local Current = UseRefResult1.current
		
		return if Current and Current.CanvasPosition.X > 0 then math.floor(Current.CanvasPosition.X / (UseStateResult5 + p1.itemPadding)) + 1 else 1
	end, { UseStateResult5, p1.itemPadding })
	local UseResult2 = ReactModule.useCallback(function(p2: number)
		-- upvalues: UseStateResult5 (copy), p1 (copy)
		return (p2 - 1) * UseStateResult5 + (p2 - 1) * p1.itemPadding
	end, { UseStateResult5, p1.itemPadding })
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), UseStateResult1 (copy), UseRefResult1 (copy), UseResult2 (copy), UserGameSettings (upval), UseStateResult2_1 (copy), UseRefResult2 (copy), OtterModule (upval), config (upval)
		if p1.isScrollingDisabled or UseStateResult1 or not UseRefResult1.current then return end
		local Current = UseRefResult1.current
		local X = Current.CanvasPosition.X
		local UseResultResult = UseResult2(p2)
		
		if UserGameSettings.ReducedMotion then
			Current.CanvasPosition = Vector2.new(UseResultResult, 0)
			UseStateResult2_1(false)
			
			return
		end
		if UseRefResult2.current then
			UseRefResult2.current:destroy()
		end
		UseRefResult2.current = OtterModule.createSingleMotor(X)
		UseRefResult2.current:onStep(function(X)
			-- upvalues: UseStateResult2_1 (upval), Current (copy)
			UseStateResult2_1(true)
			Current.CanvasPosition = Vector2.new(X, 0)
		end)
		UseRefResult2.current:onComplete(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(false)
		end)
		UseRefResult2.current:setGoal(OtterModule.spring(UseResultResult, config))
	end, { p1.isScrollingDisabled, UseStateResult1, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(p2: number)
		-- upvalues: UseStateResult1 (copy), TutilsModule (upval), UseMemoResult (copy), UseResult3 (copy)
		if not UseStateResult1 then
			UseResult3((math.max(1, (math.min(p2, (TutilsModule.fieldCount(UseMemoResult)))))))
			
			return
		end
	end, { UseStateResult1, UseResult3, UseMemoResult })
	local UseResult5 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult5 (copy), p1 (copy)
		UseStateResult2_2(Frame.AbsoluteSize.X)
		UseStateResult2_3(getMaxNumOfItemsVisible({
			itemWidth = UseStateResult5,
			itemPadding = p1.itemPadding,
			absoluteWidth = Frame.AbsoluteSize.X
		}))
	end, { UseStateResult5, p1.itemPadding })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy), UseResult4 (copy), UseStateResult4 (copy)
		UseResult4(UseResult1() - UseStateResult4)
	end, { UseResult4, UseResult1, UseStateResult4 })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy), UseResult4 (copy), UseStateResult4 (copy)
		UseResult4(UseResult1() + UseStateResult4)
	end, { UseResult4, UseResult1, UseStateResult4 })
	local UseResult8 = ReactModule.useCallback(function(Default)
		-- upvalues: UseLastInputResult (copy), ResponsiveModule (upval), FoundationModule (upval), UseStateResult2 (copy)
		if UseLastInputResult == ResponsiveModule.Input.Pointer then
			if Default == FoundationModule.Enums.ControlState.Default then
				UseStateResult2(false)
				
				return
			end
			if Default == FoundationModule.Enums.ControlState.Hover then
				UseStateResult2(true)
			end
		end
	end, { UseLastInputResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy)
		return function()
			-- upvalues: UseRefResult2 (upval)
			if UseRefResult2.current then
				UseRefResult2.current:destroy()
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_3 (copy), UseStateResult5 (copy), p1 (copy), UseStateResult3 (copy)
		UseStateResult2_3(getMaxNumOfItemsVisible({
			itemWidth = UseStateResult5,
			itemPadding = p1.itemPadding,
			absoluteWidth = UseStateResult3
		}))
	end, { UseStateResult3, UseStateResult5, p1.itemPadding })
	local UseMemoResult1 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseRefResult1 (copy), UseStateResult3 (copy), UseStateResult (copy)
		local Current = UseRefResult1.current
		
		if Current then
			local IsXBelow = Current.AbsoluteCanvasSize.X <= Current.CanvasPosition.X + UseStateResult3
			
			return UseStateResult and not IsXBelow
		else
			return false
		end
	end, { UseStateResult, UseStateResult3, UseStateResult1 })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y clip position-top-left",
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		backgroundStyle = UseTokensResult.Color.None,
		ref = UseRefResult,
		onStateChanged = UseResult8,
		onAbsoluteSizeChanged = UseResult5
	}, {
		CarouselLeftMargin = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, UseTokensResult.Size.Size_1000, 1, 0)
		}, {
			ScrollLeftButton = if ReactModule.useMemo(function(): boolean
				-- upvalues: UseRefResult1 (copy), UseStateResult (copy)
				local Current = UseRefResult1.current
				
				return if Current then UseStateResult and Current.CanvasPosition.X > 0 else false
			end, { UseStateResult, UseStateResult1 }) then ReactModule.createElement(CarouselScrollButton, { icon = IconsActionsCycleLeft, onActivate = UseResult6 }) else nil
		}),
		CarouselScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingEnabled = not p1.isScrollingDisabled and not UseStateResult1,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			Selectable = false,
			[ReactModule.Change.CanvasPosition] = p1.onChangeCanvasPosition,
			ref = function(Current)
				-- upvalues: UseRefResult1 (copy), p1 (copy)
				if Current then
					UseRefResult1.current = Current
					p1.scrollingFrameRef = Current
				end
			end
		}, {
			ReactModule.createElement(ReactModule.Fragment, nil, {
				CarouselListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, p1.itemPadding),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				CarouselPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, p1.carouselMargin),
					PaddingRight = UDim.new(0, p1.carouselMargin)
				}),
				CarouselContent = ReactModule.createElement(ReactModule.Fragment, nil, UseMemoResult)
			})
		}),
		CarouselRightMargin = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.fromScale(1, 0),
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, UseTokensResult.Size.Size_1000, 1, 0)
		}, {
			ScrollRightButton = if UseMemoResult1 then ReactModule.createElement(CarouselScrollButton, { icon = IconsActionsCycleRight, onActivate = UseResult7 }) else nil
		})
	})
end

return Carousel