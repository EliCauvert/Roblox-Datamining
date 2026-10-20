local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.ElevationLayer)
local ElevationProviderModule = require(script.Parent.ElevationProvider)
local _ = require(script.Parent.elevation)
local UseElevationManagerFunction = ElevationProviderModule.useElevationManager
local UseOwnerTokenFunction = ElevationProviderModule.useOwnerToken

return function(Layer, p1)
	-- upvalues: UseElevationManagerFunction (copy), UseOwnerTokenFunction (copy), ReactModule (copy)
	local UseElevationManagerResult = UseElevationManagerFunction()
	local UseOwnerTokenResult = UseOwnerTokenFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseOwnerTokenResult (copy), Layer (copy), p1 (copy), UseElevationManagerResult (copy)
		local IsLayerMatch: boolean = UseOwnerTokenResult ~= nil and UseOwnerTokenResult.layer == Layer
		
		return if p1.stackAboveOwner then if UseOwnerTokenResult then if IsLayerMatch then UseElevationManagerResult.acquire(Layer, { reserve = true, owner = UseOwnerTokenResult }) else {
			index = -1,
			layer = Layer,
			zIndex = UseOwnerTokenResult.zIndex + 1
		} else UseElevationManagerResult.acquire(Layer, { reserve = false }) else UseElevationManagerResult.acquire(Layer, { reserve = IsLayerMatch })
	end, {
		Layer,
		UseOwnerTokenResult,
		UseElevationManagerResult,
		p1.stackAboveOwner
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseElevationManagerResult (copy), Layer (copy)
		return function()
			-- upvalues: UseMemoResult (upval), UseElevationManagerResult (upval), Layer (upval)
			if UseMemoResult.index ~= nil and UseMemoResult.index >= 0 then
				UseElevationManagerResult.releaseIfTop(Layer, UseMemoResult.index)
			end
		end
	end, { Layer, UseMemoResult.index })
	
	return UseMemoResult
end