local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoCaptchaChallengeModule = require(script.Parent.RoCaptchaChallenge)

local function defaultShutdownGame()
	game:Shutdown()
end

local function defaultMount(p1)
	-- upvalues: ReactRobloxModule (copy), CoreGui (copy)
	local Root = ReactRobloxModule.createRoot(CoreGui)
	Root:render(p1)
	
	return function()
		-- upvalues: Root (copy)
		Root:unmount()
	end
end

local t = {}

return function(p1)
	-- upvalues: t (copy), defaultShutdownGame (copy), defaultMount (copy), ReactModule (copy), RoCaptchaChallengeModule (copy)
	local ChallengeId = p1.challengeId
	
	if t[ChallengeId] then return end
	t[ChallengeId] = true
	local ShutdownGame = p1.shutdownGame or defaultShutdownGame
	
	local function v11() end
	
	local function _()
		-- upvalues: t (upval), ChallengeId (copy), v11 (ref), ShutdownGame (copy)
		t[ChallengeId] = nil
		v11()
		ShutdownGame()
	end
	
	local Success, Result = pcall(p1.mount or defaultMount, (ReactModule.createElement(RoCaptchaChallengeModule, {
		challengeId = ChallengeId,
		challengeMetadata = p1.challengeMetadata,
		experienceService = p1.experienceService,
		desiredPlaceId = p1.desiredPlaceId,
		logging = p1.logging,
		onChallengeLoaded = p1.onChallengeLoaded,
		onChallengeFailed = function()
			-- upvalues: p1 (copy), t (upval), ChallengeId (copy), v11 (ref), ShutdownGame (copy)
			if p1.onChallengeFailed then
				p1.onChallengeFailed()
			end
			t[ChallengeId] = nil
			v11()
			ShutdownGame()
		end,
		onChallengeAbandoned = function()
			-- upvalues: p1 (copy), t (upval), ChallengeId (copy), v11 (ref), ShutdownGame (copy)
			if p1.onChallengeAbandoned then
				p1.onChallengeAbandoned()
			end
			t[ChallengeId] = nil
			v11()
			ShutdownGame()
		end,
		onChallengeCompleted = function()
			-- upvalues: p1 (copy), t (upval), ChallengeId (copy), v11 (ref), ShutdownGame (copy)
			if p1.onChallengeCompleted then
				p1.onChallengeCompleted()
			end
			t[ChallengeId] = nil
			v11()
			ShutdownGame()
		end
	})))
	
	if not Success then
		t[ChallengeId] = nil
		error(Result)
	end
	v11 = Result
end