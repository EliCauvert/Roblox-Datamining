local httpService = game:GetService("HttpService")
local signalsModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Signals)
local plainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)
local presetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)
local messageEnvelopeModelModule = require(script.Parent.Parent.MessageEnvelopeModel)
local messageModelModule = require(script.Parent.Parent.MessageModel)
local _ = require(script.Parent.Parent.Types)
local frozen = table.freeze({
	{ userId = "1", displayName = "Roblox" },
	{ userId = "156", displayName = "Builderman" }
})

local function _(a)
	return { kind = "plainText", text = a }
end

local _ = function(a, b)
	return { kind = "preset", presetId = a, displayText = b }
end

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
local frozen_2 = table.freeze({
	{ kind = "plainText", text = frozen_1[1] },
	{ kind = "plainText", text = frozen_1[2] },
	{ kind = "plainText", text = frozen_1[3] },
	{ kind = "plainText", text = frozen_1[4] },
	{ kind = "plainText", text = frozen_1[5] },
	{ kind = "plainText", text = frozen_1[6] },
	{ kind = "plainText", text = frozen_1[7] },
	{ kind = "plainText", text = frozen_1[8] },
	{ kind = "plainText", text = frozen_1[9] },
	{ kind = "plainText", text = frozen_1[10] },
	{ kind = "plainText", text = frozen_1[11] },
	{ kind = "plainText", text = frozen_1[12] },
	{
		kind = "preset",
		presetId = "hello",
		displayText = "Hello"
	},
	{ kind = "preset", presetId = "gg", displayText = "gg" }
})

local function acceptedSendOf(p1)
	-- upvalues: plainTextContentModelModule (ref), presetContentModelModule (ref)
	local var1 = p1.contents[1]
	
	if var1 == nil then
		return nil
	end
	local draft = plainTextContentModelModule.getDraft(var1)
	
	if draft == nil then
		local draft_1 = presetContentModelModule.getDraft(var1)
		
		return if draft_1 == nil then nil elseif draft_1.presetId == "" or draft_1.displayText == "" then nil else {
			kind = "preset",
			presetId = draft_1.presetId,
			displayText = draft_1.displayText
		}
	end
	return if draft.text == "" then nil else { kind = "plainText", text = draft.text }
end

