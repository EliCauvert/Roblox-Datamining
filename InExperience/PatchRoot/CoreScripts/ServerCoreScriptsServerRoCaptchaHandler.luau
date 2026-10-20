local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local TeleportService = game:GetService("TeleportService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Url = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Url
local RoCaptchaUtilsModule = require(RobloxGui.Modules.Server.RoCaptcha.RoCaptchaUtils)
local FStringRoCaptchaUniverseIdsModule = require(RobloxGui.Modules.Common.Flags.FStringRoCaptchaUniverseIds)

if game:GetService("RunService"):IsStudio() then return end
if not RoCaptchaUtilsModule.isUniverseAllowed(FStringRoCaptchaUniverseIdsModule, game.GameId) then return end
local Text = Url.APIS_URL .. "rocaptcha-service/v1/challenge/"
local Text1 = Url.APIS_URL .. "challenge/v1/continue"
local config = {
	[Enum.TeleportResult.Failure] = true,
	[Enum.TeleportResult.Flooded] = true,
	[Enum.TeleportResult.IsTeleporting] = true
}

local function postJson(ApiUrl, Input)
	-- upvalues: HttpRbxApiService (copy), HttpService (copy)
	local Data = HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(ApiUrl, HttpService:JSONEncode(Input), Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson)))
	
	if type(Data) ~= "table" then
		error("unexpected response body")
	end
	return Data
end

local function withRetry(p1, p2)
	local v1 = nil
	local Result = nil
	
	for i = 1, 3 do
		local Success
		Success, Result = pcall(p2)
		
		if Success then
			return true, Result
		end
		v1 = Result
		warn(string.format("[RoCaptcha] %s failed (attempt %d/%d): %s", p1, i, 3, (tostring(Result))))
		
		if i < 3 then
			task.wait(2 ^ (i - 1) * 0.5)
		end
	end
	return false, v1
end

local function _(ChallengeId, UserId)
	-- upvalues: withRetry (copy), postJson (copy), Text (copy)
	return withRetry("validate", function()
		-- upvalues: postJson (upval), Text (upval), ChallengeId (copy), UserId (copy)
		return (postJson(Text .. "validate", {
			challengeId = ChallengeId,
			userId = UserId,
			placeId = game.PlaceId
		}))
	end)
end

local _ = function(ChallengeId, SolvingUserId)
	-- upvalues: withRetry (copy), postJson (copy), Text (copy)
	return withRetry("verify", function()
		-- upvalues: postJson (upval), Text (upval), ChallengeId (copy), SolvingUserId (copy)
		return (postJson(Text .. "verify", {
			challengeId = ChallengeId,
			solvingUserId = SolvingUserId,
			placeId = game.PlaceId
		}))
	end)
end

local _ = function(ChallengeId)
	-- upvalues: withRetry (copy), postJson (copy), Text1 (copy)
	return withRetry("continue", function()
		-- upvalues: postJson (upval), Text1 (upval), ChallengeId (copy)
		return (postJson(Text1, {
			challengeType = "rocaptcha",
			challengeMetadata = "",
			challengeId = ChallengeId
		}))
	end)
end

local t = {}

local function createSession(Player: Player)
	-- upvalues: RoCaptchaUtilsModule (copy)
	local JoinData = Player:GetJoinData()
	local ParseLaunchDataResult = RoCaptchaUtilsModule.parseLaunchData(JoinData and JoinData.LaunchData)
	
	return if ParseLaunchDataResult then {
		state = "Validating",
		teleportInitRetries = 0,
		teleportStartedAt = nil,
		retryPending = false,
		challengeId = ParseLaunchDataResult.challengeId,
		desiredPlaceId = ParseLaunchDataResult.desiredPlaceId
	} else nil
end

local _ = function(Player: Player, p3)
	-- upvalues: t (copy)
	warn("[RoCaptcha] Kicking player, reason:", p3)
	t[Player] = nil
	
	if Player.Parent then
		Player:Kick()
	end
end

local function onPlayerAdded(Player: Player)
	-- upvalues: createSession (copy), t (copy), withRetry (copy), postJson (copy), Text (copy)
	local Session = createSession(Player)
	
	if Session then
		t[Player] = Session
		local ChallengeId = Session.challengeId
		local UserId = Player.UserId
		local Validate, Validate2 = withRetry("validate", function()
			-- upvalues: postJson (upval), Text (upval), ChallengeId (copy), UserId (copy)
			return (postJson(Text .. "validate", {
				challengeId = ChallengeId,
				userId = UserId,
				placeId = game.PlaceId
			}))
		end)
		
		if t[Player] ~= Session then return end
		if not Validate then
			warn("[RoCaptcha] validate unavailable - deferring to verify")
			Session.state = "Ready"
			
			return
		end
		if Validate2.valid == true then
			Session.state = "Ready"
			
			return
		end
		warn("[RoCaptcha] Kicking player, reason:", "validate_failed:" .. tostring(Validate2.failureReason))
		t[Player] = nil
		
		if Player.Parent then
			Player:Kick()
		end
		return
	else
		warn("[RoCaptcha] Kicking player, reason:", "invalid_launch_data")
		t[Player] = nil
		
		if Player.Parent then
			Player:Kick()
		end
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in Players:GetPlayers() do
	task.spawn(onPlayerAdded, player)
