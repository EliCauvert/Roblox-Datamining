local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local ContentProvider = require(Foundation.Utility.Wrappers).Services.ContentProvider
local _ = require(Foundation.Components.Types)

local function _(AssetFetchStatus): boolean
	return AssetFetchStatus == Enum.AssetFetchStatus.Success or (AssetFetchStatus == Enum.AssetFetchStatus.Failure or AssetFetchStatus == Enum.AssetFetchStatus.TimedOut)
end

local function attachOnLoaded(ContentId, Callback: (any) -> ())
	-- upvalues: ContentProvider (copy)
	if ContentId == nil then return end
	local AssetFetchStatus = ContentProvider:GetAssetFetchStatus(ContentId)
	
	if AssetFetchStatus == Enum.AssetFetchStatus.Success or (AssetFetchStatus == Enum.AssetFetchStatus.Failure or AssetFetchStatus == Enum.AssetFetchStatus.TimedOut) then
		Callback(AssetFetchStatus)
		
		return
	else
		return ContentProvider:GetAssetFetchStatusChangedSignal(ContentId):Connect(function(AssetFetchStatus)
			-- upvalues: Callback (copy)
			if AssetFetchStatus == Enum.AssetFetchStatus.Success or (AssetFetchStatus == Enum.AssetFetchStatus.Failure or AssetFetchStatus == Enum.AssetFetchStatus.TimedOut) then
				Callback(AssetFetchStatus)
			end
		end)
	end
end

return function(p1, Callback)
	-- upvalues: ReactModule (copy), ReactIsModule (copy), attachOnLoaded (copy)
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), ReactIsModule (upval), p1 (copy), attachOnLoaded (upval), ReactModule (upval)
		if not Callback then return end
		local Connection = nil
		
		local function _()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
		
		local function handleFinalStatus(p2)
			-- upvalues: Connection (ref), Callback (upval)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			Callback(p2)
		end
		
		if ReactIsModule.isBinding(p1) then
			Connection = attachOnLoaded(p1:getValue(), handleFinalStatus)
			local SubscribeToBindingResult = ReactModule.__subscribeToBinding(p1, function(p2)
				-- upvalues: Connection (ref), attachOnLoaded (upval), handleFinalStatus (copy)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				Connection = attachOnLoaded(p2, handleFinalStatus)
			end)
			
			return function()
				-- upvalues: SubscribeToBindingResult (copy), Connection (ref)
				SubscribeToBindingResult()
				
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
		else
			Connection = attachOnLoaded(p1, handleFinalStatus)
			
			return function()
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
		end
	end, { p1, Callback })
end