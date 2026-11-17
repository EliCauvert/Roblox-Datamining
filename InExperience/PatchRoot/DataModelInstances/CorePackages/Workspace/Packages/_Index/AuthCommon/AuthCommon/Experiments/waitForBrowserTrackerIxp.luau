local Parent = script:FindFirstAncestor("AuthCommon").Parent
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)

local function _(IXPLoadingStatus): boolean
	return IXPLoadingStatus ~= Enum.IXPLoadingStatus.None and IXPLoadingStatus ~= Enum.IXPLoadingStatus.Pending
end

return function(IXPService, Delay)
	-- upvalues: PromiseModule (copy)
	local ClockTime = os.clock()
	local BrowserTrackerLayerLoadingStatus = IXPService:GetBrowserTrackerLayerLoadingStatus()
	
	local function _(Outcome)
		-- upvalues: BrowserTrackerLayerLoadingStatus (copy), ClockTime (copy)
		return {
			ready = Outcome == "alreadyInitialized" or Outcome == "initialized",
			outcome = Outcome,
			initialStatus = BrowserTrackerLayerLoadingStatus.Name,
			elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
		}
	end
	
	if BrowserTrackerLayerLoadingStatus ~= Enum.IXPLoadingStatus.None and BrowserTrackerLayerLoadingStatus ~= Enum.IXPLoadingStatus.Pending then
		local AlreadyInitialized: string = if BrowserTrackerLayerLoadingStatus == Enum.IXPLoadingStatus.Initialized then "alreadyInitialized" else "error"
		
		return PromiseModule.resolve({
			ready = AlreadyInitialized == "alreadyInitialized" or AlreadyInitialized == "initialized",
			outcome = AlreadyInitialized,
			initialStatus = BrowserTrackerLayerLoadingStatus.Name,
			elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
		})
	else
		return PromiseModule.new(function(Callback)
			-- upvalues: BrowserTrackerLayerLoadingStatus (copy), ClockTime (copy), IXPService (copy), Delay (copy)
			local Connection = nil
			local Flag = false
			
			local function _(Outcome)
				-- upvalues: Flag (ref), Connection (ref), Callback (copy), BrowserTrackerLayerLoadingStatus (upval), ClockTime (upval)
				if Flag then return end
				Flag = true
				
				if Connection then
					Connection:Disconnect()
				end
				Callback({
					ready = Outcome == "alreadyInitialized" or Outcome == "initialized",
					outcome = Outcome,
					initialStatus = BrowserTrackerLayerLoadingStatus.Name,
					elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
				})
			end
			
			Connection = IXPService.OnBrowserTrackerLayerLoadingStatusChanged:Connect(function()
				-- upvalues: IXPService (upval), Flag (ref), Connection (ref), Callback (copy), BrowserTrackerLayerLoadingStatus (upval), ClockTime (upval)
				local BrowserTrackerLayerLoadingStatus1 = IXPService:GetBrowserTrackerLayerLoadingStatus()
				
				if BrowserTrackerLayerLoadingStatus1 ~= Enum.IXPLoadingStatus.None and BrowserTrackerLayerLoadingStatus1 ~= Enum.IXPLoadingStatus.Pending then
					local Initialized: string = if BrowserTrackerLayerLoadingStatus1 == Enum.IXPLoadingStatus.Initialized then "initialized" else "error"
					
					if Flag then return end
					Flag = true
					
					if Connection then
						Connection:Disconnect()
					end
					Callback({
						ready = Initialized == "alreadyInitialized" or Initialized == "initialized",
						outcome = Initialized,
						initialStatus = BrowserTrackerLayerLoadingStatus.Name,
						elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
					})
				end
			end)
			task.delay(Delay, function()
				-- upvalues: Flag (ref), Connection (ref), Callback (copy), BrowserTrackerLayerLoadingStatus (upval), ClockTime (upval)
				if Flag then return end
				Flag = true
				
				if Connection then
					Connection:Disconnect()
				end
				Callback({
					ready = false,
					outcome = "timeout",
					initialStatus = BrowserTrackerLayerLoadingStatus.Name,
					elapsedMs = math.floor((os.clock() - ClockTime) * 1000)
				})
			end)
		end)
	end
end