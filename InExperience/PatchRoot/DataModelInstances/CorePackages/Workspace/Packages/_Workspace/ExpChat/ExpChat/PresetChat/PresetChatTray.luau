local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local presetChatContainerModule = require(script.Parent.PresetChatContainer)
local useAutoTrayHeightModule = require(script.Parent.useAutoTrayHeight)
local setIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local compactWidthThreshold = configModule.PresetTray.CompactWidthThreshold
local slideSpring = configModule.PresetTray.SlideSpring

local function _()
	-- upvalues: compactWidthThreshold (ref)
	local currentCamera = workspace.CurrentCamera
	
	return if currentCamera then currentCamera.ViewportSize.X < compactWidthThreshold else false
end

return reactModule.memo(function(value)
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), compactWidthThreshold (ref), foundationModule (ref), useAutoTrayHeightModule (ref), reactModule (ref), guiService (ref), setIsPresetTrayOpenModule (ref), otterModule (ref), slideSpring (ref), userInputService (ref), configModule (ref), presetChatContainerModule (ref)
	local var1
	local var2 = getPresetChatStoreModule(false)
	local var3 = signalsReactModule.useSignalState(var2.getIsTrayOpen)
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		var1 = currentCamera.ViewportSize.X < compactWidthThreshold
		var1 = nil
	else
		var1 = false
	end
	local var4 = foundationModule.Hooks.useTokens()
	local var5, var6 = useAutoTrayHeightModule()
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useBinding(1)
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useState(0)
	local var14, var15 = reactModule.useState(0)
	local var16, var17 = reactModule.useState(guiService.TopbarInset.Height)
	local var18 = var5 + math.max(0, var12 - var14 - var16)
	reactModule.useEffect(function()
		-- upvalues: guiService (copy), var17 (ref)
		local var19 = guiService:GetPropertyChangedSignal("TopbarInset"):Connect(function()
			-- upvalues: var17 (copy), guiService (copy)
			var17(guiService.TopbarInset.Height)
		end)
		
		return function()
			-- upvalues: var19 (ref)
			var19:Disconnect()
		end
	end, {})
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: var13 (ref), var20 (ref)
		var13(p1.AbsoluteSize.Y)
		var20(p1.AbsoluteSize.X < p1.AbsoluteSize.Y)
	end, {})
	local var22 = reactModule.useCallback(function(p1)
		-- upvalues: var15 (ref), var6 (ref)
		var15(p1.AbsoluteSize.Y)
		var6(p1)
	end, { var6 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: setIsPresetTrayOpenModule (copy), var2 (ref)
		setIsPresetTrayOpenModule(var2, false)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var8 (ref), var11 (ref), otterModule (copy), var10 (ref), slideSpring (copy)
		if var3 then
			var8(true)
			
			if var11.current then
				var11.current:destroy()
			end
			local var24 = otterModule.createSingleMotor(1)
			var11.current = var24
			var24:onStep(function(p1)
				-- upvalues: var10 (copy)
				var10(p1)
			end)
			var24:setGoal(otterModule.spring(0, slideSpring))
			
			return
		elseif var11.current then
			var11.current:setGoal(otterModule.spring(1, slideSpring))
			var11.current:onComplete(function()
				-- upvalues: var8 (copy)
				var8(false)
			end)
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		return function()
			-- upvalues: var11 (copy)
			if var11.current then
				var11.current:destroy()
				var11.current = nil
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), userInputService (copy), setIsPresetTrayOpenModule (copy), var2 (ref), guiService (copy)
		if var3 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p1, _)
				-- upvalues: setIsPresetTrayOpenModule (copy), var2 (copy)
				if p1.KeyCode == Enum.KeyCode.Escape or p1.KeyCode == Enum.KeyCode.ButtonB then
					setIsPresetTrayOpenModule(var2, false)
				end
			end)
			local menuOpenedConnection = guiService.MenuOpened:Connect(function()
				-- upvalues: var2 (copy)
				var2.setIsTrayOpen(false)
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref), menuOpenedConnection (ref)
				inputBeganConnection:Disconnect()
				menuOpenedConnection:Disconnect()
			end
		end
	end, { var3, var2, setIsPresetTrayOpenModule })
	
	return if var7 then reactModule.createElement(reactModule.Fragment, nil, {
		OuterScreenGui = reactModule.createElement("ScreenGui", {
			DisplayOrder = 9,
			ScreenInsets = Enum.ScreenInsets.None,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			SizeTracker = reactModule.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				[reactModule.Change.AbsoluteSize] = var21
			}),
			FullFrame = if not var19 then reactModule.createElement(foundationModule.View, {
				tag = "bg-surface-200",
				AnchorPoint = Vector2.new(0, 1),
				Position = var9:map(function(p1)
					-- upvalues: var18 (ref)
					return UDim2.new(0, 0, 1, math.round(p1 * var18))
				end),
				Size = UDim2.new(1, 0, 0, var18)
			}) else nil
		}),
		InnerScreenGui = reactModule.createElement("ScreenGui", {
			DisplayOrder = 10,
			ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Backdrop = reactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 1),
				Text = "",
				ZIndex = 1,
				[reactModule.Event.Activated] = var23,
				[reactModule.Change.AbsoluteSize] = var22
			}),
			Tray = reactModule.createElement(foundationModule.View, {
				tag = "stroke-standard stroke-default bg-surface-200",
				ClipsDescendants = true,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = var9:map(function(p1)
					-- upvalues: var5 (ref)
					return UDim2.new(0, 0, 1, math.round(p1 * var5))
				end),
				Size = UDim2.new(1, 0, 0, var5)
			}, {
				Handle = reactModule.createElement(foundationModule.View, {
					ZIndex = 2,
					tag = "bg-divider radius-full",
					Size = UDim2.new(0, configModule.PresetTray.HandleWidth, 0, var4.Padding.XSmall),
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 0, var4.Padding.XSmall)
				}),
				Content = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy",
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0)
				}, {
					Container = reactModule.createElement(presetChatContainerModule, {
						shouldShowKeyboardButton = true,
						textChannel = value.textChannel,
						compact = var1
					})
				})
			})
		})
	}) else nil
end)