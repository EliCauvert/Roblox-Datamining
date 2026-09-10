local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local promiseModule = require(parent.Promise)
local logger = require(parent.Loggers).Logger
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
local createPrivateShareLinkModule = require(buildExperience.utils.createPrivateShareLink)

local function placeholderConversation(p1)
	return {
		source = "friends",
		id = tostring(p1),
		participants = { tostring(p1) }
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: promiseModule (ref), createPrivateShareLinkModule (ref), placeholderConversation (ref), logger (ref)
	return if #p3 == 0 then promiseModule.resolve({}) elseif p1 == nil or not p1.isAvailable then promiseModule.resolve(table.clone(p3)) else createPrivateShareLinkModule(p2):andThen(function(p5)
		-- upvalues: p4 (ref), p3 (ref), p1 (ref), placeholderConversation (copy), logger (copy), p2 (ref), promiseModule (copy)
		if p5 == nil then
			error("sendPlaytesterInviteMessages: no share link returned")
		end
		local var1 = if p4 == nil or p4 == "" then p5 else `{p4}\n{p5}`
		local t = {}
		local t_1 = {}
		
		for i, v in p3 do
			table.insert(t_1, p1.sendToConversation(placeholderConversation(v), var1):andThen(function(p6)
				-- upvalues: t (ref), v (ref), logger (copy), p2 (copy)
				if p6 == nil or p6.status ~= "success" then
					table.insert(t, v)
					logger:warning("sendPlaytesterInviteMessages: send not accepted for user {} (status {}) universe {}", v, if p6 ~= nil then "nil" else tostring(p6.status), p2)
				end
			end):catch(function(p6)
				-- upvalues: t (ref), v (ref), logger (copy), p2 (copy)
				table.insert(t, v)
				logger:warning("sendPlaytesterInviteMessages: send errored for user {} universe {}: {}", v, p2, p6)
			end))
		end
		return promiseModule.all(t_1):andThen(function()
			-- upvalues: t (ref)
			return t
		end)
	end):catch(function(p6)
		-- upvalues: logger (copy), p2 (ref), p3 (ref)
		logger:warning("sendPlaytesterInviteMessages: aborted for universe {}: {}", p2, p6)
		
		return table.clone(p3)
	end)
end