end
Players.PlayerRemoving:Connect(function(Player)
	-- upvalues: t (copy)
	t[Player] = nil
end)

local function teleportBack(Player, p3)
	-- upvalues: TeleportService (copy)
	p3.teleportStartedAt = os.clock()
	local Success, Result = pcall(function()
		-- upvalues: TeleportService (upval), p3 (copy), Player (copy)
		TeleportService:TeleportAsync(p3.desiredPlaceId, { Player })
	end)
	
	if not Success then
		p3.teleportStartedAt = nil
		warn("[RoCaptcha] TeleportAsync failed:", Result)
	end
	return Success
end

local _ = function(p3): boolean
	local TeleportStartedAt = p3.teleportStartedAt
	
	return TeleportStartedAt ~= nil and os.clock() - TeleportStartedAt < 30
end

local _ = function(p3, p4)
	p3.teleportStartedAt = nil
	warn("[RoCaptcha] Teleport back failed, reason:", p4)
end

TeleportService.TeleportInitFailed:Connect(function(Player: Player, TeleportResult, ErrorMessage)
	-- upvalues: t (copy), config (copy), teleportBack (copy)
	if not Player:IsA("Player") then return end
	local Entry = t[Player]
	
	if Entry and Entry.state == "Done" then
		local TeleportStartedAt = Entry.teleportStartedAt
		
		if TeleportStartedAt ~= nil and os.clock() - TeleportStartedAt < 30 and not Entry.retryPending then
			warn("[RoCaptcha] TeleportInitFailed:", TeleportResult, ErrorMessage)
			
			if not config[TeleportResult] then
				Entry.teleportStartedAt = nil
				warn("[RoCaptcha] Teleport back failed, reason:", "teleport_failed:" .. tostring(TeleportResult))
				
				return
			end
			if Entry.teleportInitRetries >= 3 then
				Entry.teleportStartedAt = nil
				warn("[RoCaptcha] Teleport back failed, reason:", "teleport_retries_exhausted:" .. tostring(TeleportResult))
				
				return
			end
			Entry.teleportInitRetries += 1
			Entry.retryPending = true
			task.wait(2 ^ (Entry.teleportInitRetries - 1) * 0.5)
			Entry.retryPending = false
			
			if Player.Parent and t[Player] == Entry then
				teleportBack(Player, Entry)
			end
			return
		end
	end
end)
local RoCaptchaVerify = Instance.new("BindableFunction")
RoCaptchaVerify.Name = "RoCaptchaVerify"

function RoCaptchaVerify.OnInvoke(Player: Player)
	-- upvalues: t (copy), teleportBack (copy), withRetry (copy), postJson (copy), Text (copy), Text1 (copy)
	if typeof(Player) ~= "Instance" or not Player:IsA("Player") then
		return { success = false, reason = "invalid_player" }
	end
	local Entry = t[Player]
	
	if not Entry then
		return { success = false, reason = "no_session" }
	end
	if Entry.state == "Validating" then
		return { success = false, reason = "not_validated" }
	end
	if Entry.state == "Done" then
		local TeleportStartedAt = Entry.teleportStartedAt
		local IsClockTimeBelow: boolean = TeleportStartedAt ~= nil and os.clock() - TeleportStartedAt < 30
		
		return if IsClockTimeBelow then { success = false, reason = "teleport_in_progress" } elseif teleportBack(Player, Entry) then { success = true } else { success = false, reason = "teleport_error" }
	end
	if Entry.state ~= "Ready" then
		return { success = false, reason = "already_in_progress" }
	end
	Entry.state = "Verifying"
	local ChallengeId = Entry.challengeId
	local UserId = Player.UserId
	local Verify, Verify2 = withRetry("verify", function()
		-- upvalues: postJson (upval), Text (upval), ChallengeId (copy), UserId (copy)
		return (postJson(Text .. "verify", {
			challengeId = ChallengeId,
			solvingUserId = UserId,
			placeId = game.PlaceId
		}))
	end)
	
	if not Verify then
		Entry.state = "Ready"
		
		return { success = false, reason = "verify_error" }
	end
	if Verify2.verified == true then
		if not withRetry("continue", function()
			-- upvalues: postJson (upval), Text1 (upval), ChallengeId (copy)
			return (postJson(Text1, {
				challengeType = "rocaptcha",
				challengeMetadata = "",
				challengeId = ChallengeId
			}))
		end) then
			warn("[RoCaptcha] continue failed - teleporting anyway")
		end
		Entry.state = "Done"
		
		return if Player.Parent then if teleportBack(Player, Entry) then { success = true } else { success = false, reason = "teleport_error" } else { success = true }
	else
		warn("[RoCaptcha] Kicking player, reason:", "verify_failed:" .. tostring(Verify2.failureReason))
		t[Player] = nil
		
		if Player.Parent then
			Player:Kick()
		end
		return {
			success = false,
			reason = "verify_failed",
			detail = Verify2.failureReason
		}
	end
end

RoCaptchaVerify.Parent = ServerStorage