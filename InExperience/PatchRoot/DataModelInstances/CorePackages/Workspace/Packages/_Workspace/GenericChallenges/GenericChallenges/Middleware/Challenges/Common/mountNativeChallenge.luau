local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local CoreGui = game:GetService("CoreGui")
local _ = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)

local function defaultShutdownGame()
	game:Shutdown()
end

local function defaultMount(p1, Container)
	-- upvalues: ReactRobloxModule (copy)
	local Root = ReactRobloxModule.createRoot(Instance.new("Folder"))
	Root:render(ReactRobloxModule.createPortal(p1, Container))
	
	return function()
		-- upvalues: Root (copy)
		Root:unmount()
	end
end

local t = {}

return function(p1)
	-- upvalues: t (copy), defaultShutdownGame (copy), CoreGui (copy), defaultMount (copy)
	local ChallengeId = p1.challengeId
	
	if t[ChallengeId] then return end
	t[ChallengeId] = true
	local ShutdownGame = p1.shutdownGame or defaultShutdownGame
	local Container = p1.container or CoreGui
	
	local function v11() end
	
	local Success, Result = pcall(p1.mount or function(p2)
		-- upvalues: defaultMount (upval), Container (copy)
		return (defaultMount(p2, Container))
	end, p1.render(function()
		-- upvalues: t (upval), ChallengeId (copy), v11 (ref), p1 (copy), ShutdownGame (copy)
		t[ChallengeId] = nil
		v11()
		
		if p1.shutdownOnTeardown then
			ShutdownGame()
		end
	end))
	
	if not Success then
		t[ChallengeId] = nil
		error(Result)
	end
	v11 = Result
end