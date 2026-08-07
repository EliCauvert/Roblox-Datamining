local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local modalWindow = require(parent.UIBlox).App.Dialog.Modal.ModalWindow
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fillBehavior = foundationModule.Enums.FillBehavior
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local wrapForReactPortalModule = require(script.Parent.Parent.Wrappers.wrapForReactPortal)
local useIsSpatial = responsiveModule.useIsSpatial
local useAXPartialPageModalFocusHandlerModule = require(script.Parent.useAXPartialPageModalFocusHandler)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local AXPartialPageModalDockedPadding = game:DefineFastFlag("AXPartialPageModalDockedPadding", false)
local fFlagAXFixAvatarScreenVR = avatarExperienceFlagsModule.FFlagAXFixAvatarScreenVR
local fFlagAXPartialPageModalBackgroundShim = avatarExperienceFlagsModule.FFlagAXPartialPageModalBackgroundShim
local AXCatalogPartialPageModalBottomInsetMultiplier = game:DefineFastInt("AXCatalogPartialPageModalBottomInsetMultiplier", 25)

local function selectDeviceOrientation(p0) --[[ line: 35 ]]
	return p0.DeviceOrientation
end

local var9 = function(p1) --[[ line: 56 ]]
	return p1.ScreenSize
end

local var10 = function(p2) --[[ line: 60 ]]
	return if p2.GlobalGuiInset then p2.GlobalGuiInset.bottom else 0
end

