local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local contentProvider = require(foundation.Utility.Wrappers).Services.ContentProvider
local _ = require(foundation.Components.Types)

local function _(value)
	return if value ~= Enum.AssetFetchStatus.Success then if value ~= Enum.AssetFetchStatus.Failure then value == Enum.AssetFetchStatus.TimedOut else true else true
end

local function attachOnLoaded(p1, p2)
	-- upvalues: contentProvider (ref)
	if p1 == nil then return end
	local var1 = contentProvider:GetAssetFetchStatus(p1)
	
	if if var1 ~= Enum.AssetFetchStatus.Success then if var1 ~= Enum.AssetFetchStatus.Failure then var1 == Enum.AssetFetchStatus.TimedOut else true else true then
		p2(var1)
		
		return
	end
	return contentProvider:GetAssetFetchStatusChangedSignal(p1):Connect(function(p3)
		-- upvalues: p2 (ref)
		if if p3 ~= Enum.AssetFetchStatus.Success then if p3 ~= Enum.AssetFetchStatus.Failure then p3 == Enum.AssetFetchStatus.TimedOut else true else true then
			p2(p3)
		end
	end)
end

return function(p1, p2)
	-- upvalues: reactModule (ref), reactIsModule (ref), attachOnLoaded (ref)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), reactIsModule (copy), p1 (ref), attachOnLoaded (copy), reactModule (copy)
		if not p2 then return end
		local var1 = nil
		
		local function _()
			-- upvalues: var1 (write)
			if var1 then
				var1:Disconnect()
				var1 = nil
			end
		end
		
		local function handleFinalStatus(p3)
			-- upvalues: var1 (write), p2 (copy)
			if var1 then
				var1:Disconnect()
				var1 = nil
			end
			p2(p3)
		end
		
		if reactIsModule.isBinding(p1) then
			local var2 = p1
			var1 = attachOnLoaded(var2:getValue(), handleFinalStatus)
			local var3 = reactModule.__subscribeToBinding(var2, function(p3)
				-- upvalues: var1 (write), attachOnLoaded (copy), handleFinalStatus (ref)
				if var1 then
					var1:Disconnect()
					var1 = nil
				end
				var1 = attachOnLoaded(p3, handleFinalStatus)
			end)
			
			return function()
				-- upvalues: var3 (ref), var1 (write)
				var3()
				
				if var1 then
					var1:Disconnect()
					var1 = nil
				end
			end
		end
		var1 = attachOnLoaded(p1, handleFinalStatus)
		
		return function()
			-- upvalues: var1 (write)
			if var1 then
				var1:Disconnect()
				var1 = nil
			end
		end
	end, { p1, p2 })
end