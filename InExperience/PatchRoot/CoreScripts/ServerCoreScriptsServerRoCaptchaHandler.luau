local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local serverStorageService = game:GetService("ServerStorage")
local teleportService = game:GetService("TeleportService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local url = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Url
local roCaptchaUtilsModule = require(robloxGui.Modules.Server.RoCaptcha.RoCaptchaUtils)
local fStringRoCaptchaUniverseIdsModule = require(robloxGui.Modules.Common.Flags.FStringRoCaptchaUniverseIds)

if runService:IsStudio() then return end
if not roCaptchaUtilsModule.isUniverseAllowed(fStringRoCaptchaUniverseIdsModule, game.GameId) then return end
local text = url.APIS_URL .. "rocaptcha-service/v1/challenge/"
local text_1 = url.APIS_URL .. "challenge/v1/continue"
local t = {
	[Enum.TeleportResult.Failure] = true,
	[Enum.TeleportResult.Flooded] = true,
	[Enum.TeleportResult.IsTeleporting] = true
}
local _ = {
	Validating = "Validating",
	Ready = "Ready",
	Verifying = "Verifying",
	Done = "Done"
}

local function postJson(p1, p2)
	-- upvalues: httpRbxApiService (ref), httpService (ref)
	local var1 = httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(p1, httpService:JSONEncode(p2), Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson))
	
	if type(var1) ~= "table" then
		error("unexpected response body")
	end
	return var1
end

local function withRetry(p1, p2)
	local var1
	local _ = nil
	
	for i = 1, 3 do
		local ok, status = pcall(p2)
		
		if not ok then
			var1 = status
			warn(string.format("[RoCaptcha] %s failed (attempt %d/%d): %s", p1, i, 3, tostring(status)))
			
			if i < 3 then
				task.wait(2 ^ (i - 1) * 0.5)
			end
		end
		return true, status
	end
	return false, var1
end

local function _(p3, p4)
	-- upvalues: withRetry (ref), postJson (ref), text (ref)
	return withRetry("validate", function()
		-- upvalues: postJson (copy), text (copy), p3 (ref), p4 (ref)
		return postJson(text .. "validate", { challengeId = p3, userId = p4, placeId = game.PlaceId })
	end)
end

local _ = function(p3, p4)
	-- upvalues: withRetry (ref), postJson (ref), text (ref)
	return withRetry("verify", function()
		-- upvalues: postJson (copy), text (copy), p3 (ref), p4 (ref)
		return postJson(text .. "verify", {
			challengeId = p3,
			solvingUserId = p4,
			placeId = game.PlaceId
		})
	end)
end

local _ = function(p3)
	-- upvalues: withRetry (ref), postJson (ref), text_1 (ref)
	return withRetry("continue", function()
		-- upvalues: postJson (copy), text_1 (copy), p3 (ref)
		return postJson(text_1, {
			challengeType = "rocaptcha",
			challengeMetadata = "",
			challengeId = p3
		})
	end)
end

local t_1 = {}

local function createSession(p3)
	-- upvalues: roCaptchaUtilsModule (ref)
	local joinData = p3:GetJoinData()
	local var2 = roCaptchaUtilsModule.parseLaunchData(joinData and joinData.LaunchData)
	
	return if var2 then {
		state = "Validating",
		teleportInitRetries = 0,
		teleportStartedAt = nil,
		retryPending = false,
		challengeId = var2.challengeId,
		desiredPlaceId = var2.desiredPlaceId
	} else nil
end

local _ = function(p3, p4)
	-- upvalues: t_1 (ref)
	warn("[RoCaptcha] Kicking player, reason:", p4)
	t_1[p3] = nil
	
	if p3.Parent then
		p3:Kick()
	end
end

local function onPlayerAdded(p3)
	-- upvalues: createSession (ref), t_1 (ref), withRetry (ref), postJson (ref), text (ref)
	local var2 = createSession(p3)
	
	if var2 then
		t_1[p3] = var2
		local challengeId = var2.challengeId
		local userId = p3.UserId
		local var3, var4 = withRetry("validate", function()
			-- upvalues: postJson (copy), text (copy), challengeId (ref), userId (ref)
			return postJson(text .. "validate", {
				challengeId = challengeId,
				userId = userId,
				placeId = game.PlaceId
			})
		end)
		
		if t_1[p3] ~= var2 then return end
		if not var3 then
			warn("[RoCaptcha] validate unavailable - deferring to verify")
			var2.state = "Ready"
			
			return
		elseif var4.valid == true then
			var2.state = "Ready"
			
			return
		end
		warn("[RoCaptcha] Kicking player, reason:", "validate_failed:" .. tostring(var4.failureReason))
		t_1[p3] = nil
		
		if p3.Parent then
			p3:Kick()
		end
		return
	else
		warn("[RoCaptcha] Kicking player, reason:", "invalid_launch_data")
		t_1[p3] = nil
		
		if p3.Parent then
			p3:Kick()
		end
	end
