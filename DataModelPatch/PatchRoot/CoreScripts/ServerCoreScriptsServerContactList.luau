local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local SocialService = game:GetService("SocialService")
local TeleportService = game:GetService("TeleportService")
local Url = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Url
local EnableIrisRerouteToRCCEngineFeature = game:GetEngineFeature("EnableIrisRerouteToRCC")
local ContactListInvokeIrisInvite = Instance.new("RemoteEvent")
ContactListInvokeIrisInvite.Name = "ContactListInvokeIrisInvite"
ContactListInvokeIrisInvite.Parent = RobloxReplicatedStorage
ContactListInvokeIrisInvite.OnServerEvent:Connect(function(Player: Player, Tag, UserId, CombinedName, Muted, CamEnabled, p1, p2)
	-- upvalues: SocialService (copy), EnableIrisRerouteToRCCEngineFeature (copy)
	if typeof(Tag) == "string" and #Tag <= 1000 and typeof(CombinedName) == "string" and #CombinedName <= 1000 and typeof(UserId) == "number" then
		SocialService:InvokeIrisInvite(Player, Tag, {
			{
				userId = Player.UserId,
				combinedName = Player.DisplayName,
				muted = Muted,
				camEnabled = CamEnabled,
				userAgent = if EnableIrisRerouteToRCCEngineFeature then p1 else nil,
				version = if EnableIrisRerouteToRCCEngineFeature then p2 else nil
			},
			{ userId = UserId, combinedName = CombinedName }
		})
		
		return
	end
end)
local ContactListIrisInviteTeleport = Instance.new("RemoteEvent")
ContactListIrisInviteTeleport.Name = "ContactListIrisInviteTeleport"
ContactListIrisInviteTeleport.Parent = RobloxReplicatedStorage
local t = {}
Players.PlayerRemoving:Connect(function(Player)
	-- upvalues: t (copy)
	t[Player.UserId] = nil
end)

local function _(Text: string): boolean
	return typeof(Text) == "string" and #Text <= 50 and string.match(Text, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
end

ContactListIrisInviteTeleport.OnServerEvent:Connect(function(Player: Player, PlaceId: number, _, _, Text: string)
	-- upvalues: t (copy), Url (copy), HttpRbxApiService (copy), HttpService (copy), TeleportService (copy)
	local Entry: number = t[Player.UserId]
	
	if Entry ~= nil and Entry > 5 then return end
	if Entry == nil then
		t[Player.UserId] = 1
	else
		t[Player.UserId] = Entry + 1
	end
	if typeof(Text) ~= "string" or #Text > 50 or string.match(Text, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") == nil or typeof(PlaceId) ~= "number" or PlaceId <= 0 then return end
	if typeof(Text) == "string" and #Text <= 50 then
		local Success, Result = pcall(function()
			-- upvalues: Url (upval), Text (copy), Player (copy), HttpRbxApiService (upval), HttpService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl(Url.APIS_URL .. `call/v1/get-call-status-rcc?callId={Text}&userId={Player.UserId}`)))
		end)
		
		if Success and Result.status == "CallAccepted" and Result.reservedServerAccessCode then
			local TeleportOptions = Instance.new("TeleportOptions")
			TeleportOptions.ReservedServerAccessCode = Result.reservedServerAccessCode
			TeleportService:TeleportAsync(PlaceId, { Player }, TeleportOptions)
		end
	end
end)
local UpdateCurrentCall = Instance.new("RemoteEvent")
UpdateCurrentCall.Name = "UpdateCurrentCall"
UpdateCurrentCall.Parent = RobloxReplicatedStorage
local v1 = nil
local t1 = {}

