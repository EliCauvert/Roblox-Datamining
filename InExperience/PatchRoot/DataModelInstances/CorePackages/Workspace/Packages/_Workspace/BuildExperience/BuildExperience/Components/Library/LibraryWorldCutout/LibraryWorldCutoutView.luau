local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local IsTapReleaseModule = require(script.Parent.isTapRelease)
local _UDim2 = UDim2.new(1, 0, 0, 100000)
local AspectRatio = {
	AspectRatio = 1.7777777777777777,
	DominantAxis = Enum.DominantAxis.Width
}

local function useScreenHeight(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local LayerCollector = if p1 == nil then nil else p1:FindFirstAncestorWhichIsA("LayerCollector")
		
		if LayerCollector == nil then
			return nil
		else
			UseStateResult2(LayerCollector.AbsoluteSize.Y)
			local Connection = LayerCollector:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2 (upval), LayerCollector (copy)
				UseStateResult2(LayerCollector.AbsoluteSize.Y)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	end, { p1 })
	
	return UseStateResult
end

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), useScreenHeight (copy), IsTapReleaseModule (copy), View (copy), Skeleton (copy), Radius (copy), Text (copy), _UDim2 (copy), AspectRatio (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local _UDim = UDim.new(0, Frame.inset)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseScreenHeightResult: number = useScreenHeight(UseStateResult)
	local OnActivatedFunction = Frame.onActivated
	local UseResult = ReactModule.useCallback(function(_, p1)
		-- upvalues: UseRefResult (copy), IsTapReleaseModule (upval), OnActivatedFunction (copy)
		UseRefResult.current = nil
		
		if IsTapReleaseModule(UseRefResult.current, p1) then
			OnActivatedFunction()
		end
	end, { OnActivatedFunction })
	local UseResult1 = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult (copy)
		if Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1 then
			UseRefResult.current = Input.Position
		end
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y",
		testId = "Library.WorldCutout",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center size-full-600",
			testId = "Library.WorldCutout.Header",
			padding = { left = _UDim, right = _UDim }
		}, {
			Title = if Frame.isLoading then ReactModule.createElement(Skeleton, {
				testId = "Library.WorldCutout.TitleSkeleton",
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_2800, UseTokensResult.Size.Size_600),
				radius = Radius.Small
			}) else ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				testId = "Library.WorldCutout.Title",
				Text = Frame.title
			})
		}),
		Cell = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y",
			padding = { left = _UDim, right = _UDim },
			ref = UseStateResult2,
			sizeConstraint = {
				MaxSize = Vector2.new((if UseScreenHeightResult > 0 then math.min(800, (math.floor(UseScreenHeightResult * 0.5 * 16 / 9))) else 800) + 2 * Frame.inset, 1e999)
			}
		}, {
			Window = if Frame.isLoading then ReactModule.createElement(View, {
				testId = "Library.WorldCutout.Skeleton",
				Size = _UDim2,
				aspectRatio = AspectRatio
			}, {
				Skeleton = ReactModule.createElement(Skeleton, { radius = Radius.Medium })
			}) else ReactModule.createElement(View, {
				tag = "radius-medium",
				testId = "Library.WorldCutout.Window",
				Size = _UDim2,
				aspectRatio = AspectRatio,
				backgroundStyle = { Transparency = 1 },
				onActivated = UseResult,
				selection = { Selectable = true },
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				ref = Frame.onRectChanged,
				onAbsolutePositionChanged = Frame.onRectChanged,
				onAbsoluteSizeChanged = Frame.onRectChanged
			}, {
				PressTracker = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					[ReactModule.Event.InputBegan] = UseResult1
				})
			})
		})
	})
end