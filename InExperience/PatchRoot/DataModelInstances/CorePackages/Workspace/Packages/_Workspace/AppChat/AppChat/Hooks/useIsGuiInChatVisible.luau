local CoreGui = game:GetService("CoreGui")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseChatIsVisibleModule = require(script.Parent.useChatIsVisible)
local SetTimeoutFunction = require(Parent.LuauPolyfill).setTimeout
local GetGuiObjectBackgroundTransparencyModule = require(AppChat.Utils.getGuiObjectBackgroundTransparency)
local FFlagAppChatGuiVisibleUsesStyledTransparencyModule = require(AppChat.Flags.FFlagAppChatGuiVisibleUsesStyledTransparency)
local AppChatGuiVisibleBatchUpdateIntervalMs = game:DefineFastInt("AppChat.GuiVisibleBatchUpdateIntervalMs", 1000)

local function getGuiObjectIsObscuredAtPosition(Frame, XDelta, YDelta): boolean
	-- upvalues: CoreGui (copy), FFlagAppChatGuiVisibleUsesStyledTransparencyModule (copy), GetGuiObjectBackgroundTransparencyModule (copy)
	for _, Frame1 in CoreGui:GetGuiObjectsAtPosition(XDelta, YDelta) do
		if Frame1:IsA("GuiObject") then
			local GuiObjectBackgroundTransparencyModule = if FFlagAppChatGuiVisibleUsesStyledTransparencyModule then GetGuiObjectBackgroundTransparencyModule(Frame1) else Frame1.BackgroundTransparency
			
			if Frame1 == Frame then
				return false
			elseif Frame1.Visible ~= false and GuiObjectBackgroundTransparencyModule <= 0.95 and not Frame1:IsDescendantOf(Frame) then
				return true
			end
			continue
		end
	end
	return false
end

local function getGuiObjectIsObscured(Frame: Frame)
	-- upvalues: getGuiObjectIsObscuredAtPosition (copy)
	local AbsolutePosition: number = Frame.AbsolutePosition
	local AbsoluteSize: number = Frame.AbsoluteSize
	local NewAbsolutePosition = AbsolutePosition + AbsoluteSize * 0.5
	local NewAbsolutePosition1 = AbsolutePosition + AbsoluteSize
	local NewAbsolutePosition2 = AbsolutePosition + Vector2.new(AbsoluteSize.X, 0)
	local NewAbsolutePosition3 = AbsolutePosition + Vector2.new(0, AbsoluteSize.Y)
	local NewCeiled = 1
	local UICorner = Frame:FindFirstChildOfClass("UICorner")
	
	if UICorner and UICorner:IsA("UICorner") then
		local Offset: number = UICorner.CornerRadius.Offset
		
		if Offset > 0 then
			NewCeiled = math.ceil(Offset * 0.3) + 1
		end
	end
	local GuiObjectIsObscuredAtPosition = getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition.X, NewAbsolutePosition.Y)
	local GuiObjectIsObscuredAtPosition1 = getGuiObjectIsObscuredAtPosition(Frame, AbsolutePosition.X + NewCeiled, AbsolutePosition.Y + NewCeiled)
	local GuiObjectIsObscuredAtPosition2 = getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition3.X + NewCeiled, NewAbsolutePosition3.Y - NewCeiled)
	local GuiObjectIsObscuredAtPosition3 = getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition2.X - NewCeiled, NewAbsolutePosition2.Y + NewCeiled)
	local GuiObjectIsObscuredAtPosition4 = getGuiObjectIsObscuredAtPosition(Frame, NewAbsolutePosition1.X - NewCeiled, NewAbsolutePosition1.Y - NewCeiled)
	
	return GuiObjectIsObscuredAtPosition or (GuiObjectIsObscuredAtPosition1 or (GuiObjectIsObscuredAtPosition2 or (GuiObjectIsObscuredAtPosition3 or GuiObjectIsObscuredAtPosition4)))
end

