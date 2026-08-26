local achievements = script:FindFirstAncestor("Achievements")
local parent = achievements.Parent
local _ = require(parent.Signal)
local loggerModule = require(achievements.Logger)
local getUserVoteCountModule = require(achievements.Requests.GetUserVoteCount)
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)
local dashModule = require(parent.Dash)

return {
	init = function(p1, p2, p3, p4, p5)
		p1.fireVoteCountChanged = p2
		p1.store = p3
		p1.requestImpl = p4
		p1.platformCloudStorageService = p5
	end,
	start = function(p1)
		-- upvalues: loggerModule (ref)
		p1.storeChangedConnection = p1.store.changed:connect(function(p2, p3)
			-- upvalues: p1 (ref), loggerModule (copy)
			local localUserGameVoteCounter = p2.LocalUserGameVoteCounter
			
			if p3.LocalUserGameVoteCounter ~= localUserGameVoteCounter and localUserGameVoteCounter.voteCountSinceAppStart > 0 then
				p1:_checkPollster(localUserGameVoteCounter.lastUniverseId):catch(function(p4)
					-- upvalues: loggerModule (copy)
					loggerModule:warning(p4)
				end)
			end
		end)
	end,
	_checkPollster = function(p1, p2)
		-- upvalues: promiseModule (ref), dashModule (ref), getUserVoteCountModule (ref), loggerModule (ref)
		return if p1.platformCloudStorageService and p1.platformCloudStorageService:IsUserDataAvailable() then promiseModule.new(function()
			-- upvalues: p1 (ref), dashModule (copy), p2 (ref)
			local data = p1.platformCloudStorageService:GetUserDataAsync("UniversesVoted").data or {}
			
			if #data < 5 and not dashModule.includes(data, p2) then
				table.insert(data, p2)
				p1.platformCloudStorageService:SetUserDataAsync("UniversesVoted", { data = data })
			end
			p1.fireVoteCountChanged(#data)
		end) else getUserVoteCountModule(p1.requestImpl):andThen(function(p3)
			-- upvalues: loggerModule (copy), p1 (ref)
			if p3.responseBody == nil then
				loggerModule:warning("Response has no body.")
				
				return
			end
			local voteCount = p3.responseBody.voteCount
			
			if voteCount == nil then
				loggerModule:warning("Response has no voteCount field.")
				
				return
			end
			p1.fireVoteCountChanged(voteCount)
		end)
	end,
	stop = function(p1)
		if p1.storeChangedConnection then
			p1.storeChangedConnection:disconnect()
			p1.storeChangedConnection = nil
		end
	end
}