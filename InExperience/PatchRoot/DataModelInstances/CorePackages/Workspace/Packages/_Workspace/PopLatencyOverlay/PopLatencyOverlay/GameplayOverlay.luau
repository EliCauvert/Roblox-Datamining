local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.React)
local FormatModule = require(script.Parent.format)
local GameplayModule = require(script.Parent.gameplay)
local IsToggleChordModule = require(script.Parent.isToggleChord)
local list = {
	"RRakRecvToAppPop",
	"RAppPopToDeserialize",
	"RDeserializeToPBQ",
	"RQToS",
	"RBscQ"
}
local list1 = {
	"LQToS",
	"LBcsQ",
	"LRakRecvToAppPop",
	"LAppPopToSerialize",
	"LDeserializeToProcess"
}

local function _(Object, ChildName)
	local ChildName1 = Object:FindFirstChild(ChildName)
	
	if ChildName1 then
		local Success, Result = pcall(function()
			-- upvalues: ChildName1 (copy)
			return ChildName1:GetValue()
		end)
		
		return if Success and typeof(Result) == "number" then Result else nil
	else
		return nil
	end
end

local function sumStages(Object, ChildNames, p1): number
	local Total = 0
	
	for _, childName in ChildNames do
		local Child = Object:FindFirstChild(childName)
		local Amount = nil
		
		if Child then
			local Success, Result = pcall(function()
				-- upvalues: Child (copy)
				return Child:GetValue()
			end)
			Amount = if Success and typeof(Result) == "number" then Result else nil
		else
			Amount = nil
		end
		if Amount and Amount >= 0 and Amount <= p1 then
			Total += Amount
		end
	end
	return Total
end

local function readSplit(p2)
	-- upvalues: sumStages (copy), list (copy), list1 (copy)
	local Success, Result = pcall(function()
		-- upvalues: p2 (copy)
		return p2.Network.ServerStatsItem.DataPingDetails
	end)
	
	if not Success or not Result then
		return nil, nil, nil, nil
	end
	local MeasuredTotal = Result:FindFirstChild("MeasuredTotal")
	local v1 = nil
	
	if MeasuredTotal then
		local Success1, Result1 = pcall(function()
			-- upvalues: MeasuredTotal (copy)
			return MeasuredTotal:GetValue()
		end)
		v1 = if Success1 and typeof(Result1) == "number" then Result1 else nil
	else
		v1 = nil
	end
	if not v1 or v1 <= 0 then
		return nil, nil, nil, nil
	end
	local v2: number = v1
	local SumStagesResult = sumStages(Result, list, v1)
	local SumStagesResult1 = sumStages(Result, list1, v1)
	local RakPing = Result:FindFirstChild("RakPing")
	
	if not RakPing then
		return v2, SumStagesResult, SumStagesResult1, nil
	end
	local Success2, Result2 = pcall(function()
		-- upvalues: RakPing (copy)
		return RakPing:GetValue()
	end)
	
	if Success2 and typeof(Result2) == "number" then
		return v2, SumStagesResult, SumStagesResult1, Result2
	else
		return v2, SumStagesResult, SumStagesResult1, nil
	end
end

