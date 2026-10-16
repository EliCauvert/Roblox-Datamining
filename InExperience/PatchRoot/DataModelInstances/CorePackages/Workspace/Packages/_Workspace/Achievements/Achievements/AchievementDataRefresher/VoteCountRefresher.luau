local Achievements = script:FindFirstAncestor("Achievements")
local Parent = Achievements.Parent
local _ = require(Parent.Signal)
local LoggerModule = require(Achievements.Logger)
local GetUserVoteCountModule = require(Achievements.Requests.GetUserVoteCount)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local DashModule = require(Parent.Dash)

return {
	init = function(p1, FireVoteCountChanged, Store, RequestImpl, PlatformCloudStorageService) --[[ Line: 36 ]]
		p1.fireVoteCountChanged = FireVoteCountChanged
		p1.store = Store
		p1.requestImpl = RequestImpl
		p1.platformCloudStorageService = PlatformCloudStorageService
	end,
	start = function(p1) --[[ Line: 48 ]]
		-- upvalues: LoggerModule (copy)
		p1.storeChangedConnection = p1.store.changed:connect(function(Value, p2) --[[ Line: 49 ]]
			-- upvalues: p1 (copy), LoggerModule (upval)
			local LocalUserGameVoteCounter = Value.LocalUserGameVoteCounter
			
			if p2.LocalUserGameVoteCounter ~= LocalUserGameVoteCounter and LocalUserGameVoteCounter.voteCountSinceAppStart > 0 then
				p1:_checkPollster(LocalUserGameVoteCounter.lastUniverseId):catch(function(Err) --[[ Line: 57 ]]
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning(Err)
				end)
			end
		end)
	end,
	_checkPollster = function(p1, LastUniverseId) --[[ Line: 64 ]]
		-- upvalues: PromiseModule (copy), DashModule (copy), GetUserVoteCountModule (copy), LoggerModule (copy)
		return if p1.platformCloudStorageService and p1.platformCloudStorageService:IsUserDataAvailable() then PromiseModule.new(function() --[[ Line: 66 ]]
			-- upvalues: p1 (copy), DashModule (upval), LastUniverseId (copy)
			local Data = p1.platformCloudStorageService:GetUserDataAsync("UniversesVoted").data or {}
			
			if #Data < 5 and not DashModule.includes(Data, LastUniverseId) then
				table.insert(Data, LastUniverseId)
				p1.platformCloudStorageService:SetUserDataAsync("UniversesVoted", { data = Data })
			end
			p1.fireVoteCountChanged(#Data)
		end) else GetUserVoteCountModule(p1.requestImpl):andThen(function(Result) --[[ Line: 75 ]]
			-- upvalues: LoggerModule (upval), p1 (copy)
			if Result.responseBody == nil then
				LoggerModule:warning("Response has no body.")
				
				return
			end
			local VoteCount = Result.responseBody.voteCount
			
			if VoteCount == nil then
				LoggerModule:warning("Response has no voteCount field.")
				
				return
			else
				p1.fireVoteCountChanged(VoteCount)
			end
		end)
	end,
	stop = function(p1) --[[ Line: 93 ]]
		if p1.storeChangedConnection then
			p1.storeChangedConnection:disconnect()
			p1.storeChangedConnection = nil
		end
	end
}