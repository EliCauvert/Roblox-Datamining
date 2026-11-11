local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ContentProvider = game:GetService("ContentProvider")
local ReactModule = require(MomentsCommon.Parent.React)
local SignalModule = require(MomentsCommon.Utils.Signal)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseToggleStateModule = require(MomentsCommon.Hooks.useToggleState)

return function(_, ImageContent)
	-- upvalues: UseRefFunction (copy), SignalModule (copy), UseToggleStateModule (copy), UseEffectFunction (copy), ContentProvider (copy), UseCallbackFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseRefResult2 = UseRefFunction(false)
	local UseRefResult3 = UseRefFunction(SignalModule.new())
	local UseToggleStateModuleResult = UseToggleStateModule(false)
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), ImageContent (copy), UseRefResult2 (copy), UseRefResult1 (copy), ContentProvider (upval), UseRefResult3 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		if ImageContent then
			UseRefResult2.current = false
			
			if ImageContent.SourceType == Enum.ContentSourceType.Uri then
				UseRefResult1.current = ImageContent.Uri
				task.spawn(function()
					-- upvalues: ContentProvider (upval), ImageContent (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult3 (upval)
					ContentProvider:PreloadAsync({ ImageContent.Uri }, function(_, AssetFetchStatus)
						-- upvalues: UseRefResult1 (upval), ImageContent (upval), UseRefResult2 (upval), UseRefResult3 (upval)
						if UseRefResult1.current ~= ImageContent.Uri then return end
						if AssetFetchStatus == Enum.AssetFetchStatus.Success then
							UseRefResult2.current = true
							UseRefResult3.current:fire()
						end
					end)
				end)
			end
			if ImageContent.SourceType == Enum.ContentSourceType.Object then
				UseRefResult2.current = true
				UseRefResult3.current:fire()
			end
			Current.ImageContent = ImageContent
		end
	end, { UseToggleStateModuleResult.enabled, ImageContent })
	
	return {
		isLoadedRef = UseRefResult2,
		onImageLoadedSignalRef = UseRefResult3,
		ref = UseRefResult,
		updateRef = UseCallbackFunction(function(Current)
			-- upvalues: UseToggleStateModuleResult (copy), UseRefResult (copy)
			UseToggleStateModuleResult.toggle()
			UseRefResult.current = Current
		end, { UseToggleStateModuleResult.toggle })
	}
end