local function readPings(Stats)
	-- upvalues: readSplit (copy), Players (copy), GameplayModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: Stats (copy)
		return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
	end)
	local Split, Split2, Split3, Split4 = readSplit(Stats)
	local Success1, Result1 = pcall(function()
		-- upvalues: Players (upval)
		return Players.LocalPlayer:GetNetworkPing()
	end)
	local ServerStatsItem = Stats.Network:FindFirstChild("ServerStatsItem")
	local StatsService = if ServerStatsItem then ServerStatsItem:FindFirstChild("Stats") else nil
	local v1 = nil
	
	if StatsService then
		local IsLimitedByCongestionControl = StatsService:FindFirstChild("isLimitedByCongestionControl")
		
		if IsLimitedByCongestionControl then
			local Success2, Result2 = pcall(function()
				-- upvalues: IsLimitedByCongestionControl (copy)
				return IsLimitedByCongestionControl:GetValue()
			end)
			v1 = if Success2 and typeof(Result2) == "number" then Result2 else nil
		else
			v1 = nil
		end
	else
		v1 = nil
	end
	local v2 = nil
	if StatsService then
		local PacketlossLastSecond = StatsService:FindFirstChild("packetlossLastSecond")
		
		if PacketlossLastSecond then
			local Success3, Result3 = pcall(function()
				-- upvalues: PacketlossLastSecond (copy)
				return PacketlossLastSecond:GetValue()
			end)
			v2 = if Success3 and typeof(Result3) == "number" then Result3 else nil
		else
			v2 = nil
		end
	else
		v2 = nil
	end
	local v3 = nil
	if StatsService then
		local MessagesInResendQueue = StatsService:FindFirstChild("messagesInResendQueue")
		
		if MessagesInResendQueue then
			local Success4, Result4 = pcall(function()
				-- upvalues: MessagesInResendQueue (copy)
				return MessagesInResendQueue:GetValue()
			end)
			v3 = if Success4 and typeof(Result4) == "number" then Result4 else nil
		else
			v3 = nil
		end
	else
		v3 = nil
	end
	local PeerStatsPlausibleResult = GameplayModule.peerStatsPlausible(v2, v3)
	local config = {
		dataMs = if Success and typeof(Result) == "number" then Result else nil,
		rakMs = if Success1 and typeof(Result1) == "number" and Result1 >= 0 then Result1 * 1000 else nil,
		lastMs = Split,
		serverMs = Split2,
		clientMs = Split3,
		splitRakMs = if PeerStatsPlausibleResult then Split4 else nil,
		loss = if PeerStatsPlausibleResult then v2 else nil,
		resendMsgs = if PeerStatsPlausibleResult then v3 else nil
	}
	local ResendBytes = nil
	
	if StatsService and PeerStatsPlausibleResult then
		local BytesInResendQueue = StatsService:FindFirstChild("bytesInResendQueue")
		
		if BytesInResendQueue then
			local Success5, Result5 = pcall(function()
				-- upvalues: BytesInResendQueue (copy)
				return BytesInResendQueue:GetValue()
			end)
			ResendBytes = if Success5 and typeof(Result5) == "number" then Result5 else nil
		else
			ResendBytes = nil
		end
	else
		ResendBytes = nil
	end
	config.resendBytes = ResendBytes
	local SendKbps = nil
	
	if ServerStatsItem then
		local SendKBps = ServerStatsItem:FindFirstChild("Send kBps")
		
		if SendKBps then
			local Success6, Result6 = pcall(function()
				-- upvalues: SendKBps (copy)
				return SendKBps:GetValue()
			end)
			SendKbps = if Success6 and typeof(Result6) == "number" then Result6 else nil
		else
			SendKbps = nil
		end
	else
		SendKbps = nil
	end
	config.sendKbps = SendKbps
	local ReceiveKbps = nil
	
	if ServerStatsItem then
		local ReceiveKBps = ServerStatsItem:FindFirstChild("Receive kBps")
		
		if ReceiveKBps then
			local Success7, Result7 = pcall(function()
				-- upvalues: ReceiveKBps (copy)
				return ReceiveKBps:GetValue()
			end)
			ReceiveKbps = if Success7 and typeof(Result7) == "number" then Result7 else nil
		else
			ReceiveKbps = nil
		end
	else
		ReceiveKbps = nil
	end
	config.receiveKbps = ReceiveKbps
	config.congested = if v1 and PeerStatsPlausibleResult then v1 ~= 0 else nil
	config.peerStatsInvalid = not PeerStatsPlausibleResult
	
	return config
end

local _ = function()
	local Success, Result = pcall(function()
		return workspace.AuthorityMode
	end)
	
	return if Success and typeof(Result) == "EnumItem" then Result.Name else nil
end

