local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local config = {
	now = os.time,
	getUserId = function()
		-- upvalues: Players (copy)
		local LocalPlayer = Players.LocalPlayer
		
		return if LocalPlayer then LocalPlayer.UserId else 0
	end,
	timeoutSeconds = game:DefineFastInt("AXJourneySessionTimeoutMinutes", 30) * 60
}
local Guid = ""
local v1 = 0
local v2 = 0

return {
	createJourneySession = function(p1)
		-- upvalues: HttpService (copy)
		local Guid = ""
		local UserId = 0
		local v3 = 0
		
		return {
			get = function()
				-- upvalues: p1 (copy), Guid (ref), UserId (ref), v3 (ref), HttpService (upval)
				local NowResult = p1.now()
				local UserId1 = p1.getUserId()
				
				if Guid == "" or UserId1 ~= UserId or p1.timeoutSeconds < NowResult - v3 then
					Guid = HttpService:GenerateGUID(false)
					UserId = UserId1
				end
				v3 = NowResult
				
				return Guid
			end
		}
	end,
	get = ({
		get = function()
			-- upvalues: config (copy), Guid (ref), v1 (ref), v2 (ref), HttpService (copy)
			local NowResult = config.now()
			local UserId1 = config.getUserId()
			
			if Guid == "" or UserId1 ~= v1 or config.timeoutSeconds < NowResult - v2 then
				Guid = HttpService:GenerateGUID(false)
				v1 = UserId1
			end
			v2 = NowResult
			
			return Guid
		end
	}).get
}