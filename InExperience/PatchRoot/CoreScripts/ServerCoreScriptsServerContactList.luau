local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local socialService = game:GetService("SocialService")
local teleportService = game:GetService("TeleportService")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local enableIrisRerouteToRCCEngineFeature = game:GetEngineFeature("EnableIrisRerouteToRCC")
local contactListInvokeIrisInvite = Instance.new("RemoteEvent")
contactListInvokeIrisInvite.Name = "ContactListInvokeIrisInvite"
contactListInvokeIrisInvite.Parent = robloxReplicatedStorageService
contactListInvokeIrisInvite.OnServerEvent:Connect(function(p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 22 ]]
	-- upvalues: socialService (ref), enableIrisRerouteToRCCEngineFeature (ref)
	if typeof(p1) == "string" and #p1 <= 1000 and (typeof(p3) == "string" and #p3 <= 1000) and typeof(p2) == "number" then
		socialService:InvokeIrisInvite(p0, p1, {
			{
				userId = p0.UserId,
				combinedName = p0.DisplayName,
				muted = p4,
				camEnabled = p5,
				userAgent = if enableIrisRerouteToRCCEngineFeature then p6 else nil,
				version = if enableIrisRerouteToRCCEngineFeature then p7 else nil
			},
			{ userId = p2, combinedName = p3 }
		})
		
		return
	end
end)
local contactListIrisInviteTeleport = Instance.new("RemoteEvent")
contactListIrisInviteTeleport.Name = "ContactListIrisInviteTeleport"
contactListIrisInviteTeleport.Parent = robloxReplicatedStorageService
local t = {}
playersService.PlayerRemoving:Connect(function(p8) --[[ line: 56 ]]
	-- upvalues: t (ref)
	t[p8.UserId] = nil
end)

local function _(p9) --[[ line: 60 | named "validateCallId" ]]
	return typeof(p9) == "string" and #p9 <= 50 and string.match(p9, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
end

contactListIrisInviteTeleport.OnServerEvent:Connect(function(p10, p11, _, _, p12) --[[ line: 69 ]]
	-- upvalues: t (ref), url (ref), httpRbxApiService (ref), httpService (ref), teleportService (ref)
	local userId = t[p10.UserId]
	
	if userId ~= nil and userId > 5 then return end
	if userId == nil then
		t[p10.UserId] = 1
	else
		t[p10.UserId] = userId + 1
	end
	local ok = typeof(p12) == "string" and #p12 <= 50 and string.match(p12, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
	
	if not ok or typeof(p11) ~= "number" or p11 <= 0 then return end
	if typeof(p12) == "string" and #p12 <= 50 then
		ok, status = pcall(function() --[[ line: 86 ]]
			-- upvalues: url (copy), p12 (ref), p10 (ref), httpRbxApiService (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(url.APIS_URL .. `call/v1/get-call-status-rcc?callId={p12}&userId={p10.UserId}`))
		end)
		
		if ok and status.status == "CallAccepted" and status.reservedServerAccessCode then
			local teleportOptions = Instance.new("TeleportOptions")
			teleportOptions.ReservedServerAccessCode = status.reservedServerAccessCode
			teleportService:TeleportAsync(p11, { p10 }, teleportOptions)
		end
	end
end)
local updateCurrentCall = Instance.new("RemoteEvent")
updateCurrentCall.Name = "UpdateCurrentCall"
updateCurrentCall.Parent = robloxReplicatedStorageService
local var12 = nil
local t_1 = {}

local function enforceCallParticipants() --[[ line: 109 ]]
	-- upvalues: var12 (write), playersService (ref)
	if var12 ~= nil then
		local var19 = false
		
		for i, v in pairs(playersService:GetPlayers()) do
			if table.find(var12.participants, tostring(v.UserId)) == nil then
				var19 = true
				break
			end
		end
		if var19 then
			for i, v in pairs(playersService:GetPlayers()) do
				if table.find(var12.participants, tostring(v.UserId)) ~= nil then
					v:Kick()
				end
			end
			var12 = nil
		end
	end