return function(p2)
	-- upvalues: UserInputService (copy), StatsService (copy), RunService (copy), ReactModule (copy), IsToggleChordModule (copy), readPings (copy), GameplayModule (copy), FormatModule (copy)
	local ExperienceService = p2.experienceService
	local AuthorizeToggleFunction = p2.authorizeToggle
	local AuthorizationVersion = p2.authorizationVersion
	local UserInputService1 = p2.userInputService or UserInputService
	local Stats = p2.stats or StatsService
	local RunService1 = p2.runService or RunService
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	ReactModule.useEffect(function()
		-- upvalues: UserInputService1 (copy), IsToggleChordModule (upval), UseStateResult2 (copy), AuthorizeToggleFunction (copy)
		local InputBeganConnection = UserInputService1.InputBegan:Connect(function(Input)
			-- upvalues: IsToggleChordModule (upval), UserInputService1 (upval), UseStateResult2 (upval), AuthorizeToggleFunction (upval)
			if not IsToggleChordModule(Input, UserInputService1) or UserInputService1:GetFocusedTextBox() ~= nil then return end
			local function _()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(function(p3): boolean
					return not p3
				end)
			end
			
			if AuthorizeToggleFunction then
				task.spawn(function()
					-- upvalues: AuthorizeToggleFunction (upval), UseStateResult2 (upval)
					if AuthorizeToggleFunction() then
						UseStateResult2(function(p3): boolean
							return not p3
						end)
					end
				end)
				
				return
			else
				UseStateResult2(function(p3): boolean
					return not p3
				end)
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { AuthorizeToggleFunction, UserInputService1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { AuthorizationVersion })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), RunService1 (copy), readPings (upval), Stats (copy), ExperienceService (copy), GameplayModule (upval), FormatModule (upval), UseStateResult2_1 (copy)
		if not UseStateResult then return end
		local Flag = true
		local Count = 0
		local Largest = 0
		local HeartbeatConnection = RunService1.Heartbeat:Connect(function(DeltaTime: number)
			-- upvalues: Count (ref), Largest (ref)
			Count += 1
			Largest = math.max(Largest, DeltaTime)
		end)
		local t = {}
		local List = {}
		local Elapsed = os.clock() - 1
		task.spawn(function()
			-- upvalues: readPings (upval), Stats (upval), ExperienceService (upval), GameplayModule (upval), t (copy), List (copy), FormatModule (upval), Elapsed (ref), Flag (ref), Count (ref), Largest (ref), UseStateResult2_1 (upval)
			local function poll()
				-- upvalues: readPings (upval), Stats (upval), ExperienceService (upval), GameplayModule (upval), t (upval), List (upval), FormatModule (upval), Elapsed (upval), Flag (upval), Count (upval), Largest (upval), UseStateResult2_1 (upval)
				local ClockTime = os.clock()
				local Pings = readPings(Stats)
				local Success, Result = pcall(function()
					-- upvalues: ExperienceService (upval)
					return ExperienceService:GetConnectedServerInfo()
				end)
				local Success1, Result1 = pcall(function()
					-- upvalues: ExperienceService (upval)
					return ExperienceService:GetConnectedServerProbeSnapshot()
				end)
				local Result2 = if Success then Result else nil
				
				if Result2 and Result2.popCode then
					pcall(function()
						-- upvalues: ExperienceService (upval)
						ExperienceService:SetConnectedServerProbingActive(true)
					end)
				end
				local Result3 = if Success1 and Result1 then Result1 else {}
				local CurrentRegionResult = GameplayModule.currentRegion(Result2)
				local RecentProbeResult = if CurrentRegionResult then GameplayModule.recentProbe(Result3, CurrentRegionResult, 5) else nil
				Pings.probeLoss = if RecentProbeResult then RecentProbeResult.loss else nil
				Pings.probeSilentPops = if RecentProbeResult then RecentProbeResult.silentPops else nil
				Pings.probeDown = if RecentProbeResult then RecentProbeResult.allSilent else nil
				local ProbeTargets = {}
				
				for _, value in Result3 do
					local PopCode: string = value.popCode
					
					if CurrentRegionResult and typeof(PopCode) == "string" and string.upper((string.sub(PopCode, 1, 3))) == CurrentRegionResult then
						table.insert(ProbeTargets, PopCode)
						local LastSampleEpochMs: number = value.lastSampleEpochMs
						local Entry: number = t[PopCode]
						
						if typeof(LastSampleEpochMs) == "number" and LastSampleEpochMs > 0 and LastSampleEpochMs ~= Entry then
							if Entry and Entry < LastSampleEpochMs then
								table.insert(List, LastSampleEpochMs - Entry)
								
								if #List > 20 then
									table.remove(List, 1)
								end
							end
							t[PopCode] = LastSampleEpochMs
						end
					end
				end
				Pings.probeIntervalMs = FormatModule.historyMedian(List)
				Pings.probeTargets = ProbeTargets
				local ClockTimeDelta = ClockTime - Elapsed
				
				if Flag and ClockTimeDelta >= 1 then
					Pings.fps = if Count > 0 then Count / ClockTimeDelta else nil
					Pings.worstFrameMs = if Count > 0 then Largest * 1000 else nil
					Count = 0
					Largest = 0
					Elapsed = ClockTime
					local RenderFunction = GameplayModule.render
					local Success2, Result4 = pcall(function()
						return workspace.AuthorityMode
					end)
					UseStateResult2_1(RenderFunction(Result2, Result3, Pings, if Success2 and typeof(Result4) == "EnumItem" then Result4.Name else nil))
				end
			end
			
			local Flag1 = false
			while Flag do
				local Success, Result = pcall(poll)
				
				if not Success and not Flag1 then
					Flag1 = true
					warn("[GameplayPopOverlay] poll failed: " .. tostring(Result))
				end
				task.wait(0.2)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref), HeartbeatConnection (copy), ExperienceService (upval)
			Flag = false
			HeartbeatConnection:Disconnect()
			pcall(function()
				-- upvalues: ExperienceService (upval)
				ExperienceService:SetConnectedServerProbingActive(false)
			end)
		end
	end, { UseStateResult })
	
	return if UseStateResult then ReactModule.createElement("Frame", {
		Name = "GameplayPopOverlay",
		BackgroundTransparency = 0.15,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -12, 0, 64),
		Size = UDim2.fromOffset(460, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = FormatModule.COLOR_BG
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 6) }),
		Stroke = ReactModule.createElement("UIStroke", { Thickness = 1, Color = FormatModule.COLOR_BORDER }),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 8),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10)
		}),
		Panel = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = Enum.Font.Code,
			TextSize = FormatModule.TEXT_SIZE,
			TextColor3 = FormatModule.COLOR_HEADER,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Text = UseStateResult1
		})
	}) else nil
end