return {
	incomingIntervalSeconds = 2,
	welcomeText = "Welcome to Crossroads! Type /regen if someone wrecks the map.",
	create = function(p1, p2)
		-- upvalues: signalsModule (ref), messageModelModule (ref), messageEnvelopeModelModule (ref), frozen (ref), acceptedSendOf (ref), httpService (ref), frozen_2 (ref)
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
		
		local function messageFromAcceptedSend(p4, p5, p6)
			-- upvalues: var4 (write), p2 (ref), messageModelModule (copy)
			local t = {}
			local var5 = p6
			
			if not var5 then
				local var6 = if p2 then p2.getNowMs else nil
				var4 = math.max(if var6 then var6() else DateTime.now().UnixTimestampMillis, var4 + 1)
				var5 = var4
			end
			t.sentAtUnixMilliseconds = var5
			t.author = p5
			
			return if p4.kind == "preset" then messageModelModule.fromPreset(p4.presetId, p4.displayText, t) else messageModelModule.fromPlainText(p4.text, t)
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
			-- upvalues: frozen_2 (copy), p2 (ref), random (ref), frozen (copy), messageFromAcceptedSend (ref), messageEnvelopeModelModule (copy), var2 (ref), var3 (ref)
			local frozen_2Count = #frozen_2
			local var11 = if p2 then p2.random else nil
			local var12 = frozen_2[if var11 then var11:NextInteger(1, frozen_2Count) else random:NextInteger(1, frozen_2Count)]
			local frozenCount = #frozen
			local var13 = if p2 then p2.random else nil
			local var14 = if var13 then var13:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)
			local cloned = table.clone(var2(false))
			table.insert(cloned, messageEnvelopeModelModule.incoming(messageFromAcceptedSend(var12, frozen[var14])))
			var3(cloned)
		end
		
		return {
			getMessageEnvelopes = var2,
			sendMessageDraft = function(p6)
				-- upvalues: acceptedSendOf (copy), httpService (copy), var4 (write), p2 (ref), messageEnvelopeModelModule (copy), t (ref), var2 (ref), var3 (ref), t_1 (ref), replaceEnvelope (ref), messageFromAcceptedSend (ref)
				local var15 = acceptedSendOf(p6)
				
				if var15 == nil then
					return
				end
				local var16 = httpService:GenerateGUID(false)
				local var17 = if p2 then p2.getNowMs else nil
				var4 = math.max(if var17 then var17() else DateTime.now().UnixTimestampMillis, var4 + 1)
				local var18 = var4
				local var19 = if p2 then p2.deliveryOutcome else nil
				local var20 = if p2 then p2.deliveryDelaySeconds else nil
				local cloned = table.clone(var2(false))
				table.insert(cloned, messageEnvelopeModelModule.sending(var16, p6, t, var18))
				var3(cloned)
				local var21 = nil
				
				local function resolveDelivery()
					-- upvalues: t_1 (copy), var21 (write), replaceEnvelope (copy), var16 (ref), p2 (copy), var19 (ref), messageEnvelopeModelModule (copy), messageFromAcceptedSend (copy), var15 (ref), t (copy), var18 (ref)
					t_1[var21] = nil
					replaceEnvelope(var16, function(p7)
						-- upvalues: p2 (copy), var19 (copy), messageEnvelopeModelModule (copy), messageFromAcceptedSend (copy), var15 (copy), t (copy), var18 (copy)
						if p7.direction ~= "outgoing" or p7.payload.kind ~= "draft" or p7.delivery.state ~= "sending" then
							return p7
						end
						local var22 = if p2 then p2.getNowMs else nil
						local maxValue = math.max(if var22 then var22() else DateTime.now().UnixTimestampMillis, p7.delivery.attemptedAtUnixMilliseconds)
						
						return if var19 == "fail" then messageEnvelopeModelModule.failed(p7, maxValue) else messageEnvelopeModelModule.acknowledged(p7, messageFromAcceptedSend(var15, t, var18), maxValue)
					end)
				end
				
				t_1[if var20 ~= nil then task.defer(resolveDelivery) else task.delay(var20, resolveDelivery)] = true
			end,
			startIncomingTraffic = function()
				-- upvalues: frozen_2 (copy), p2 (ref), random (ref), frozen (copy), messageFromAcceptedSend (ref), messageEnvelopeModelModule (copy), var2 (ref), var3 (ref)
				local var22 = false
				local delayedThread = nil
				
				local function scheduleNext()
					-- upvalues: delayedThread (write), var22 (write), frozen_2 (copy), p2 (copy), random (copy), frozen (copy), messageFromAcceptedSend (copy), messageEnvelopeModelModule (copy), var2 (copy), var3 (copy), scheduleNext (ref)
					delayedThread = task.delay(2, function()
						-- upvalues: delayedThread (copy), var22 (copy), frozen_2 (copy), p2 (copy), random (copy), frozen (copy), messageFromAcceptedSend (copy), messageEnvelopeModelModule (copy), var2 (copy), var3 (copy), scheduleNext (copy)
						delayedThread = nil
						
						if var22 then
							return
						end
						local frozen_2Count = #frozen_2
						local var23 = if p2 then p2.random else nil
						local var24 = frozen_2[if var23 then var23:NextInteger(1, frozen_2Count) else random:NextInteger(1, frozen_2Count)]
						local frozenCount = #frozen
						local var25 = if p2 then p2.random else nil
						local var26 = if var25 then var25:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)
						local cloned = table.clone(var2(false))
						table.insert(cloned, messageEnvelopeModelModule.incoming(messageFromAcceptedSend(var24, frozen[var26])))
						var3(cloned)
						scheduleNext()
					end)
				end
				
				delayedThread = task.delay(2, function()
					-- upvalues: delayedThread (write), var22 (write), frozen_2 (copy), p2 (copy), random (copy), frozen (copy), messageFromAcceptedSend (copy), messageEnvelopeModelModule (copy), var2 (copy), var3 (copy), scheduleNext (ref)
					delayedThread = nil
					
					if var22 then
						return
					end
					local frozen_2Count = #frozen_2
					local var23 = if p2 then p2.random else nil
					local var24 = frozen_2[if var23 then var23:NextInteger(1, frozen_2Count) else random:NextInteger(1, frozen_2Count)]
					local frozenCount = #frozen
					local var25 = if p2 then p2.random else nil
					local cloned = table.clone(var2(false))
					table.insert(cloned, messageEnvelopeModelModule.incoming(messageFromAcceptedSend(var24, frozen[if var25 then var25:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)])))
					var3(cloned)
					scheduleNext()
				end)
				
				return function()
					-- upvalues: var22 (write), delayedThread (write)
					var22 = true
					
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
	incomingLines = frozen_1,
	incomingContents = frozen_2
}