local function enforceCallParticipants()
	-- upvalues: v1 (ref), Players (copy)
	if v1 ~= nil then
		local Flag = false
		
		for _, player in pairs(Players:GetPlayers()) do
			if table.find(v1.participants, (tostring(player.UserId))) == nil then
				Flag = true
				break
			end
		end
		if Flag then
			for _, player1 in pairs(Players:GetPlayers()) do
				if table.find(v1.participants, (tostring(player1.UserId))) ~= nil then
					player1:Kick()
				end
			end
			v1 = nil
		end
	end
end

local _ = function(CallId)
	-- upvalues: Url (copy), HttpService (copy), HttpRbxApiService (copy)
	local Success, _ = pcall(function()
		-- upvalues: Url (upval), HttpService (upval), CallId (copy), HttpRbxApiService (upval)
		return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "call/v1/force-terminate-call-rcc", (HttpService:JSONEncode({ callId = CallId })))))
	end)
	
	return Success
end

local function validateCallParticipants(List): boolean
	if typeof(List) ~= "table" or List == nil or #List ~= 2 then
		return false
	end
	for _, value in ipairs(List) do
		if typeof(value) ~= "string" or #value > 50 or tonumber(value) == nil then
			return false
		end
	end
	return true
end

local function validateCall(Player, Text: string, Participants): number
	-- upvalues: validateCallParticipants (copy), Url (copy), HttpService (copy), HttpRbxApiService (copy)
	if typeof(Text) == "string" and #Text <= 50 and string.match(Text, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil and validateCallParticipants(Participants) then
		local Success, _ = pcall(function()
			-- upvalues: Url (upval), Participants (copy), Text (copy), Player (copy), HttpService (upval), HttpRbxApiService (upval)
			local Text1 = Url.APIS_URL .. "call/v1/verify-valid-call"
			local CallParticipants = {}
			
			for i, participant in ipairs(Participants) do
				CallParticipants[i] = tonumber(participant)
			end
			return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(Text1, (HttpService:JSONEncode({
				callId = Text,
				userId = Player.UserId,
				instanceId = game.JobId,
				callParticipants = CallParticipants
			})))))
		end)
		
		return if Success then 200 else 400
	else
		return 400
	end
end

UpdateCurrentCall.OnServerEvent:Connect(function(Player: Player, p1)
	-- upvalues: t1 (copy), validateCall (copy), v1 (ref), Url (copy), HttpService (copy), HttpRbxApiService (copy), enforceCallParticipants (copy)
	if t1[Player.UserId] ~= nil and t1[Player.UserId] > 10 then return end
	if t1[Player.UserId] == nil then
		t1[Player.UserId] = 1
	else
		t1[Player.UserId] += 1
	end
	if p1 ~= nil and validateCall(Player, p1.callId, p1.participants) ~= 200 then
		Player:Kick()
		
		return
	end
	if v1 ~= nil and p1 ~= nil and v1.callId ~= p1.callId then
		local CallId = v1.callId
		local _, _ = pcall(function()
			-- upvalues: Url (upval), HttpService (upval), CallId (copy), HttpRbxApiService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "call/v1/force-terminate-call-rcc", (HttpService:JSONEncode({ callId = CallId })))))
		end)
		enforceCallParticipants()
	end
	v1 = p1
	enforceCallParticipants()
end)
Players.PlayerAdded:Connect(function(_)
	-- upvalues: enforceCallParticipants (copy)
	enforceCallParticipants()
end)
Players.PlayerRemoving:Connect(function(Player: Player)
	-- upvalues: t1 (copy), v1 (ref), Url (copy), HttpService (copy), HttpRbxApiService (copy)
	t1[Player.UserId] = nil
	
	if v1 ~= nil and table.find(v1.participants, (tostring(Player.UserId))) ~= nil then
		local CallId = v1.callId
		local Success, _ = pcall(function()
			-- upvalues: Url (upval), HttpService (upval), CallId (copy), HttpRbxApiService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "call/v1/force-terminate-call-rcc", (HttpService:JSONEncode({ callId = CallId })))))
		end)
		
		if Success then
			v1 = nil
		end
	end
end)