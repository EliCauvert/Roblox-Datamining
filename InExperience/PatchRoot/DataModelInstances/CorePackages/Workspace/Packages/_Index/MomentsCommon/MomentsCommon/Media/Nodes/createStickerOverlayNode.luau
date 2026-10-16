local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local StickerOverlayModule = require(MomentsCommon.Components.StickerOverlay)
local OverlayDisplayModule = require(MomentsCommon.Components.OverlayDisplay)
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local OverlayScaleModule = require(MomentsCommon.Media.overlayScale)
local GetFFlagMomentsStickerOverlayMediaRectModule = require(MomentsCommon.Flags.GetFFlagMomentsStickerOverlayMediaRect)
local FFlagMomentsOverlayContainerScaleFallbackModule = require(MomentsCommon.Flags.FFlagMomentsOverlayContainerScaleFallback)
local Signal = SignalsModule.createSignal(Enum.ScaleType.Crop)

local function StickerOverlayLayer(p1) --[[ Line: 86 ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), Signal (copy), FFlagMomentsOverlayContainerScaleFallbackModule (copy), OverlayDisplayModule (copy), StickerOverlayModule (copy)
	local GetResolutionFunction = p1.getResolution
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 98 ]]
		-- upvalues: SignalsModule (upval), GetResolutionFunction (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 99 ]]
			-- upvalues: GetResolutionFunction (upval)
			return GetResolutionFunction(p2)
		end)
	end, { GetResolutionFunction })
	local UseSignalStateResult = UseSignalStateFunction(p1.getItemSize)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult)
	
	return ReactModule.createElement(OverlayDisplayModule, {
		draggable = false,
		editable = false,
		overlayComponent = StickerOverlayModule,
		itemResolution = if FFlagMomentsOverlayContainerScaleFallbackModule and UseSignalStateResult1 == nil then UseSignalStateResult else UseSignalStateResult1,
		itemSize = UseSignalStateResult,
		scaleType = UseSignalStateFunction(p1.getScaleType or Signal),
		overlayEdits = { p1.overlay }
	})
end

local function LegacyStickerOverlayLayer(p1) --[[ Line: 139 ]]
	-- upvalues: UseSignalStateFunction (copy), OverlayScaleModule (copy), ReactModule (copy), StickerOverlayModule (copy)
	return ReactModule.createElement(StickerOverlayModule, {
		draggable = false,
		editable = false,
		additionalScale = OverlayScaleModule(1, UseSignalStateFunction(p1.getItemSize).X),
		overlayEdit = p1.overlay
	})
end

return {
	kind = "sticker",
	create = function(p1, _) --[[ Line: 152 ]]
		-- upvalues: GetFFlagMomentsStickerOverlayMediaRectModule (copy), ReactModule (copy), LegacyStickerOverlayLayer (copy), StickerOverlayLayer (copy)
		local Overlay = p1.overlay
		assert(Overlay ~= nil, "createStickerOverlayNode: spec.overlay (a StickerOverlayEdit) is required")
		
		return {
			kind = "sticker",
			usesDecoder = false,
			id = p1.id,
			assets = function() --[[ Line: 164 ]]
				return {}
			end,
			download = function() --[[ Line: 190 ]] end,
			zIndex = p1.zIndex or Overlay.zIndex,
			render = function(p2) --[[ Line: 168 ]]
				-- upvalues: GetFFlagMomentsStickerOverlayMediaRectModule (upval), ReactModule (upval), LegacyStickerOverlayLayer (upval), Overlay (copy), StickerOverlayLayer (upval)
				return if GetFFlagMomentsStickerOverlayMediaRectModule() then ReactModule.createElement(StickerOverlayLayer, {
					overlay = Overlay,
					getItemSize = p2.getItemSize,
					getResolution = p2.getResolution,
					getScaleType = p2.getScaleType
				}) else ReactModule.createElement(LegacyStickerOverlayLayer, { overlay = Overlay, getItemSize = p2.getItemSize })
			end,
			dispose = function() --[[ Line: 194 ]] end
		}
	end
}