end

playersService.PlayerAdded:Connect(onPlayerAdded)

for i, v in playersService:GetPlayers() do
	task.spawn(onPlayerAdded, v)
end
playersService.PlayerRemoving:Connect(function(p3)
	-- upvalues: t_1 (ref)
	t_1[p3] = nil
end)

local function teleportBack(p3, p4)
	-- upvalues: teleportService (ref)
	p4.teleportStartedAt = os.clock()
	local ok, status = pcall(function()
		-- upvalues: teleportService (copy), p4 (ref), p3 (ref)
		teleportService:TeleportAsync(p4.desiredPlaceId, { p3 })
	end)
	
	if not ok then
		p4.teleportStartedAt = nil
		warn("[RoCaptcha] TeleportAsync failed:", status)
	end
	return ok
end

local _ = function(p3)
	local teleportStartedAt = p3.teleportStartedAt
	
	return teleportStartedAt ~= nil and os.clock() - teleportStartedAt < 30
end

local _ = function(p3, p4)
	p3.teleportStartedAt = nil
	warn("[RoCaptcha] Teleport back failed, reason:", p4)
end

teleportService.TeleportInitFailed:Connect(function(p3, p4, p5)
	-- upvalues: t_1 (ref), t (ref), teleportBack (ref)
	if not p3:IsA("Player") then return end
	local var2
	local var3 = t_1[p3]
	
	if var3 and var3.state == "Done" then
		local teleportStartedAt = var3.teleportStartedAt
		var2 = teleportStartedAt ~= nil and os.clock() - teleportStartedAt < 30
		
		if not var2 or var3.retryPending then return end
		warn("[RoCaptcha] TeleportInitFailed:", p4, p5)
		
		if not t[p4] then
			var2 = "teleport_failed:" .. tostring(p4)
			var3.teleportStartedAt = nil
			warn("[RoCaptcha] Teleport back failed, reason:", var2)
			
			return
		elseif var3.teleportInitRetries >= 3 then
			var2 = "teleport_retries_exhausted:" .. tostring(p4)
			var3.teleportStartedAt = nil
			warn("[RoCaptcha] Teleport back failed, reason:", var2)
			
			return
		end
		var3.teleportInitRetries += 1
		var3.retryPending = true
		task.wait(2 ^ (var3.teleportInitRetries - 1) * 0.5)
		var3.retryPending = false
		
		if p3.Parent and t_1[p3] == var3 then
			teleportBack(p3, var3)
		end
		return
	end
end)
local roCaptchaVerify = Instance.new("BindableFunction")
roCaptchaVerify.Name = "RoCaptchaVerify"

function roCaptchaVerify.OnInvoke(p3)
	-- upvalues: t_1 (ref), teleportBack (ref), withRetry (ref), postJson (ref), text (ref), text_1 (ref)
	if typeof(p3) ~= "Instance" or not p3:IsA("Player") then
		return { success = false, reason = "invalid_player" }
	end
	local var2 = t_1[p3]
	
	if not var2 then
		return { success = false, reason = "no_session" }
	elseif var2.state == "Validating" then
		return { success = false, reason = "not_validated" }
	elseif var2.state == "Done" then
		local teleportStartedAt = var2.teleportStartedAt
		
		return if teleportStartedAt ~= nil and os.clock() - teleportStartedAt < 30 then { success = false, reason = "teleport_in_progress" } elseif teleportBack(p3, var2) then { success = true } else { success = false, reason = "teleport_error" }
	elseif var2.state ~= "Ready" then
		return { success = false, reason = "already_in_progress" }
	end
	var2.state = "Verifying"
	local challengeId = var2.challengeId
	local userId = p3.UserId
	local var3, var4 = withRetry("verify", function()
		-- upvalues: postJson (copy), text (copy), challengeId (ref), userId (ref)
		return postJson(text .. "verify", {
			challengeId = challengeId,
			solvingUserId = userId,
			placeId = game.PlaceId
		})
	end)
	
	if not var3 then
		var2.state = "Ready"
		
		return { success = false, reason = "verify_error" }
	elseif var4.verified == true then
		if not withRetry("continue", function()
			-- upvalues: postJson (copy), text_1 (copy), challengeId (ref)
			return postJson(text_1, {
				challengeType = "rocaptcha",
				challengeMetadata = "",
				challengeId = challengeId
			})
		end) then
			warn("[RoCaptcha] continue failed - teleporting anyway")
		end
		var2.state = "Done"
		
		return if p3.Parent then if teleportBack(p3, var2) then { success = true } else { success = false, reason = "teleport_error" } else { success = true }
	else
		warn("[RoCaptcha] Kicking player, reason:", "verify_failed:" .. tostring(var4.failureReason))
		t_1[p3] = nil
		
		if p3.Parent then
			p3:Kick()
		end
		return {
			success = false,
			reason = "verify_failed",
			detail = var4.failureReason
		}
	end
end

roCaptchaVerify.Parent = serverStorageService