return function(p3) --[[ line: 64 | named "AXPartialPageModal" ]]
	-- upvalues: useTokens (ref), useSelector (ref), var9 (ref), reactModule (ref), fFlagAXFixAvatarScreenVR (ref), var10 (ref), useIsSpatial (ref), useAXPartialPageModalFocusHandlerModule (ref), AXPartialPageModalDockedPadding (ref), AXCatalogPartialPageModalBottomInsetMultiplier (ref), selectDeviceOrientation (ref), responsiveModule (ref), view (ref), button (ref), fillBehavior (ref), fFlagAXPartialPageModalBackgroundShim (ref), modalWindow (ref), wrapForReactPortalModule (ref)
	local var11 = useTokens()
	local var12 = useSelector(var9)
	local medium = var11.Margin.Medium
	local uDim = UDim.new(0, var11.Margin.Medium)
	local var14 = reactModule.useRef(nil)
	local var15 = if fFlagAXFixAvatarScreenVR then reactModule.useRef(nil) else nil
	local var16 = nil
	local var17 = nil
	
	if fFlagAXFixAvatarScreenVR then
		local var18, var19 = reactModule.useState(Vector2.new(360, 700))
		var16 = var18
		var17 = var19
	end
	local var20 = useSelector(var10)
	local var21 = if fFlagAXFixAvatarScreenVR then useIsSpatial() else nil
	local var22 = useAXPartialPageModalFocusHandlerModule(var14)
	
	if fFlagAXFixAvatarScreenVR then
		reactModule.useLayoutEffect(function() --[[ line: 84 ]]
			-- upvalues: var21 (ref), var15 (ref), var17 (write)
			if not var21 then return end
			local current = var15.current
			
			if current == nil then return end
			local surfaceGui = current:FindFirstAncestorOfClass("SurfaceGui")
			
			if surfaceGui == nil then
				return
			end
			local function syncSize() --[[ line: 98 ]]
				-- upvalues: var17 (copy), surfaceGui (ref)
				var17(surfaceGui.AbsoluteSize)
			end
			
			var17(surfaceGui.AbsoluteSize)
			local var32 = surfaceGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncSize)
			
			return function() --[[ line: 104 ]]
				-- upvalues: var32 (ref)
				var32:Disconnect()
			end
		end, { var21, var22, var17 })
	end
	local var23 = if fFlagAXFixAvatarScreenVR and var21 then var16 else var12
	
	if AXPartialPageModalDockedPadding then
		if var23.X < 540 then
			uDim = UDim.new(0, var11.Margin.Large + var20 * AXCatalogPartialPageModalBottomInsetMultiplier / 100)
		end
	elseif useSelector(selectDeviceOrientation) == responsiveModule.Keys.Portrait then
		uDim = UDim.new(0, var11.Margin.Large + var20 * AXCatalogPartialPageModalBottomInsetMultiplier / 100)
	end
	local textButton
	local var24 = if p3.position then p3.position else nil
	
	local var25 = function() --[[ line: 134 ]]
		-- upvalues: p3 (ref), reactModule (copy), view (copy), button (copy), fillBehavior (copy)
		local t = {}
		
		if p3.buttonStackProps == nil then
			return {}
		end
		local buttons = p3.buttonStackProps.buttons
		
		for i, v in ipairs(buttons) do
			local props = buttons[i].props
			t[i] = reactModule.createElement(view, {
				tag = "row gap-small wrap auto-y size-full-0 fill-x",
				key = props.text or i
			}, reactModule.createElement(button, {
				text = props.text,
				variant = props.variant,
				onActivated = props.onActivated,
				LayoutOrder = props.layoutOrder or i,
				fillBehavior = fillBehavior.Fill,
				size = props.size
			}))
		end
		return t
	end
	
	local var26 = function() --[[ line: 164 ]]
		-- upvalues: p3 (ref), reactModule (copy), button (copy), fillBehavior (copy)
		local t = {}
		
		if p3.buttonStackProps == nil then
			return {}
		end
		local buttons = p3.buttonStackProps.buttons
		
		for i, v in ipairs(buttons) do
			local props = buttons[i].props
			t[i] = reactModule.createElement(button, {
				text = props.text,
				key = props.text or i,
				variant = props.variant,
				width = UDim.new(1, 0),
				onActivated = props.onActivated,
				LayoutOrder = props.layoutOrder or i,
				fillBehavior = fillBehavior.Fill,
				size = props.size
			})
		end
		return t
	end
	
	local var27 = p3.visible ~= nil or p3.visible
	local _ = nil
	
	if fFlagAXPartialPageModalBackgroundShim then
		local var29 = reactModule.createElement(modalWindow, {
			isFullHeight = false,
			screenSize = var23,
			position = var24,
			anchorPoint = p3.anchorPoint
		}, {
			ContentContainer = reactModule.createElement(view, {
				tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium",
				Position = UDim2.new(0, 0, 0, medium),
				backgroundStyle = var11.Color.Surface.Surface_100,
				padding = { bottom = uDim },
				ref = if var22 == nil then var14 else nil,
				selectionGroup = if var22 == nil then {
					SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
					SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
					SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
					SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				} else nil
			}, {
				Content = reactModule.createElement(view, { tag = "auto-y size-full-0" }, p3.children),
				Buttons = p3.buttonStackProps and reactModule.createElement(view, {
					tag = {
						["col gap-medium auto-y size-full-0 fill-x"] = not p3.buttonStackProps.rowLayout,
						["row gap-small auto-y size-full-0 fill-x"] = p3.buttonStackProps.rowLayout
					}
				}, if p3.buttonStackProps.rowLayout then var26() else var25())
			})
		})
		textButton = if p3.hasBackgroundShim == true then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1),
			Visible = var27,
			ref = if fFlagAXFixAvatarScreenVR then var15 else nil
		}, {
			Scrim = reactModule.createElement("TextButton", {
				Text = "",
				AutoButtonColor = false,
				Selectable = false,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.45,
				BorderSizePixel = 0,
				ZIndex = 1,
				[reactModule.Event.Activated] = p3.onBackgroundPress
			}),
			SheetLayer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, { PartialPageModal = var29 })
		}) else reactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[reactModule.Event.Activated] = p3.onBackgroundPress,
			ZIndex = 5,
			Visible = var27,
			ref = if fFlagAXFixAvatarScreenVR then var15 else nil
		}, { PartialPageModal = var29 })
	else
		textButton = reactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[reactModule.Event.Activated] = p3.onBackgroundPress,
			ZIndex = 5,
			Visible = var27,
			ref = if fFlagAXFixAvatarScreenVR then var15 else nil
		}, {
			PartialPageModal = reactModule.createElement(modalWindow, {
				isFullHeight = false,
				screenSize = var23,
				position = var24,
				anchorPoint = p3.anchorPoint
			}, {
				ContentContainer = reactModule.createElement(view, {
					tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium",
					Position = UDim2.new(0, 0, 0, medium),
					backgroundStyle = var11.Color.Surface.Surface_100,
					padding = { bottom = uDim },
					ref = if var22 == nil then var14 else nil,
					selectionGroup = if var22 == nil then {
						SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
						SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
						SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
						SelectionBehaviorRight = Enum.SelectionBehavior.Stop
					} else nil
				}, {
					Content = reactModule.createElement(view, { tag = "auto-y size-full-0" }, p3.children),
					Buttons = p3.buttonStackProps and reactModule.createElement(view, {
						tag = {
							["col gap-medium auto-y size-full-0 fill-x"] = not p3.buttonStackProps.rowLayout,
							["row gap-small auto-y size-full-0 fill-x"] = p3.buttonStackProps.rowLayout
						}
					}, if p3.buttonStackProps.rowLayout then var26() else var25())
				})
			})
		})
	end
	return if var22 == nil then textButton else wrapForReactPortalModule(textButton, var22, var14)
end