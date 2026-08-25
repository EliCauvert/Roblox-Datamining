local achievements = script:FindFirstAncestor("Achievements")
local parent = achievements.Parent
local _ = require(parent.Signal)
local loggerModule = require(achievements.Logger)
local getUserVoteCountModule = require(achievements.Requests.GetUserVoteCount)
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local dashModule = require(parent.Dash)

return {
	init = function(p0, p1, p2, p3, p4)
		p0.fireVoteCountChanged = p1
		p0.store = p2
		p0.requestImpl = p3
		p0.platformCloudStorageService = p4
	end,
	start = function(p5)
		-- upvalues: loggerModule (ref)
		p5.storeChangedConnection = p5.store.changed:connect(function(p6, p7)
			-- upvalues: p5 (ref), loggerModule (copy)
			local localUserGameVoteCounter = p6.LocalUserGameVoteCounter
			
			if p7.LocalUserGameVoteCounter ~= localUserGameVoteCounter and localUserGameVoteCounter.voteCountSinceAppStart > 0 then
				p5:_checkPollster(localUserGameVoteCounter.lastUniverseId):catch(function(p8)
					-- upvalues: loggerModule (copy)
					loggerModule:warning(p8)
				end)
			end
		end)
	end,
	_checkPollster = function(p9, p10)
		-- upvalues: promiseModule (ref), dashModule (ref), getUserVoteCountModule (ref), loggerModule (ref)
		return if p9.platformCloudStorageService and p9.platformCloudStorageService:IsUserDataAvailable() then promiseModule.new(function()
			-- upvalues: p9 (ref), dashModule (copy), p10 (ref)
			local data = p9.platformCloudStorageService:GetUserDataAsync("UniversesVoted").data or {}
			
			if #data < 5 and not dashModule.includes(data, p10) then
				table.insert(data, p10)
				p9.platformCloudStorageService:SetUserDataAsync("UniversesVoted", { data = data })
			end
			p9.fireVoteCountChanged(#data)
		end) else getUserVoteCountModule(p9.requestImpl):andThen(function(p11)
			-- upvalues: loggerModule (copy), p9 (ref)
			if p11.responseBody == nil then
				loggerModule:warning("Response has no body.")
				
				return
			end
			local voteCount = p11.responseBody.voteCount
			
			if voteCount == nil then
				loggerModule:warning("Response has no voteCount field.")
				
				return
			end
			p9.fireVoteCountChanged(voteCount)
		end)
	end,
	stop = function(p12)
		if p12.storeChangedConnection then
			p12.storeChangedConnection:disconnect()
			p12.storeChangedConnection = nil
		end
	end
}