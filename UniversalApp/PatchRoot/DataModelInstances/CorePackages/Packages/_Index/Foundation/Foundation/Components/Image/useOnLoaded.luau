local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local contentProvider = require(foundation.Utility.Wrappers).Services.ContentProvider
local _ = require(foundation.Components.Types)

local function _(value) --[[ line: 21 | named "isFinalAssetFetchStatus" ]]
	return if value ~= Enum.AssetFetchStatus.Success then if value ~= Enum.AssetFetchStatus.Failure then value == Enum.AssetFetchStatus.TimedOut else true else true
end

local function attachOnLoaded(p0, p1) --[[ line: 27 ]]
	-- upvalues: contentProvider (ref)
	if p0 == nil then return end
	local var4 = contentProvider:GetAssetFetchStatus(p0)
	
	if if var4 ~= Enum.AssetFetchStatus.Success then if var4 ~= Enum.AssetFetchStatus.Failure then var4 == Enum.AssetFetchStatus.TimedOut else true else true then
		p1(var4)
		
		return
	end
	return contentProvider:GetAssetFetchStatusChangedSignal(p0):Connect(function(p2) --[[ line: 41 ]]
		-- upvalues: p1 (ref)
		if if p2 ~= Enum.AssetFetchStatus.Success then if p2 ~= Enum.AssetFetchStatus.Failure then p2 == Enum.AssetFetchStatus.TimedOut else true else true then
			p1(p2)
		end
	end)
end

return function(p3, p4) --[[ line: 48 | named "useOnLoaded" ]]
	-- upvalues: reactModule (ref), reactIsModule (ref), attachOnLoaded (ref)
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: p4 (ref), reactIsModule (copy), p3 (ref), attachOnLoaded (copy), reactModule (copy)
		if not p4 then return end
		local var5 = nil
		
		local function _() --[[ line: 55 | named "disconnectConnection" ]]
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
		end
		
		local function handleFinalStatus(p5) --[[ line: 62 ]]
			-- upvalues: var5 (write), p4 (copy)
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
			p4(p5)
		end
		
		if reactIsModule.isBinding(p3) then
			local var7 = p3
			var5 = attachOnLoaded(var7:getValue(), handleFinalStatus)
			local var8 = reactModule.__subscribeToBinding(var7, function(p6) --[[ line: 71 ]]
				-- upvalues: var5 (write), attachOnLoaded (copy), handleFinalStatus (ref)
				if var5 then
					var5:Disconnect()
					var5 = nil
				end
				var5 = attachOnLoaded(p6, handleFinalStatus)
			end)
			
			return function() --[[ line: 76 ]]
				-- upvalues: var8 (ref), var5 (write)
				var8()
				
				if var5 then
					var5:Disconnect()
					var5 = nil
				end
			end
		end
		var5 = attachOnLoaded(p3, handleFinalStatus)
		
		return function() --[[ line: 84 ]]
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
		end
	end, { p3, p4 })
end