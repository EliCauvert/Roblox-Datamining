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

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

local var1 = function(p1)
	return p1.ScreenSize
end

local var2 = function(p1)
	return if p1.GlobalGuiInset then p1.GlobalGuiInset.bottom else 0
end

return function(p1)
	-- upvalues: useTokens (ref), useSelector (ref), var1 (ref), reactModule (ref), fFlagAXFixAvatarScreenVR (ref), var2 (ref), useIsSpatial (ref), useAXPartialPageModalFocusHandlerModule (ref), AXPartialPageModalDockedPadding (ref), AXCatalogPartialPageModalBottomInsetMultiplier (ref), selectDeviceOrientation (ref), responsiveModule (ref), view (ref), button (ref), fillBehavior (ref), fFlagAXPartialPageModalBackgroundShim (ref), modalWindow (ref), wrapForReactPortalModule (ref)
	local var3 = useTokens()
	local var4 = useSelector(var1)
	local medium = var3.Margin.Medium
	local uDim = UDim.new(0, var3.Margin.Medium)
	local var5 = reactModule.useRef(nil)
	local var6 = if fFlagAXFixAvatarScreenVR then reactModule.useRef(nil) else nil
	local var7 = nil
	local var8 = nil
	
	if fFlagAXFixAvatarScreenVR then
		local var9, var10 = reactModule.useState(Vector2.new(360, 700))
		var7 = var9
		var8 = var10
	end
	local var11 = useSelector(var2)
	local var12 = if fFlagAXFixAvatarScreenVR then useIsSpatial() else nil
	local var13 = useAXPartialPageModalFocusHandlerModule(var5)
	
	if fFlagAXFixAvatarScreenVR then
		reactModule.useLayoutEffect(function()
			-- upvalues: var12 (ref), var6 (ref), var8 (write)
			if not var12 then return end
			local current = var6.current
			
			if current == nil then return end
			local surfaceGui = current:FindFirstAncestorOfClass("SurfaceGui")
			
			if surfaceGui == nil then
				return
			end
			local function syncSize()
				-- upvalues: var8 (copy), surfaceGui (ref)
				var8(surfaceGui.AbsoluteSize)
			end
			
			var8(surfaceGui.AbsoluteSize)
			local var14 = surfaceGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(syncSize)
			
			return function()
				-- upvalues: var14 (ref)
				var14:Disconnect()
			end
		end, { var12, var13, var8 })
	end
	local var14 = if fFlagAXFixAvatarScreenVR and var12 then var7 else var4
	
	if AXPartialPageModalDockedPadding then
		if var14.X < 540 then
			uDim = UDim.new(0, var3.Margin.Large + var11 * AXCatalogPartialPageModalBottomInsetMultiplier / 100)
		end
	elseif useSelector(selectDeviceOrientation) == responsiveModule.Keys.Portrait then
		uDim = UDim.new(0, var3.Margin.Large + var11 * AXCatalogPartialPageModalBottomInsetMultiplier / 100)
	end
	local textButton
	local var15 = if p1.position then p1.position else nil
	
	local var16 = function()
		-- upvalues: p1 (ref), reactModule (copy), view (copy), button (copy), fillBehavior (copy)
		local t = {}
		
		if p1.buttonStackProps == nil then
			return {}
		end
		local buttons = p1.buttonStackProps.buttons
		
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
	
	local var17 = function()
		-- upvalues: p1 (ref), reactModule (copy), button (copy), fillBehavior (copy)
		local t = {}
		
		if p1.buttonStackProps == nil then
			return {}
		end
		local buttons = p1.buttonStackProps.buttons
		
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
	
	local var18 = p1.visible ~= nil or p1.visible
	local _ = nil
	
	if fFlagAXPartialPageModalBackgroundShim then
		local var19 = reactModule.createElement(modalWindow, {
			isFullHeight = false,
			screenSize = var14,
			position = var15,
			anchorPoint = p1.anchorPoint
		}, {
			ContentContainer = reactModule.createElement(view, {
				tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium",
				Position = UDim2.new(0, 0, 0, medium),
				backgroundStyle = var3.Color.Surface.Surface_100,
				padding = { bottom = uDim },
				ref = if var13 == nil then var5 else nil,
				selectionGroup = if var13 == nil then {
					SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
					SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
					SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
					SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				} else nil
			}, {
				Content = reactModule.createElement(view, { tag = "auto-y size-full-0" }, p1.children),
				Buttons = p1.buttonStackProps and reactModule.createElement(view, {
					tag = {
						["col gap-medium auto-y size-full-0 fill-x"] = not p1.buttonStackProps.rowLayout,
						["row gap-small auto-y size-full-0 fill-x"] = p1.buttonStackProps.rowLayout
					}
				}, if p1.buttonStackProps.rowLayout then var17() else var16())
			})
		})
		textButton = if p1.hasBackgroundShim == true then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 5,
			Size = UDim2.fromScale(1, 1),
			Visible = var18,
			ref = if fFlagAXFixAvatarScreenVR then var6 else nil
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
				[reactModule.Event.Activated] = p1.onBackgroundPress
			}),
			SheetLayer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, { PartialPageModal = var19 })
		}) else reactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[reactModule.Event.Activated] = p1.onBackgroundPress,
			ZIndex = 5,
			Visible = var18,
			ref = if fFlagAXFixAvatarScreenVR then var6 else nil
		}, { PartialPageModal = var19 })
	else
		textButton = reactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			Selectable = false,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			[reactModule.Event.Activated] = p1.onBackgroundPress,
			ZIndex = 5,
			Visible = var18,
			ref = if fFlagAXFixAvatarScreenVR then var6 else nil
		}, {
			PartialPageModal = reactModule.createElement(modalWindow, {
				isFullHeight = false,
				screenSize = var14,
				position = var15,
				anchorPoint = p1.anchorPoint
			}, {
				ContentContainer = reactModule.createElement(view, {
					tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium",
					Position = UDim2.new(0, 0, 0, medium),
					backgroundStyle = var3.Color.Surface.Surface_100,
					padding = { bottom = uDim },
					ref = if var13 == nil then var5 else nil,
					selectionGroup = if var13 == nil then {
						SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
						SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
						SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
						SelectionBehaviorRight = Enum.SelectionBehavior.Stop
					} else nil
				}, {
					Content = reactModule.createElement(view, { tag = "auto-y size-full-0" }, p1.children),
					Buttons = p1.buttonStackProps and reactModule.createElement(view, {
						tag = {
							["col gap-medium auto-y size-full-0 fill-x"] = not p1.buttonStackProps.rowLayout,
							["row gap-small auto-y size-full-0 fill-x"] = p1.buttonStackProps.rowLayout
						}
					}, if p1.buttonStackProps.rowLayout then var17() else var16())
				})
			})
		})
	end
	return if var13 == nil then textButton else wrapForReactPortalModule(textButton, var13, var5)
end