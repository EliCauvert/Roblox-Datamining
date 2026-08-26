local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(momentsCommon.Parent.React)
local signalModule = require(momentsCommon.Utils.Signal)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useToggleStateModule = require(momentsCommon.Hooks.useToggleState)

return function(_, p1)
	-- upvalues: useRef (ref), signalModule (ref), useToggleStateModule (ref), useEffect (ref), contentProviderService (ref), useCallback (ref)
	local var1 = useRef(nil)
	local var2 = useRef(nil)
	local var3 = useRef(false)
	local var4 = useRef(signalModule.new())
	local var5 = useToggleStateModule(false)
	useEffect(function()
		-- upvalues: var1 (ref), p1 (ref), var3 (ref), var2 (ref), contentProviderService (copy), var4 (ref)
		local current = var1.current
		
		if not current then return end
		if p1 then
			var3.current = false
			
			if p1.SourceType == Enum.ContentSourceType.Uri then
				var2.current = p1.Uri
				task.spawn(function()
					-- upvalues: contentProviderService (copy), p1 (copy), var2 (copy), var3 (copy), var4 (copy)
					contentProviderService:PreloadAsync({ p1.Uri }, function(_, p2)
						-- upvalues: var2 (copy), p1 (copy), var3 (copy), var4 (copy)
						if var2.current ~= p1.Uri then return end
						if p2 == Enum.AssetFetchStatus.Success then
							var3.current = true
							var4.current:fire()
						end
					end)
				end)
			end
			if p1.SourceType == Enum.ContentSourceType.Object then
				var3.current = true
				var4.current:fire()
			end
			current.ImageContent = p1
		end
	end, { var5.enabled, p1 })
	
	return {
		isLoadedRef = var3,
		onImageLoadedSignalRef = var4,
		ref = var1,
		updateRef = useCallback(function(p2)
			-- upvalues: var5 (ref), var1 (ref)
			var5.toggle()
			var1.current = p2
		end, { var5.toggle })
	}
end