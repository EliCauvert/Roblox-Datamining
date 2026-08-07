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

local function _() --[[ line: 23 | named "isCompactMode" ]]
	-- upvalues: compactWidthThreshold (ref)
	local currentCamera = workspace.CurrentCamera
	
	return if currentCamera then currentCamera.ViewportSize.X < compactWidthThreshold else false
end

return reactModule.memo(function(value) --[[ line: 31 | named "PresetChatTray" ]]
	-- upvalues: getPresetChatStoreModule (ref), signalsReactModule (ref), compactWidthThreshold (ref), foundationModule (ref), useAutoTrayHeightModule (ref), reactModule (ref), guiService (ref), setIsPresetTrayOpenModule (ref), otterModule (ref), slideSpring (ref), userInputService (ref), configModule (ref), presetChatContainerModule (ref)
	local var14
	local var12 = getPresetChatStoreModule(false)
	local var13 = signalsReactModule.useSignalState(var12.getIsTrayOpen)
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		var14 = currentCamera.ViewportSize.X < compactWidthThreshold
		var14 = nil
	else
		var14 = false
	end
	local var15 = foundationModule.Hooks.useTokens()
	local var16, var17 = useAutoTrayHeightModule()
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useBinding(1)
	local var22 = reactModule.useRef(nil)
	local var23, var24 = reactModule.useState(0)
	local var25, var26 = reactModule.useState(0)
	local var27, var28 = reactModule.useState(guiService.TopbarInset.Height)
	local var29 = var16 + math.max(0, var23 - var25 - var27)
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: guiService (copy), var28 (ref)
		local var35 = guiService:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ line: 50 ]]
			-- upvalues: var28 (copy), guiService (copy)
			var28(guiService.TopbarInset.Height)
		end)
		
		return function() --[[ line: 53 ]]
			-- upvalues: var35 (ref)
			var35:Disconnect()
		end
	end, {})
	local var30, var31 = reactModule.useState(false)
	local var32 = reactModule.useCallback(function(p0) --[[ line: 60 ]]
		-- upvalues: var24 (ref), var31 (ref)
		var24(p0.AbsoluteSize.Y)
		var31(p0.AbsoluteSize.X < p0.AbsoluteSize.Y)
	end, {})
	local var33 = reactModule.useCallback(function(p1) --[[ line: 65 ]]
		-- upvalues: var26 (ref), var17 (ref)
		var26(p1.AbsoluteSize.Y)
		var17(p1)
	end, { var17 })
	local var34 = reactModule.useCallback(function() --[[ line: 70 ]]
		-- upvalues: setIsPresetTrayOpenModule (copy), var12 (ref)
		setIsPresetTrayOpenModule(var12, false)
	end, { var12 })
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: var13 (ref), var19 (ref), var22 (ref), otterModule (copy), var21 (ref), slideSpring (copy)
		if var13 then
			var19(true)
			
			if var22.current then
				var22.current:destroy()
			end
			local var36 = otterModule.createSingleMotor(1)
			var22.current = var36
			var36:onStep(function(p2) --[[ line: 82 ]]
				-- upvalues: var21 (copy)
				var21(p2)
			end)
			var36:setGoal(otterModule.spring(0, slideSpring))
			
			return
		elseif var22.current then
			var22.current:setGoal(otterModule.spring(1, slideSpring))
			var22.current:onComplete(function() --[[ line: 89 ]]
				-- upvalues: var19 (copy)
				var19(false)
			end)
		end
	end, { var13 })
	reactModule.useEffect(function() --[[ line: 96 ]]
		-- upvalues: var22 (ref)
		return function() --[[ line: 97 ]]
			-- upvalues: var22 (copy)
			if var22.current then
				var22.current:destroy()
				var22.current = nil
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 105 ]]
		-- upvalues: var13 (ref), userInputService (copy), setIsPresetTrayOpenModule (copy), var12 (ref), guiService (copy)
		if var13 then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p3, _) --[[ line: 110 ]]
				-- upvalues: setIsPresetTrayOpenModule (copy), var12 (copy)
				if p3.KeyCode == Enum.KeyCode.Escape or p3.KeyCode == Enum.KeyCode.ButtonB then
					setIsPresetTrayOpenModule(var12, false)
				end
			end)
			local menuOpenedConnection = guiService.MenuOpened:Connect(function() --[[ line: 116 ]]
				-- upvalues: var12 (copy)
				var12.setIsTrayOpen(false)
			end)
			
			return function() --[[ line: 120 ]]
				-- upvalues: inputBeganConnection (ref), menuOpenedConnection (ref)
				inputBeganConnection:Disconnect()
				menuOpenedConnection:Disconnect()
			end
		end
	end, { var13, var12, setIsPresetTrayOpenModule })
	
	return if var18 then reactModule.createElement(reactModule.Fragment, nil, {
		OuterScreenGui = reactModule.createElement("ScreenGui", {
			DisplayOrder = 9,
			ScreenInsets = Enum.ScreenInsets.None,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			SizeTracker = reactModule.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				[reactModule.Change.AbsoluteSize] = var32
			}),
			FullFrame = if not var30 then reactModule.createElement(foundationModule.View, {
				tag = "bg-surface-200",
				AnchorPoint = Vector2.new(0, 1),
				Position = var20:map(function(p4) --[[ line: 144 ]]
					-- upvalues: var29 (ref)
					return UDim2.new(0, 0, 1, math.round(p4 * var29))
				end),
				Size = UDim2.new(1, 0, 0, var29)
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
				[reactModule.Event.Activated] = var34,
				[reactModule.Change.AbsoluteSize] = var33
			}),
			Tray = reactModule.createElement(foundationModule.View, {
				tag = "stroke-standard stroke-default bg-surface-200",
				ClipsDescendants = true,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = var20:map(function(p5) --[[ line: 169 ]]
					-- upvalues: var16 (ref)
					return UDim2.new(0, 0, 1, math.round(p5 * var16))
				end),
				Size = UDim2.new(1, 0, 0, var16)
			}, {
				Handle = reactModule.createElement(foundationModule.View, {
					ZIndex = 2,
					tag = "bg-divider radius-full",
					Size = UDim2.new(0, configModule.PresetTray.HandleWidth, 0, var15.Padding.XSmall),
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 0, var15.Padding.XSmall)
				}),
				Content = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy",
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0)
				}, {
					Container = reactModule.createElement(presetChatContainerModule, {
						shouldShowKeyboardButton = true,
						textChannel = value.textChannel,
						compact = var14
					})
				})
			})
		})
	}) else nil
end)