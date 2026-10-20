local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local TextOverlayModule = require(MomentsCommon.Components.TextOverlay)
local TextOverlayDisplayModule = require(MomentsCommon.Components.TextOverlayDisplay)
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local OverlayScaleModule = require(MomentsCommon.Media.overlayScale)
local GetFFlagMomentsTextOverlayMediaRectModule = require(MomentsCommon.Flags.GetFFlagMomentsTextOverlayMediaRect)
local Signal = SignalsModule.createSignal(Enum.ScaleType.Crop)

local function TextOverlayLayer(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), Signal (copy), TextOverlayDisplayModule (copy)
	local GetResolutionFunction = p1.getResolution
	
	return ReactModule.createElement(TextOverlayDisplayModule, {
		draggable = false,
		editable = false,
		itemResolution = UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), GetResolutionFunction (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: GetResolutionFunction (upval)
				return GetResolutionFunction(p2)
			end)
		end, { GetResolutionFunction }))),
		itemSize = UseSignalStateFunction(p1.getItemSize),
		scaleType = UseSignalStateFunction(p1.getScaleType or Signal),
		textOverlayEdits = { p1.overlay }
	})
end

local function LegacyTextOverlayLayer(p1)
	-- upvalues: UseSignalStateFunction (copy), OverlayScaleModule (copy), ReactModule (copy), TextOverlayModule (copy)
	return ReactModule.createElement(TextOverlayModule, {
		draggable = false,
		editable = false,
		additionalScale = OverlayScaleModule(1, UseSignalStateFunction(p1.getItemSize).X),
		textOverlayEdit = p1.overlay
	})
end

return {
	kind = "text",
	create = function(p1, _)
		-- upvalues: GetFFlagMomentsTextOverlayMediaRectModule (copy), ReactModule (copy), LegacyTextOverlayLayer (copy), TextOverlayLayer (copy)
		local Overlay = p1.overlay
		assert(Overlay ~= nil, "createTextOverlayNode: spec.overlay (a TextOverlayEdit) is required")
		
		return {
			kind = "text",
			usesDecoder = false,
			id = p1.id,
			assets = function()
				return {}
			end,
			download = function() end,
			zIndex = p1.zIndex or Overlay.zIndex,
			render = function(p2)
				-- upvalues: GetFFlagMomentsTextOverlayMediaRectModule (upval), ReactModule (upval), LegacyTextOverlayLayer (upval), Overlay (copy), TextOverlayLayer (upval)
				return if GetFFlagMomentsTextOverlayMediaRectModule() then ReactModule.createElement(TextOverlayLayer, {
					overlay = Overlay,
					getItemSize = p2.getItemSize,
					getResolution = p2.getResolution,
					getScaleType = p2.getScaleType
				}) else ReactModule.createElement(LegacyTextOverlayLayer, { overlay = Overlay, getItemSize = p2.getItemSize })
			end,
			dispose = function() end
		}
	end
}