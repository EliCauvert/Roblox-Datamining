local httpService = game:GetService("HttpService")
local signalsModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Signals)
local messageEnvelopeModelModule = require(script.Parent.Parent.MessageEnvelopeModel)
local messageModelModule = require(script.Parent.Parent.MessageModel)
local _ = require(script.Parent.Parent.Types)
local frozen = table.freeze({
	{ userId = "1", displayName = "Roblox" },
	{ userId = "156", displayName = "Builderman" }
})
local frozen_1 = table.freeze({
	"Switching to Bright blue, red team is stacked",
	"Who just bloxxed me off the tower??",
	"12 KOs and still top of the leaderboard, come get me",
	"gg! Sending you a friend request", "Where is everyone? The map is empty",
	"/regen the bridge is gone again", "Anyone on yellow want to team up?",
	"Got bloxxed by my own rocket lol", "Meet at the middle tower, bring a sword",
	"Friend request sent, let's run it back", "Changing teams, green has nobody",
	"Who keeps blowing up the house? /regen"
})

local function _(p1)
	local var1 = p1.contents[1]
	
	return if var1 == nil or var1.plainText == nil then nil else var1.plainText.text
end

return {
	incomingIntervalSeconds = 2,
	welcomeText = "Welcome to Crossroads! Type /regen if someone wrecks the map.",
	create = function(p1, p2)
		-- upvalues: signalsModule (ref), messageModelModule (ref), messageEnvelopeModelModule (ref), frozen (ref), httpService (ref), frozen_1 (ref)
		local t = { displayName = "You", userId = p1 }
		local random = Random.new()
		
		local function _(p3, p4)
			-- upvalues: p2 (ref), random (ref)
			local var1 = if p2 then p2.random else nil
			
			return if var1 then var1:NextInteger(p3, p4) else random:NextInteger(p3, p4)
		end
		
		local _ = function(p3)
			-- upvalues: p2 (ref), random (ref)
			local p5Count = #p3
			local var1 = if p2 then p2.random else nil
			
			return p3[if var1 then var1:NextInteger(1, p5Count) else random:NextInteger(1, p5Count)]
		end
		
		local var2, var3 = signalsModule.createSignal({})
		local t_1 = {}
		local var4 = 0
		
		local _ = function()
			-- upvalues: p2 (ref)
			local var5 = if p2 then p2.getNowMs else nil
			
			return if var5 then var5() else DateTime.now().UnixTimestampMillis
		end
		
		local _ = function(p4)
			-- upvalues: var2 (ref), var3 (ref)
			local cloned = table.clone(var2(false))
			table.insert(cloned, p4)
			var3(cloned)
		end
		
		local _ = function()
			-- upvalues: var4 (write), p2 (ref)
			local var5 = if p2 then p2.getNowMs else nil
			var4 = math.max(if var5 then var5() else DateTime.now().UnixTimestampMillis, var4 + 1)
			
			return var4
		end
		
		local _ = function(p4, p5, p6)
			-- upvalues: messageModelModule (copy), var4 (write), p2 (ref)
			local fromPlainText = messageModelModule.fromPlainText
			local t = {}
			local var5 = p6
			
			if not var5 then
				local var6 = if p2 then p2.getNowMs else nil
				var4 = math.max(if var6 then var6() else DateTime.now().UnixTimestampMillis, var4 + 1)
				var5 = var4
			end
			t.sentAtUnixMilliseconds = var5
			t.author = p5
			
			return fromPlainText(p4, t)
		end
		
		local _ = function(p4)
			-- upvalues: messageEnvelopeModelModule (copy), var2 (ref), var3 (ref)
			local cloned = table.clone(var2(false))
			table.insert(cloned, messageEnvelopeModelModule.incoming(p4))
			var3(cloned)
		end
		
		local frozenCount = #frozen
		local var5 = if p2 then p2.random else nil
		local var6 = frozen[if var5 then var5:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
		local fromPlainText = messageModelModule.fromPlainText
		local var7 = "Welcome to Crossroads! Type /regen if someone wrecks the map."
		local t_2 = { sentAtUnixMilliseconds = var4, author = var6 }
		local var8 = if p2 then p2.getNowMs else nil
		var4 = math.max(if var8 then var8() else DateTime.now().UnixTimestampMillis, var4 + 1)
		local var9 = messageEnvelopeModelModule.incoming(fromPlainText(var7, t_2))
		local cloned = table.clone(var2(false))
		table.insert(cloned, var9)
		var3(cloned)
		
		local function replaceEnvelope(p4, p5)
			-- upvalues: var2 (ref), var3 (ref)
			local var10 = var2(false)
			local cloned = table.clone(var10)
			
			for i, v in var10 do
				if v.stableId == p4 then
					cloned[i] = p5(v)
					var3(cloned)
					
					return
				end
			end
		end
		
		local _ = function()
			-- upvalues: frozen_1 (copy), p2 (ref), random (ref), frozen (copy), messageModelModule (copy), var4 (write), messageEnvelopeModelModule (copy), var2 (ref), var3 (ref)
			local frozen_1Count = #frozen_1
			local var11 = if p2 then p2.random else nil
			local var12 = frozen_1[if var11 then var11:NextInteger(1, frozen_1Count) else random:NextInteger(1, frozen_1Count)]
			local frozenCount = #frozen
			local var13 = if p2 then p2.random else nil
			local fromPlainText = messageModelModule.fromPlainText
			local t = {
				sentAtUnixMilliseconds = var4,
				author = frozen[if var13 then var13:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
			}
			local var14 = if p2 then p2.getNowMs else nil
			var4 = math.max(if var14 then var14() else DateTime.now().UnixTimestampMillis, var4 + 1)
			local var15 = messageEnvelopeModelModule.incoming(fromPlainText(var12, t))
			local cloned = table.clone(var2(false))
			table.insert(cloned, var15)
			var3(cloned)
		end
		
		return {
			getMessageEnvelopes = var2,
			sendMessageDraft = function(p6)
				-- upvalues: httpService (copy), var4 (write), p2 (ref), messageEnvelopeModelModule (copy), t (ref), var2 (ref), var3 (ref), t_1 (ref), replaceEnvelope (ref), messageModelModule (copy)
				local var16 = p6.contents[1]
				local var17 = if var16 == nil or var16.plainText == nil then nil else var16.plainText.text
				
				if var17 == nil or var17 == "" then
					return { accepted = false }
				end
				var16 = httpService:GenerateGUID(false)
				local var18 = if p2 then p2.getNowMs else nil
				var4 = math.max(if var18 then var18() else DateTime.now().UnixTimestampMillis, var4 + 1)
				local var19 = var4
				local var20 = if p2 then p2.deliveryOutcome else nil
				local var21 = if p2 then p2.deliveryDelaySeconds else nil
				local cloned = table.clone(var2(false))
				table.insert(cloned, messageEnvelopeModelModule.sending(var16, p6, t, var19))
				var3(cloned)
				local var22 = nil
				
				local function resolveDelivery()
					-- upvalues: t_1 (copy), var22 (write), replaceEnvelope (copy), var16 (ref), p2 (copy), var20 (ref), messageEnvelopeModelModule (copy), var17 (ref), t (copy), var19 (ref), messageModelModule (copy), var4 (copy)
					t_1[var22] = nil
					replaceEnvelope(var16, function(p7)
						-- upvalues: p2 (copy), var20 (copy), messageEnvelopeModelModule (copy), var17 (copy), t (copy), var19 (copy), messageModelModule (copy), var4 (copy)
						if p7.direction ~= "outgoing" or p7.payload.kind ~= "draft" or p7.delivery.state ~= "sending" then
							return p7
						end
						local var23 = if p2 then p2.getNowMs else nil
						local maxValue = math.max(if var23 then var23() else DateTime.now().UnixTimestampMillis, p7.delivery.attemptedAtUnixMilliseconds)
						
						if var20 == "fail" then
							return messageEnvelopeModelModule.failed(p7, maxValue)
						end
						local acknowledged = messageEnvelopeModelModule.acknowledged
						local fromPlainText = messageModelModule.fromPlainText
						local t_1 = {}
						local var24 = var19
						
						if not var24 then
							local var25 = if p2 then p2.getNowMs else nil
							var4 = math.max(if var25 then var25() else DateTime.now().UnixTimestampMillis, var4 + 1)
							var24 = var4
						end
						t_1.sentAtUnixMilliseconds = var24
						t_1.author = t
						
						return acknowledged(p7, fromPlainText(var17, t_1), maxValue)
					end)
				end
				
				t_1[if var21 ~= nil then task.defer(resolveDelivery) else task.delay(var21, resolveDelivery)] = true
				
				return { accepted = true, messageId = var16 }
			end,
			startIncomingTraffic = function()
				-- upvalues: frozen_1 (copy), p2 (ref), random (ref), frozen (copy), messageModelModule (copy), var4 (write), messageEnvelopeModelModule (copy), var2 (ref), var3 (ref)
				local var23 = false
				local delayedThread = nil
				
				local function scheduleNext()
					-- upvalues: delayedThread (write), var23 (write), frozen_1 (copy), p2 (copy), random (copy), frozen (copy), messageModelModule (copy), var4 (copy), messageEnvelopeModelModule (copy), var2 (copy), var3 (copy), scheduleNext (ref)
					delayedThread = task.delay(2, function()
						-- upvalues: delayedThread (copy), var23 (copy), frozen_1 (copy), p2 (copy), random (copy), frozen (copy), messageModelModule (copy), var4 (copy), messageEnvelopeModelModule (copy), var2 (copy), var3 (copy), scheduleNext (copy)
						delayedThread = nil
						
						if var23 then
							return
						end
						local frozen_1Count = #frozen_1
						local var24 = if p2 then p2.random else nil
						local var25 = frozen_1[if var24 then var24:NextInteger(1, frozen_1Count) else random:NextInteger(1, frozen_1Count)]
						local frozenCount = #frozen
						local var26 = if p2 then p2.random else nil
						local var27 = frozen[if var26 then var26:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
						local fromPlainText = messageModelModule.fromPlainText
						local t = {}
						local var28 = if p2 then p2.getNowMs else nil
						var4 = math.max(if var28 then var28() else DateTime.now().UnixTimestampMillis, var4 + 1)
						t.sentAtUnixMilliseconds = var4
						t.author = var27
						local var29 = messageEnvelopeModelModule.incoming(fromPlainText(var25, t))
						local cloned = table.clone(var2(false))
						table.insert(cloned, var29)
						var3(cloned)
						scheduleNext()
					end)
				end
				
				delayedThread = task.delay(2, function()
					-- upvalues: delayedThread (write), var23 (write), frozen_1 (copy), p2 (copy), random (copy), frozen (copy), messageModelModule (copy), var4 (copy), messageEnvelopeModelModule (copy), var2 (copy), var3 (copy), scheduleNext (ref)
					delayedThread = nil
					
					if var23 then
						return
					end
					local frozen_1Count = #frozen_1
					local var30 = if p2 then p2.random else nil
					local var31 = frozen_1[if var30 then var30:NextInteger(1, frozen_1Count) else random:NextInteger(1, frozen_1Count)]
					local frozenCount = #frozen
					local var32 = if p2 then p2.random else nil
					local var33 = frozen[if var32 then var32:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
					local fromPlainText = messageModelModule.fromPlainText
					local t = {}
					local var34 = if p2 then p2.getNowMs else nil
					var4 = math.max(if var34 then var34() else DateTime.now().UnixTimestampMillis, var4 + 1)
					t.sentAtUnixMilliseconds = var4
					t.author = var33
					local cloned = table.clone(var2(false))
					table.insert(cloned, messageEnvelopeModelModule.incoming(fromPlainText(var31, t)))
					var3(cloned)
					scheduleNext()
				end)
				
				return function()
					-- upvalues: var23 (write), delayedThread (write)
					var23 = true
					
					if delayedThread ~= nil then
						task.cancel(delayedThread)
						delayedThread = nil
					end
				end
			end,
			destroy = function()
				-- upvalues: t_1 (ref)
				for i in t_1 do
					task.cancel(i)
				end
				table.clear(t_1)
			end
		}
	end,
	senderPool = frozen,
	incomingLines = frozen_1
}