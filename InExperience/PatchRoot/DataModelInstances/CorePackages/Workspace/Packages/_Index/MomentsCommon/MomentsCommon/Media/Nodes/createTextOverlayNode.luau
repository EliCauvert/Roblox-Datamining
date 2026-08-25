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
local var8 = signalsModule.createSignal(Enum.ScaleType.Crop)

local function TextOverlayLayer(p0)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), var8 (ref), fFlagMomentsOverlayContainerScaleFallbackModule (ref), textOverlayDisplayModule (ref)
	local getResolution = p0.getResolution
	local var11 = useSignalState(p0.getItemSize)
	local var12 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getResolution (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: getResolution (copy)
			return getResolution(p1)
		end)
	end, { getResolution }))
	
	return reactModule.createElement(textOverlayDisplayModule, {
		draggable = false,
		editable = false,
		itemResolution = if fFlagMomentsOverlayContainerScaleFallbackModule and var12 == nil then var11 else var12,
		itemSize = var11,
		scaleType = useSignalState(p0.getScaleType or var8),
		textOverlayEdits = { p0.overlay }
	})
end

local function LegacyTextOverlayLayer(p2)
	-- upvalues: useSignalState (ref), overlayScaleModule (ref), reactModule (ref), textOverlayModule (ref)
	return reactModule.createElement(textOverlayModule, {
		draggable = false,
		editable = false,
		additionalScale = overlayScaleModule(1, useSignalState(p2.getItemSize).X),
		textOverlayEdit = p2.overlay
	})
end

return {
	kind = "text",
	create = function(p3, _)
		-- upvalues: getFFlagMomentsTextOverlayMediaRectModule (ref), reactModule (ref), LegacyTextOverlayLayer (ref), TextOverlayLayer (ref)
		local overlay = p3.overlay
		assert(overlay ~= nil, "createTextOverlayNode: spec.overlay (a TextOverlayEdit) is required")
		
		return {
			kind = "text",
			usesDecoder = false,
			id = p3.id,
			assets = function()
				return {}
			end,
			download = function() end,
			zIndex = p3.zIndex or overlay.zIndex,
			render = function(p4)
				-- upvalues: getFFlagMomentsTextOverlayMediaRectModule (copy), reactModule (copy), LegacyTextOverlayLayer (copy), overlay (ref), TextOverlayLayer (copy)
				return if getFFlagMomentsTextOverlayMediaRectModule() then reactModule.createElement(TextOverlayLayer, {
					overlay = overlay,
					getItemSize = p4.getItemSize,
					getResolution = p4.getResolution,
					getScaleType = p4.getScaleType
				}) else reactModule.createElement(LegacyTextOverlayLayer, { overlay = overlay, getItemSize = p4.getItemSize })
			end,
			dispose = function() end
		}
	end
}