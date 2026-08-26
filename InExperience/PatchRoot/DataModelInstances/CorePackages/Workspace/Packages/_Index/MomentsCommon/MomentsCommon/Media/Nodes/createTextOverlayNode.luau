local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local useSignalState = require(parent.SignalsReact).useSignalState
local textOverlayModule = require(momentsCommon.Components.TextOverlay)
local textOverlayDisplayModule = require(momentsCommon.Components.TextOverlayDisplay)
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local overlayScaleModule = require(momentsCommon.Media.overlayScale)
local getFFlagMomentsTextOverlayMediaRectModule = require(momentsCommon.Flags.GetFFlagMomentsTextOverlayMediaRect)
local fFlagMomentsOverlayContainerScaleFallbackModule = require(momentsCommon.Flags.FFlagMomentsOverlayContainerScaleFallback)
local var1 = signalsModule.createSignal(Enum.ScaleType.Crop)

local function TextOverlayLayer(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), var1 (ref), fFlagMomentsOverlayContainerScaleFallbackModule (ref), textOverlayDisplayModule (ref)
	local getResolution = p1.getResolution
	local var2 = useSignalState(p1.getItemSize)
	local var3 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getResolution (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getResolution (copy)
			return getResolution(p2)
		end)
	end, { getResolution }))
	
	return reactModule.createElement(textOverlayDisplayModule, {
		draggable = false,
		editable = false,
		itemResolution = if fFlagMomentsOverlayContainerScaleFallbackModule and var3 == nil then var2 else var3,
		itemSize = var2,
		scaleType = useSignalState(p1.getScaleType or var1),
		textOverlayEdits = { p1.overlay }
	})
end

local function LegacyTextOverlayLayer(p1)
	-- upvalues: useSignalState (ref), overlayScaleModule (ref), reactModule (ref), textOverlayModule (ref)
	return reactModule.createElement(textOverlayModule, {
		draggable = false,
		editable = false,
		additionalScale = overlayScaleModule(1, useSignalState(p1.getItemSize).X),
		textOverlayEdit = p1.overlay
	})
end

return {
	kind = "text",
	create = function(p1, _)
		-- upvalues: getFFlagMomentsTextOverlayMediaRectModule (ref), reactModule (ref), LegacyTextOverlayLayer (ref), TextOverlayLayer (ref)
		local overlay = p1.overlay
		assert(overlay ~= nil, "createTextOverlayNode: spec.overlay (a TextOverlayEdit) is required")
		
		return {
			kind = "text",
			usesDecoder = false,
			id = p1.id,
			assets = function()
				return {}
			end,
			download = function() end,
			zIndex = p1.zIndex or overlay.zIndex,
			render = function(p2)
				-- upvalues: getFFlagMomentsTextOverlayMediaRectModule (copy), reactModule (copy), LegacyTextOverlayLayer (copy), overlay (ref), TextOverlayLayer (copy)
				return if getFFlagMomentsTextOverlayMediaRectModule() then reactModule.createElement(TextOverlayLayer, {
					overlay = overlay,
					getItemSize = p2.getItemSize,
					getResolution = p2.getResolution,
					getScaleType = p2.getScaleType
				}) else reactModule.createElement(LegacyTextOverlayLayer, { overlay = overlay, getItemSize = p2.getItemSize })
			end,
			dispose = function() end
		}
	end
}