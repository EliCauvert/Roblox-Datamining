local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local OverlayContextModule = require(Foundation.Providers.Overlay.OverlayContext)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseUniqueWidgetModule = require(Foundation.Providers.StudioWidgets.useUniqueWidget)

return function(Frame: Frame, p1) --[[ Line: 19 | Named "usePluginAnchor" ]]
	-- upvalues: ReactModule (copy), OverlayContextModule (copy), UseUniqueWidgetModule (copy), ViewModule (copy), ReactRobloxModule (copy)
	local UseContextResult = ReactModule.useContext(OverlayContextModule)
	local IsNotInstance: boolean = Frame ~= nil and typeof(Frame) ~= "Instance"
	local UseRefResult = ReactModule.useRef(nil)
	
	if not IsNotInstance and typeof(Frame) == "Instance" then
		UseRefResult.current = Frame
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	UseRefResult1.current = UseStateResult
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 38 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, { UseStateResult2 })
	local UseUniqueWidgetModuleResult = UseUniqueWidgetModule({
		forwardRef = if IsNotInstance then UseRefResult1 else UseRefResult
	})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.one)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Vector2.zero)
	ReactModule.useLayoutEffect(function() --[[ Line: 50 ]]
		-- upvalues: IsNotInstance (copy), Frame (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		if not IsNotInstance or Frame == nil then return end
		local function updateFromAnchor() --[[ Line: 56 ]]
			-- upvalues: UseStateResult2_1 (upval), Frame (copy), UseStateResult2_2 (upval)
			UseStateResult2_1(Frame.AbsolutePosition)
			UseStateResult2_2(Frame.AbsoluteSize)
		end
		
		UseStateResult2_1(Frame.AbsolutePosition)
		UseStateResult2_2(Frame.AbsoluteSize)
		local Connection = Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateFromAnchor)
		local Connection1 = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateFromAnchor)
		
		return function() --[[ Line: 66 ]]
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, { Frame, IsNotInstance })
	ReactModule.useLayoutEffect(function() --[[ Line: 72 ]]
		-- upvalues: IsNotInstance (copy), UseContextResult (copy)
		if IsNotInstance then
			UseContextResult.requestOverlay()
		end
	end, { UseContextResult.requestOverlay, IsNotInstance })
	ReactModule.useLayoutEffect(function() --[[ Line: 78 ]]
		-- upvalues: IsNotInstance (copy), UseContextResult (copy), UseStateResult2_3 (copy)
		if not IsNotInstance then return end
		local UseContextResultInstance = UseContextResult.instance
		
		if UseContextResultInstance == nil or not UseContextResultInstance:IsA("GuiObject") then
			UseStateResult2_3(Vector2.zero)
			
			return
		end
		local function updateOffset() --[[ Line: 89 ]]
			-- upvalues: UseStateResult2_3 (upval), UseContextResultInstance (copy)
			UseStateResult2_3(UseContextResultInstance.AbsolutePosition)
		end
		
		UseStateResult2_3(UseContextResultInstance.AbsolutePosition)
		local Connection = UseContextResultInstance:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateOffset)
		
		return function() --[[ Line: 95 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseContextResult.instance, IsNotInstance })
	local NoIsNotInstance: boolean = Frame ~= nil and (not IsNotInstance or UseContextResult.instance ~= nil)
	
	return {
		uri = if p1 == nil then UseUniqueWidgetModuleResult.uri else p1,
		element = if IsNotInstance and UseContextResult.instance then ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
			Visible = true,
			Position = UDim2.fromOffset(UseStateResult1.X - UseStateResult4.X, UseStateResult1.Y - UseStateResult4.Y),
			Size = UDim2.fromOffset(UseStateResult3.X, UseStateResult3.Y),
			ref = UseResult
		}), UseContextResult.instance) else nil,
		isVirtual = IsNotInstance,
		isReady = p1 ~= nil or NoIsNotInstance
	}
end