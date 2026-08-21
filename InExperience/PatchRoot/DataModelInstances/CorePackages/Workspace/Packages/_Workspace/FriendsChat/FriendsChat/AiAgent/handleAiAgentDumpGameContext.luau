local parent = script:FindFirstAncestor("FriendsChat").Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local chatAiAgentMessageTransformModule = require(parent.AppChat.ChatAiAgentMessageTransform)
local buildGameContextDumpModule = require(script.Parent.buildGameContextDump)
local fFlagChatAiAgentToggle = require(parent.SharedFlags).FFlagChatAiAgentToggle
local t = {}

local function _(p0) --[[ line: 33 | named "printDump" ]]
	for i, v in p0 do
		print(v)
	end
end

local function splitOversizedItem(p1, p2) --[[ line: 39 ]]
	local t = {}
	local var8 = 1
	while var8 <= #p1 do
		table.insert(t, string.sub(p1, var8, var8 + p2 - 1))
		var8 += p2
	end
	return t
end

local function buildPages(p3, p4) --[[ line: 49 ]]
	-- upvalues: splitOversizedItem (ref)
	local t = {}
	local var10 = ""
	
	for i, v in p3 do
		if p4 >= #v then
			local var12 = if var10 == "" then v else `{var10} {v}`
			
			if p4 < #var12 then
				table.insert(t, var10)
				var10 = v
			else
				var10 = var12
			end
		end
		if var10 ~= "" then
			table.insert(t, var10)
			var10 = ""
		end
		for i_2, v_1 in splitOversizedItem(v, p4) do
			table.insert(t, v_1)
		end
	end
	if var10 ~= "" then
		table.insert(t, var10)
	end
	if #t <= 15 then
		return t
	end
	local t_1 = {}
	
	for i_1 = 1, 15 do
		table.insert(t_1, t[i_1])
	end
	t_1[15] = `{t_1[15]} (truncated)`
	
	return t_1
end

local _ = function(p5) --[[ line: 89 | named "retryDelaySeconds" ]]
	return math.min(2 ^ (p5 - 1) * 1, 16)
end

local function sendPage(p6, p7, p8, p9) --[[ line: 97 ]]
	-- upvalues: sendPage (ref), appChatNetworkingModule (ref)
	local p7Count = #p7
	
	if p7Count < p8 then
		return
	end
	local function _() --[[ line: 103 | named "scheduleNextPage" ]]
		-- upvalues: p8 (ref), p7Count (ref), sendPage (copy), p6 (ref), p7 (ref)
		if p8 < p7Count then
			task.delay(0.6, function() --[[ line: 105 ]]
				-- upvalues: sendPage (copy), p6 (copy), p7 (copy), p8 (copy)
				sendPage(p6, p7, p8 + 1, 1)
			end)
		end
	end
	
	local function handleFailure(p10) --[[ line: 111 ]]
		-- upvalues: p9 (ref), p8 (ref), p7Count (ref), sendPage (copy), p6 (ref), p7 (ref)
		if p9 < 20 then
			local minValue = math.min(2 ^ (p9 - 1) * 1, 16)
			print(`[ChatAiAgent][GameContext] page {p8}/{p7Count} attempt {p9} failed, retrying in {minValue}s: {p10}`)
			task.delay(minValue, function() --[[ line: 121 ]]
				-- upvalues: sendPage (copy), p6 (copy), p7 (copy), p8 (copy), p9 (copy)
				sendPage(p6, p7, p8, p9 + 1)
			end)
			
			return
		end
		print(`[ChatAiAgent][GameContext] page {p8}/{p7Count} dropped after {p9} attempts: {p10}`)
		
		if p8 < p7Count then
			task.delay(0.6, function() --[[ line: 105 ]]
				-- upvalues: sendPage (copy), p6 (copy), p7 (copy), p8 (copy)
				sendPage(p6, p7, p8 + 1, 1)
			end)
		end
	end
	
	appChatNetworkingModule.http.SendChatTextMessage(nil, p6, `[{p8}/{p7Count}] {p7[p8]}`):andThen(function(p12) --[[ line: 131 ]]
		-- upvalues: handleFailure (ref), p8 (ref), p7Count (ref), sendPage (copy), p6 (ref), p7 (ref)
		local messages = p12 and (p12.responseBody and p12.responseBody.messages)
		
		if messages == nil or #messages == 0 then
			handleFailure("send returned no message")
			
			return
		elseif p8 < p7Count then
			task.delay(0.6, function() --[[ line: 105 ]]
				-- upvalues: sendPage (copy), p6 (copy), p7 (copy), p8 (copy)
				sendPage(p6, p7, p8 + 1, 1)
			end)
		end
	end):catch(function(p11) --[[ line: 141 ]]
		-- upvalues: handleFailure (ref)
		handleFailure(tostring(p11))
	end)
end

return function(p13, p14, p15) --[[ line: 146 | named "handleAiAgentDumpGameContext" ]]
	-- upvalues: fFlagChatAiAgentToggle (ref), t (ref), chatAiAgentMessageTransformModule (ref), buildGameContextDumpModule (ref), sendPage (ref), buildPages (ref)
	if not fFlagChatAiAgentToggle then return end
	if type(p13) ~= "string" or p13 == "" or type(p14) ~= "table" then return end
	for i, v in p14 do
		if type(v) == "table" then
			local id = v.id
			
			if type(id) == "string" and id ~= "" and (not p15[id] and not t[id]) then
				local content = v.content
				
				if type(content) == "string" and chatAiAgentMessageTransformModule.isDumpGameContextCommand(content) then
					t[id] = true
					print(`[ChatAiAgent][GameContext] command detected for message {id}`)
					task.defer(function() --[[ line: 177 ]]
						-- upvalues: buildGameContextDumpModule (copy), sendPage (copy), p13 (ref), buildPages (copy)
						local ok, status = pcall(buildGameContextDumpModule)
						
						if not ok then
							print(`[ChatAiAgent][GameContext] dump failed: {tostring(status)}`)
							
							return
						end
						for i, v in status.lines do
							print(v)
						end
						local list = { status.summary }
						
						for i, v_1 in status.chatItems do
							table.insert(list, v_1)
						end
						sendPage(p13, buildPages(list, 148), 1, 1)
					end)
				end
			end
		end
	end
end