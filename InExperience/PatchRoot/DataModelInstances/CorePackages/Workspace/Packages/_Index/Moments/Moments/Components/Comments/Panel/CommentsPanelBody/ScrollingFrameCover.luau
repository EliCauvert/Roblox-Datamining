local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: ReactModule (copy), ReactRobloxModule (copy), View (copy)
	local ScrollingFrame = p1.scrollingFrame
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy), ScrollingFrame (copy)
		UseStateResult2(ScrollingFrame.Parent)
		local Connection = ScrollingFrame:GetPropertyChangedSignal("Parent"):Connect(function()
			-- upvalues: UseStateResult2 (upval), ScrollingFrame (upval)
			UseStateResult2(ScrollingFrame.Parent)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { ScrollingFrame })
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(1)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UDim2.new())
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(UDim2.new())
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseBindingResult2 (copy), ScrollingFrame (copy), UseBindingResult2_1 (copy), UseBindingResult2_2 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then
			return nil
		else
			local function synchronize()
				-- upvalues: UseBindingResult2 (upval), ScrollingFrame (upval), Current (copy), UseBindingResult2_1 (upval), UseBindingResult2_2 (upval)
				UseBindingResult2(ScrollingFrame.ZIndex + 1)
				local AbsolutePositionDelta = ScrollingFrame.AbsolutePosition - Current.AbsolutePosition
				local AbsoluteSize = ScrollingFrame.AbsoluteSize
				UseBindingResult2_1(UDim2.fromOffset(AbsolutePositionDelta.X, AbsolutePositionDelta.Y))
				UseBindingResult2_2(UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y))
			end
			
			synchronize()
			local Connections = {
				ScrollingFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(synchronize),
				ScrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(synchronize),
				ScrollingFrame:GetPropertyChangedSignal("ZIndex"):Connect(synchronize),
				Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(synchronize)
			}
			
			return function()
				-- upvalues: Connections (copy)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end
	end, { ScrollingFrame, UseStateResult })
	
	return if UseStateResult == nil then nil else ReactRobloxModule.createPortal({
		ScrollingFrameCover = ReactModule.createElement("Folder", nil, {
			Bounds = ReactModule.createElement("ScrollingFrame", {
				Active = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				ScrollingEnabled = false,
				Selectable = false,
				CanvasSize = UDim2.new(),
				Size = UDim2.fromScale(1, 1),
				ZIndex = UseBindingResult,
				ref = UseRefResult
			}, {
				Cover = ReactModule.createElement(View, {
					tag = "bg-surface-100",
					Position = UseBindingResult1,
					Size = UseBindingResult3,
					Visible = p1.Visible,
					testId = p1.testId
				}, p1.children)
			})
		})
	}, UseStateResult)
end