end

local _ = function(a) --[[ line: 138 | named "terminateCall" ]]
	-- upvalues: url (ref), httpService (ref), httpRbxApiService (ref)
	local ok, _ = pcall(function() --[[ line: 139 ]]
		-- upvalues: url (copy), httpService (copy), a (ref), httpRbxApiService (copy)
		return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "call/v1/force-terminate-call-rcc", httpService:JSONEncode({ callId = a })))
	end)
	
	return ok
end

local function validateCallParticipants(p13) --[[ line: 148 ]]
	if typeof(p13) ~= "table" or p13 == nil or #p13 ~= 2 then
		return false
	end
	for i, v in ipairs(p13) do
		if typeof(v) ~= "string" or #v > 50 or tonumber(v) == nil then
			return false
		end
	end
	return true
end

local function validateCall(p14, p15, p16) --[[ line: 161 ]]
	-- upvalues: validateCallParticipants (ref), url (ref), httpService (ref), httpRbxApiService (ref)
	local ok = typeof(p15) == "string" and #p15 <= 50 and string.match(p15, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil
	
	if not ok or not validateCallParticipants(p16) then
		return 400
	end
	ok, _ = pcall(function() --[[ line: 165 ]]
		-- upvalues: url (copy), p16 (ref), p15 (ref), p14 (ref), httpService (copy), httpRbxApiService (copy)
		local text = url.APIS_URL .. "call/v1/verify-valid-call"
		local t = {}
		
		for i, v in ipairs(p16) do
			t[i] = tonumber(v)
		end
		return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(text, httpService:JSONEncode({
			callId = p15,
			userId = p14.UserId,
			instanceId = game.JobId,
			callParticipants = t
		})))
	end)
	
	return if ok then 200 else 400
end

updateCurrentCall.OnServerEvent:Connect(function(p17, p18) --[[ line: 190 ]]
	-- upvalues: t_1 (ref), validateCall (ref), var12 (write), url (ref), httpService (ref), httpRbxApiService (ref), enforceCallParticipants (ref)
	if t_1[p17.UserId] ~= nil and t_1[p17.UserId] > 10 then return end
	if t_1[p17.UserId] == nil then
		t_1[p17.UserId] = 1
	else
		t_1[p17.UserId] += 1
	end
	if not (if p18 ~= nil then validateCall(p17, p18.callId, p18.participants) == 200 else true) then
		p17:Kick()
		
		return
	elseif var12 ~= nil and p18 ~= nil and var12.callId ~= p18.callId then
		local callId = var12.callId
		local _, _ = pcall(function() --[[ line: 139 ]]
			-- upvalues: url (copy), httpService (copy), callId (ref), httpRbxApiService (copy)
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "call/v1/force-terminate-call-rcc", httpService:JSONEncode({ callId = callId })))
		end)
		enforceCallParticipants()
	end
	var12 = p18
	enforceCallParticipants()
end)
playersService.PlayerAdded:Connect(function(_) --[[ line: 227 ]]
	-- upvalues: enforceCallParticipants (ref)
	enforceCallParticipants()
end)
playersService.PlayerRemoving:Connect(function(p19) --[[ line: 231 ]]
	-- upvalues: t_1 (ref), var12 (write), url (ref), httpService (ref), httpRbxApiService (ref)
	t_1[p19.UserId] = nil
	
	if var12 ~= nil and table.find(var12.participants, tostring(p19.UserId)) ~= nil then
		local callId = var12.callId
		local ok, _ = pcall(function() --[[ line: 139 ]]
			-- upvalues: url (copy), httpService (copy), callId (ref), httpRbxApiService (copy)
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "call/v1/force-terminate-call-rcc", httpService:JSONEncode({ callId = callId })))
		end)
		
		if ok then
			var12 = nil
		end
	end
end)