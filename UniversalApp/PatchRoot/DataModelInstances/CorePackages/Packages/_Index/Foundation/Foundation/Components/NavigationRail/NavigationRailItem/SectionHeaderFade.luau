local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)

local function useSizedStableContainer(AutomaticSize)
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AutomaticSize (copy)
		local StableContent = Instance.new("Frame")
		StableContent.Name = "StableContent"
		StableContent.BackgroundTransparency = 1
		StableContent.BorderSizePixel = 0
		StableContent.AutomaticSize = AutomaticSize
		StableContent.Size = if AutomaticSize == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0) else UDim2.fromOffset(0, 0)
		
		return StableContent
	end, { AutomaticSize })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:Destroy()
		end
	end, { UseMemoResult })
	
	return UseMemoResult, (ReactModule.useCallback(function(Parent)
		-- upvalues: UseMemoResult (copy)
		UseMemoResult.Parent = Parent
	end, { UseMemoResult }))
end

return function(Frame: Frame)
	-- upvalues: useSizedStableContainer (copy), ReactModule (copy), ViewModule (copy), ReactRobloxModule (copy)
	local UseSizedStableContainerResult, UseSizedStableContainerResult2 = useSizedStableContainer(Frame.contentSize)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Host = ReactModule.createElement(ViewModule, {
			AnchorPoint = Frame.AnchorPoint,
			Position = Frame.Position,
			Size = Frame.Size,
			ZIndex = Frame.ZIndex,
			padding = Frame.padding,
			tag = Frame.tag,
			backgroundStyle = Frame.backgroundStyle,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId,
			GroupTransparency = if Frame.isFading then Frame.transparency else nil,
			ref = UseSizedStableContainerResult2
		}),
		Content = if Frame.children == nil then nil else ReactRobloxModule.createPortal(Frame.children, UseSizedStableContainerResult)
	})
end