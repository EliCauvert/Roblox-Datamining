local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local TextOverlayDisplayModule = require(MomentsCommon.Components.TextOverlayDisplay)
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local FFlagMomentsOverlayContainerScaleFallbackModule = require(MomentsCommon.Flags.FFlagMomentsOverlayContainerScaleFallback)
local Signal = SignalsModule.createSignal(Enum.ScaleType.Crop)

local function TextOverlayLayer(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), Signal (copy), FFlagMomentsOverlayContainerScaleFallbackModule (copy), TextOverlayDisplayModule (copy)
	local GetResolutionFunction = p1.getResolution
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetResolutionFunction (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetResolutionFunction (upval)
			return GetResolutionFunction(p2)
		end)
	end, { GetResolutionFunction })
	local UseSignalStateResult = UseSignalStateFunction(p1.getItemSize)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult)
	
	return ReactModule.createElement(TextOverlayDisplayModule, {
		draggable = false,
		editable = false,
		itemResolution = if FFlagMomentsOverlayContainerScaleFallbackModule and UseSignalStateResult1 == nil then UseSignalStateResult else UseSignalStateResult1,
		itemSize = UseSignalStateResult,
		scaleType = UseSignalStateFunction(p1.getScaleType or Signal),
		textOverlayEdits = { p1.overlay }
	})
end

return {
	kind = "text",
	create = function(p1, _)
		-- upvalues: ReactModule (copy), TextOverlayLayer (copy)
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
				-- upvalues: ReactModule (upval), TextOverlayLayer (upval), Overlay (copy)
				return ReactModule.createElement(TextOverlayLayer, {
					overlay = Overlay,
					getItemSize = p2.getItemSize,
					getResolution = p2.getResolution,
					getScaleType = p2.getScaleType
				})
			end,
			dispose = function() end
		}
	end
}