return function(p1, p2)
	-- upvalues: UseChatIsVisibleModule (copy), ReactModule (copy), getGuiObjectIsObscured (copy), SetTimeoutFunction (copy), AppChatGuiVisibleBatchUpdateIntervalMs (copy), CryoModule (copy)
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), getGuiObjectIsObscured (upval), UseStateResult2 (copy), UseRefResult (copy), SetTimeoutFunction (upval), AppChatGuiVisibleBatchUpdateIntervalMs (upval), UseChatIsVisibleModuleResult (copy)
		local function _()
			-- upvalues: p1 (upval), getGuiObjectIsObscured (upval), UseStateResult2 (upval)
			if p1.current and p1.current:IsA("GuiObject") then
				local IsNotOccluded = p1.current.IsNotOccluded
				local GuiObjectIsObscured = getGuiObjectIsObscured(p1.current)
				UseStateResult2(IsNotOccluded and not GuiObjectIsObscured)
				
				return
			else
				UseStateResult2(false)
			end
		end
		
		local function queueUpdateIsGuiVisible()
			-- upvalues: UseRefResult (upval), SetTimeoutFunction (upval), p1 (upval), getGuiObjectIsObscured (upval), UseStateResult2 (upval), AppChatGuiVisibleBatchUpdateIntervalMs (upval)
			if not UseRefResult.current then
				UseRefResult.current = SetTimeoutFunction(function()
					-- upvalues: UseRefResult (upval), p1 (upval), getGuiObjectIsObscured (upval), UseStateResult2 (upval)
					UseRefResult.current = nil
					
					if p1.current and p1.current:IsA("GuiObject") then
						local IsNotOccluded = p1.current.IsNotOccluded
						local v1 = getGuiObjectIsObscured(p1.current)
						UseStateResult2(IsNotOccluded and not v1)
						
						return
					else
						UseStateResult2(false)
					end
				end, AppChatGuiVisibleBatchUpdateIntervalMs)
				
				return
			end
		end
		
		local function onDescendantEvent(Descendant)
			-- upvalues: UseRefResult (upval), SetTimeoutFunction (upval), p1 (upval), getGuiObjectIsObscured (upval), UseStateResult2 (upval), AppChatGuiVisibleBatchUpdateIntervalMs (upval)
			if not Descendant:IsA("GuiObject") then return end
			if not UseRefResult.current then
				UseRefResult.current = SetTimeoutFunction(function()
					-- upvalues: UseRefResult (upval), p1 (upval), getGuiObjectIsObscured (upval), UseStateResult2 (upval)
					UseRefResult.current = nil
					
					if p1.current and p1.current:IsA("GuiObject") then
						local IsNotOccluded = p1.current.IsNotOccluded
						local v1 = getGuiObjectIsObscured(p1.current)
						UseStateResult2(IsNotOccluded and not v1)
						
						return
					else
						UseStateResult2(false)
					end
				end, AppChatGuiVisibleBatchUpdateIntervalMs)
				
				return
			end
		end
		
		if not UseRefResult.current then
			UseRefResult.current = SetTimeoutFunction(function()
				-- upvalues: UseRefResult (upval), p1 (upval), getGuiObjectIsObscured (upval), UseStateResult2 (upval)
				UseRefResult.current = nil
				
				if p1.current and p1.current:IsA("GuiObject") then
					local IsNotOccluded = p1.current.IsNotOccluded
					local v1 = getGuiObjectIsObscured(p1.current)
					UseStateResult2(IsNotOccluded and not v1)
					
					return
				else
					UseStateResult2(false)
				end
			end, AppChatGuiVisibleBatchUpdateIntervalMs)
		end
		local List = {}
		
		if p1.current and p1.current:IsA("GuiObject") and UseChatIsVisibleModuleResult then
			table.insert(List, p1.current:GetPropertyChangedSignal("IsNotOccluded"):Connect(queueUpdateIsGuiVisible))
			local LayerCollector = p1.current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector then
				table.insert(List, LayerCollector.DescendantAdded:Connect(onDescendantEvent))
				table.insert(List, LayerCollector.DescendantRemoving:Connect(onDescendantEvent))
			end
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, CryoModule.List.join(p2, { UseChatIsVisibleModuleResult }))
	
	return UseChatIsVisibleModuleResult and UseStateResult
end