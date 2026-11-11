local CorePackages = game:GetService("CorePackages")
local ContentProvider = game:GetService("ContentProvider")
local RunService = game:GetService("RunService")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Skeleton = FoundationModule.Skeleton
local Image = FoundationModule.Image
local View = FoundationModule.View

return function(Frame)
	-- upvalues: ReactModule (copy), ContentProvider (copy), RunService (copy), View (copy), Skeleton (copy), Image (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), Frame (copy)
		if Current == UseRefResult1.current then return end
		UseRefResult1.current = Current
		
		if Frame.onImageStateChanged then
			Frame.onImageStateChanged(Current)
		end
	end, { Frame.onImageStateChanged })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy), UseResult (copy), ContentProvider (upval), UseRefResult (copy), RunService (upval)
		local Image = Frame.Image
		
		if not Image then
			UseStateResult2(false)
			UseResult(false)
			
			return
		end
		local CurrentTime = time()
		
		local function checkImageState()
			-- upvalues: ContentProvider (upval), Image (copy), CurrentTime (copy), UseRefResult (upval), UseResult (upval), UseStateResult2 (upval)
			local AssetFetchStatus = ContentProvider:GetAssetFetchStatus(Image)
			local IsCurrentTimeAbove = time() - CurrentTime >= 1
			local IsAssetFetchStatusMatch: boolean = AssetFetchStatus == Enum.AssetFetchStatus.Success or IsCurrentTimeAbove and AssetFetchStatus == Enum.AssetFetchStatus.None
			local IsLoaded = (if UseRefResult.current then UseRefResult.current.IsLoaded else false) or IsAssetFetchStatusMatch
			UseResult(IsLoaded)
			local IsAssetFetchStatusMatch1: boolean = AssetFetchStatus == Enum.AssetFetchStatus.Failure or AssetFetchStatus == Enum.AssetFetchStatus.TimedOut
			local IsLoaded1 = IsLoaded or IsAssetFetchStatusMatch1
			UseStateResult2(IsLoaded1)
			
			return IsLoaded1
		end
		
		if checkImageState() then return end
		local Connections = nil
		
		local function _()
			-- upvalues: Connections (ref)
			if not Connections then return end
			for _, connection in Connections do
				connection:Disconnect()
			end
			Connections = nil
		end
		
		local function onStateMayHaveChanged()
			-- upvalues: checkImageState (copy), Connections (ref)
			if checkImageState() then
				if not Connections then return end
				for _, connection in Connections do
					connection:Disconnect()
				end
				Connections = nil
			end
		end
		
		Connections = {
			ContentProvider:GetAssetFetchStatusChangedSignal(Image):Connect(onStateMayHaveChanged),
			RunService.RenderStepped:Connect(onStateMayHaveChanged)
		}
		
		return function()
			-- upvalues: Connections (ref)
			if not Connections then return end
			for _, connection in Connections do
				connection:Disconnect()
			end
			Connections = nil
		end
	end, { Frame.Image, UseResult })
	
	return ReactModule.createElement(View, {
		Size = Frame.Size,
		SizeConstraint = Frame.SizeConstraint,
		LayoutOrder = Frame.LayoutOrder
	}, {
		skeleton = if UseStateResult then nil else ReactModule.createElement(Skeleton, { tag = "size-full-full" }),
		image = if Frame.Image then ReactModule.createElement(Image, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			ref = UseRefResult,
			tag = `size-full-full {Frame.tag}`,
			Image = Frame.Image,
			onActivated = Frame.onActivated
		}) else nil
	})
end