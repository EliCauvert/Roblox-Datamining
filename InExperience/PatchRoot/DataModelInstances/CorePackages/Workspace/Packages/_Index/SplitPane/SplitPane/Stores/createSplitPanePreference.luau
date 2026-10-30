local Parent = script:FindFirstAncestor("SplitPane").Parent
local SignalsModule = require(Parent.Signals)
local MockableProxyServicesModule = require(Parent.MockableProxyServices)

return function()
	-- upvalues: MockableProxyServicesModule (copy), SignalsModule (copy)
	local AppStorageService = MockableProxyServicesModule.AppStorageService
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Flag = false
	local Flag1 = false
	
	local function _(p1)
		-- upvalues: AppStorageService (copy)
		pcall(function()
			-- upvalues: AppStorageService (upval), p1 (copy)
			AppStorageService:SetItem("SplitPaneCollapsedPreference", (tostring(p1)))
			AppStorageService:Flush()
		end)
	end
	
	pcall(function()
		-- upvalues: AppStorageService (copy), Flag (ref), Flag1 (ref), Signal (copy), Signal2 (copy)
		AppStorageService:WhenLoaded(function()
			-- upvalues: Flag (upval), Flag1 (upval), Signal (upval), AppStorageService (upval), Signal2 (upval)
			Flag = true
			
			if Flag1 then
				local SignalResult = Signal(false)
				pcall(function()
					-- upvalues: AppStorageService (upval), SignalResult (copy)
					AppStorageService:SetItem("SplitPaneCollapsedPreference", (tostring(SignalResult)))
					AppStorageService:Flush()
				end)
				
				return
			end
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService (upval)
				return AppStorageService:GetItem("SplitPaneCollapsedPreference")
			end)
			
			if Success and (Result == "true" or Result == "false") then
				Signal2(Result == "true")
			end
		end)
	end)
	
	return Signal, function(p1)
		-- upvalues: Flag1 (ref), Signal2 (copy), Flag (ref), AppStorageService (copy)
		Flag1 = true
		Signal2(p1)
		
		if Flag then
			pcall(function()
				-- upvalues: AppStorageService (upval), p1 (copy)
				AppStorageService:SetItem("SplitPaneCollapsedPreference", (tostring(p1)))
				AppStorageService:Flush()
			end)
		end
	end
end