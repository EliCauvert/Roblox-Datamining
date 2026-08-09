local corePackagesService = game:GetService("CorePackages")
local contentProviderService = game:GetService("ContentProvider")
local runService = game:GetService("RunService")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local skeleton = foundationModule.Skeleton
local image = foundationModule.Image
local view = foundationModule.View

return function(p0) --[[ line: 32 ]]
	-- upvalues: reactModule (ref), contentProviderService (ref), runService (ref), view (ref), skeleton (ref), image (ref)
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useCallback(function(p1) --[[ line: 37 ]]
		-- upvalues: var8 (ref), p0 (ref)
		if p1 == var8.current then return end
		var8.current = p1
		
		if p0.onImageStateChanged then
			p0.onImageStateChanged(p1)
		end
	end, { p0.onImageStateChanged })
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: p0 (ref), var7 (ref), var9 (ref), contentProviderService (copy), var5 (ref), runService (copy)
		local image = p0.Image
		
		if not image then
			var7(false)
			var9(false)
			
			return
		end
		local var10 = time()
		
		local function checkImageState() --[[ line: 57 ]]
			-- upvalues: contentProviderService (copy), image (ref), var10 (ref), var5 (copy), var9 (copy), var7 (copy)
			local var14 = contentProviderService:GetAssetFetchStatus(image)
			local var15 = (if var5.current then var5.current.IsLoaded else false) or (if var14 ~= Enum.AssetFetchStatus.Success then time() - var10 >= 1 and var14 == Enum.AssetFetchStatus.None else true)
			var9(var15)
			local var15_1 = var15 or (if var14 ~= Enum.AssetFetchStatus.Failure then var14 == Enum.AssetFetchStatus.TimedOut else true)
			var7(var15_1)
			
			return var15_1
		end
		
		if checkImageState() then
			return
		end
		local list = nil
		
		local function _() --[[ line: 79 | named "disconnect" ]]
			-- upvalues: list (write)
			if not list then return end
			for i, v in list do
				v:Disconnect()
			end
			list = nil
		end
		
		local function onStateMayHaveChanged() --[[ line: 90 ]]
			-- upvalues: checkImageState (ref), list (write)
			if checkImageState() then
				if not list then return end
				for i, v in list do
					v:Disconnect()
				end
				list = nil
			end
		end
		
		list = {
			contentProviderService:GetAssetFetchStatusChangedSignal(image):Connect(onStateMayHaveChanged),
			runService.RenderStepped:Connect(onStateMayHaveChanged)
		}
		
		return function() --[[ line: 101 ]]
			-- upvalues: list (write)
			if not list then return end
			for i, v in list do
				v:Disconnect()
			end
			list = nil
		end
	end, { p0.Image, var9 })
	
	return reactModule.createElement(view, {
		Size = p0.Size,
		SizeConstraint = p0.SizeConstraint,
		LayoutOrder = p0.LayoutOrder
	}, {
		skeleton = if not var6 then reactModule.createElement(skeleton, { tag = "size-full-full" }) else nil,
		image = if p0.Image then reactModule.createElement(image, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ref = var5,
			tag = `size-full-full {p0.tag}`,
			Image = p0.Image,
			onActivated = p0.onActivated
		}) else nil
	})
end