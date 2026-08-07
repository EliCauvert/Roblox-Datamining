-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local useCallback = reactModule.useCallback
local _ = require(momentsCommon.Types)

return function(p0) --[[ line: 28 | named "TextOverlay" ]]
	-- upvalues: reactModule (ref), useCallback (ref), view (ref), foundationModule (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = useCallback(function(_, p1) --[[ line: 32 ]]
		-- upvalues: p0 (ref), var4 (ref)
		if p0.containerRef and p0.containerRef.current then
			var4.current = p1
		end
	end, { p0.containerRef })
	local var6 = useCallback(function(_, p2) --[[ line: 38 ]]
		-- upvalues: var4 (ref), p0 (ref)
		if var4.current == p2 and p0.onActivated then
			p0.onActivated()
		end
		if p0.onDragEnd then
			p0.onDragEnd()
		end
	end, { p0.onActivated, p0.onDragEnd })
	
	return reactModule.createElement(view, {
		tag = "auto-xy anchor-center-center bg-contrast padding-medium position-center-center radius-medium",
		ref = p0.containerRef,
		onActivated = p0.onActivated,
		Position = p0.textOverlayEdit.position,
		Rotation = p0.textOverlayEdit.rotation,
		scale = p0.textOverlayEdit.scale * (p0.additionalScale or 1),
		sizeConstraint = { MaxSize = Vector2.new(300, 1e999) },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p0.textOverlayEdit.zIndex
	}, {
		UIDragDetector = reactModule.useMemo(function() --[[ line: 48 ]]
			-- upvalues: p0 (ref), reactModule (copy), var3 (ref), var5 (ref), var6 (ref)
			return if p0.draggable then reactModule.createElement("UIDragDetector", {
				BoundingBehavior = Enum.UIDragDetectorBoundingBehavior.EntireObject,
				BoundingUI = p0.boundingUI,
				DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane,
				ref = var3,
				ReferenceUIInstance = p0.boundingUI,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale,
				[reactModule.Event.DragStart] = var5,
				[reactModule.Event.DragEnd] = var6
			}) else nil
		end, { p0.boundingUI, p0.draggable, var5, var6 }),
		TextInput = reactModule.createElement("TextBox", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			ClipsDescendants = true,
			Font = p0.textOverlayEdit.textOverlayStyle.font,
			Interactable = p0.editable == true,
			Text = p0.textOverlayEdit.text,
			TextColor3 = p0.textOverlayEdit.textOverlayStyle.fontColor,
			TextSize = p0.textOverlayEdit.textOverlayStyle.fontSize,
			TextXAlignment = p0.textOverlayEdit.textOverlayStyle.textXAlignment,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			Size = p0.size,
			ZIndex = p0.textOverlayEdit.zIndex,
			ref = p0.textBoxRef,
			[reactModule.Change.Text] = p0.onTextChanged
		})
	})
end