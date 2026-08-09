local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local _ = require(parent.MomentsTypes)
local useSignalState = require(parent.SignalsReact).useSignalState
local textOverlayModule = require(momentsCommon.Components.TextOverlay)
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local overlayScaleModule = require(momentsCommon.Media.overlayScale)

local function TextOverlayLayer(p0) --[[ line: 74 ]]
	-- upvalues: useSignalState (ref), overlayScaleModule (ref), reactModule (ref), textOverlayModule (ref)
	return reactModule.createElement(textOverlayModule, {
		draggable = false,
		editable = false,
		additionalScale = overlayScaleModule(1, useSignalState(p0.getItemSize).X),
		textOverlayEdit = p0.overlay
	})
end

return {
	kind = "text",
	create = function(p1, _) --[[ line: 87 ]]
		-- upvalues: reactModule (ref), TextOverlayLayer (ref)
		local overlay = p1.overlay
		assert(overlay ~= nil, "createTextOverlayNode: spec.overlay (a TextOverlayEdit) is required")
		
		return {
			kind = "text",
			usesDecoder = false,
			id = p1.id,
			assets = function() --[[ line: 95 ]]
				return {}
			end,
			download = function() --[[ line: 110 ]] end,
			zIndex = p1.zIndex or overlay.zIndex,
			render = function(p2) --[[ line: 99 ]]
				-- upvalues: reactModule (copy), TextOverlayLayer (copy), overlay (ref)
				return reactModule.createElement(TextOverlayLayer, { overlay = overlay, getItemSize = p2.getItemSize })
			end,
			dispose = function() --[[ line: 114 ]] end
		}
	end
}