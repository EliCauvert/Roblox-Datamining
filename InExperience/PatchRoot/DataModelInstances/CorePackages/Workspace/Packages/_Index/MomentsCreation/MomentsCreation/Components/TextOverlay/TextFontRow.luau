local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useState = reactModule.useState
local useSignalState = signalsReactModule.useSignalState
local useTokens = foundationModule.Hooks.useTokens
local useFormFactor = momentsCommonModule.Hooks.useFormFactor
local formFactor = momentsCommonModule.Enums.FormFactor
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(parent.MomentsTypes)
local list = {
	{ label = "Builder", font = Enum.Font.BuilderSansMedium },
	{ label = "Source Sans", font = Enum.Font.SourceSans },
	{ label = "Luckiest Guy", font = Enum.Font.LuckiestGuy },
	{ label = "Bangers", font = Enum.Font.Bangers },
	{
		label = "Permanent Marker",
		font = Enum.Font.PermanentMarker
	},
	{ label = "Creepster", font = Enum.Font.Creepster },
	{ label = "Arcade", font = Enum.Font.Arcade },
	{ label = "Sci-Fi", font = Enum.Font.SciFi },
	{ label = "Indie Flower", font = Enum.Font.IndieFlower },
	{ label = "Grenze Gotisch", font = Enum.Font.GrenzeGotisch },
	{ label = "Special Elite", font = Enum.Font.SpecialElite }
}
local t = { Transparency = 0, Color3 = Color3.fromRGB(32, 34, 39) }

return function(p1)
	-- upvalues: useTokens (ref), useFormFactor (ref), formFactor (ref), useMemo (ref), signalsModule (ref), useSignalState (ref), dashModule (ref), useRef (ref), useState (ref), useCallback (ref), reactOtterModule (ref), list (ref), reactModule (ref), view (ref), text (ref), t (ref), constantsModule (ref), foundationModule (ref), iconButton (ref), builderIconsModule (ref)
	local controller = p1.controller
	local var1 = useTokens()
	local var2 = useFormFactor() == formFactor.Wide
	local var3 = useSignalState(useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			local activeSession = controller.getActiveSession(p2)
			local var4 = if activeSession ~= nil then nil else activeSession.getDraft(p2)
			local var5 = var4 and var4[1]
			
			return if var5 == nil then Enum.Font.BuilderSansMedium else var5.textOverlayStyle.font
		end)
	end, { controller }))
	
	local function onChipActivated(p2)
		-- upvalues: controller (ref), dashModule (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession == nil then return end
		local draft = activeSession.getDraft(false)
		local var4 = draft and draft[1]
		
		if var4 == nil then
			return
		end
		activeSession.update({
			dashModule.joinDeep(var4, { textOverlayStyle = { font = p2 } })
		})
	end
	
	local var4 = useRef(nil)
	local var5, var6 = useState(false)
	local var7, var8 = useState(false)
	local var9 = useCallback(function(p2)
		-- upvalues: var6 (ref), var8 (ref)
		if p2.AbsoluteWindowSize.X == 0 then
			return
		end
		var6(p2.CanvasPosition.X > 0)
		var8(p2.AbsoluteWindowSize.X + p2.CanvasPosition.X < p2.AbsoluteCanvasSize.X - 1)
	end, {})
	local var10 = reactOtterModule.useMotor(0, function(p2)
		-- upvalues: var4 (ref)
		local current = var4.current
		
		if current == nil then
			return
		end
		current.CanvasPosition = Vector2.new(p2, 0)
	end)
	local var11 = useCallback(function(p2)
		-- upvalues: var4 (ref), var10 (ref), reactOtterModule (copy), var1 (ref)
		local current = var4.current
		
		if current == nil then
			return
		end
		var10(reactOtterModule.ease(math.clamp(current.CanvasPosition.X + p2 * (current.AbsoluteWindowSize.X * 0.8), 0, math.max(current.AbsoluteCanvasSize.X - current.AbsoluteWindowSize.X, 0)), {
			duration = var1.Time.Time_200,
			easingStyle = Enum.EasingStyle.Quad,
			startingValue = current.CanvasPosition.X
		}))
	end, { var1, var10 })
	local var12 = useCallback(function()
		-- upvalues: var11 (ref)
		var11(-1)
	end, { var11 })
	local var13 = useCallback(function()
		-- upvalues: var11 (ref)
		var11(1)
	end, { var11 })
	local t_1 = {}
	
	for i, v in list do
		local var14 = var3 == v.font
		t_1["Chip" .. i] = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-0-800 auto-x radius-circle clip",
			LayoutOrder = i,
			padding = {
				left = UDim.new(0, var1.Padding.Medium),
				right = UDim.new(0, var1.Padding.Medium)
			},
			backgroundStyle = if var14 then var1.Inverse.Surface.Surface_0 else var1.Color.ActionStandard.Background,
			onActivated = function()
				-- upvalues: onChipActivated (ref), v (ref)
				onChipActivated(v.font)
			end
		}, {
			Label = reactModule.createElement(text, {
				tag = "shrink auto-x text-label-medium text-truncate-end",
				Text = v.label,
				fontStyle = { Font = v.font },
				textStyle = if var14 then t else var1.Color.ActionStandard.Foreground
			})
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, constantsModule.TextOverlay.PickerRowHeight)
	}, {
		Scroll = reactModule.createElement(foundationModule.ScrollView, {
			Size = UDim2.new(1, 0, 1, 0),
			scrollingFrameRef = var4,
			onCanvasPositionChanged = var9,
			onAbsoluteCanvasSizeChanged = var9,
			onAbsoluteWindowSizeChanged = var9,
			scroll = {
				scrollBarVisibility = foundationModule.Enums.Visibility.None,
				ScrollingDirection = Enum.ScrollingDirection.X,
				AutomaticCanvasSize = Enum.AutomaticSize.X
			}
		}, {
			Row = reactModule.createElement(view, {
				tag = "row align-y-center gap-medium size-0-full auto-x padding-x-large"
			}, t_1)
		}),
		LeftChevron = if var2 and var5 then reactModule.createElement(view, {
			ZIndex = 2,
			tag = "position-center-left anchor-center-left auto-xy"
		}, {
			Icon = reactModule.createElement(iconButton, {
				icon = builderIconsModule.Icon.ChevronSmallLeft,
				onActivated = var12,
				size = foundationModule.Enums.InputSize.Medium
			})
		}) else nil,
		RightChevron = if var2 and var7 then reactModule.createElement(view, {
			ZIndex = 2,
			tag = "position-center-right anchor-center-right auto-xy"
		}, {
			Icon = reactModule.createElement(iconButton, {
				icon = builderIconsModule.Icon.ChevronSmallRight,
				onActivated = var13,
				size = foundationModule.Enums.InputSize.Medium
			})
		}) else nil
	})
end