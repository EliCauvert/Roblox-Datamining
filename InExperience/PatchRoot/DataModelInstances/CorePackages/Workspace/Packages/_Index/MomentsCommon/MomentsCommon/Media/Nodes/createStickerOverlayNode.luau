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
local var1 = signalsModule.createSignal(Enum.ScaleType.Crop)

local function StickerOverlayLayer(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), var1 (ref), fFlagMomentsOverlayContainerScaleFallbackModule (ref), overlayDisplayModule (ref), stickerOverlayModule (ref)
	local getResolution = p1.getResolution
	local var2 = useSignalState(p1.getItemSize)
	local var3 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getResolution (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getResolution (copy)
			return getResolution(p2)
		end)
	end, { getResolution }))
	
	return reactModule.createElement(overlayDisplayModule, {
		draggable = false,
		editable = false,
		overlayComponent = stickerOverlayModule,
		itemResolution = if fFlagMomentsOverlayContainerScaleFallbackModule and var3 == nil then var2 else var3,
		itemSize = var2,
		scaleType = useSignalState(p1.getScaleType or var1),
		overlayEdits = { p1.overlay }
	})
end

local function LegacyStickerOverlayLayer(p1)
	-- upvalues: useSignalState (ref), overlayScaleModule (ref), reactModule (ref), stickerOverlayModule (ref)
	return reactModule.createElement(stickerOverlayModule, {
		draggable = false,
		editable = false,
		additionalScale = overlayScaleModule(1, useSignalState(p1.getItemSize).X),
		overlayEdit = p1.overlay
	})
end

return {
	kind = "sticker",
	create = function(p1, _)
		-- upvalues: getFFlagMomentsStickerOverlayMediaRectModule (ref), reactModule (ref), LegacyStickerOverlayLayer (ref), StickerOverlayLayer (ref)
		local overlay = p1.overlay
		assert(overlay ~= nil, "createStickerOverlayNode: spec.overlay (a StickerOverlayEdit) is required")
		
		return {
			kind = "sticker",
			usesDecoder = false,
			id = p1.id,
			assets = function()
				return {}
			end,
			download = function() end,
			zIndex = p1.zIndex or overlay.zIndex,
			render = function(p2)
				-- upvalues: getFFlagMomentsStickerOverlayMediaRectModule (copy), reactModule (copy), LegacyStickerOverlayLayer (copy), overlay (ref), StickerOverlayLayer (copy)
				return if getFFlagMomentsStickerOverlayMediaRectModule() then reactModule.createElement(StickerOverlayLayer, {
					overlay = overlay,
					getItemSize = p2.getItemSize,
					getResolution = p2.getResolution,
					getScaleType = p2.getScaleType
				}) else reactModule.createElement(LegacyStickerOverlayLayer, { overlay = overlay, getItemSize = p2.getItemSize })
			end,
			dispose = function() end
		}
	end
}