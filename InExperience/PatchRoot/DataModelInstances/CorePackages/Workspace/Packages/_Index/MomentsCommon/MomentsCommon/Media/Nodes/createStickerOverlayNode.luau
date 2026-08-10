local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local useSignalState = require(parent.SignalsReact).useSignalState
local stickerOverlayModule = require(momentsCommon.Components.StickerOverlay)
local overlayDisplayModule = require(momentsCommon.Components.OverlayDisplay)
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local overlayScaleModule = require(momentsCommon.Media.overlayScale)
local getFFlagMomentsStickerOverlayMediaRectModule = require(momentsCommon.Flags.GetFFlagMomentsStickerOverlayMediaRect)
local fFlagMomentsOverlayContainerScaleFallbackModule = require(momentsCommon.Flags.FFlagMomentsOverlayContainerScaleFallback)
local var8 = signalsModule.createSignal(Enum.ScaleType.Crop)

local function StickerOverlayLayer(p0) --[[ line: 86 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), var8 (ref), fFlagMomentsOverlayContainerScaleFallbackModule (ref), overlayDisplayModule (ref), stickerOverlayModule (ref)
	local getResolution = p0.getResolution
	local var11 = useSignalState(p0.getItemSize)
	local var12 = useSignalState(reactModule.useMemo(function() --[[ line: 98 ]]
		-- upvalues: signalsModule (copy), getResolution (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 99 ]]
			-- upvalues: getResolution (copy)
			return getResolution(p1)
		end)
	end, { getResolution }))
	
	return reactModule.createElement(overlayDisplayModule, {
		draggable = false,
		editable = false,
		overlayComponent = stickerOverlayModule,
		itemResolution = if fFlagMomentsOverlayContainerScaleFallbackModule and var12 == nil then var11 else var12,
		itemSize = var11,
		scaleType = useSignalState(p0.getScaleType or var8),
		overlayEdits = { p0.overlay }
	})
end

local function LegacyStickerOverlayLayer(p2) --[[ line: 139 ]]
	-- upvalues: useSignalState (ref), overlayScaleModule (ref), reactModule (ref), stickerOverlayModule (ref)
	return reactModule.createElement(stickerOverlayModule, {
		draggable = false,
		editable = false,
		additionalScale = overlayScaleModule(1, useSignalState(p2.getItemSize).X),
		overlayEdit = p2.overlay
	})
end

return {
	kind = "sticker",
	create = function(p3, _) --[[ line: 152 ]]
		-- upvalues: getFFlagMomentsStickerOverlayMediaRectModule (ref), reactModule (ref), LegacyStickerOverlayLayer (ref), StickerOverlayLayer (ref)
		local overlay = p3.overlay
		assert(overlay ~= nil, "createStickerOverlayNode: spec.overlay (a StickerOverlayEdit) is required")
		
		return {
			kind = "sticker",
			usesDecoder = false,
			id = p3.id,
			assets = function() --[[ line: 164 ]]
				return {}
			end,
			download = function() --[[ line: 190 ]] end,
			zIndex = p3.zIndex or overlay.zIndex,
			render = function(p4) --[[ line: 168 ]]
				-- upvalues: getFFlagMomentsStickerOverlayMediaRectModule (copy), reactModule (copy), LegacyStickerOverlayLayer (copy), overlay (ref), StickerOverlayLayer (copy)
				return if getFFlagMomentsStickerOverlayMediaRectModule() then reactModule.createElement(StickerOverlayLayer, {
					overlay = overlay,
					getItemSize = p4.getItemSize,
					getResolution = p4.getResolution,
					getScaleType = p4.getScaleType
				}) else reactModule.createElement(LegacyStickerOverlayLayer, { overlay = overlay, getItemSize = p4.getItemSize })
			end,
			dispose = function() --[[ line: 194 ]] end
		}
	end
}