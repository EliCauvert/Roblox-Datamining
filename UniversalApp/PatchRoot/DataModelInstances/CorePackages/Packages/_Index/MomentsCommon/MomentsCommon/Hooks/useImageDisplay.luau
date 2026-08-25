local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(momentsCommon.Parent.React)
local signalModule = require(momentsCommon.Utils.Signal)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useToggleStateModule = require(momentsCommon.Hooks.useToggleState)

return function(_, p0)
	-- upvalues: useRef (ref), signalModule (ref), useToggleStateModule (ref), useEffect (ref), contentProviderService (ref), useCallback (ref)
	local var5 = useRef(nil)
	local var6 = useRef(nil)
	local var7 = useRef(false)
	local var8 = useRef(signalModule.new())
	local var9 = useToggleStateModule(false)
	useEffect(function()
		-- upvalues: var5 (ref), p0 (ref), var7 (ref), var6 (ref), contentProviderService (copy), var8 (ref)
		local current = var5.current
		
		if not current then return end
		if p0 then
			var7.current = false
			
			if p0.SourceType == Enum.ContentSourceType.Uri then
				var6.current = p0.Uri
				task.spawn(function()
					-- upvalues: contentProviderService (copy), p0 (copy), var6 (copy), var7 (copy), var8 (copy)
					contentProviderService:PreloadAsync({ p0.Uri }, function(_, p1)
						-- upvalues: var6 (copy), p0 (copy), var7 (copy), var8 (copy)
						if var6.current ~= p0.Uri then return end
						if p1 == Enum.AssetFetchStatus.Success then
							var7.current = true
							var8.current:fire()
						end
					end)
				end)
			end
			if p0.SourceType == Enum.ContentSourceType.Object then
				var7.current = true
				var8.current:fire()
			end
			current.ImageContent = p0
		end
	end, { var9.enabled, p0 })
	
	return {
		isLoadedRef = var7,
		onImageLoadedSignalRef = var8,
		ref = var5,
		updateRef = useCallback(function(p2)
			-- upvalues: var9 (ref), var5 (ref)
			var9.toggle()
			var5.current = p2
		end, { var9.toggle })
	}
end